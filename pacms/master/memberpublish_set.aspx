<% @ Page Language="C#"  Inherits="PageAdmin.memberpublish_set" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>会员发布权限</b></td></tr>
 <tr><td height=10 ></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">
<form runat="server" >

<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">

  <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
    <tr>
     <td  height=25><b>当前类别</b>：<%=CurrentSite%></td>
   </tr>
   </table>

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>

    <tr>
        <td height=25  width="100px">开放会员类别</td>
       <td>
        <asp:Repeater id="P1" runat="server">
         <ItemTemplate>
           <input type="checkbox" name="M_Type" id="Type_<%#DataBinder.Eval(Container.DataItem,"id")%>" value="<%#DataBinder.Eval(Container.DataItem,"id")%>" ><%#DataBinder.Eval(Container.DataItem,"m_type")%><br>
         </ItemTemplate>
        </asp:Repeater>
      </td>
     </tr>
   <tr>
    <td  colspan="2" align="center" height="40px">
<asp:Button class=button   text="提交"  Id="Bt_Submit" runat="server" OnClick="PageAdmin_Data_Update" />&nbsp;&nbsp;
<input type="button" class=button  value="关闭"  onclick="window.close()"> 
</td>
  </tr>
  </table>
  </td>
  <tr>
 </table>
<script Language="javascript">
var M_Type="<%=M_Type%>";
var AType=M_Type.split(',');
if(M_Type!="")
 {
   for(i=0;i<AType.length;i++)
    {
      if(document.getElementById("Type_"+AType[i])!=null)
         {
          document.getElementById("Type_"+AType[i]).checked=true;
         }
    }
 }
</script>

</form>
</td>
</tr>
</table>
</center>
</body>
</html>  



