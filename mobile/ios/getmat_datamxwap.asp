<html>
<body style="font-size:11px">
<%
response.charset = "gb2312"
id=request("parm1")
id2=request("parm2")
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"   
sql = "select * from material_data where mid = '" + id +"' order by id desc"
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn ,1,1   
i = 1
do While not rs.eof 
if i = 1 then
%>

<b>������Ϣ</b><br/>
<table style="font-size:11px" border="1" width="100%">
<tr><td>��������:</td><td><%=rs("zname")%></td></tr>
<tr><td>���ϵ�λ:</td><td><%=rs("zunit")%></td></tr>
<tr><td>���ϼ۸�:</td><td><%=rs("lprice")%></td></tr>
<tr><td>Ʒ��:</td><td><%=rs("class")%></td></tr>
<tr><td>����:</td><td><%=rs("place")%></td></tr>
<tr><td>�ܹ�Ӧ��:</td><td><%=rs("amount")%></td></tr>
<tr><td>����:</td><td><%=rs("material")%></td></tr>
<tr><td>���ϼ�¼¼������:</td><td><%=rs("stime")%></td></tr>
<tr><td>��¼��������:</td><td><%=rs("ptime")%></td></tr>
</table>
<b>��Ӧ����Ϣ</b><br/>
<%
sql1 = "select * from material_company where cid = '" + Cstr(rs(14)) +"'"	
set rs1= Server.CreateObject("ADODB.RecordSet")  
rs1.Open sql1,cnn ,1,1 
%>
<%
do While not rs1.eof
%>
<table style="font-size:11px" border="1" width="100%">
<tr><td width="70">��˾����</td><td><%=rs1("company")%></td></tr>
<tr><td>��˾��ַ</td><td><%=rs1("address")%></td></tr>
<tr><td>����</td><td><%=rs1("leader")%></td></tr>
<tr><td>ҵ����ϵ��</td><td><%=rs1("linkman")%></td></tr>
<tr><td>��˾�绰</td><td><%=rs1("tel")%></td></tr>
<tr><td>�����ʼ�</td><td><%=rs1("email")%></td></tr>
<tr><td>����</td><td><%=rs1("fax")%></td></tr>
<tr><td>��ַ</td><td><%=rs1("url")%></td></tr>
<tr><td>�ʱ�</td><td><%=rs1("post")%></td></tr>
<tr><td>��ϵ���ֻ�</td><td><%=rs1("handset")%></td></tr>
</table>
<%
rs1.MoveNext 
Loop 
rs1.close() 
%>

<%     
 i = i + 1
 rs.MoveNext 
else
	exit do
end if      
     
Loop 
rs.close()  
cnn.close()  
%>
</body>
</html>
