<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<%
set rs_prodlist=server.createobject("adodb.recordset")
sql="select * from 产品表 order by 商品编码"
rs_prodlist.open sql,conn,1,1
%>
<div class="men" style="background:#f2f9fe">
	<div class="container">
	<!--#include file="adminleft.asp"-->
	<div class="col-md-9">
			<div class="specia-top">
                    <%
                   		if rs_prodlist.RecordCount<>0 then 
               		%>
                    <table class="table table-bordered">
                    <tr>
                        <td>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>商品名</th>
                                        <th>报价</th>
                                        <th>商品编码</th>
                                        <th>图片</th>
                                        <th>编辑</th>
                                	</tr>
                                </thead>
                                <tbody>
                                    <% for i = 1 to rs_prodlist.RecordCount %>
                                    <tr>
                                        <td><%=rs_prodlist("产品ID")%></td>
                                        <td><%=rs_prodlist("商品名称")%></td>
                                        <td>￥<%=rs_prodlist("零售价")%></td>
                                        <td><%=rs_prodlist("商品编码")%></td>
                                        <td><% if rs_prodlist("产品图片")<>"" then %>有<% else %>无<% end if %></td>
                                        <td><a href="modifyproduct.asp?productID=<%=rs_prodlist("产品ID")%>">修改</a></td>
                						<td><a href="delproduct.asp?del_productID=<%=rs_prodlist("产品ID")%>" onClick="return confirm('真的要删除这个商品吗？')">删除</a></td>
                                    </tr>
                                	<%
                        				rs_prodlist.movenext
										next 
                        			%>
                                </tbody>
                            </table>
                            
                        </td>
                    </tr>
                </table>
			</div>
			<% else %>
			<h3>没有产品!</h3>
			<%end if%>
			<div class="clearfix"></div>
		</div>
	</div>
</div>	
<!--#include file="footer.asp"-->
