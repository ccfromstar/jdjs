<% @ Page Language="C#"   Inherits="PageAdmin.lanmu_spc" %>
<% @ Register TagPrefix="aspcn" TagName="uc_fckeditor" src="/incs/fckeditor/fckeditor.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="lanmu_4" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>自定义栏目</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top>

<form runat="server">
<table border=0 cellpadding=5 cellspacing=0  width=100% align=center  class=table_style2>
<tr>
  <td valign=top  align="left">
<table border=0 cellpadding=0 cellspacing=2 width=100% align=center>

     <tr>
          <td  height=40 width="60px">是否开启</td>
          <td ><asp:CheckBox id="Spe_lanmu_open"  Runat="server" />开启自定义栏目(通过此功能，用户可制作个性化的栏目菜单)</td>
      </tr> 
      <tr>
          <td>栏目内容</td>
          <td>
             <asp:TextBox id="Content" TextMode="MultiLine"  runat="server" />
            <aspcn:uc_fckeditor  Tb_Id="Content" Fck_Height="400" Fck_Style="Basic" runat="server"/>
          </td>
      </tr> 
      <tr>
          <td   height=25 colspan=2 align=center>
<asp:Button Text=" 提 交 " runat="server" cssclass="button"  onclick="PageAdmin_Data_Update"/>

</td>
      <tr>       
    </table>
 </td>
 <tr>
</table>
<br>
<div align="left">说明：开启自定义栏目后，系统默认栏目将不显示，所以自定义栏目中的链接务必和默认栏目链接保持一致。</div>
</form>

</td>
</tr>
</table>
</center>
</body>
</html>  

