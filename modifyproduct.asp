<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<%
if request("productID")<>"" then
	set rs_upprod=server.createobject("adodb.recordset")
	sql="select * from 产品表 where 产品ID=" & request("productID") & " order by 产品ID"
	rs_upprod.open sql,conn,1,1
else
	response.Redirect(request.serverVariables("Http_REFERER"))
end if
%>
<div class="men" style="background:#f2f9fe">
    <div class="container">
        <!--#include file="adminleft.asp"-->
        <div class="col-md-9">
            <div class="specia-top">
                <table class="table table-bordered">
                    <tr>
                        <td>
                            <form name="form1" method="post" action="updateproduct.asp" enctype="multipart/form-data">
                               <table class="table table-bordered">
                                <tr>
                                    <td>商品名称</td>
                                    <td>
                                        <input name="pro_mingcheng" type="text" class="registe" id="pro_mingcheng" value="<%=rs_upprod("商品名称")%>" size="55">
                                    </td>
                                </tr>
                                <tr>
                                    <td>商品编码</td>
                                    <td>
                                        
                                        <input name="pro_bianma" type="text" class="registe" value="<%=rs_upprod("商品编码")%>" size="20">
                                        <input name="pro_ID" type="hidden" value="<%=rs_upprod("产品ID")%>" size="20">
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">零售价</td>
                                    <td>
                                        <input name="pro_jiage" type="text" class="registe" size="20" value="<%=rs_upprod("零售价")%>">例：1200.00
                                    </td>
                                </tr>
                                <tr>
                                    <td>在架状态</td>
                                    <td>
                                        <input name="pro_zaijia" type="radio" value="1" 
                                        <% if rs_upprod("在架状态") = 1 then %>
                                        checked
                                        <% end if %>> 在架
                                        <input type="radio" name="pro_zaijia" value="0" 
                                        <% if rs_upprod("在架状态") <> 1 then %>
                                        checked
                                        <% end if %>> 缺货
                                    </td>
                                </tr>
                                <tr>
                                    <td>主页推荐</td>
                                    <td>
                                        <input name="pro_tuijian" type="radio" value="0" 
                                        <% if rs_upprod("主页推荐") <> 1 then %>
                                        checked
                                        <% end if %>> 不推荐
                                        <input type="radio" name="pro_tuijian" value="1" 
                                        <% if rs_upprod("主页推荐")=1 then %>
                                        checked
                                        <% end if %>> 推荐
                                    </td>
                                </tr>
                                <tr>
                                    <td>商品图片</td>
                                    <td>
                                        <input name="pro_image" type="file" class="registe" size="35">
                                        <input name="filepath" type="hidden" value="./images">
                                        <input type="hidden" name="act" value="upload">
                                        <% if rs_upprod("产品图片") <> "" then %>
                                        	<a href="./images/<%=rs_upprod("产品图片")%>" target="_blank">查看图片</a>
                                            <% else %>还没有上传图片<% end if %>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td colspan="3" class="fenlei">
                                        <input class="btn btn-primary" name="Submit" type="submit" value="提  交">
                                    </td>
                                </tr>
                               	</table>
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--#include file="footer.asp"-->
