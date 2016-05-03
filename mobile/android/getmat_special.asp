<%    
response.ContentType="text/plain"
response.charset = "gb2312"
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"   
sql = "select * from mat_special"  
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn ,1,1   
do While not rs.eof  	
    Response.write(rs(3)&"#"&rs(1)&"@")  
    rs.MoveNext  
Loop  
rs.close()  
cnn.close()  
%>
