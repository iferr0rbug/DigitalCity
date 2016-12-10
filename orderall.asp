<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<%
set rs_orderall=server.createobject("adodb.recordset")
sql="SELECT *, IIF(是否处理 = '1', '已处理', '未处理') AS 处理结果 FROM 订单表 ORDER BY 订单序列号 DESC"
rs_orderall.open sql,conn,1,1

set rs_orderlist=server.createobject("adodb.recordset")
sql="SELECT A.订单ID, A.订购数量, B.* FROM 订单产品 A INNER JOIN 产品表 B ON A.产品ID = CStr(B.产品ID) ORDER BY A.订单ID"
rs_orderlist.open sql,conn,1,1
%>
<div class="men" style="background:#f2f9fe">
	<div class="container">
	<!--#include file="adminleft.asp"-->
		<div class="col-md-9">
			<div class="specia-top">
                   <%
                   		if rs_orderall.RecordCount<>0 then
                		for i = 1 to rs_orderall.RecordCount 
               		%>
                    <table class="table table-bordered">
                    <tr>
                        <td>
                            <table class="table table-hover">
                                <tbody>
                                    <tr>
                                        <td>订单号：<%=rs_orderall("订单ID")%></td>
                                        <td>日期：<%=rs_orderall("订单日期")%></td>
                                        <td>处理状态：<%=rs_orderall("处理结果")%></td>
                                        <%
                                        	if rs_orderall("是否处理") = 1 then
                                        %>
                                        <td><a href="markorder.asp?mark_orderID=<%=rs_orderall("订单ID")%>&mark=0">标记为未处理</a></td>
                                        <% else %>
                                        <td><a href="markorder.asp?mark_orderID=<%=rs_orderall("订单ID")%>&mark=1">标记为已处理</a></td>
                                        <% end if %>
                                        <td><a href="delorder.asp?del_orderID=<%=rs_orderall("订单ID")%>" onClick="return confirm('真的要删除这份订单吗？')">删除</a></td>
                                	</tr>
                                </tbody>
                            </table>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>订购物品</th>
                                        <th>数量</th>
                                        <th>单价</th></tr>
                                </thead>
                                <tbody>
                                    <% for j = 1 to rs_orderlist.RecordCount 
                            			if rs_orderlist.eof then
											rs_orderlist.MoveFirst
										end if
										if CStr(rs_orderlist("订单ID")) = CStr(rs_orderall("订单ID")) then
                            		%>
                                    <tr>
                                        <td><%=rs_orderlist("商品名称")%></td>
                                        <td><%=rs_orderlist("订购数量")%></td>
                                        <td>￥<%=rs_orderlist("零售价")%></td></tr>
                                	<%
                        				end if
										rs_orderlist.movenext
										next 
                        			%>
                                </tbody>
                            </table>
                            
                        </td>
                    </tr>
                </table>
                <%
                		rs_orderall.movenext
						next
               			else
                %>
			</div>
			<h3>订单库里没有订单!</h3>
			<%end if%>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!--#include file="footer.asp"-->