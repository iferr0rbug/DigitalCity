<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<%
set rs_userlist=server.createobject("adodb.recordset")
sql="SELECT * FROM 用户表 ORDER BY 用户ID"
rs_userlist.open sql,conn,1,1

del_userID=Request("del_userID")

if del_userID <> "" then
   	conn.execute("delete from 用户表 where 用户ID = " & del_userID)
end if
%>
<div class="men" style="background:#f2f9fe">
	<div class="container">
	<!--#include file="adminleft.asp"-->
	<div class="col-md-9">
			<div class="specia-top">
                    <%
                   		if rs_userlist.RecordCount<>0 then 
               		%>
                    <table class="table table-bordered">
                    <tr>
                        <td>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>用户ID</th>
                                        <th>用户名</th>
                                        <th>真实姓名</th>
                                        <th>手机</th>
                                        <th>电子邮件</th>
                                        <th>属性</th>
                                        <th>编辑</th>
                                	</tr>
                                </thead>
                                <tbody>
                                    <% for i = 1 to rs_userlist.RecordCount %>
                                    <tr>
                                        <td><%=rs_userlist("用户ID")%></td>
                                        <td><%=rs_userlist("用户名")%></td>
                                        <td><%=rs_userlist("真实姓名")%></td>
                                        <td><%=rs_userlist("手机")%></td>
                                        <td><%=rs_userlist("电子邮件")%></td>
                                        <td>
                                        <% if rs_userlist("属性") = "admin" then %>
                                        	管理员
                                        <% else %>
                                        	用户
                                        <% end if %>
                                        </td>
                                        <td><a href="modifyuser.asp?userID=<%=rs_userlist("用户ID")%>">修改</a></td>
                						<td><a href="userlist.asp?del_userID=<%=rs_userlist("用户ID")%>" onClick="return confirm('真的要删除这个用户吗？')">删除</a></td>
                                    </tr>
                                	<%
                        				rs_userlist.movenext
										next 
                        			%>
                                </tbody>
                            </table>
                            
                        </td>
                    </tr>
                </table>
			</div>
			<% else %>
			<h3>没有用户!</h3>
			<%end if%>
			<div class="clearfix"></div>
		</div>
	</div>
</div>	
<!--#include file="footer.asp"-->