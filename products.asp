<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<%
prodName=Request("prodName")
prodlv1ID=Request("prodlv1ID")
prodlv2ID=Request("prodlv2ID")

if prodlv1ID <> "" then
	set rs_prod=server.createobject("adodb.recordset")
	sql="SELECT * FROM 产品表 WHERE 根类别ID='" & prodlv1ID & "' ORDER BY 产品ID"
	rs_prod.open sql,conn,1,1
elseif prodlv2ID <> "" then
	set rs_prod=server.createobject("adodb.recordset")
	sql="SELECT * FROM 产品表 WHERE 子类别ID='" & prodlv2ID & "' ORDER BY 产品ID"
	rs_prod.open sql,conn,1,1
elseif prodName <> "" then
	set rs_prod=server.createobject("adodb.recordset")
	sql="SELECT * FROM 产品表 WHERE 商品名称 LIKE '%" & prodName & "%' ORDER BY 产品ID"
	rs_prod.open sql,conn,1,1
else
	set rs_prod=server.createobject("adodb.recordset")
	sql="SELECT * FROM 产品表 ORDER BY 产品ID"
	rs_prod.open sql,conn,1,1
end if

set rs_prodlv1=server.createobject("adodb.recordset")
sql="SELECT * FROM 产品主类别 T ORDER BY T.主类别ID"
rs_prodlv1.open sql,conn,1,1

set rs_prodlv2=server.createobject("adodb.recordset")
sql="SELECT * FROM 产品子类别 T ORDER BY T.子类别ID"
rs_prodlv2.open sql,conn,1,1
%>
<div class="men" style="background:#f2f9fe">
    <div class="container">
        <div class="col-md-3 sidebar">
            <div class="block block-layered-nav">
                <div class="block-title" style="padding: 7px 15px; background: #9fc5e8; text-align: center;">
                    <strong>
                        <a href="products.asp"><span>所有产品</span></a></strong>
                </div>
                <div class="block-content" style="padding: 10px">
                    <dl id="narrow-by-list">
                    	<% for i = 1 to rs_prodlv1.RecordCount %>
                        <dt class="odd" style="padding: 10px; color: #1bccf7;"><a href="products.asp?prodlv1ID=<%=rs_prodlv1("主类别ID")%>"><%=rs_prodlv1("主类别名称")%></a></dt>
                        <dd class="odd" style="padding: 0 20px 5px; margin-left: 0;">
                            <ol style="padding: 5px; list-style: none;">
                            	<% for j = 1 to rs_prodlv2.RecordCount 
                            		if rs_prodlv2.eof then
										rs_prodlv2.MoveFirst
									end if
									if CInt(rs_prodlv2("主类别ID"))=CInt(rs_prodlv1("主类别ID")) then
                            	%>
                                <li><a href="products.asp?prodlv2ID=<%=rs_prodlv2("子类别ID")%>"><span class="price1"><%=rs_prodlv2("子类别名称")%></span></a></li>
                                <%
                        			end if
									rs_prodlv2.movenext
									next 
                        		%>
                        	</ol>
                        </dd>
                        <%
							rs_prodlv1.movenext
							next 
						%>
                    </dl>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="specia-top">
                    <ul class="grid_2">
                    	<% for i = 1 to rs_prod.RecordCount %>
                        <li>
                            <a href="single.asp?productID=<%=rs_prod("产品ID")%>">
                                <img src="images/<%=rs_prod("产品图片")%>" class="img-responsive" alt="" /></a>
                            <div class="special-info grid_1 simpleCart_shelfItem">
                                <h5><%=rs_prod("商品名称")%></h5>
                                <div class="item_add">
                                    <span class="item_price">
                                        <h6>￥<%=rs_prod("零售价")%></h6></span>
                                </div>
                                <div class="item_add">
                                    <span class="item_price">
                                        <a href="add2bag.asp?productID=<%=rs_prod("产品ID")%>">加入购物车</a></span>
                                </div>
                            </div>
                        </li>
                        <%
                        	if rs_prod.eof then
					  			exit for
							end if
							rs_prod.movenext
							next 
                        %>
                        <div class="clearfix"></div>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
<!--#include file="footer.asp"-->