<% @  Control Language="c#" Inherits="PageAdmin.mem_mdy"%>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 资料修改</li>
<li class="uc_lanmu_site_2">资料修改</li>
</ul>
</div>
<div class="uc_lanmu_content">
<div class="reg_box">
<form   method="post">
<li class="reg_item_jiange"></li>

<li class="reg_item_1">公司名称：</li>
<li class="reg_item_2">&nbsp;<input  type="textbox" size="25" maxlength="45" class="reg_textbox"  name="company"  id="company"  onfocus="fk4()"  onblur="bk4(this.value)" value="<%=Company%>"/> 
<span  id="div_cname">所在工作单位名称</span>
</li>

<li class="reg_item_jiange"></li>

<li class="reg_item_1">联系人：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<input  type="textbox" size="25" maxlength="16" class="reg_textbox" name="truename" id="truename"  onfocus="fk5()"  onblur="bk5(this.value)" value="<%=TrueName%>"/>
<span  id="div_lxname">举例：王二</span>
</li>

<li class="reg_item_jiange"></li>

<li class="reg_item_1">性别：</li>
<li class="reg_item_2">&nbsp;<input  type="radio" name="sex"   value="男" checked />男 <input  type="radio" value="女"  name="sex" <%if(Sex=="女"){Response.Write("checked");}%>/>女</li>
<li class="reg_item_jiange"></li>


<li class="reg_item_jiange"></li>

<li class="reg_item_1">电子邮件：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="25" maxlength="45" class="reg_textbox" name="email" id="email"  onfocus="fk6()"  onblur="bk6(this.value)"  value="<%=Email%>"/>
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
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="25" maxlength="20" class="reg_textbox" name="city" id="city" onfocus="fk8()"  onblur="bk8(this.value)" value="<%=City%>"/>
<span  id="div_city">举例：中山市</span>
</li>


<li class="reg_item_jiange"></li>

<li class="reg_item_1">联系地址：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="35" maxlength="50" class="reg_textbox" name="address" id="address" onfocus="fk9()"  onblur="bk9(this.value)" value="<%=Address%>"/>
<span  id="div_add">举例：南头区金湾广场B座16号</span>
</li>

<li class="reg_item_jiange"></li>

<li class="reg_item_1">邮政编码：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="25" maxlength="6" class="reg_textbox" name="postcode" id="postcode" onfocus="fk10()"  onblur="bk10(this.value)" value="<%=Postcode%>"/>
<span  id="div_cde">举例：528427</span>
</li>
<li class="reg_item_jiange"></li>

<li class="reg_item_1">联系电话：<span style="color:#ff0000">*</span></li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="25" maxlength="40" class="reg_textbox" name="tel" id="tel" onfocus="fk11()"  onblur="bk11(this.value)" value="<%=Tel%>"/>
<span  id="div_tel">举例：0760-22517081</span>
</li>


<li class="reg_item_jiange"></li>

<li class="reg_item_1">传真：</li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="25" maxlength="40" class="reg_textbox" name="fax" id="fax" onfocus="fk12()"  onblur="bk12(this.value)" value="<%=Fax%>" />
<span  id="div_fax">举例：0760-22517084</span>
</li>
<li class="reg_item_jiange"></li>

<li class="reg_item_1">QQ号码：</li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="25" maxlength="40" class="reg_textbox" name="qq" id="qq" onfocus="fk13()"  onblur="bk13(this.value)" value="<%=QQ%>" />
<span  id="div_oicq">举例：190452532 </span>
</li>

<li class="reg_item_jiange"></li>

<li class="reg_item_1">MSN：</li>
<li class="reg_item_2">&nbsp;<input  type="textbox"  size="25" maxlength="40" class="reg_textbox" name="msn" id="msn"  onfocus="fk14()"  onblur="bk14(this.value)" value="<%=Msn%>" />
<span  id="div_msn">举例：msn@hotmail.com </span>
</li>


<li class="reg_item_jiange"></li>
<li class="reg_item_1"></li>
<li class="reg_item_2"><br><input type="hidden" name="submit"  value="yes"><input id="sub" type="Submit"  value=" 修改 "  Class="bt"  onclick="return Check_mem_mdy()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"  value=" 重设 "  Class="bt"  ></li>
<li class="clear"></li>
</ul>
</form>
</div>
<script>
  var objProvince = document.getElementById("province");
  objProvince.value="<%=Province%>";
</script>
</div>
</div>