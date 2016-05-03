<%    
set cnn2 = Server.CreateObject("ADODB.Connection")   
cnn2.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"   
sql = "select * from cctest"  
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn2 ,1,1  
Response.write("连接2："&cnn2.ConnectionString&"<br/> spt_values行数："&rs.recordcount&"<br/>")  
do While not rs.eof  
    Response.write(rs(0)&","&rs(1)&"<br/>")  
    rs.MoveNext  
Loop  
rs.close()  
cnn2.close()  
%>
