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
<input type="button" value="后退" onclick="history.go(-1)" /><br/>
<b>工程信息</b><br/>
<table style="font-size:11px" border="1" width="100%">
<tr><td width="80">工程名称:</td><td><%=rs("proname")%></td></tr>
<tr><td>工程地域:</td><td><%=rs("proplace")%></td></tr>
<tr><td>工程地址:</td><td><%=rs("proaddress")%></td></tr>
<tr><td>工程造价:</td><td><%=rs("promoney")%></td></tr>
<tr><td>工程类别:</td><td><%=rs("prosort")%></td></tr>
<tr><td>工程状态:</td><td><%=rs("prostate")%></td></tr>
<tr><td>工程描述:</td><td><%=rs("prorek")%></td></tr>
<tr><td>开工日期:</td><td><%=rs("prostime")%></td></tr>
<tr><td>竣工日期:</td><td><%=rs("proftime")%></td></tr>
<tr><td>发布日期:</td><td><%=rs("inforptime")%></td></tr>
<%
if id2 = "1" then
%>
<tr><td>业主/开发商:</td><td>
<%
sql1 = "select * from Pro_linkman_View where compid = 0 and proid  = '" + Cstr(rs("id")) +"'"  
set rs1= Server.CreateObject("ADODB.RecordSet")  
rs1.Open sql1,cnn ,1,1 
%>
<%
do While not rs1.eof
%>
工程角色:<%=rs1("juese")%><br/>
<a href="http://www.jdjs.com.cn/mobile/ios/getcompanymxwap.asp?parm1=<%=rs1("cid")%>&parm2=1"><%=rs1("companyname")%></a><br/>
联系人：<a href="http://www.jdjs.com.cn/mobile/ios/getpeoplemxwap.asp?parm1=<%=rs1("pepid")%>&parm2=1"><%=rs1("linkman")%></a><%=rs1("chenghu")%><%=rs1("job")%><br/>
电话/手机:<%=rs1("phone")%><br/>
传真:<%=rs1("fax")%><br/>
邮箱:<%=rs1("email")%><br/>
地址:<%=rs1("address")%><br/><br/>
<%
rs1.MoveNext  
Loop 
rs1.close() 
%>
</td></tr>
<tr><td>建筑师/设计院:</td><td>
<%
sql1 = "select * from Pro_linkman_View where compid = 1 and proid  = '" + Cstr(rs("id")) +"'"  
set rs1= Server.CreateObject("ADODB.RecordSet")  
rs1.Open sql1,cnn ,1,1 
%>
<%
do While not rs1.eof
%>
工程角色:<%=rs1("juese")%><br/>
<a href="http://www.jdjs.com.cn/mobile/ios/getcompanymxwap.asp?parm1=<%=rs1("cid")%>&parm2=1"><%=rs1("companyname")%></a><br/>
联系人：<a href="http://www.jdjs.com.cn/mobile/ios/getpeoplemxwap.asp?parm1=<%=rs1("pepid")%>&parm2=1"><%=rs1("linkman")%></a><%=rs1("chenghu")%><%=rs1("job")%><br/>
电话/手机:<%=rs1("phone")%><br/>
传真:<%=rs1("fax")%><br/>
邮箱:<%=rs1("email")%><br/>
地址:<%=rs1("address")%><br/><br/>
<%
rs1.MoveNext  
Loop 
rs1.close() 
%>
</td></tr>
<tr><td>承建商:</td><td>
<%
sql1 = "select * from Pro_linkman_View where compid = 2 and proid  = '" + Cstr(rs("id")) +"'"  
set rs1= Server.CreateObject("ADODB.RecordSet")  
rs1.Open sql1,cnn ,1,1 
%>
<%
do While not rs1.eof
%>
工程角色:<%=rs1("juese")%><br/>
<a href="http://www.jdjs.com.cn/mobile/ios/getcompanymxwap.asp?parm1=<%=rs1("cid")%>&parm2=1"><%=rs1("companyname")%></a><br/>
联系人：<a href="http://www.jdjs.com.cn/mobile/ios/getpeoplemxwap.asp?parm1=<%=rs1("pepid")%>&parm2=1"><%=rs1("linkman")%></a><%=rs1("chenghu")%><%=rs1("job")%><br/>
电话/手机:<%=rs1("phone")%><br/>
传真:<%=rs1("fax")%><br/>
邮箱:<%=rs1("email")%><br/>
地址:<%=rs1("address")%><br/><br/>
<%
rs1.MoveNext  
Loop 
rs1.close() 
%>
</td></tr>
<%
else
%>
<tr><td>业主/开发商:</td><td>登录后可见</td></tr
<tr><td>建筑师/设计院:</td><td>登录后可见</td></tr
<tr><td>承建商:</td><td>登录后可见</td></tr>
<%
end if
%>
<!--<tr><td>业主/开发商:</td><td><%=rs("proowner")%></td></tr>-->
<!--<tr><td>建筑师/设计院:</td><td><%=rs("prodesigner")%></td></tr>-->
<!--<tr><td>承建商:</td><td><%=rs("probuilder")%></td></tr>-->
</table>
<%           
    rs.MoveNext  
Loop 
rs.close()  
cnn.close()  
%>
</body>
</html>
