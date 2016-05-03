<html>
<body style="font-size:11px">
<%
response.charset = "gb2312"
id=request("parm1")
id2=request("parm2")
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"   
sql = "select * from TClinkman where id = '" + id +"'"
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn ,1,1   
do While not rs.eof 
%>
<input type="button" value="后退" onclick="history.go(-1)" /><br/>
<b>人员信息</b><br/>
<%
if id2 = "1" then
%>
<table style="font-size:11px" border="1" width="100%">
<tr><td width="80">姓名:</td><td><%=rs("linkman")%></td></tr>
<tr><td>称呼:</td><td><%=rs("chenghu")%></td></tr>
<tr><td>职称:</td><td><%=rs("job")%></td></tr>
<tr><td>地域:</td><td><%=rs("place")%></td></tr>
<tr><td>人员地址:</td><td><%=rs("address")%></td></tr>
<tr><td>电话/手机:</td><td><%=rs("phone")%></td></tr>
<tr><td>传真:</td><td><%=rs("fax")%></td></tr>
<tr><td>电子邮件:</td><td><%=rs("email")%></td></tr>
</table>
<b>所属公司</b><br/>
<%
sql1 = "select * from TCcompany where pcid  = '" + Cstr(rs("cid")) +"'"  
set rs1= Server.CreateObject("ADODB.RecordSet")  
rs1.Open sql1,cnn ,1,1 
%>
<table style="font-size:11px" border="1" width="100%">
<tr><td>公司名称</td</tr>
<%
do While not rs1.eof
%>
<tr><td><a href="http://www.jdjs.com.cn/mobile/ios/getcompanymxwap.asp?parm1=<%=rs1("pcid")%>&parm2=1"><%=rs1("company")%></a></td></tr>
<%
rs1.MoveNext  
Loop 
rs1.close() 
%>
</table>
<b>相关参与工程列表</b><br/>
<%
sql2 = "select * from Pro_linkman_View where pepid = '" + Cstr(rs("id")) +"'"  
set rs2= Server.CreateObject("ADODB.RecordSet")  
rs2.Open sql2,cnn ,1,1 
%>
<table style="font-size:11px" border="1" width="100%">
<tr><td>项目名称</td</tr>
<%
do While not rs2.eof
%>
<tr><td><a href="http://www.jdjs.com.cn/mobile/ios/getmat_projectmxwap.asp?parm1=<%=rs2("proid")%>&parm2=1"><%=rs2("proname")%></a></td></tr>
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
