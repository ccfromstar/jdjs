<% @  Control Language="c#" Inherits="PageAdmin.fnc_idx" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 我的财务</li>
<li class="uc_lanmu_site_2">我的财务</li>
</ul>
</div>
<div class="uc_lanmu_content">
<form runat="server">
 <table border=0 cellpadding=0 cellspacing=0 width="98%" align=center>
                <tr>
                  <td align=center width=15% class=memlist_header_item height=20>可用金额</td>
                  <td align=center width=10% class=memlist_header_item><%=Fnc_Ky%>元</td>
                  <td align=center width=15% class=memlist_header_item>已消费</td>
                  <td align=center width=10% class=memlist_header_item><%=Fnc_Xf%>元</td>

                  <td align=center width=15% class=memlist_header_item height=20>入款总额</td>
                  <td align=center width=10% class=memlist_header_item><%=Fnc_Rk%>元</td>
                  <td align=center width=15% class=memlist_header_item>返款总额</td>
                  <td align=center width=10% class=memlist_header_item_last><%=Fnc_Fk%>元</td>
                </tr>
 </table> 
<br>
            <table border=0 cellpadding=0 cellspacing=0  align="center" class="member_table">
                <tr>
                  <td align=center width=10% class=memlist_header_item height=20>事项</td>
                  <td align=center width=15% class=memlist_header_item>金额</td>
                  <td align=center width=25% class=memlist_header_item><asp:DropDownList id="D_fnc_type" runat="server" OnSelectedIndexChanged="Fnc_type_change" AutoPostBack="true"><asp:ListItem value=""> -- </asp:ListItem><asp:ListItem value="rk"> 入款 </asp:ListItem><asp:ListItem value="xf"> 扣款 </asp:ListItem><asp:ListItem value="fk"> 返款 </asp:ListItem></asp:DropDownList></td>
                  <td align=center width=25% class=memlist_header_item>备注</td>
                  <td align=center width=25% class=memlist_header_item_last>时间</td>
                </tr>

          <asp:Repeater id="P1" runat="server">         
             <ItemTemplate>
                 <tr>
                  <td align=center class=memlist_item ><%#Get_Type(DataBinder.Eval(Container.DataItem,"fnc_type").ToString())%>&nbsp;</td>
                  <td align=center class=memlist_item ><b><%#Get_Symbol(DataBinder.Eval(Container.DataItem,"fnc_type").ToString())%><%#DataBinder.Eval(Container.DataItem,"fnc_amount")%></b>&nbsp;</td>
                  <td align=center  class=memlist_item ><%#DataBinder.Eval(Container.DataItem,"fnc_detail")%>&nbsp;</td>
                  <td align=center class=memlist_item ><%#DataBinder.Eval(Container.DataItem,"beizhu")%>&nbsp;</td>
                  <td align=center  class=memlist_item_last><%#DataBinder.Eval(Container.DataItem,"thedate")%>
                    <asp:Label Id="Lb_type" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"fnc_type")%>' visible="false" />
                    <asp:Label Id="Lb_amount" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"fnc_amount")%>' visible="false" />
                 </td>
                </tr>
             </ItemTemplate>
          </asp:Repeater>
               </table> 
<br>
<asp:Panel id="Page_panel" runat="server">
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
</asp:Panel>
</form>
</div>
</div>
