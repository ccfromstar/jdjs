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

<b>材料信息</b><br/>
<table style="font-size:11px" border="1" width="100%">
<tr><td>材料名称:</td><td><%=rs("zname")%></td></tr>
<tr><td>材料单位:</td><td><%=rs("zunit")%></td></tr>
<tr><td>材料价格:</td><td><%=rs("lprice")%></td></tr>
<tr><td>品牌:</td><td><%=rs("class")%></td></tr>
<tr><td>产地:</td><td><%=rs("place")%></td></tr>
<tr><td>总供应量:</td><td><%=rs("amount")%></td></tr>
<tr><td>材质:</td><td><%=rs("material")%></td></tr>
<tr><td>材料记录录入日期:</td><td><%=rs("stime")%></td></tr>
<tr><td>记录发布日期:</td><td><%=rs("ptime")%></td></tr>
</table>
<b>供应商信息</b><br/>
<%
sql1 = "select * from material_company where cid = '" + Cstr(rs(14)) +"'"	
set rs1= Server.CreateObject("ADODB.RecordSet")  
rs1.Open sql1,cnn ,1,1 
%>
<%
do While not rs1.eof
%>
<table style="font-size:11px" border="1" width="100%">
<tr><td width="70">公司名称</td><td><%=rs1("company")%></td></tr>
<tr><td>公司地址</td><td><%=rs1("address")%></td></tr>
<tr><td>法人</td><td><%=rs1("leader")%></td></tr>
<tr><td>业务联系人</td><td><%=rs1("linkman")%></td></tr>
<tr><td>公司电话</td><td><%=rs1("tel")%></td></tr>
<tr><td>电子邮件</td><td><%=rs1("email")%></td></tr>
<tr><td>传真</td><td><%=rs1("fax")%></td></tr>
<tr><td>网址</td><td><%=rs1("url")%></td></tr>
<tr><td>邮编</td><td><%=rs1("post")%></td></tr>
<tr><td>联系人手机</td><td><%=rs1("handset")%></td></tr>
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
