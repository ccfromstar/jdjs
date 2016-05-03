
<%@ LANGUAGE=VBScript CodePage=65001%>
<%    
response.ContentType="text/plain"
response.charset = "gb2312"
id=Request.QueryString("parm1")
id1=Request.QueryString("parm3")
ps=Cint(request("parm2"))
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"   
sql = "select * from v_material_data where zname like '%" + id  +"%' and company like '%"+id1+"%'"
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn ,1,1    
i = 1  
do While not rs.eof  
    if i < ps then
      rs.MoveNext  
    elseif i > (ps + 3) then
      exit do
    else
    sql1 = "select * from material_company where cid = '" + rs("cid") +"'"	
    set rs1= Server.CreateObject("ADODB.RecordSet")  
    rs1.Open sql1,cnn ,1,1  
    do While not rs1.eof
          Response.write(rs("mid")&"#"&rs("zname")&"#"&rs1(2)&"#"&rs("lprice")&"#"&rs("zunit")&"#"&rs("standard")&"#-@") 
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
