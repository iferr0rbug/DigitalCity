<!--#include file="config.asp"-->
<%
user=session("user")
if session("user")="" then
	response.redirect "login.asp?error_inf=请登陆之后再进行结算!"
	conn.close
	set conn=nothing
end if

Function Random_number()
	now_year=Year(Date)
	if Month(Date)<10 then 
		now_month=0&Month(Date)
	else
		now_month=Month(Date)
	end if
	if Day(Date)<10 then 
		now_day=0&Day(Date)
	else
		now_day=Day(Date)
	end if
	Randomize
	Random_number=now_year&now_month&now_day&Int((9999-1000+ 1) * Rnd+1000)
End Function

set rs_ordernum=server.createobject("adodb.recordset")
sqlorder="SELECT * FROM 订单表 ORDER BY 订单ID"
rs_ordernum.open sqlorder,conn,1,1

if session("order_number")="" then
	session("order_number")=Random_number()
	Do
		for i=1 to rs_ordernum.recordcount
			if CStr(rs_ordernum("订单ID"))=CStr(session("order_number")) then
				same_number=TRUE
			else
				same_number=False
			end if
			rs_ordernum.movenext
		next
		if Not same_number then 
			Exit Do
		else
			session("order_number")=Random_number()
		end if
	Loop
end if
order_number=session("order_number")

now_year=Year(Date)
if Month(Date)<10 then 
	now_month=0&Month(Date)
else
	now_month=Month(Date)
end if
if Day(Date)<10 then 
	now_day=0&Day(Date)
else
	now_day=Day(Date)
end if
now_date=now_year&"-"&now_month&"-"&now_day
	
for i = 1 to session("all_number")
	if i = session("all_number") then
		sqlStr1 = sqlStr1 & "SELECT * FROM 产品表 A WHERE A.产品ID = " & CInt(session("product"&i))
	else
		sqlStr1 = "SELECT * FROM 产品表 A WHERE A.产品ID = " & CInt(session("product"&i)) & " UNION ALL " & sqlStr1
	end if
next

sqlStrAll="" _
& "SELECT '" & order_number & "', T.产品ID, COUNT(*) AS 订购数量" _
& " FROM (" & sqlStr1 & ") T" _
& " GROUP BY T.产品ID"
	
conn.execute("insert into 订单表(订单ID,用户名,订单日期,是否处理) values ('"+order_number+"','"+user+"','"+now_date+"','0')")
conn.execute("insert into 订单产品(订单ID,产品ID,订购数量) "+sqlStrAll)
conn.close
set conn=nothing

if Err.Number>0 then
	response.write "对不起，数据库处理有错误，请稍候再试..."
	response.end
else
end if

user_type=session("user_prop")
session.Contents.RemoveAll()
session("user")=user
session("user_prop")=user_type
response.redirect "orderlist.asp"
%>
