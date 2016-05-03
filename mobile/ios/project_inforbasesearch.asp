<%@ LANGUAGE=VBScript CodePage=65001%>
<%    
response.ContentType="text/plain"
response.charset = "gb2312"
id1=Request.QueryString("parm11")
id2=Request.QueryString("parm12")
id3=Request.QueryString("parm13")
id4=Request.QueryString("parm14")
id5=Request.QueryString("parm15")
ps=Cint(request("parm3"))
set cnn = Server.CreateObject("ADODB.Connection")   
cnn.Open "Driver={SQL Server};Server=hds-076.hichina.com;Database=hds0760218_db;UID=hds0760218;PWD=t2b5m6d1m0;"   
sql = "select * from project_inforbase where proname like '%" + id1 +"%' and proplace like '%" + id2 +"%' and proquyu like '%" + id3 +"%' and proaddress like '%"+ id4 +"%' and prostime like '%"+ id5 +"%'"
set rs= Server.CreateObject("ADODB.RecordSet")  
rs.Open sql,cnn ,1,1   
i = 1
do While not rs.eof  
    if i < ps then
      rs.MoveNext  
    elseif i > (ps + 7) then
      exit do
    else
      Response.write(rs("id")&"#"&rs("proname")&"#"&rs("inforptime")&"@")  
      rs.MoveNext  
    end if
    i = i + 1
Loop  
rs.close()  
cnn.close()  
%>
