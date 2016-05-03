<%    
response.ContentType="text/plain"
response.charset = "gb2312"
id=request("parm1")
ps=Cint(request("parm2"))
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"   
sql = "select * from material_data where cid = '" + id +"'"
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn ,1,1 
i = 1  
do While not rs.eof  
     if i < ps then
      rs.MoveNext  
    elseif i > (ps + 3) then
      exit do
    else
    sql1 = "select * from material_company where cid = '" + rs(14) +"'"	
    set rs1= Server.CreateObject("ADODB.RecordSet")  
    rs1.Open sql1,cnn ,1,1  
    do While not rs1.eof
          Response.write(rs(1)&"#"&rs(2)&"#"&rs1(2)&"#"&rs(5)&"#"&rs("zunit")&"#"&rs("standard")&"#-@") 
          rs1.MoveNext   
    Loop
    rs1.close() 
    rs.MoveNext  
     end if
    i = i + 1
Loop  
rs.close()  
cnn.close()  
%>
