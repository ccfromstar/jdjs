<%    
response.ContentType="text/plain"
response.charset = "gb2312"
id=request("parm1")
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"   
sql = "select * from TClinkman where id = '" + id +"'"
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn ,1,1   
do While not rs.eof 
  sql1 = "select * from TCcompany where pcid = '" + Cstr(rs("cid")) +"'"	
    set rs1= Server.CreateObject("ADODB.RecordSet")  
    rs1.Open sql1,cnn ,1,1  
    do While not rs1.eof
           Response.write(rs("linkman")&"#"&rs("chenghu")&"#"&rs("job")&"#"&rs("companyname")&"#"&rs("place")&"#"&rs("address")&"#"&rs("phone")&"#"&rs("fax")&"#"&rs("email")&"#"&rs1("company")&"#"&rs1("caddress")&"#"&rs1("cpost")&"#"&rs1("ctype")&"#"&rs1("cplace")&"#"&rs1("cphone")&"#"&rs1("cfax")&"#"&rs1("cemail")&"#"&rs1("cweb")) 
          rs1.MoveNext   
    Loop
    rs1.close()
           
    rs.MoveNext  
Loop 
rs.close()  
cnn.close()  
%>
