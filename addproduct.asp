<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<%
  return_inf=Request("return_inf")
%>
<div class="men" style="background:#f2f9fe">
    <div class="container">
        <!--#include file="adminleft.asp"-->
        <div class="col-md-9">
            <div class="specia-top">
                <table class="table table-bordered">
                    <tr>
                        <td>
                            <h3><%=return_inf%></h3>
                            <form name="form1" method="post" action="insertproduct.asp" enctype="multipart/form-data">
                               <table class="table table-bordered">
                                <tr>
                                    <td>商品名称</td>
                                    <td>
                                        <input name="pro_mingcheng" type="text" class="registe" id="pro_mingcheng" size="55">
                                    </td>
                                </tr>
                                <tr>
                                    <td>商品编码</td>
                                    <td>
                                        <input name="pro_bianma" type="text" class="registe" size="20">
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">零售价</td>
                                    <td>
                                        <input name="pro_jiage" type="text" class="registe" size="20">例：1200.00
                                    </td>
                                </tr>
                                <tr>
                                    <td>在架状态</td>
                                    <td>
                                        <input name="pro_zaijia" type="radio" value="1"> 在架
                                        <input type="radio" name="pro_zaijia" value="0"> 缺货
                                    </td>
                                </tr>
                                <tr>
                                    <td>主页推荐</td>
                                    <td>
                                        <input name="pro_tuijian" type="radio" value="0"> 不推荐
                                        <input type="radio" name="pro_tuijian" value="1"> 推荐
                                    </td>
                                </tr>
                                <tr>
                                    <td>商品图片</td>
                                    <td>
                                        <input name="pro_image" type="file" class="registe" size="35">
                                        <input name="filepath" type="hidden" value="./images">
                                        <input type="hidden" name="act" value="upload">
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td colspan="3" class="fenlei">
                                        <input class="btn btn-primary" name="Submit" type="submit" value="提  交">&nbsp;
                                        <input class="btn btn-primary" name="Submit2" type="reset" value="清  除"></td></tr>
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