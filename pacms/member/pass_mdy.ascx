<% @  Control Language="c#" Inherits="PageAdmin.pass_mdy"%>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 重设密码</li>
<li class="uc_lanmu_site_2">重设密码</li>
</ul>
</div>
<div class="uc_lanmu_content">
<div class="reg_box">
<form   method="post" >
<li class="reg_item_jiange"></li>

<li class="reg_item_1">密 码：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<input  type="password" size="25" maxlength="16" class="reg_textbox" name="password" id="password" onfocus="fk2()" onblur="bk2(this.value)" /> 
<span  id="div_pwd">由字母、数字、下划线组成(6-16位)</span>
</li>

<li class="reg_item_jiange"></li>

<li class="reg_item_1">密码确认：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<input  type="password" size="25" maxlength="16" class="reg_textbox" name="password1" id="password1"  onfocus="fk3()"  onblur="bk3(this.value)" /> 
<span  id="div_pwd1">密码再次确认</span>
</li>

<li class="reg_item_jiange"></li>
<li class="reg_item_1"></li>
<li class="reg_item_2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="submit"  value="yes"><input id="sub" type="Submit"  value=" 修改"  onclick="return Check_pass_mdy()" Class="bt" ></li>
<li class="clear"></li>
</ul>
</form>
</div>


</div>
</div>