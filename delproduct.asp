<!--#include file="config.asp"-->
<%
if request("del_productID")<>"" then
	conn.execute("delete * from 产品表 WHERE 产品ID=" & CInt(request("del_productID"))) 
	conn.execute("delete * from 订单产品 WHERE 产品ID='" & request("del_productID") & "'") 
  if Err.Number>0 then
     response.write "对不起，数据库处理有错误，请稍候再试..."
	   response.end
  else
		conn.close
		set conn=nothing
 	  response.Redirect(request.serverVariables("Http_REFERER"))
 	end if
else
	conn.close
	set conn=nothing
	response.Redirect(request.serverVariables("Http_REFERER"))
end if
%>