<%
Dim city
city=Request("city")
a = weather(""&city&"")'这里是城市名称
if a(1)="晴转多云" then mm="123123123"
%>
document.write('<%=a(0)%>:<%=a(1)%>&nbsp;<%=a(2)%>-<%=a(3)%>&nbsp;<%=a(4)%>');
<%
on error resume next
function weather(city)
  DIM Product(5)
  content = getHTTPPage("http://tq.tom.com/china/index.html")
  cc      = split(content," align=center><td><font color=#005FC9>")
  'response.write (cc(0))
  for each a in cc
    a1 = split(a,"</font></td><td>")'a1(0)为城市
   
    if (a1(0)=city) then
      'response.write a1(0)&a1(1)
      a2           = split(a1(1),"</td><td>")'a2(0)天气,a2(1)最高温度,a2(2)最低温度
      Product(0)   = city
      Product(1)   = a2(0)
      Product(2)   = a2(1)
      Product(3)   = a2(2)
      a3           = split(a2(3),"</td>")
      Product(4)   = a3(0)
      exit for
    end if
    'response.write a&vbcrlf
  next
  weather = Product
end function



response.write city&vbcrlf&a2(0)&vbcrlf&a2(1)&vbcrlf&a2(2)&vbcrlf&wind
Function BytesToBstr(body,Cset)
  dim objstream
  set objstream = Server.CreateObject("adodb.stream")
  objstream.Type = 1
  objstream.Mode =3
  objstream.Open
  objstream.Write body
  objstream.Position = 0
  objstream.Type = 2
  objstream.Charset = Cset
  BytesToBstr = objstream.ReadText
  objstream.Close
  set objstream = nothing
End Function

Function getHTTPPage(Path)
  t = GetBody(Path)
  getHTTPPage=BytesToBstr(t,"GB2312")
End function

Function GetBody(url)
  on error resume next
  Set Retrieval = CreateObject("Microsoft.XMLHTTP")
  With Retrieval
  .Open "Get", url, False, "", ""
  .Send
  GetBody = .ResponseBody
  End With
  Set Retrieval = Nothing
End Function
%>