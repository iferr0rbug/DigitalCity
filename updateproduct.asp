<!--#include file="config.asp"-->
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
	pro_ID=upload.form("pro_ID")
	pro_mingcheng=upload.form("pro_mingcheng")
	pro_bianma=CStr(upload.form("pro_bianma"))
	pro_jiage=upload.form("pro_jiage")
	pro_zaijia=upload.form("pro_zaijia")
	pro_tuijian=upload.form("pro_tuijian")
	if imageName<>"" then
 		conn.execute("update 产品表 set 商品名称='" & pro_mingcheng & "',商品编码='" & pro_bianma & "',零售价='" & pro_jiage & "',产品图片='" & imageName & "',子类别ID='" & this_class & "',根类别ID='" & root_class & "',在架状态='" & pro_zaijia & "',主页推荐='" & pro_tuijian & "' where 产品ID=" & pro_ID)
	else
 		conn.execute("update 产品表 set 商品名称='" & pro_mingcheng & "',商品编码='" & pro_bianma & "',零售价='" & pro_jiage & "',子类别ID='" & this_class & "',根类别ID='" & root_class & "',在架状态='" & pro_zaijia & "',主页推荐='" & pro_tuijian & "' where 产品ID=" & pro_ID)	
	end if  
end if
if Err.Number>0 then
   response.write "对不起，数据库处理有错误，请稍候再试..."
   response.end
else
	conn.close
	set conn=nothing
	set upload=nothing
	response.Redirect("productlist.asp")
end if
%>