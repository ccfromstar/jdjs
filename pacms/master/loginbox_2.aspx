<% @ Page Language="C#" Inherits="PageAdmin.loginbox_2" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>登陆界面设置</b></td></tr>
 <tr><td height=10></td></tr>
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
  <td  colspan=2 height=25><b><%=Request.QueryString["name"]%>设置<b></td>
 </tr>
</table>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  height=25>允许登陆</td>
  <td> <input type="checkbox" name="Visiter_all" id="Visiter_0" value="0"  onclick="select_all()">所有来访者<br>
<asp:Repeater id="P1" runat="server">
         <ItemTemplate>
           <input type="checkbox" name="Visiter" id="Visiter_<%#DataBinder.Eval(Container.DataItem,"id")%>" value="<%#DataBinder.Eval(Container.DataItem,"id")%>" ><%#DataBinder.Eval(Container.DataItem,"m_type")%>&nbsp;
         </ItemTemplate>
        </asp:Repeater>
  </td>
 </tr>

<tr>
  <td  height=25>登陆按纽文字</td>
  <td><asp:TextBox id="Login_Name" runat="server" Text=" 登 陆 " size="10" Maxlength="20" />
 </tr>

<tr>
  <td  height=25>登陆目标地址</td>
  <td><asp:TextBox id="To_Url" runat="server"  size="40" Maxlength="100" /> 留空则默认会员中心
 </tr>

<tr>
  <td  height=25>登陆出错返回地址</td>
  <td><asp:TextBox id="Back_Url" runat="server"  size="40" Maxlength="100" /> 留空则默认会员中心
 </tr>

<tr>
  <td  height=25>注册链接</td>
  <td><asp:DropDownList id="D_ShowReg" runat="server" >
     <asp:ListItem value="0">隐藏</asp:ListItem>
     <asp:ListItem value="1">显示</asp:ListItem>
     </asp:DropDownList>
  </td>
 </tr>

</table>
<br>
<div align=center>
<asp:Button   Text="提交" CssClass="button" Runat="server" OnClick="PageAdmin_Data_Update"/>
<input type="button" class=button  value="返回"  onclick="location.href='loginbox_1.aspx'">
</div>

</td>
</tr>
</table>
</form>
</td>
</tr>
</table>
<script Language="javascript">
var Visitor="<%=Visitor%>";
var AVisitor=Visitor.split(',');
if(Visitor=="" || Visitor=="0")
 {
   document.getElementById("Visiter_0").checked=true;
   lock_mem_check();
 }
else
 {
   for(i=0;i<AVisitor.length;i++)
    {
      try{
         document.getElementById("Visiter_"+AVisitor[i]).checked=true;
         }
       catch(ex)
         {
         }
    }
 }

function lock_mem_check()
 {
  for(i=0;i<document.forms[0].Visiter.length;i++)
     {
       document.forms[0].Visiter[i].checked=true;
       document.forms[0].Visiter[i].disabled=true;
    }
 }

function unlock_mem_check()
 {
  for(i=0;i<document.forms[0].Visiter.length;i++)
     {
       document.forms[0].Visiter[i].checked=false;
       document.forms[0].Visiter[i].disabled=false;
    }
 }

function select_all()
 {
   var obj=document.getElementById("Visiter_0");
   if(obj.checked)
    {
      lock_mem_check();
    }
   else
    {
     unlock_mem_check()
    }
 }

</script>
</center>
</body>
</html>  



