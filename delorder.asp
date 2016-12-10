<!--#include file="config.asp"-->
<%
if request("del_orderID")<>"" then
	Set rs_order_product = conn.execute("delete * from 订单产品 WHERE 订单ID='" & request("del_orderID") & "'") 
	Set rs_order = conn.execute("delete * from 订单表 WHERE 订单ID='" & request("del_orderID") & "'") 
  if Err.Number>0 then
     response.write "对不起，数据库处理有错误，请稍候再试..."
	   response.end
  else
		conn.close
		set conn=nothing
 	  response.redirect(request.serverVariables("Http_REFERER"))
 	end if
else
	conn.close
	set conn=nothing
	response.Redirect(request.serverVariables("Http_REFERER"))
end if
%>