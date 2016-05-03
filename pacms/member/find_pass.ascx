<% @  Control Language="c#" Inherits="PageAdmin.find_pass" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; 找回密码</li>
<li class="uc_lanmu_site_2">找回密码</li>
</ul>
</div>
<div class="uc_lanmu_content">
<asp:PlaceHolder id="P1" runat="server" >
<div class="findpass_box">
<form   method="post" name="login_form" id="login_form" >
<li class="findpass_item_1">用户名： </li>
<li class="findpass_item_2">&nbsp;<input  type="text" size="20" maxlength="16" class="login_textbox" name="username"   id="username"  />
</li>

<li class="findpass_item_jiange"></li>

<li class="findpass_item_1">注册邮箱： </li>
<li class="findpass_item_2">&nbsp;<input  type="text" size="20" maxlength="45" class="login_textbox" name="email" id="email" /> 请填注册会员时所填的邮箱
</li>

<li class="findpass_item_jiange"></li>
<li class="findpass_item_jiange"></li>
<li class="findpass_submit_box"><input type="hidden" name="submit"  value="yes"><input type="submit"  value=" 找回密码 "  onclick="return Find_Pass()" class="bt"></li>
<li class="findpass_tishi_box">忘记邮箱或用户名请联系客服人员</li>
 <li class="clear"></li>
</ul>
</form>
</div>
</asp:PlaceHolder>

<asp:PlaceHolder id="P2" runat="server"  visible="false">
<div align=center>
<img src=/images/public/suc.gif width="167px" vspace="5px">
<br>对不起，用户名或邮箱填写错误。
<br><br><input type="button" class="bt" value="返回"  onclick="location.href=location.href">
<br><br>
</div>
</asp:PlaceHolder>

<asp:PlaceHolder id="P3" runat="server"  visible="false">
<div align=center>
<img src=/images/public/suc.gif width="167px" vspace="5px">
<br>您的密码已经发送到您的油箱(<%=Result%>)。
<br><br><input type="button" class="bt" value="返回"  onclick="location.href='<%=GetUrl("login")%>'">
<br><br>
</div>
</asp:PlaceHolder>


</div>
</div>