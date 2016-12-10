<!--#include file="config.asp"-->
<%
if request("mark_orderID")<>"" then
	sql="update 订单表 set 是否处理='" & request("mark") & "' where 订单ID='" & request("mark_orderID") & "'"
	conn.execute(sql)
  if Err.Number>0 then
     response.write "对不起，数据库处理有错误，请稍候再试..."
	   response.end
  else
 	  response.redirect(request.serverVariables("Http_REFERER"))
 	end if
end if 
conn.close
set conn=nothing
%>