<!--#include file="config.asp"-->
<%	
productID=request("productID")
set rs=server.createobject("adodb.recordset")
sql="select * from 产品表 where 产品ID="&productID&" order by 产品ID"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
	session("all_number")=session("all_number")+1
	session("product" & session("all_number"))=productID
	session("all_price")=session("all_price")+CDbl(rs("零售价"))
end if
rs.close
set rs=nothing
response.Redirect(request.serverVariables("Http_REFERER"))
%>
<%
for i=1 to CInt(session("all_number"))
%>
<%=session("product"&i)&"<br>"%>
<%
next
%>