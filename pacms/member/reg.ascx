<% @  Control Language="c#" Inherits="PageAdmin.reg" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; 会员注册</li>
<li class="uc_lanmu_site_2">会员注册</li>
</ul>
</div>
<div class="uc_lanmu_content">

<asp:PlaceHolder id="P1" runat="server">
<script src="/js/member.js" type="text/javascript"></script>
<div class="reg_box">
<form   method="post">
<li class="reg_item_1">注册类型：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<select name="Reg_type" id="Reg_type" onblur="bk0(this.value)"></select>
<span  id="div_regtype"></span>
</li>

<li class="reg_item_jiange"></li>

<li class="reg_item_1">用户名：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<input  type="text" size="25" maxlength="16" class="reg_textbox" name="username"  id="username" onfocus="fk1()" onblur="bk1(this.value)" />
<span  id="div_name">由字母、数字、下划线组成(4-16位)</span>
</li>

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

<li class="reg_item_1">公司名称：</li>
<li class="reg_item_2">&nbsp;<input  type="textbox" size="25" maxlength="45" class="reg_textbox"  name="company"  id="company"  onfocus="fk4()"  onblur="bk4(this.value)" /> 
<span  id="div_cname">所在工作单位名称</span>
</li>

<li class="reg_item_jiange"></li>

<li class="reg_item_1">联系人：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<input  type="textbox" size="25" maxlength="16" class="reg_textbox" name="truename" id="truename"  onfocus="fk5()"  onblur="bk5(this.value)" />
<span  id="div_lxname">举例：王二</span>
</li>

<li class="reg_item_jiange"></li>

<li class="reg_item_1">性别：</li>
<li class="reg_item_2">&nbsp;<input  type="radio" name="sex"   value="男" checked />男 <input  type="radio" value="女"  name="sex" />女</li>
<li class="reg_item_jiange"></li>


<li class="reg_item_jiange"></li>

<li class="reg_item_1">电子邮件：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="25" maxlength="50" class="reg_textbox" name="email" id="email"  onfocus="fk6()"  onblur="bk6(this.value)" />
<span  id="div_eml">举例：web@pageadmin.net</span>
</li>


<li class="reg_item_jiange"></li>

<li class="reg_item_1">所在省份：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2" ><span style="float:left"> &nbsp;<select name="province" id="province" size="1"  onfocus="fk7()"  onblur="bk7(this.value)" />
                                    <option value="">--请选择--</option>   <option value="北京">北京</option><option value="香港">香港</option><option value="澳门">澳门</option>
                                    <option value="台湾">台湾</option><option value="上海">上海</option>
                                    <option value="广东">广东</option><option value="山东">山东</option><option value="四川">四川</option>
                                    <option value="福建">福建</option><option value="江苏">江苏</option> <option value="浙江">浙江</option>
                                    <option value="天津">天津</option> <option value="重庆">重庆</option><option value="河北">河北</option>
                                    <option value="河南">河南</option><option value="黑龙江">黑龙江</option> <option value="吉林">吉林</option>
                                    <option value="辽宁">辽宁</option><option value="内蒙古">内蒙古</option><option value="海南">海南</option>
                                    <option value="山西">山西</option><option value="陕西">陕西</option> <option value="安徽">安徽</option><option value="江西">江西</option><option value="甘肃">甘肃</option>
                                    <option value="新疆">新疆</option><option value="湖北">湖北</option><option value="湖南">湖南</option><option value="云南">云南</option><option value="广西">广西</option><option value="宁夏">宁夏</option>
                                    <option value="贵州">贵州</option><option value="青海">青海</option><option value="西藏">西藏</option><option value="其他">其他</option>
</select> </span>
<span  id="div_pro" style="float:left">举例：广东</span>
</li>

<li class="reg_item_jiange"></li>

<li class="reg_item_1">所在城市：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="25" maxlength="20" class="reg_textbox" name="city" id="city" onfocus="fk8()"  onblur="bk8(this.value)" />
<span  id="div_city">举例：中山市</span>
</li>


<li class="reg_item_jiange"></li>

<li class="reg_item_1">联系地址：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="35" maxlength="50" class="reg_textbox" name="address" id="address" onfocus="fk9()"  onblur="bk9(this.value)" />
<span  id="div_add">举例：南头区金湾广场B座16号</span>
</li>

