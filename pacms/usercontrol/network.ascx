<% @ Control language="c#" Inherits="PageAdmin.network" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1"><%=Tags_1%> &gt; <%=Lanmu_site%></li>
<li class="uc_lanmu_site_2"><%=Lanmu_3%></li>
</ul>
</div>
<div class="uc_lanmu_content">
<%=Lanmu_Header%>
<table border="0" cellpadding="0" align="center" width="100%">
 <tr><td align="center">
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="480" height="380">
 <param name="movie" value="/images/swf/map.swf">
<param name="quality" value="high">
<embed src="/images/swf/map.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"  width="480" height="380">
</embed>
</object>
</td>
</tr>
 <tr><td align="left" id="N_list"></td></tr>
</table>
</div>
</div>
<form  runat="server"> 
<script language=javascript>
 var obj=document.getElementById("N_list");
 function showmap(Province)
  {
    var Canshu=Province;
    obj.innerHTML="Loading...";
    <%=Page.ClientScript.GetCallbackEventReference(this,"Canshu","ReceiveServerData",null)%>
  }
 function ReceiveServerData(BackValue) 
  { 
    obj.innerHTML=BackValue;
  } 
document.getElementsByTagName("form")[0].action="<%=PostUrl%>";
</script>
</form>

