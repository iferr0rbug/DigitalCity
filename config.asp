<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
DBPath="mdb/DigitalCityDB.mdb"
set conn=server.createobject("ADODB.CONNECTION")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("" & DBPath & "")
conn.open connstr
%>