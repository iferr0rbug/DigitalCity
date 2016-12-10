<!--#include file="config.asp"-->
<!--#include file="header.asp"-->
<!--#include FILE="upload_5xsoft.inc"-->
<%Server.ScriptTimeOut=5000%>
<%
dim upload,file,formName,formPath,imageName
imageName=""
set upload=new upload_5xsoft

if upload.form("filepath")="" then
 set upload=nothing
 response.end
else
 formPath=upload.form("filepath")
 if right(formPath,1)<>"/" then formPath=formPath & "/" 
end if

for each formName in upload.objFile
 set file=upload.file(formName)
 if file.FileSize>0 then
  file.SaveAs Server.mappath(formPath & file.FileName)
  'response.write file.FilePath & file.FileName & " (" & file.FileSize & ") => " & formPath & File.FileName & " 成功!<br>"
	imageName=File.FileName
 end if
 set file=nothing
next

%>
<%
Dim root_class,this_class
this_class=CStr(Left(CLng(upload.form("pro_bianma")),4))
root_class=CStr(Left(CLng(upload.form("pro_bianma")),2))
if upload.form("pro_mingcheng")<>"" then
	pro_mingcheng=upload.form("pro_mingcheng")
	pro_bianma=CStr(upload.form("pro_bianma"))
	pro_jiage=upload.form("pro_jiage")
	pro_zaijia=upload.form("pro_zaijia")
	pro_tuijian=upload.form("pro_tuijian")
 	conn.execute("insert into 产品表(商品名称,商品编码,零售价,产品图片,子类别ID,根类别ID,在架状态,主页推荐) values ('" & pro_mingcheng & "','" & pro_bianma & "','" & pro_jiage & "','" & imageName & "','" & this_class & "','" & root_class & "','" & pro_zaijia & "','" & pro_tuijian & "')")
end if
if Err.Number>0 then
   response.write "对不起，数据库处理有错误，请稍候再试..."
   response.end
else
	conn.close
	set conn=nothing
	set upload=nothing
	response.Redirect("addproduct.asp?return_inf=添加产品信息成功，请继续添加！")
end if
%>