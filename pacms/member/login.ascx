<% @  Control Language="c#" Inherits="PageAdmin.mem_login" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; 会员登陆</li>
<li class="uc_lanmu_site_2">会员登陆</li>
</ul>
</div>
<div class="uc_lanmu_content">
<asp:PlaceHolder id="P1" runat="server" >

<div class="login_box">

<form method="post" name="login_form" id="login_form" >
<li class="login_item_1">用户名： </li>
<li class="login_item_2">&nbsp;<input  type="text" size="20" maxlength="16" class="login_textbox" name="username" id="username"  id="username"  />
</li>

<li class="login_item_jiange"></li>

<li class="login_item_1">密 码： </li>
<li class="login_item_2">&nbsp;<input  type="password" size="20" maxlength="16" class="login_textbox" name="password" id="password" id="password"  /> <a href="<%=Get_Url("find_pass")%>">忘记密码?</a>
</li>

<li class="login_item_jiange"></li>

<li class="login_item_1">验证码： </li>
<li class="login_item_2">&nbsp;<input type='textbox' name='yzm' class='login_textbox' maxlength='4' style="width:50px">&nbsp;<img src='/incs/yzm.aspx' onclick='Code_Change("logincode")' align=absmiddle border=0 id='logincode' style='cursor:pointer;width:50px;height:18px'  alt='点击更换'>
</li>
<li class="login_item_jiange"></li>
<li class="login_item_jiange"><input type="hidden" name="login"  value="yes"></li>
<li class="login_submit_box">&nbsp;<input type="submit"  value="登 陆"  onclick="return login_check()" class="bt"></li>
<li class="login_reg_box"><input type="button" onclick="location.href='<%=Get_Url("reg")%>'" align="absmiddle" class="bt" value="注 册"></li>
<li class="clear"></li>
</ul>
</form>
</div>
</asp:PlaceHolder>

<asp:PlaceHolder id="P2" runat="server"  visible="false">
<div align=center>
<img src=/images/public/suc.gif width="167px" vspace="5px">
<br><%=Error_Info%>
<br><br><input type="button" class="bt" value="返回"  onclick="location.href='<%=Get_Url("login")%>'">
<br><br>
</div>
</asp:PlaceHolder>


</div>
</div>