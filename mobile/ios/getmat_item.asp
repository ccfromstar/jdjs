<%    
response.ContentType="text/plain"
response.charset = "gb2312"
id=request("parm1")
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"   
sql = "select * from mat_item where specialCode='" + id +"'"
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn ,1,1   
do While not rs.eof  	
	'查找有没有子项，没有的话就不显示二级分类
	'sql1 = "select * from material_data where mid like '%" + rs(5) +"%'"
	'set rs1= Server.CreateObject("ADODB.RecordSet")  
    'rs1.Open sql1,cnn ,1,1 
	'if rs1.recordcount > 0 then
    Response.write(rs(5)&"#"&rs(1)&"@")
	'end if
    rs.MoveNext  
Loop  
rs.close()  
cnn.close()  
%>
