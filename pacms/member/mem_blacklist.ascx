<% @  Control Language="c#" Inherits="PageAdmin.mem_blacklist" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 黑名单</li>
<li class="uc_lanmu_site_2">黑名单</li>
</ul>
</div>
<div class="uc_lanmu_content">

<form method="post">

 <table border="0" cellspacing="0" cellpadding="0" width="98%" align="center">
    <tr><td align=left height=25px>
      <input type="button" class='msg_bt' value="收件箱" onclick="location.href='<%=Get_Url("mem_msg")%>'">
      <input type="button" class='msg_bt' value="发件箱" onclick="location.href='<%=Get_Url("mem_msgout")%>'">
      <input type="button" class='msg_bt' value="发信息" onclick="location.href='<%=Get_Url("mem_msgsend")%>'">
      <input type="button" class='msg_bt' value="我的好友" onclick="location.href='<%=Get_Url("mem_friends")%>'">
      <input type="button" class='msg_bt' value="好友分类" onclick="location.href='<%=Get_Url("mem_friendssort")%>'">
      <input type="button" class='msg_bt_1' value="黑名单"  onclick="location.href='<%=Get_Url("mem_blacklist")%>'">
    </td></tr>
   </table> 

<table border=0 cellpadding="5px" cellspacing=0  align=center class="mem_message_table">
   <tr>
       <td>
       如果某用户被加入到黑名单中，那么该用户给您发送的消息将不会被接收。<br>
       多个用户添加到黑名单时需要用逗号(英文半角)分开，如“zhansan,lisi,wanger”。<br>
      <textarea name="Content" id="Content" cols="80" rows="15"><%=The_Content%></textarea>
      </td>
      </tr> 

     <tr>
      <td height=30px>
      <input type="hidden" value="save"  name="Submit" id="Submit">&nbsp;
      <input type="submit" value="保 存"  class="bt">&nbsp;
     </td>
    </tr>
   </table>
</form>

</div>
</div>
