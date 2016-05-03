<%    
response.ContentType="text/plain"
response.charset = "gb2312"
sql=request("p")
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"    
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn ,1,1   
i = 1
do While not rs.eof 	
    Response.write(rs("count"))
    rs.MoveNext  
    i = i + 1
Loop  
rs.close()  
cnn.close()  
%>
