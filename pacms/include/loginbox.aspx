<% @ Page  language="c#"  Inherits="PageAdmin.loginbox" %>
function LoadLoginBox_<%=Id%>()
{
var LoginBoxHtml="<form name='loginbox_<%=Id%>'  id='loginbox_<%=Id%>' method='post' onsubmit='return login_box_check_<%=Id%>()'>";
LoginBoxHtml+="<input type='hidden'  name='loginbox' value='yes'>";
LoginBoxHtml+="<input type='hidden'  name='Allow_Login' value='<%=Allow_Login%>'>";
LoginBoxHtml+="<input type='hidden'  name='To_Url' value='<%=ToUrl%>'>";
LoginBoxHtml+="<input type='hidden'  name='Back_Url' value='<%=BackUrl%>'>";
<asp:PlaceHolder id="P1" runat="server"  visible="false">
LoginBoxHtml+="<ul>";
LoginBoxHtml+="<li class='loginbox_item'>用户名：<input type='textbox' name='login_box_username' class='loginbox_textbox' maxlength='16'></li>";
LoginBoxHtml+="<li class='loginbox_item'>密&nbsp;&nbsp;&nbsp;码：<input type='password' name='login_box_password' class='loginbox_textbox' maxlength='16'></li>";
<% if(Show_Code=="1")
 {
%>
LoginBoxHtml+="<li class='loginbox_item'>验证码：<input type='textbox' name='login_box_yzm' class='loginbox_textbox_yzm' maxlength='4'>&nbsp;<img src='/incs/yzm.aspx' onclick='Login_Code_Change_<%=Id%>()' align=absmiddle border=0 id='yzcode_<%=Id%>'  alt='点击更换' style='cursor:pointer;width:50px;height:18px' ></li>";
<%}%>
LoginBoxHtml+="<li class='loginbox_item'>&nbsp;&nbsp;<%if(ShowReg=="1"){%><a href='<%=Get_Url("reg")%>'>注册会员</a><%}%>&nbsp;&nbsp;<input type='submit'  value='<%=LoginName%>' class='loginbox_submit'></li>";
LoginBoxHtml+="</ul>";
</asp:PlaceHolder>

<asp:PlaceHolder id="P1_Logined" runat="server" visible="false">
LoginBoxHtml+="会员名：<%=UserName%><br>";
LoginBoxHtml+="类&nbsp;&nbsp;&nbsp;别：<%=UserType%><br>";
LoginBoxHtml+="<a href='<%=Get_Url("index")%>' class='logined_href'>会员中心</a>&nbsp;&nbsp;<%if(Request.Cookies["order"]!=null){%><a href='/order/order.aspx?language=cn' class='logined_href' target='order'>我的购物车</a>&nbsp;&nbsp;<%}%><a href='<%=Get_Url("exit")%>' class='logined_href'>注销退出</a>";
</asp:PlaceHolder>


<asp:PlaceHolder id="P2" runat="server" visible="false">
LoginBoxHtml+="<ul style='clear:both'>";
LoginBoxHtml+="<li class='loginbox_item' style='float:left'>用户名：<input type='textbox' name='login_box_username' class='loginbox_textbox' maxlength='16'>&nbsp;</li>";
LoginBoxHtml+="<li class='loginbox_item' style='float:left'>密 码：<input type='password' name='login_box_password' class='loginbox_textbox' maxlength='16'>&nbsp;</li>";
<% if(Show_Code=="1")
 {
%>
LoginBoxHtml+="<li class='loginbox_item' style='float:left'>验证码：<input type='textbox' name='login_box_yzm' class='loginbox_textbox_yzm' maxlength='4'>&nbsp;<img src='/incs/yzm.aspx' onclick='Login_Code_Change_<%=Id%>()' align=absmiddle border=0 id='yzcode_<%=Id%>'  alt='点击更换' style='cursor:pointer;width:50px;height:18px' >&nbsp;</li>";
<%}%>
LoginBoxHtml+="<li class='loginbox_item' style='float:left'>&nbsp;<input type='submit'  value='<%=LoginName%>' class='loginbox_submit'><%if(ShowReg=="1"){%>&nbsp;&nbsp;<a href='<%=Get_Url("reg")%>'>注册会员</a><%}%></li>";
LoginBoxHtml+="</ul>";
</asp:PlaceHolder>

LoginBoxHtml+="</form>";
<asp:PlaceHolder id="P2_Logined" runat="server" visible="false">
LoginBoxHtml+="会员名：<%=UserName%>&nbsp;";
LoginBoxHtml+="类别：<%=UserType%>&nbsp;";
LoginBoxHtml+="<a href='<%=Get_Url("index")%>' class='logined_href'>会员中心</a>&nbsp;&nbsp;<%if(Request.Cookies["order"]!=null){%><a href='/order/order.aspx?language=cn' class='logined_href' target='order'>我的购物车</a>&nbsp;&nbsp;<%}%><a href='<%=Get_Url("exit")%>' class='logined_href'>注销退出</a>";
</asp:PlaceHolder>
document.write("<div class='loginbox'>"+LoginBoxHtml+"</div>");
}
LoadLoginBox_<%=Id%>();

function login_box_check_<%=Id%>()
 {
   var ShowCode="<%=Show_Code%>";
   if(ShowCode=="1")
    {
     document.loginbox_<%=Id%>.action="/member/index.aspx?type=login&language=<%=P_Language%>";
    }
   else
    {
     document.loginbox_<%=Id%>.action="/member/index.aspx?type=login&language=<%=P_Language%>&code=false";
    }

   document.loginbox_<%=Id%>.target="_self";
   var obj_username = document.loginbox_<%=Id%>.login_box_username;
   var obj_passowrd = document.loginbox_<%=Id%>.login_box_password;
   var username_checked,pass_checked;
  if (obj_username.value.length <4 || obj_username.value.length > 16)
      {
        alert("用户名长度需要在4-16之间!");
        obj_username.focus();
        return false;
      }

   if(!IsStr_<%=Id%>(obj_username.value))
          {
            alert("用户名只能由数字，字母和下划线组成!");
            obj_username.focus();
            return false;
          }

  if (obj_passowrd.value.length <5 || obj_passowrd.valuelength > 16)
      {
        alert("密码长度需要在5-16之间!");
        obj_passowrd.focus();
        return false;
      }

   if(!IsStr_<%=Id%>(obj_passowrd.value))
          {
            alert("密码只能由数字，字母和下划线组成!");
            obj_passowrd.focus();
            return false;
          }

<% if(Show_Code=="1")
 {
%>
  var obj_yzm = document.loginbox_<%=Id%>.login_box_yzm;
  if (obj_yzm.value.length<4)
      {
        alert("请输入验证码!");
        obj_yzm.focus();
        return false;
      }
<%}%>
   return true;
 }

function IsStr_<%=Id%>(temp)
  {
	validStr=new String("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_");
	for(i=0;i<temp.length;i++)
	{
		if(validStr.indexOf(temp.charAt(i))==-1)
		{
	      return false;
		}
	}
	
	return true;
  }

function  Login_Code_Change_<%=Id%>()
 {
  Obj=document.getElementById("yzcode_<%=Id%>");
  if(Obj.src.indexOf("yzm.aspx")>=0)
   {
    Obj.src="/incs/yzm1.aspx";
   }
  else
   {
    Obj.src="/incs/yzm.aspx"
   }
 }
