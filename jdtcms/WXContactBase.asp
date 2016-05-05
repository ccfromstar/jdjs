<%@ LANGUAGE=VBScript CodePage=65001%>
<%    
response.ContentType="text/plain"
response.charset = "utf-8"
sql=Request.QueryString("p")
sql=replace(sql,"@","%")
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"    
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn ,1,1   
i = 1
do While not rs.eof  	
    if i = 1 then
    	Response.write(rs("linkman")&"@"&rs("companyname")&"@"&rs("job"))
    else
    	Response.write("*"&rs("linkman")&"@"&rs("companyname")&"@"&rs("job"))  
    end if
    rs.MoveNext  
    i = i + 1
Loop  
rs.close()  
cnn.close()  
%>
