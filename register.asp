<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<%
user=Request("reg_user")
realname=Request("reg_realname")
mphone=Request("reg_mphone")
email=Request("reg_email")
pw1=Request("reg_pw1")
pw2=Request("reg_pw2")
if (user<>"" and pw1<>"") and pw2<>"" then
	if pw1=pw2 then
		set rs=server.createobject("adodb.recordset")
		sql="select * from 用户表 where 用户名='" & request("reg_user") & "'"
		rs.open sql,conn,1,1
		if rs.RecordCount=0 then
			conn.execute("insert into 用户表(用户名,密码,真实姓名,手机,电子邮件,属性) values ('"+user+"','"+pw1+"','"+realname+"','"+mphone+"','"+email+"','user')")
			conn.close
			set conn=nothing
			response.redirect "login.asp?error_inf=注册成功,请登陆!"
		else
			error_inf="此用户名已存在，请重新输入！"
		end if
	else
		error_inf="两次输入的密码不一样，请重新检查！"
	end if
else
	error_inf=""
end if
if Err.Number>0 then
	response.write "对不起，数据库处理有错误，请稍候再试..."
	response.end
else
end if
%>
 <!-- register -->
<link href="css/stylenew.css" rel="stylesheet" type="text/css" />
<div class="men" style="background:#f2f9fe">
    <div class="container">
        <div class="col-md-12 register">
            <% if error_inf<>"" then %>
                <h5 style="color:#FF0101">
                    <%=error_inf%></h5>
                <% end if %>
                    <form method="post" action="register.asp">
                        <div class="register-top-grid">
                            <h3>个人信息</h3>
                            <div>
                                <span>用户名</span>
                                <input name="reg_user" type="text"></div>
                            <div>
                                <span>真实姓名</span>
                                <input name="reg_realname" type="text"></div>
                            <div>
                                <span>手机号码</span>
                                <input name="reg_mphone" type="text"></div>
                            <div>
                                <span>电子邮箱</span>
                                <input name="reg_email" type="text"></div>
                            <div class="clearfix"></div>
                            <a class="news-letter" href="#"></a>
                        </div>
                        <div class="register-bottom-grid">
                            <h3>注册信息</h3>
                            <div>
                                <span>密码</span>
                                <input name="reg_pw1" type="password"></div>
                            <div>
                                <span>确认密码</span>
                                <input name="reg_pw2" type="password"></div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="register-but">
                            <input type="submit" value="注册">
                            <div class="clearfix"></div>
                        </div>
                    </form>
        </div>
    </div>
</div>
<!--#include file="footer.asp"-->