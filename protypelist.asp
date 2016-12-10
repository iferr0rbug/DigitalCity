<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<%
set rs_prodtypelist=server.createobject("adodb.recordset")
sql="SELECT A.主类别ID, A.主类别名称, B.子类别ID, B.子类别名称 FROM 产品主类别 A INNER JOIN 产品子类别 B ON A.主类别ID = B.主类别ID ORDER BY B.子类别ID"
rs_prodtypelist.open sql,conn,1,1

protypelv2ID = Request("del_protypelv2ID")
protypelv1ID = CStr(Left(CLng(Request("del_protypelv2ID")),2))

if protypelv2ID <> "" then
   	conn.execute("delete from 产品子类别 where 子类别ID = '" & protypelv2ID & "'")
   	
    set rs_typelist=server.createobject("adodb.recordset")
	sql="SELECT A.主类别ID, A.主类别名称, B.子类别ID, B.子类别名称 FROM 产品主类别 A INNER JOIN 产品子类别 B ON A.主类别ID = B.主类别ID WHERE B.子类别ID = '" & protypelv2ID & "' ORDER BY B.子类别ID"
	rs_typelist.open sql,conn,1,1
	
	if rs_typelist.RecordCount = 0 then
		conn.execute("delete from 产品主类别 where 主类别ID = '" & protypelv1ID & "'")
	end if
end if
%>
<div class="men" style="background:#f2f9fe">
	<div class="container">
	<!--#include file="adminleft.asp"-->
	<div class="col-md-9">
			<div class="specia-top">
                    <%
                   		if rs_prodtypelist.RecordCount<>0 then 
               		%>
                    <table class="table table-bordered">
                    <tr>
                        <td>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>商品大类ID</th>
                                        <th>商品大类名称</th>
                                        <th>商品小类ID</th>
                                        <th>商品小类名称</th>
                                        <th>编辑</th>
                                	</tr>
                                </thead>
                                <tbody>
                                    <% for i = 1 to rs_prodtypelist.RecordCount %>
                                    <tr>
                                        <td><%=rs_prodtypelist("主类别ID")%></td>
                                        <td><%=rs_prodtypelist("主类别名称")%></td>
                                        <td><%=rs_prodtypelist("子类别ID")%></td>
                                        <td><%=rs_prodtypelist("子类别名称")%></td>
                						<td><a href="protypelist.asp?del_protypelv2ID=<%=rs_prodtypelist("子类别ID")%>" onClick="return confirm('真的要删除这个商品吗？')">删除</a></td>
                                    </tr>
                                	<%
                        				rs_prodtypelist.movenext
										next 
                        			%>
                                </tbody>
                            </table>
                            
                        </td>
                    </tr>
                </table>
			</div>
			<% else %>
			<h3>没有产品类别!</h3>
			<%end if%>
			<div class="clearfix"></div>
		</div>
	</div>
</div>	
<!--#include file="footer.asp"-->