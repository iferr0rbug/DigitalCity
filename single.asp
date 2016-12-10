<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<%
productID=Request("productID")

if productID <> "" then
	set rs_prod=server.createobject("adodb.recordset")
	sql="SELECT *, IIF(在架状态 = '1', '是', '否') AS 是否在库 FROM 产品表 WHERE 产品ID = " & productID & " ORDER BY 产品ID"
	rs_prod.open sql,conn,1,1
end if
%>
<!-- single product -->
<div class="single" style="background:#f2f9fe">
    <div class="container">
        <div class="content span_1_of_2">
            <div class="grid images_3_of_2">
                <img src="images/<%=rs_prod("产品图片")%>" class="img-responsive" alt="" /></div>
            <div class="desc span_3_of_2">
                <h3>
                    <%=rs_prod("商品名称")%></h3>
                <div class="desc">
                    <div class="padd-stock">
                        <div class="extra-wrap">
                            <span class="prod-stock-2">是否在库：</span>
                            <div class="prod-stock">
                                <%=rs_prod("是否在库")%></div>
                        </div>
                    </div>
                    <div class="price">
                        <span class="text">单价：</span>
                        <span class="price-new">￥
                            <%=rs_prod("零售价")%></span>
                        <br></div>
                    <div class="single-cart">
                        <div class="prod-row">
                            <div class="cart-top">
                                <div class="item_add">
                                    <span class="item_price">
                                        <a href="add2bag.asp?productID=<%=rs_prod("产品ID")%>">加入购物车</a></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--#include file="footer.asp"-->