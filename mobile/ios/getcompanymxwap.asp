<html>
<body style="font-size:11px">
<%
response.charset = "gb2312"
id=request("parm1")
id2=request("parm2")
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"   
sql = "select * from TCcompany where pcid = '" + id +"'"
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn ,1,1   
do While not rs.eof 
%>
<input type="button" value="����" onclick="history.go(-1)" /><br/>
<b>��˾��Ϣ</b><br/>
<%
if id2 = "1" then
%>
<table style="font-size:11px" border="1" width="100%">
<tr><td width="80">��˾����:</td><td><%=rs("company")%></td></tr>
<tr><td>��˾��ַ:</td><td><%=rs("caddress")%></td></tr>
<tr><td>��˾�ʱ�:</td><td><%=rs("cpost")%></td></tr>
<tr><td>��˾����:</td><td><%=rs("ctype")%></td></tr>
<tr><td>����:</td><td><%=rs("cplace")%></td></tr>
<tr><td>��˾�绰:</td><td><%=rs("cphone")%></td></tr>
<tr><td>��˾����:</td><td><%=rs("cfax")%></td></tr>
<tr><td>��������:</td><td><%=rs("cemail")%></td></tr>
<tr><td>��˾��ַ:</td><td><%=rs("cweb")%></td></tr>
</table>
<b>��˾�����б�</b><br/>
<%
sql1 = "select * from TClinkman where cid = '" + Cstr(rs("pcid")) +"'"  
set rs1= Server.CreateObject("ADODB.RecordSet")  
rs1.Open sql1,cnn ,1,1 
%>
<table style="font-size:11px" border="1" width="100%">
<tr><td>����</td><td>ְ��</td><td>�绰</td</tr>
<%
do While not rs1.eof
%>
<tr><td width="60"><a href="http://www.jdjs.com.cn/mobile/ios/getpeoplemxwap.asp?parm1=<%=rs1("id")%>&parm2=1"><%=rs1("linkman")%></a></td><td><%=rs1("job")%></td><td><%=rs1("phone")%></td></tr>
<%
rs1.MoveNext  
Loop 
rs1.close() 
%>
</table>
<b>��ز��빤���б�</b><br/>
<%
sql2 = "select * from project_inforbase where attcmp like '%" + Cstr(rs("company")) +"%'"  
set rs2= Server.CreateObject("ADODB.RecordSet")  
rs2.Open sql2,cnn ,1,1 
%>
<table style="font-size:11px" border="1" width="100%">
<tr><td>��Ŀ����</td</tr>
<%
do While not rs2.eof
%>
<tr><td><a href="http://www.jdjs.com.cn/mobile/ios/getmat_projectmxwap.asp?parm1=<%=rs2("id")%>&parm2=1"><%=rs2("proname")%></a></td></tr>
<%
rs2.MoveNext  
Loop 
rs2.close() 
%>
</table>
<%
else
%>
��¼��ɼ�
<%
end if
%>
<%           
    rs.MoveNext  
Loop 
rs.close()  
cnn.close()  
%>
</body>
</html>
