<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<%
for i = 1 to session("all_number")
	if i = session("all_number") then
		sqlStr1 = sqlStr1 & "SELECT * FROM 产品表 A WHERE A.产品ID = " & CInt(session("product"&i))
	else
		sqlStr1 = "SELECT * FROM 产品表 A WHERE A.产品ID = " & CInt(session("product"&i)) & " UNION ALL " & sqlStr1
	end if
next

if session("all_number") <> "" then
	set rs_cartprod=server.createobject("adodb.recordset")
	sql="" _
	& "SELECT T.产品ID, T.商品名称, T.商品编码, T.零售价, T.产品图片, COUNT(*) AS 商品数量" _
	& " FROM (" & sqlStr1 & ") T" _
	& " GROUP BY T.产品ID, T.商品名称, T.商品编码, T.零售价, T.产品图片"
	rs_cartprod.open sql,conn,1,1
end if
%> 
<!-- checkout -->
<div class="check">
    <div class="container">
        <div class="col-md-3 cart-total">
            <a class="continue" href="products.asp">再去逛逛</a>
            <ul class="total_price">
                <li class="last_price">
                    <h4>总计</h4></li>
                <li class="last_price">
                    <span>￥
                    	<%
							if session("all_price")="" then								
						%>0
						<%
							else
						%>
						<%=session("all_price")%>
						<%
							end if
						%></span></li>
                <div class="clearfix"></div>
            </ul>
            <div class="clearfix"></div>
            <% if session("all_number")<>"" then %>
            <a class="order" href="ordersubmit.asp">去结算</a>
			<% end if %>
        </div>
        <div class="col-md-9 cart-items">
            <h1>我的购物车 (
            <% if session("all_number")="" then %>0
			<% else %>
			<%=session("all_number")%>
			<% end if %>)
            </h1>
            <% if session("all_number")="" then %>
            <h3>您的购物车是空的！</h3>
			<% else %>	
            <% for i = 1 to rs_cartprod.RecordCount %>		
            <div class="cart-header">
                <div class="cart-sec simpleCart_shelfItem">
                    <div class="cart-item cyc">
                        <img src="images/<%=rs_cartprod("产品图片")%>" class="img-responsive" alt="" /></div>
                    <div class="cart-item-info">
                        <h3>
                            <a href="single.asp?productID=<%=rs_cartprod("产品ID")%>"><%=rs_cartprod("商品名称")%></a></h3>
                        <ul class="qty">
                            <li>
                                <p>单价： <%=rs_cartprod("零售价")%></p>
                            </li>
                            <li>
                                <p>数量： <%=rs_cartprod("商品数量")%></p>
                            </li>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <%
            	if rs_cartprod.eof then
					exit for
				end if
				rs_cartprod.movenext
				next 
            %>
            <% end if %>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--#include file="footer.asp"-->