<li class="reg_item_jiange"></li>

<li class="reg_item_1">邮政编码：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="25" maxlength="6" class="reg_textbox" name="postcode" id="postcode" onfocus="fk10()"  onblur="bk10(this.value)" />
<span  id="div_cde">举例：528427</span>
</li>


<li class="reg_item_jiange"></li>

<li class="reg_item_1">联系电话：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="25" maxlength="40" class="reg_textbox" name="tel" id="tel" onfocus="fk11()"  onblur="bk11(this.value)" />
<span  id="div_tel">举例：0760-22517081</span>
</li>

<li class="reg_item_jiange"></li>

<li class="reg_item_1">传真：</li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="25" maxlength="40" class="reg_textbox" name="fax" id="fax" onfocus="fk12()"  onblur="bk12(this.value)" />
<span  id="div_fax">举例：0760-22517084</span>
</li>
<li class="reg_item_jiange"></li>

<li class="reg_item_1">QQ号码：</li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="25" maxlength="40" class="reg_textbox" name="qq" id="qq" onfocus="fk13()"  onblur="bk13(this.value)" />
<span  id="div_oicq">举例：190452532 </span>
</li>

<li class="reg_item_jiange"></li>

<li class="reg_item_1">MSN：</li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="25" maxlength="40" class="reg_textbox" name="msn" id="msn"  onfocus="fk14()"  onblur="bk14(this.value)" />
<span  id="div_msn">举例：msn@hotmail.com </span>
</li>

<li class="reg_item_jiange"></li>

<li class="reg_item_1">如何知道本站：</li>
<li class="reg_item_2">&nbsp;<input  type="radio" name="url_from" value="google">google <input  type="radio" name="url_from" value="baidu">百度  <input  type="radio" name="url_from" value="朋友介绍">朋友介绍 <input  type="radio" name="url_from" value="else"> 其他网站</li>
<li class="reg_item_jiange"></li>

<li class="reg_item_1">验证码：</li>
<li class="reg_item_2">&nbsp;<input type='textbox' name='yzm' class='login_textbox' maxlength='4'  onfocus="fk15()"  onblur="bk15(this.value)">&nbsp;<img src='/incs/yzm.aspx' onclick='Code_Change("regcode")' align=absmiddle border=0 id='regcode' style='cursor:pointer;width:50px;height:18px'  alt='点击更换'> <span  id="div_yzm"></span></li>

<li class="reg_item_jiange"></li>
<li class="reg_item_submit">
<input type="hidden" name="submit"  value="yes"><input id="sub" type="submit"  value=" 同意以下注册协议，注册成为会员  "  onclick="return CheckInput()">
<br><br><TextArea  Cols="60" rows="5"><%=Agreement%></textArea>
</li>
<li class="clear"></li>
</ul>
</form>
</div>
<script language="javascript">
 var AText="<%=Amtype%>".split(",");
 var Avalue="<%=Amid%>".split(",");
 var Obj=document.getElementById("Reg_type");
 Obj.options.add(new Option("-----请选择注册类型-----","0"));
 for(var i=0;i<AText.length-1;i++)
  {
     Obj.options.add(new Option(AText[i],Avalue[i]));
  }
</script>
</asp:PlaceHolder>

<asp:PlaceHolder id="P2" runat="server" visible="false">
<div align=center>
<img src=/images/public/suc.gif width="167px" vspace="5px">
<br>欢迎您注册成为的会员用户!

<br>您的登录帐号及密码已经发往您的信箱，以备查用(<%=SendMailResult%>)。

<br>最后，感谢您对本站的支持，希望本站的服务能给您带来满意！
<script>setTimeout("location.href='<%=GetUrl("login")%>'",3000);</script>   
<br><br>
</div>
</asp:PlaceHolder>

<asp:PlaceHolder id="P3" runat="server"  visible="false">
<div align=center>
<br><asp:Label id="Lb_Err" runat="server"  ForeColor="#ff0000" />
<br><br><input type="button" class="bt" value="返回"  onclick="history.back()">
<br><br>
</div>
</asp:PlaceHolder>



</div>
</div>