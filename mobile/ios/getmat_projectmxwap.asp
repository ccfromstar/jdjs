<html>
<body style="font-size:11px">
<%
response.charset = "gb2312"
id=request("parm1")
id2=request("parm2")
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"   
sql = "select * from project_inforbase where id = '" + id +"'"
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn ,1,1   
do While not rs.eof 
%>
<input type="button" value="����" onclick="history.go(-1)" /><br/>
<b>������Ϣ</b><br/>
<table style="font-size:11px" border="1" width="100%">
<tr><td width="80">��������:</td><td><%=rs("proname")%></td></tr>
<tr><td>���̵���:</td><td><%=rs("proplace")%></td></tr>
<tr><td>���̵�ַ:</td><td><%=rs("proaddress")%></td></tr>
<tr><td>�������:</td><td><%=rs("promoney")%></td></tr>
<tr><td>�������:</td><td><%=rs("prosort")%></td></tr>
<tr><td>����״̬:</td><td><%=rs("prostate")%></td></tr>
<tr><td>��������:</td><td><%=rs("prorek")%></td></tr>
<tr><td>��������:</td><td><%=rs("prostime")%></td></tr>
<tr><td>��������:</td><td><%=rs("proftime")%></td></tr>
<tr><td>��������:</td><td><%=rs("inforptime")%></td></tr>
<%
if id2 = "1" then
%>
<tr><td>ҵ��/������:</td><td>
<%
sql1 = "select * from Pro_linkman_View where compid = 0 and proid  = '" + Cstr(rs("id")) +"'"  
set rs1= Server.CreateObject("ADODB.RecordSet")  
rs1.Open sql1,cnn ,1,1 
%>
<%
do While not rs1.eof
%>
���̽�ɫ:<%=rs1("juese")%><br/>
<a href="http://www.jdjs.com.cn/mobile/ios/getcompanymxwap.asp?parm1=<%=rs1("cid")%>&parm2=1"><%=rs1("companyname")%></a><br/>
��ϵ�ˣ�<a href="http://www.jdjs.com.cn/mobile/ios/getpeoplemxwap.asp?parm1=<%=rs1("pepid")%>&parm2=1"><%=rs1("linkman")%></a><%=rs1("chenghu")%><%=rs1("job")%><br/>
�绰/�ֻ�:<%=rs1("phone")%><br/>
����:<%=rs1("fax")%><br/>
����:<%=rs1("email")%><br/>
��ַ:<%=rs1("address")%><br/><br/>
<%
rs1.MoveNext  
Loop 
rs1.close() 
%>
</td></tr>
<tr><td>����ʦ/���Ժ:</td><td>
<%
sql1 = "select * from Pro_linkman_View where compid = 1 and proid  = '" + Cstr(rs("id")) +"'"  
set rs1= Server.CreateObject("ADODB.RecordSet")  
rs1.Open sql1,cnn ,1,1 
%>
<%
do While not rs1.eof
%>
���̽�ɫ:<%=rs1("juese")%><br/>
<a href="http://www.jdjs.com.cn/mobile/ios/getcompanymxwap.asp?parm1=<%=rs1("cid")%>&parm2=1"><%=rs1("companyname")%></a><br/>
��ϵ�ˣ�<a href="http://www.jdjs.com.cn/mobile/ios/getpeoplemxwap.asp?parm1=<%=rs1("pepid")%>&parm2=1"><%=rs1("linkman")%></a><%=rs1("chenghu")%><%=rs1("job")%><br/>
�绰/�ֻ�:<%=rs1("phone")%><br/>
����:<%=rs1("fax")%><br/>
����:<%=rs1("email")%><br/>
��ַ:<%=rs1("address")%><br/><br/>
<%
rs1.MoveNext  
Loop 
rs1.close() 
%>
</td></tr>
<tr><td>�н���:</td><td>
<%
sql1 = "select * from Pro_linkman_View where compid = 2 and proid  = '" + Cstr(rs("id")) +"'"  
set rs1= Server.CreateObject("ADODB.RecordSet")  
rs1.Open sql1,cnn ,1,1 
%>
<%
do While not rs1.eof
%>
���̽�ɫ:<%=rs1("juese")%><br/>
<a href="http://www.jdjs.com.cn/mobile/ios/getcompanymxwap.asp?parm1=<%=rs1("cid")%>&parm2=1"><%=rs1("companyname")%></a><br/>
��ϵ�ˣ�<a href="http://www.jdjs.com.cn/mobile/ios/getpeoplemxwap.asp?parm1=<%=rs1("pepid")%>&parm2=1"><%=rs1("linkman")%></a><%=rs1("chenghu")%><%=rs1("job")%><br/>
�绰/�ֻ�:<%=rs1("phone")%><br/>
����:<%=rs1("fax")%><br/>
����:<%=rs1("email")%><br/>
��ַ:<%=rs1("address")%><br/><br/>
<%
rs1.MoveNext  
Loop 
rs1.close() 
%>
</td></tr>
<%
else
%>
<tr><td>ҵ��/������:</td><td>��¼��ɼ�</td></tr
<tr><td>����ʦ/���Ժ:</td><td>��¼��ɼ�</td></tr
<tr><td>�н���:</td><td>��¼��ɼ�</td></tr>
<%
end if
%>
<!--<tr><td>ҵ��/������:</td><td><%=rs("proowner")%></td></tr>-->
<!--<tr><td>����ʦ/���Ժ:</td><td><%=rs("prodesigner")%></td></tr>-->
<!--<tr><td>�н���:</td><td><%=rs("probuilder")%></td></tr>-->
</table>
<%           
    rs.MoveNext  
Loop 
rs.close()  
cnn.close()  
%>
</body>
</html>
