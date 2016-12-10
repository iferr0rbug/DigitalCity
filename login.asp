<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<%
error_inf = Request("error_inf")

If Request("input_user") <> "" Then
	Set rs   = Server.CreateObject("adodb.recordset")
	sql      = "select * from 用户表 where 用户名='" & Request("input_user") & "'"
	rs.open sql,conn,1,1

	If rs.RecordCount <> 0 Then

		If rs("密码") = Request("input_pw") Then
			Session("user")  = rs("用户名")

			If rs("属性") = "admin" Then
				Session("user_prop") = "admin"
				Response.Redirect("index.asp")
			Else
				Session("user_prop") = ""
				Response.Redirect("index.asp")
			End If

		Else
			error_inf = "用户名或密码错误，请重新输入！"
		End If

	Else
		error_inf = "用户名或密码错误，请重新输入！"
	End If

End If %>
<!-- login -->
<link href="css/stylenew.css" rel="stylesheet" type="text/css" />
<div class="men" style="background:#f2f9fe">
    <div class="container">
        <div class="register">
            <div class="col-md-6 login-left">
                <h3>新用户</h3>
                <a class="acount-btn" href="register.asp">新建一个新用户</a></div>
            <div class="col-md-6 login-right">
                <% if error_inf<>"" then %>
                    <h5 style="color:#FF0101">
                        <%=error_inf%></h5>
                    <% end if %>
                        <h3>注册用户</h3>
                        <p>假如你已经注册，请登录。</p>
                        <form method="post" action="login.asp">
                            <div>
                                <span>用户名
                                    <label>*</label></span>
                                <input name="input_user" type="text"></div>
                            <div>
                                <span>密码
                                    <label>*</label></span>
                                <input name="input_pw" type="password"></div>
                            <input type="submit" value="登录"></form>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--#include file="footer.asp"-->