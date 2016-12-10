<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<%
set rs_goodprod = server.createobject("adodb.recordset")
sql="SELECT * FROM 产品表 T WHERE T.主页推荐 = '1' AND T.在架状态 = '1'"
rs_goodprod.open sql,conn,1,1

set rs_hotprod = server.createobject("adodb.recordset")
sql="" _
& "SELECT TOP 8, * " _
& "FROM " _
& "  (SELECT B.产品ID, " _
& "              B.商品名称, B.零售价, B.产品图片, COUNT(*) AS 销售数量 " _
& "   FROM 订单产品 A " _
& "   INNER JOIN 产品表 B ON A.产品ID = CStr(B.产品ID) " _
& "   WHERE B.在架状态 = '1' " _
& "   GROUP BY B.产品ID, " _
& "                B.商品名称, B.零售价, B.产品图片) T " _
& "ORDER BY T.销售数量, T.产品ID DESC"
rs_hotprod.open sql,conn,1,1
%>
<div class="special">
    <div class="container">
        <ul class="product_head" style="list-style-type:none">
            <li class="new_product">
                <h3>推荐商品</h3></li>
        </ul>
        <div class="specia-top">
            <ul class="grid_2">
                <% for i=1 to rs_goodprod.RecordCount %>
                    <li>
                        <a href="single.asp?productID=<%=rs_goodprod("产品ID")%>">
                            <img src="images/<%=rs_goodprod("产品图片")%>" class="img-responsive" alt="" /></a>
                        <div class="special-info grid_1 simpleCart_shelfItem">
                            <h5>
                                <%=rs_goodprod("商品名称")%></h5>
                            <div class="item_add">
                                <span class="item_price">
                                    <h6>￥
                                        <%=rs_goodprod("零售价")%></h6></span>
                            </div>
                            <div class="item_add">
                                <span class="item_price">
                                    <a href="add2bag.asp?productID=<%=rs_goodprod("产品ID")%>">加入购物车</a></span>
                            </div>
                        </div>
                    </li>
                    <%
                   		if rs_goodprod.eof then 
                    		exit for 
                    	end if
                       	rs_goodprod.movenext
                       	next
                    %>
                    <div class="clearfix"></div>
            </ul>
        </div>
    </div>
</div>
<!-- special -->
<div class="special">
    <div class="container">
        <ul class="product_head" style="list-style-type:none">
            <li class="hot_product">
                <h3>最热商品</h3></li>
        </ul>
        <div class="specia-top">
            <ul class="grid_2">
                <% for i=1 to rs_hotprod.RecordCount %>
                    <li>
                        <a href="single.asp?productID=<%=rs_hotprod("产品ID")%>">
                            <img src="images/<%=rs_hotprod("产品图片")%>" class="img-responsive" alt="" /></a>
                        <div class="special-info grid_1 simpleCart_shelfItem">
                            <h5>
                                <%=rs_hotprod("商品名称")%></h5>
                            <div class="item_add">
                                <span class="item_price">
                                    <h6>￥
                                        <%=rs_hotprod("零售价")%></h6></span>
                            </div>
                            <div class="item_add">
                                <span class="item_price">
                                    <a href="add2bag.asp?productID=<%=rs_hotprod("产品ID")%>">加入购物车</a></span>
                            </div>
                        </div>
                    </li>
                    <% 
                    	if rs_hotprod.eof then 
                    		exit for 
                       	end if 
                       	rs_hotprod.movenext 
                       	next 
                    %>
                    <div class="clearfix"></div>
            </ul>
        </div>
    </div>
</div>
<!--#include file="footer.asp"-->