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
<input type="button" value="后退" onclick="history.go(-1)" /><br/>
<b>公司信息</b><br/>
<%
if id2 = "1" then
%>
<table style="font-size:11px" border="1" width="100%">
<tr><td width="80">公司名称:</td><td><%=rs("company")%></td></tr>
<tr><td>公司地址:</td><td><%=rs("caddress")%></td></tr>
<tr><td>公司邮编:</td><td><%=rs("cpost")%></td></tr>
<tr><td>公司性质:</td><td><%=rs("ctype")%></td></tr>
<tr><td>地域:</td><td><%=rs("cplace")%></td></tr>
<tr><td>公司电话:</td><td><%=rs("cphone")%></td></tr>
<tr><td>公司传真:</td><td><%=rs("cfax")%></td></tr>
<tr><td>电子邮箱:</td><td><%=rs("cemail")%></td></tr>
<tr><td>公司网址:</td><td><%=rs("cweb")%></td></tr>
</table>
<b>公司人脉列表</b><br/>
<%
sql1 = "select * from TClinkman where cid = '" + Cstr(rs("pcid")) +"'"  
set rs1= Server.CreateObject("ADODB.RecordSet")  
rs1.Open sql1,cnn ,1,1 
%>
<table style="font-size:11px" border="1" width="100%">
<tr><td>姓名</td><td>职务</td><td>电话</td</tr>
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
<b>相关参与工程列表</b><br/>
<%
sql2 = "select * from project_inforbase where attcmp like '%" + Cstr(rs("company")) +"%'"  
set rs2= Server.CreateObject("ADODB.RecordSet")  
rs2.Open sql2,cnn ,1,1 
%>
<table style="font-size:11px" border="1" width="100%">
<tr><td>项目名称</td</tr>
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
登录后可见
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
