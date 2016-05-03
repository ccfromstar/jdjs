<% @ Page Language="C#" Inherits="PageAdmin.msgsend_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="business_3"/> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>信息发送</b></td></tr>
 <tr><td height=10 ></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">
<form method="post">
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">
<div name="tabcontent" id="tabcontent">
<table border=0 cellpadding="5px" cellspacing=0  align=center width=98%>
     <tr>
      <td height=25 align=right width=100px>收件人：</td>
      <td> 
        <asp:Repeater id="P1" runat="server">
         <ItemTemplate>
           <input type="radio" name="Receivers" id="Receivers" value="<%#DataBinder.Eval(Container.DataItem,"id")%>" ><%#DataBinder.Eval(Container.DataItem,"m_type")%>
         </ItemTemplate>
        </asp:Repeater>
       <input type="text"  id="Receiver"  name="Receiver"  size="60" class="tb" value="<%=Receiver%>" style="display:<%=ShowSingleReceiver%>"></td>
    </tr>

  <tr>
      <td height=25 align=right>标题：</td>
      <td><input type="text"  id="fb_title"  name="fb_title"  maxlength="100" size="60" class="tb" > <span style="color:#ff0000">*</span>
   </td>
  </tr>

   <tr>
          <td align=right>内容：</td>
          <td>
            <textarea name="Content" id="Content"></textarea>
<script type="text/javascript" src="/incs/fckeditor/fckeditor.js"></script>
<script  type="text/javascript"> 
var FCKeditor = new FCKeditor("Content"); 
FCKeditor.BasePath = "/incs/fckeditor/"; 
FCKeditor.Height = 300; 
FCKeditor.Config['LinkBrowser'] = false ;
FCKeditor.Config['ImageBrowser'] =false ;
FCKeditor.Config['FlashBrowser'] = false ;
FCKeditor.Config['LinkUpload'] = true ;
FCKeditor.Config['ImageUpload'] = true ;
FCKeditor.Config['FlashUpload'] = true ;
FCKeditor.ToolbarSet ="Simple"; 
FCKeditor.ReplaceTextarea(); 
</script>
          </td>
      </tr> 

  </tr>

     <tr>
      <td height=30px align=center colspan=2>
      <asp:Label id="SendState" runat="server"/>
      <input type="hidden"   value="<%=SendType%>"  name="Submit" id="Submit">&nbsp;
      <input type="checkbox" value="1"  name="sendmail" id="sendmail"  title="群发较多用户时建议不要选择，会严重影响速度、导致油箱被封等情况">同时发送邮件
      <input type="submit" value="发 送"   class="button" onclick="return Check_Message('<%=SendType%>')">
     </td>
    </tr>
   </table>

  </td>
  <tr>
 </table>

</form>
</td>
</tr>
</table>
</center>
<script>
 if("<%=SendType%>"=="single")
    {
       document.getElementById("sendmail").checked=true;
    }
 function Check_Message(thetype)
  { 

    var fb_value;
    if(thetype=="single")
     {
       fb_value=Trim(document.getElementById("fb_receiver").value);
       if(fb_value=="")
       {
       alert("收件人不能为空!");
       document.getElementById("fb_receiver").focus();
       return false;
      }
     }
   else
    {
     var MGroup=document.getElementsByName("Receivers");
     if(!IsChecked(MGroup))
      {
       alert("请至少选择一个收件组!");
       return false;
      }
    }

   fb_value=Trim(document.getElementById("fb_title").value);
   if(fb_value=="")
    {
      alert("请输入短信标题!");
      document.getElementById("fb_title").focus();
      return false;
    }

  }
</script>
</body>
</html>  



