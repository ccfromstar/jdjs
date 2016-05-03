<% @ Page Language="C#"  Inherits="PageAdmin.zdyform_data" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="zdydata"/> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>数据查看</b></td></tr>
 <tr><td height=10 ></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">

<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td height=25><b><%=Request.QueryString["fname"]%></b></td>
 </tr>
</table>

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2  align="left">
            <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle >
                <tr>
                  <td align=center width=60% class=white>标题字段</td>
                  <td align=center width=15% class=white height=20>提交时间</td>
                  <td align=center width=10% class=white height=20>会员</td>
                  <td align=center width=15% class=white>管理</td>
                </tr>
              </table> 
          <asp:Repeater id="P1" runat="server" OnItemDataBound="PageAdmin_Data_Bound">    
             <HeaderTemplate>
                 <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle style="table-layout:fixed;">
             </HeaderTemplate>      
             <ItemTemplate>
                 <tr>
                  <td align=left width=60% class="tdstyle"><span <asp:Literal text="style='color:#cccccc'" runat="server" visible='<%#!Get_Bool(DataBinder.Eval(Container.DataItem,"show").ToString())%>' />><%#Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"title").ToString())%></span></td>
                  <td align=center width=15% class="tdstyle" title="<%#DataBinder.Eval(Container.DataItem,"thedate")%>"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></td>
                  <td align=center width=10% class=tdstyle><a href='member_info.aspx?username=<%#DataBinder.Eval(Container.DataItem,"username")%>'><%#DataBinder.Eval(Container.DataItem,"username")%></a></td>
                  <td align=center width=15% class="tdstyle">

                    <asp:LinkButton runat="server" Text="显示" forecolor="#ff0000"    OnCommand="Article_Set"      CommandName="Show"   CommandArgument='<%#DataBinder.Eval(Container.DataItem,"id")%>'   visible='<%#!Get_Bool(DataBinder.Eval(Container.DataItem,"show").ToString())%>' />
                    <asp:LinkButton runat="server" Text="隐藏"  OnCommand="Article_Set"      CommandName="Hide"   CommandArgument='<%#DataBinder.Eval(Container.DataItem,"id")%>'   visible='<%#Get_Bool(DataBinder.Eval(Container.DataItem,"show").ToString())%>' />
                    <a href='zdyform_data_2.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>&fid=<%=Request.QueryString["fid"]%>&ftable=<%#Server.UrlEncode(Request.QueryString["ftable"])%>&fname=<%#Server.UrlEncode(Request.QueryString["fname"])%>'>查看</a>
                    <asp:LinkButton Id="Delete" runat="server" Text="删除" CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' OnCommand="Data_Delete" />
                  </td>
                </tr>
             </ItemTemplate>
             <FooterTemplate>
               </table> 
             </FooterTemplate>
          </asp:Repeater>

<br>
共<asp:Label id="Lblrecordcount"  Text=0 runat="server" />条记录 
&nbsp;当前页次: <asp:Label id="Lblcurrentpage"  runat="server" />/<asp:Label id="LblpageCount"  runat="server" />&nbsp;
<asp:Button  text="上一页"  id="LblPrev"  class=button runat="server"  CommandName="Prev"   OnCommand="Bt_Click" />&nbsp;
<asp:Button  text="下一页"  id="LblNext"  class=button runat="server"  CommandName="Next"   OnCommand="Bt_Click" />&nbsp;
转到:&nbsp;<asp:DropDownList id="DLpage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Page_Changed"  /> 页&nbsp;

       </td>
    </tr>
   </table>
  </td>
  <tr>
 </table>


<br>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  height=30px>分类显示：
<asp:DropDownList id="Dl_Sort1" runat="server" DataTextField="sort_name" DataValueField="id"  AutoPostBack="true" OnSelectedIndexChanged="PageAdmin_Sort2_Bind" />
<asp:Label id="LbTishi1" Text=" 小类：" Visible="false"  runat="server"/>
<asp:DropDownList id="Dl_Sort2" runat="server" Visible="false"  DataTextField="sort_name" DataValueField="id" AutoPostBack="true" OnSelectedIndexChanged="PageAdmin_Sort2_Changed"/>
</td>
</tr>

 <tr>
  <td height=30px>
   &nbsp;&nbsp;关键字：<asp:TextBox id="S_name" runat="server" Maxlength="25" size="25" />
   搜索字段：<asp:DropdownList id="S_Field" runat="server" DataTextField="field_title"  DataValueField="field_name"></asp:DropdownList>
   <asp:Button  Text="搜索" runat="server" class="button" onclick="PageAdmin_Search"/> 
 </td>
 </tr>
</table>
  </td>
  <tr>
 </table>
</form>
</td>
</tr>
</table>
</center>
</body>
</html>  



