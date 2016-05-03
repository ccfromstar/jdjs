<% @ Control language="c#" Inherits="PageAdmin.feedback"%>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1"><%=Tags_1%> &gt; <%=Lanmu_site%></li>
<li class="uc_lanmu_site_2"><%=Lanmu_3%></li>
</ul>
</div>
<div class="uc_lanmu_content">
<%=Lanmu_Header%>
<asp:PlaceHolder id="P1" runat="server" visible="false">
<form method="post"  action="<%=PostUrl%>">
<table border=1 cellpadding=5 cellspacing=0 align=center class="feedback_table">
    <tr>
      <td height=20 align=right width="20%"><%=Tags_2%></td>
      <td height=20 width="80%">
<select name="fb_type" id="fb_type" >
	<option value="咨询">  <%=Feedback_Type[0]%>  </option>
	<option value="问题">  <%=Feedback_Type[1]%>  </option>
	<option value="建议">  <%=Feedback_Type[2]%>  </option>
	<option value="投诉">  <%=Feedback_Type[3]%>  </option>
	<option value="合作">  <%=Feedback_Type[4]%>  </option>
	<option value="其他">  <%=Feedback_Type[5]%>  </option>
</select>
     </td>
    </tr>
 
     <tr>
      <td height=20 align=right ><%=Tags_3%></td>
      <td height=20><input type="text"  id="fb_truename"  name="fb_truename"  maxlength="30" size="20" class="tb"><span style="color:#ff0000"> *</span></td>
    </tr>


  </tr>
     <tr>
      <td height=20 align=right  ><%=Tags_4%></td>
      <td height=20><input type="text"  id="fb_tel"  name="fb_tel"   maxlength="30" size="20" class="tb" ><span style="color:#ff0000"> *</span></td>
  </tr>

     <tre>
      <td height=20 align=right ><%=Tags_Email%></td>
      <td height=20><input type="text"  id="fb_email"  name="fb_email" maxlength="30" size="20" class="tb"><span style="color:#ff0000"> *</span></td>
    </tr>




  <tr>
      <td height=20 align=right ><%=Tags_5%></td>
      <td height=20><textarea  id="fb_content"  name="fb_content"  Cols="60" rows="7"  onblur="if(this.value.length>250)this.value=this.value.substr(0,250)"></textarea> <span style="color:#ff0000"> *</span></td>
    </tr>

  <tr>
      <td height=20 align=right ><%=Tags_6%></td>
      <td height=20><input type='textbox' name='fb_yzm' id='fb_yzm' class="tb"  maxlength='4' size="5">&nbsp;<img src='/incs/yzm.aspx' onclick='Code_Change("fb_code")' align=absmiddle border=0 id='fb_code' style='cursor:pointer' alt='Click for a change'></td>
    </tr>

     <tr>
      <td height=30 align=center colspan=2>
<input type="submit" value="<%=Tags_7%>" class="bt" onclick="return <%=Check_Js%>" />&nbsp;
<input type="reset" value="<%=Tags_8%>" class="bt" /></li>
     </td>
    </tr>
   </table>
</form>
</asp:PlaceHolder>


<asp:PlaceHolder id="P2" runat="server" visible="false">
<form method="post"  action="<%=PostUrl%>">
<div class="feedback_box">
<ul>
<li style="float:left;height:20px;text-align:right;width:60px"><%=Tags_3%></li>
<li style="float:left;"><input type="text" name="fb_truename"  id="fb_truename" maxlength="30" size="15" class="tb"><span style="color:#ff0000"> *</span></li>

<li style="float:left;height:20px;text-align:right;width:60px"><%=Tags_4%></li>
<li style="float:left;"><input type="text" name="fb_tel"   id="fb_tel" maxlength="30" size="15" class="tb" ><span style="color:#ff0000"> *</span></li>

<li style="float:left;height:20px;text-align:right;width:60px"><%=Tags_Email%></li>
<li style="float:left;"><input type="text"  name="fb_email"  id="fb_email" maxlength="30" size="20" class="tb"><span style="color:#ff0000"> *</span></li>
<li style="clear:both;height:2px;line-height:0px;font-size:1px;"></li>

