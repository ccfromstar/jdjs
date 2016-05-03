<% @  Control Language="c#" Inherits="PageAdmin.mem_fbk" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 有问必答</li>
<li class="uc_lanmu_site_2">有问必答</li>
</ul>
</div>
<div class="uc_lanmu_content">
<form method="post">

<table border=0 cellpadding="5px" cellspacing=0  align=center class="member_table">
    <tr>
      <td height=20 align=right width="100px">问题类型：</td>
      <td height=20 >
<select name="fb_type" id="fb_type" >
	<option value="咨询">  咨询  </option>
	<option value="问题">  问题  </option>
	<option value="建议">  建议  </option>
	<option value="投诉">  投诉  </option>
	<option value="合作">  合作  </option>
	<option value="其他">  其他  </option>
</select>
     </td>
    </tr>
  <tr>
      <td height=20 align=right >标题：</td>
      <td height=20><input type="text"  id="fb_title"  name="fb_title"  maxlength="50" size="50" class="tb"><span style="color:#ff0000">*</span>
   </td>
  </tr>

     <tr>
      <td height=20 align=right >联系人：</td>
      <td height=20><input type="text"  id="fb_truename"  name="fb_truename" value="<%=Name%>" maxlength="30" size="30" class="tb"><span style="color:#ff0000"> *</span></td>
    </tr>


  </tr>
     <tr>
      <td height=20 align=right  >联系电话：</td>
      <td height=20><input type="text"  id="fb_tel"  name="fb_tel"    value="<%=Tel%>" maxlength="30" size="30" class="tb" ><span style="color:#ff0000"> *</span></td>
  </tr>

     <tr>
      <td height=20 align=right >E-mail：</td>
      <td height=20><input type="text"  id="fb_email"  name="fb_email" value="<%=Email%>"  maxlength="30"   size="30" class="tb"><span style="color:#ff0000"> *</span></td>
    </tr>

   <tr>
      <td height=20 align=right >反馈内容：</td>
      <td height=20><textarea  id="fb_content"  name="fb_content"  Cols="55" rows="7" onblur="if(this.value.length>250)this.value=this.value.substr(0,250)" class="tb"></textarea> <span style="color:#ff0000"> *</span></td>
    </tr>

     <tr>
      <td height=30 align=center colspan=2>
      <input type="hidden" value="yes"  name="submit">&nbsp;
      <input type="submit" value="提 交"  onclick="return Check_MemFeedback()" class="bt">&nbsp;
      <input type="button" value="返 回"   class="bt" onclick="location.href='<%=Get_Url("mem_fbklst")%>'"></li>
     </td>
    </tr>
   </table>
</form>

</div>
</div>