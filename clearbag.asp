<%
user=session("user")
user_type=session("user_prop")
session.Contents.RemoveAll()
session("user")=user
session("user_prop")=user_type
response.Redirect(request.serverVariables("Http_REFERER"))
%>