<li style="float:left;text-align:right;width:55px;height:60px;margin:30px 0 0 0"><%=Tags_5%></li>
<li style="float:left;padding:5px 0 5px 0">&nbsp;<textarea  id="fb_content"  name="fb_content"  Cols="62" rows="5" style="border:1px solid #cccccc;border-color:#000000 #cccccc #cccccc #000000;"  onblur="if(this.value.length>250)this.value=this.value.substr(0,250)"></textarea> <span style="color:#ff0000"> *</span>
</li>
<li style="clear:both;height:2px;line-height:0px;font-size:1px;"></li>
<li style="float:left;height:20px;text-align:right;width:60px"><%=Tags_6%></li>
<li style="float:left;"><input type='textbox' name='fb_yzm' id='fb_yzm' class="tb"  maxlength='4' size="5">&nbsp;<img src='/incs/yzm.aspx' onclick='Code_Change("fb_code")' align=absmiddle border=0 id='fb_code' style='cursor:pointer' alt='Click for a change'></li>

<li style="clear:both;height:2px;line-height:0px;font-size:1px;"></li>
<li style="clear:both;padding:5px 0 5px 55px;">
<input type="radio" name="fb_type" value="咨询" checked><%=Feedback_Type[0]%> 
<input type="radio" name="fb_type" value="问题"><%=Feedback_Type[1]%>
<input type="radio" name="fb_type" value="建议"><%=Feedback_Type[2]%>
<input type="radio" name="fb_type" value="投诉"><%=Feedback_Type[3]%>
<input type="radio" name="fb_type" value="合作"><%=Feedback_Type[4]%>
<input type="radio" name="fb_type" value="其他"><%=Feedback_Type[5]%>&nbsp;
<input type="submit" value="<%=Tags_7%>" class="bt" onclick="return <%=Check_Js%>" />&nbsp;
<input type="reset" value="<%=Tags_8%>" class="bt" /></li>
</li>
</ul>
</div>
</form>

<asp:Repeater id="Repeater_1" runat="server" onItemDataBound="Data_Bound">
 <HeaderTemplate>
  <div class="feedbacklist_box">
 </HeaderTemplate>
 <ItemTemplate>
   <ul class="feedbacklist_item_box">

    <li style="float:left;height:20px;background:url(/images/public/face1.gif) no-repeat 0 0;padding:0 0 0 25px;"><%=Tags_9%><%#DataBinder.Eval(Container.DataItem,"type")%></li>
    <li style="float:right;height:20px;"><%#DataBinder.Eval(Container.DataItem,"thedate")%></li>
    <li class="feedbacklist_item_jiange"></li>

    <li style="padding:5px 10px 5px 10px"><%#DataBinder.Eval(Container.DataItem,"content")%></li>
    <asp:Placeholder id="Place_Replay" runat="server" visible="false">
    <li class="feedbacklist_item_jiange"></li>
    <li style="float:left;height:20px;background:url(/images/public/face2.gif) no-repeat 0 0;padding:0 0 0 25px;color:#ff0000"><%=Tags_10%></li>
    <li style="float:right;height:20px;color:#ff0000"><asp:Label id="Lb_Replay_Time" Runat="server" /></li>
    <li class="feedbacklist_item_jiange"></li>
    <li style="padding:5px 10px 5px 10px">
<asp:Label id="Lb_id"  Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' visible="false"  runat="server" />
<asp:Label id="Lb_Replay"  runat="server" />
</li>
    </asp:Placeholder>
  </ul>
 </ItemTemplate>
 <FooterTemplate>
  </div>
 </FooterTemplate>
</asp:Repeater>

<div class="uc_lanmu_page" style="display:<%=Page_Show%>">
<%=Page_Tag1%><%=RecordCount%><%=Page_Tag2%>&nbsp;
<%=Page_Tag3%><%=CurrentPage%>/<%=PageCount%>&nbsp;
<a id="P_First" href="<%=F_Url%>"><%=F_Name%></a>&nbsp;
<a id="P_Prev"  href="<%=P_Url%>"><%=P_Name%></a>&nbsp;
<a id="P_Next"  href="<%=N_Url%>"><%=N_Name%></a>&nbsp;
<a id="P_Last"  href="<%=L_Url%>"><%=L_Name%></a>&nbsp;
<%=Page_Tag4%>
<select id="P_Page" onchange="location.href=this.options[this.selectedIndex].value">
<%
 for(int i=1;i<=PageCount;i++)
  {
%>
  <option value="<%=Get_PageUrl(i)%>"><%=i%></option>
<%
  }
%>
</select><%=Page_Tag5%>
</div>
<script language="javascript">Go_Page(<%=PageCount%>,<%=CurrentPage%>)</script>
</asp:PlaceHolder>
<script src="/js/feedback.js" language="javascript"></script>
</div>
</div>