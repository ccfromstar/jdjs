<% @  Control Language="c#" Inherits="PageAdmin.mem_prodlst" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 产品管理</li>
<li class="uc_lanmu_site_2">产品管理</li>
</ul>
</div>
<div class="uc_lanmu_content">
<form runat="server">

  <asp:PlaceHolder  id="P_Add" runat="server" Visible="false" >
 <table border="0" cellspacing="0" cellpadding="0" width="98%" align="center">
    <tr><td align=right  height=25px>
      <input type="button" class='m_bt' value="发布产品" onclick="location.href='<%=Get_Url("mem_prodadd")%>'">
    </td></tr>
   </table> 
  </asp:PlaceHolder>
 <table border="0" cellspacing="0" cellpadding="0" align="center" class="member_table">
    <tr>
      <td align=center  class="memlist_header_item" width="60%">产品名称</td> 
      <td align=center  class="memlist_header_item" width="10%">状态</td> 
      <td align=center  class="memlist_header_item" width="15%">发布日期</td> 
      <td align=center  class="memlist_header_item_last" width="15%">操作</td>
    </tr>
<asp:Repeater id="P1" runat="server" OnItemDataBound="P1_Bound">     
 <ItemTemplate>
      <tr title="类别：<%#DataBinder.Eval(Container.DataItem,"sort1")%> <%#Get_Type2(DataBinder.Eval(Container.DataItem,"sort2").ToString())%>">
      <td align=left class="memlist_item"><a href="<%#Get_ViewUrl(DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"planguage").ToString())%>" target=_blank><%#Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%></a></td> 
      <td align=center  class="memlist_item"><%#Get_State(DataBinder.Eval(Container.DataItem,"show").ToString())%></td> 
      <td align=center  class="memlist_item"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></td> 
      <td align=center  class="memlist_item_last">
        <asp:HyperLink Text="查看"   id="Edit" runat="server" NavigateUrl='<%#Get_Url("mem_proddtl",DataBinder.Eval(Container.DataItem,"id").ToString())%>' />
        <asp:LinkButton Text="删除" id="Delete" runat="server" CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' OnCommand="Data_Delete" />
        <asp:Label   id="A_Show" Text='<%#DataBinder.Eval(Container.DataItem,"show")%>' runat="server"  Visible="false" />  
     </td>
    </tr>
 </ItemTemplate>
</asp:Repeater>
  </table> 

<div class="uc_lanmu_page">
共<asp:Label id="Lblrecordcount"  Text=0 runat="server" />条记录 
&nbsp;当前页次: <asp:Label id="Lblcurrentpage"  runat="server" />/<asp:Label id="LblpageCount"  runat="server" />&nbsp;
         <asp:LinkButton id="First" CssClass="link" CommandName="First"  OnCommand="Page_change"  runat="server" Text="首页"/>&nbsp;
         <asp:LinkButton id="Prev"  CssClass="link"  CommandName="Prev"  OnCommand="Page_change"  runat="server" Text="上一页"/>&nbsp;
         <asp:LinkButton id="Next"  CssClass="link"  CommandName="Next"  OnCommand="Page_change"  runat="server" Text="下一页"/>&nbsp;
         <asp:LinkButton id="Last"  CssClass="link"  CommandName="Last"  OnCommand="Page_change"  runat="server" Text="尾页"/>&nbsp;
       转到：<asp:DropDownList id="Dp_page" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Page_select">
          </asp:DropDownList>页
</div>

<br><br>
<table border=0 cellpadding=0 cellspacing=2 width=98% align=center>
<tr>
  <td  height=25>分类显示：<asp:DropDownList id="Dl_Sort1" runat="server" DataTextField="sort_name" DataValueField="id"  AutoPostBack="true" OnSelectedIndexChanged="Sort2_Bind" />
    <asp:DropDownList id="Dl_Sort2" runat="server" Visible="false"  DataTextField="sort_name" DataValueField="id" AutoPostBack="true" OnSelectedIndexChanged="Sort2_Changed"/>
</td>
</tr>
<tr>
<td  height=25 >标题搜索：<asp:TextBox id="Sname" Size="30" Maxlength=20 runat="server"  CssClass="tb "/>
<asp:Button  Text="确定" CssClass="bt" runat="server" onclick="Title_Search" />
</td>
</tr>
 </td>
 <tr>
</table>
</form>
</div>
</div>
