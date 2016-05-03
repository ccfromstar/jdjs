<% @ Control language="c#" Inherits="PageAdmin.comments"%>
<div id="comments_box">


<asp:Repeater id="Repeater_1" runat="server">
 <headerTemplate>
  <div style="height:25px;margin-top:10px"><span class="left"><b><%=Site_Tag1%><%=RecordCount%><%=Site_Tag2%></b></span><span style="display:none" class="right"><span id="PageCurrent_Top"></span>&nbsp;<span id="Comment_Page_Top"></span></span></div>
   <div class="pllist">
 </headerTemplate>
 <ItemTemplate>
   <ul class="plitem" id="CommentsItem" name="CommentsItem" style="display:none">
    <li class="header"><span class="left" id="User_<%#DataBinder.Eval(Container.DataItem,"id")%>"><%=Xuhao++%># <%#DataBinder.Eval(Container.DataItem,"username")%></span><span class="right"><%=Site_Tag3%><span id="Date_<%#DataBinder.Eval(Container.DataItem,"id")%>"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd HH:mm:ss}")%></span>&nbsp;<a href="javascript:InsertQuot('<%#DataBinder.Eval(Container.DataItem,"id")%>','c_content')"><%=Site_Tag4%></a></span><span class="clear"></span></li>
    <li><p id="Content_<%#DataBinder.Eval(Container.DataItem,"id")%>"><%#ubb(DataBinder.Eval(Container.DataItem,"content").ToString())%></p></li>
  </ul>
 </ItemTemplate>
 <footerTemplate>
   </div>
   <div id="pllist_bottom" style="display:none;height:25px"><span class="right"><span id="PageCurrent_Bottom"></span>&nbsp;<span id="Comment_Page_Bottom"></span></span></div>
 </footerTemplate>
</asp:Repeater>



<form method="post" action="<%=PostUrl%>">
<div class="plbox">
<ul>
<li class="header"><b><%=Site_Tag5%></b></li>
<li>
<p><textarea  id="c_content"  name="content"  Cols="65" rows="5" class="tb"  onblur="if(this.value.length>250)this.value=this.value.substr(0,250)"></textarea></p>
</li>
<li><p>
<%=Site_Tag6%><input type="textbox" name="Username" value="<%=Site_Tag7%>" maxlength="15" size="15"  class="tb" onblur="if(Trim(this.value)==''){this.value='<%=Site_Tag7%>'}">&nbsp;
<%=Site_Tag8%><input type='textbox' name='yzm'  id="c_yzm" size="5" maxlength='4' class="tb">&nbsp;<img src='/incs/yzm.aspx' onclick="Code_Change('yzmcode')" align=absmiddle border=0  id="yzmcode"  alt='点击更换' style='cursor:pointer;width:50px;height:18px'>&nbsp;&nbsp;
<input type="hidden"  name="anonymous" value="1"/>
<input type="hidden"  name="send" value="1"/>
<input type="submit"   value=" <%=Site_Tag9%> " class="comments_bt"  onclick="return Check_Comments('<%=P_Language%>')"/>
</p>
</li>
</ul>
</div>
</form>
</div>
<script language=javascript>
var C_PLCount=<%=RecordCount%>;
var C_Language="<%=P_Language%>";
</script>
<script src="/js/comments.js"></script>
