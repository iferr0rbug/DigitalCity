<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<%
username = request("username")
truename = request("truename")
mobilephone = request("mobilephone")
email = request("email")
usertype = request("usertype")

if request("userID")<>"" then
	set rs_modifyuser=server.createobject("adodb.recordset")
	sql="select * from 用户表 where 用户ID=" & request("userID") & " order by 用户ID"
	rs_modifyuser.open sql,conn,1,1
	
	if username<>"" then
		conn.execute("update 用户表 set 用户名 = '" & username & "', 真实姓名 = '" & truename & "', 手机 = '" & mobilephone & "', 电子邮件 = '" & email & "', 属性 = '" & usertype & "' where 用户ID = " & request("userID"))
		response.Redirect("userlist.asp")
	end if
else
	response.Redirect(request.serverVariables("Http_REFERER"))
end if

%>
<div class="men" style="background:#f2f9fe">
    <div class="container">
        <!--#include file="adminleft.asp"-->
        <div class="col-md-9">
            <div class="specia-top">
                <table class="table table-bordered">
                    <tr>
                        <td>
                            <form name="form1" method="post" action="modifyuser.asp">
                               <table class="table table-bordered">
                                <tr>
                                    <td>用户名</td>
                                    <td>
                                        <input name="username" type="text" id="username" value="<%=rs_modifyuser("用户名")%>" size="30">
                                        <input name="userID" type="hidden" value="<%=rs_modifyuser("用户ID")%>" size="20">
                                    </td>
                                </tr>
                                <tr>
                                    <td>真实姓名</td>
                                    <td>
                                        <input name="truename" type="text" value="<%=rs_modifyuser("真实姓名")%>" size="20">
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">手机</td>
                                    <td>
                                        <input name="mobilephone" type="text" size="30" value="<%=rs_modifyuser("手机")%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>电子邮件</td>
                                    <td>
                                        <input name="email" type="text" size="30" value="<%=rs_modifyuser("电子邮件")%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>属性</td>
                                    <td>
                                        <input name="usertype" type="radio" value="user" 
                                        <% if rs_modifyuser("属性") <> "admin" then %>
                                        checked
                                        <% end if %>> 用户
                                        <input type="radio" name="usertype" value="admin" 
                                        <% if rs_modifyuser("属性") = "admin" then %>
                                        checked
                                        <% end if %>> 管理员
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td colspan="3" class="fenlei">
                                        <input class="btn btn-primary" name="Submit" type="submit" value="提  交">
                                    </td>
                                </tr>
                               	</table>
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--#include file="footer.asp"-->