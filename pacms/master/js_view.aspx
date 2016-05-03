<% @ Page Language="C#" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<% @ Import NameSpace="PageAdmin"%>
<script language="c#" runat="server">
 string  Id;
 public void Page_Load(Object src,EventArgs e)
  {
     Master_Valicate YZ=new Master_Valicate();
     YZ.Master_Check();       //PageAdmin网站管理系统管理权限验证
     Get_Code();
  }

public void Get_Code()
 {
   string Type=Request.QueryString["type"];
   switch(Type)
    {
     case "link":
      Link_Holder.Visible=true;
      string Tid=Request.QueryString["tid"];
      string Target=Request.QueryString["target"];
      string Num=Request.QueryString["num"];
      Like_js_Code.Text="<s"+"cript src=\"/include/link.aspx?tid="+Tid+"&num="+Num+"&style=0\" type=\"text/javascript\"></"+"script>";
    break;

    case "slide":
      Id=Request.QueryString["id"];
      slide_Holder.Visible=true;
    break;

    case "vote":
     Id=Request.QueryString["id"];
     vote_Holder.Visible=true;
     break;

    case "loginbox":
     Id=Request.QueryString["id"];
     loginbox_Holder.Visible=true;
     break;

    case "searchbox":
     Id=Request.QueryString["id"];
     searchbox_Holder.Visible=true;
     break;

    }
 }
public bool IsNum(string str)
 {
  if(str=="" || str==null)
   {
    return false;
   }
  string str1="0123456789";
  string str2=str.ToLower();
  for(int i=0;i<str2.Length;i++)
   {
    if(str1.IndexOf(str2[i])==-1)
     {
       return false;
     }
   }
  return true;
 }

</script>
<aspcn:uc_head runat="server" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>JS代码调用</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">
 <form runat="server">
 <asp:PlaceHolder id="Link_Holder" runat="server" Visible="false" >
 <asp:TextBox TextMode="multiLine" Id="Like_js_Code" columns="80" rows="6" runat="server"/>
  <br><br>说明：复制以上代码到您需要调用的地方；在修改参数后，请重新生成JS代码。
  <br>参数说明：
  <br>tid：链接类型的ID号.
  <br>num：表示需要显示的记录数；0表示显示所有记录。
  <br>style：显示样式；0:下拉表单形式，1:文字排列，2:图片排列
 </asp:PlaceHolder>

<asp:PlaceHolder id="slide_Holder" runat="server" Visible="false" >
<textArea cols="80" rows="6">
<script src="/include/slide.aspx?id=<%=Id%>" type="text/javascript"></script>
</textArea>
  <br><br>说明：复制以上代码到您需要调用的地方;
  <br>参数说明：
  <br>id：幻灯片的ID号.
 </asp:PlaceHolder>

<asp:PlaceHolder id="vote_Holder" runat="server" Visible="false" >
<textArea cols="80" rows="6">
<script src="/include/votebar.aspx?id=<%=Id%>" type="text/javascript"></script>
</textArea>
  <br><br>说明：复制以上代码到您需要调用的地方;
  <br>参数说明：
  <br>id：问卷的ID号.
 </asp:PlaceHolder>

<asp:PlaceHolder id="loginbox_Holder" runat="server" Visible="false" >
<textArea cols="80" rows="6" id="L_js">
<script src="/include/loginbox.aspx?id=<%=Id%>" type="text/javascript"></script>
</textArea>

  <br><br>说明：复制以上代码到您需要调用的地方,可以根据需要填写各参数重新生成JS;
  <br>参数说明：
  <br>id：搜索框的ID号.
<script language="javascript">
function Build_Js()
 {
   var obj_js=document.getElementById("L_js")
   var obj_id=document.getElementById("L_id");
   var obj_allow=document.getElementById("Allow")
   var obj_tourl=document.getElementById("Tourl")
   var obj_backurl=document.getElementById("Backurl")
   var Str="<"+"script src=\"/include/loginbox.aspx?id="+obj_id.value+"&allow="+obj_allow.value+"&tourl="+escape(obj_tourl.value)+"&backurl="+escape(obj_backurl.value)+"&showreg=true\"><"+"/script>";
   obj_js.value=Str;
 }
</script>
 </asp:PlaceHolder>

<asp:PlaceHolder id="searchbox_Holder" runat="server" Visible="false" >
<textArea cols="80" rows="6">
<script src="/include/searchbox.aspx?id=<%=Id%>" type="text/javascript"></script>
</textArea>
  <br><br>说明：复制以上代码到您需要调用的地方;
  <br>参数说明：
  <br>id：搜索框的ID号.
</asp:PlaceHolder>

</form>
</td>
</tr>
</table>
</center>
</body>
</html>  



