<% @ Page Language="C#"  Inherits="PageAdmin.iplist" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  Type="basic_5" />
<style Type="text/css">
.button1{
	height:23px;
	width:120px;
        font-weight:normal;
        color:#222222;
        background-color:white;
        border-top: 0 outset #333333;
	border-right: 0 outset #333333;
	border-bottom:0 outset #333333;
	border-left: 0 outset #333333;
        cursor:hand;
       }
</style>
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1 align="left"><b>流量统计</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top>
<form runat="server" id="form1">

<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border=0 cellpadding=0 cellspacing=0 width=95% align=center>
<tr>
  <td  colspan=2 height=25><b><asp:Label id="TheDate" runat="server"/>访问明细</b></td>
 </tr>
</table>

 <table border=0 cellpadding=0 cellspacing=1 width=95% align=center class="tablestyle" >
 <tr>
  <td width=12% class="white" height=25 align=center>IP</td>
  <td width=55% class="white" align=center>访问来路</td>
  <td width=8% class="white" align=center>时间</td>
  <td width=7% class="white" align=center>浏览器</td>
  <td width=8% class="white" align=center>系统</td>
  <td width=10% class="white" align=center>操作</td>
 </tr>
 </table>
<asp:DataList id="Dlist1" width="100%" runat="server" RepeatLayout="Table" RepeatColumns="1" Cellspacing=0 Cellpadding="0"   
RepeatDirection="Horizontal" OnItemDataBound="Del_Bind">
<ItemTemplate>
 <table border=0 cellpadding=0 cellspacing=0 width=95% align=center class="tablestyle" style="table-layout:fixed;">
 <tr>
  <td  class="tdstyle" width=12% height=25><input type="button" class="button1"  value='<%#DataBinder.Eval(Container.DataItem,"ip")%>'   onclick="GetIP(this.value)"></td>
  <td  class="tdstyle" width=55% align="left"><span onclick="GO_Url('<%#DataBinder.Eval(Container.DataItem,"urlfrom")%>')" style="cursor:pointer"><%#DataBinder.Eval(Container.DataItem,"urlfrom")%></a></td>
  <td   class="tdstyle" width=8%><%#DataBinder.Eval(Container.DataItem,"thedate","{0:HH:mm:dd}")%></td>
  <td   class="tdstyle" width=7%><%#DataBinder.Eval(Container.DataItem,"browser")%></td>
  <td   class="tdstyle" width=8%><%#DataBinder.Eval(Container.DataItem,"platform")%></td>
  <td   class="tdstyle" width=10% align=center><asp:Button id="Delete" Text="删除" CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' onCommand="Data_Delete" Cssclass="button" runat="server"/></td>
 </tr>
 </table>
</ItemTemplate>
</asp:DataList>

</td>
 </tr>
</table>
<br>
<table border=0 cellpadding=0 cellspacing=1 width=95% align=center>
 <tr>
  <td width=20%  height=25  align=left>
   <input type="button" value="返回" class="button" onclick="location.href='tongji.aspx?year=<%=Request.QueryString["year"]%>&month=<%=Request.QueryString["month"]%>'">
 </td>
  <td width=80%  height=25 align=right>
  总共<asp:Label id="LblRecordcount" runat="server" />条记录
  当前页次：<asp:Label id="LblCurrentPage" runat="server" />/<asp:Label id="LblPageCount" runat="server" />
<asp:LinkButton id="First" CssClass="link" CommandName="First"  OnCommand="Page_change"  runat="server" Text="首页"/>&nbsp;
<asp:LinkButton id="Prev"  CssClass="link"  CommandName="Prev"  OnCommand="Page_change"  runat="server" Text="上一页"/>&nbsp;
<asp:LinkButton id="Next"  CssClass="link"  CommandName="Next"  OnCommand="Page_change"  runat="server" Text="下一页"/>&nbsp;
<asp:LinkButton id="Last"  CssClass="link"  CommandName="Last"  OnCommand="Page_change"  runat="server" Text="尾页"/>&nbsp;
转到：<asp:DropDownList id="Dp_page" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Page_select">
</asp:DropDownList>页
 </td>

 </tr>
 </table>
</form>
</td>
</tr>
</table>
<FORM METHOD=POST ACTION="http://www.ip138.com/ips8.asp" name="ipform" target="_blank">
<tr><td align="center">
IP地址：<input type="text" name="ip" size="16"> 
<INPUT TYPE="hidden" name="action" value="2">
<input type="submit" value="查询" class="button">
</td></tr></FORM>
<script language="javascript">
function GetIP(TheValue)
 {
   window.open("http://www.ip138.com/ips.asp?ip="+TheValue,"ip");
 }

function GO_Url(TheValue)
 {
    if(TheValue.indexOf("http://")==0)
     {
     window.open(TheValue,"urlfrom");
    }
 }

</script>
</center>
</body>
</html>  
