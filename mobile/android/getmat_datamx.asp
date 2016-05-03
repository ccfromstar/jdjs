<%    
response.ContentType="text/plain"
response.charset = "gb2312"
id=request("parm1")
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"   
sql = "select * from material_data where mid = '" + id +"'"
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn ,1,1   
for r=1 to rs.recordcount 
    if r = rs.recordcount then  
    sql1 = "select * from material_company where cid = '" + rs(14) +"'"	
    set rs1= Server.CreateObject("ADODB.RecordSet")  
    rs1.Open sql1,cnn ,1,1  
    do While not rs1.eof
          Response.write(rs("zname")&"#"&rs("zunit")&"#"&rs("lprice")&"#"&rs("class")&"#"&rs("place")&"#"&rs("amount")&"#"&rs("material")&"#"&rs("stime")&"#"&rs("ptime")&"#"&rs1("company")&"#"&rs1("address")&"#"&rs1("leader")&"#"&rs1("linkman")&"#"&rs1("tel")&"#"&rs1("email")&"#"&rs1("fax")&"#"&rs1("url")&"#"&rs1("post")&"#"&rs1("handset")&"#"&rs1("company")) 
          rs1.MoveNext   
    Loop
    rs1.close() 
    end if
next
rs.close()  
cnn.close()  
%>
