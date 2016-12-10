<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<%
return_inf=Request("return_inf")

protypelv1ID=Request("protypelv1ID")
protypelv1Name=Request("protypelv1Name")
protypelv2ID=Request("protypelv2ID")
protypelv2Name=Request("protypelv2Name")

set rs_dlcx=server.createobject("adodb.recordset")
sql="select * from 产品主类别 where 主类别ID='" & protypelv1ID & "'"
rs_dlcx.open sql,conn,1,1

set rs_xlcx=server.createobject("adodb.recordset")
sql="select * from 产品子类别 where 子类别ID='" & protypelv2ID & "'"
rs_xlcx.open sql,conn,1,1

if protypelv1ID <> "" and protypelv2ID <> "" then
    if rs_dlcx.RecordCount = 0 and rs_xlcx.RecordCount = 0 then 
		conn.execute("insert into 产品主类别(主类别ID,主类别名称) values ('"+protypelv1ID+"','"+protypelv1Name+"')")
		conn.execute("insert into 产品子类别(主类别ID,子类别ID,子类别名称) values ('"+protypelv1ID+"','"+protypelv2ID+"','"+protypelv2Name+"')")
		conn.close
		set conn=nothing
		response.redirect "addprotype.asp?return_inf=添加产品类型成功，请继续添加！"
	elseif rs_dlcx.RecordCount <> 0 and rs_xlcx.RecordCount = 0 then
		conn.execute("insert into 产品子类别(主类别ID,子类别ID,子类别名称) values ('"+protypelv1ID+"','"+protypelv2ID+"','"+protypelv2Name+"')")
		conn.close
		set conn=nothing
		response.redirect "addprotype.asp?return_inf=添加产品类型成功，请继续添加！"
	end if
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
                            <h3><%=return_inf%></h3>
                            <form name="form1" method="post" action="addprotype.asp">
                               <table class="table table-bordered">
                                <tr>
                                    <td>商品大类ID</td>
                                    <td>
                                        <input name="protypelv1ID" type="text" id="protypelv1ID" size="30">
                                    </td>
                                </tr>
                                <tr>
                                    <td>商品大类名称</td>
                                    <td>
                                        
                                        <input name="protypelv1Name" type="text" id="protypelv1Name" size="30">
                                    </td>
                                </tr>
                                <tr>
                                    <td>商品小类ID</td>
                                    <td>
                                        <input name="protypelv2ID" type="text" id="protypelv2ID" size="30">
                                    </td>
                                </tr>
                                <tr>
                                    <td>商品小类名称</td>
                                    <td>
                                        <input name="protypelv2Name" type="text" id="protypelv2Name" size="30">
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