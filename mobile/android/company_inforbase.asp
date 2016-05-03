<%    
response.ContentType="text/plain"
response.charset = "gb2312"
ps=Cint(request("parm2"))
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"   
sql = "select * from TCcompany"  
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn ,1,1   
i = 1
do While not rs.eof  	
    if i < ps then
      rs.MoveNext  
    elseif i > (ps + 7) then
      exit do
    else
    Response.write(rs("pcid")&"#"&rs("company")&"#"&rs("cplace")&"#"&rs("cphone")&"@")  
    rs.MoveNext  
    end if
    i = i + 1
Loop  
rs.close()  
cnn.close()  
%>
