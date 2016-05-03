<% @ Control  language="c#"  Inherits="PageAdmin.navigation_menu" %>
<div id="Nav_<%=_Lanmu2Id%>"  class="nav_box" style="<%=Nav_box_style%>">
<asp:PlaceHolder  id="P_Title"  runat="server">
<div class="nav_title" style="<%=Nav_titlebox_style%>"  onclick="ShowItem('Nav_Menu_<%=_Lanmu2Id%>','#')"><span class="nav_sign" style="<%=Nav_title_style%>" ><%=Lanmu_title%></span></div>
</asp:PlaceHolder>
<asp:PlaceHolder id="P_Header"  runat="server" Visible="false"><div  class="nav_header"><%=Nav_Header%></div></asp:PlaceHolder>
<div id="Nav_Menu_<%=_Lanmu2Id%>" class="nav_menu" style="<%=Nav_content_style%>">
<ul>
<asp:Repeater id="DL_menu"  runat="server" OnItemDataBound="Data_Bound">
   <ItemTemplate>
     <asp:Label id="Lb_lanmu1Id" Text='<%#DataBinder.Eval(Container.DataItem,"lanmu1id")%>' runat="server" Visible="false"/>
     <asp:Label id="Lb_lanmu3Id" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" Visible="false"/>
     <asp:Label id="Lb_lanmuType" Text='<%#DataBinder.Eval(Container.DataItem,"thetype")%>' runat="server" Visible="false"/>
     <li id="Nav_menulist_<%#DataBinder.Eval(Container.DataItem,"id")%>"  class="nav_menu_list" style="<%=Nav_list_style%>"><a href='<%#Get_Url(DataBinder.Eval(Container.DataItem,"thetype").ToString(),DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>' class="nav_menu_href" target="<%#DataBinder.Eval(Container.DataItem,"lanmu3_target")%>" onclick="ShowItem('Nav_submenu_<%#DataBinder.Eval(Container.DataItem,"id")%>','<%#DataBinder.Eval(Container.DataItem,"url").ToString()%>')"><%#DataBinder.Eval(Container.DataItem,"lanmu3")%></a>
      <asp:Repeater id="Sub_menu"  runat="server" Visible="false">
        <HeaderTemplate>
          <ul  id="Nav_submenu_<%#Lanmu_Id%>" style="display:none">
        </HeaderTemplate>
       <ItemTemplate>
         <li class="nav_submenu_list"><a href='<%#Get_Sub_Url(DataBinder.Eval(Container.DataItem,"thetype").ToString(),DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString())%>' class="nav_submenu_href"><%#DataBinder.Eval(Container.DataItem,"sort_name")%></a></li>
       </ItemTemplate> 
       <FooterTemplate>
         </ul>
       </FooterTemplate>
    </asp:Repeater>
    </li>
   </ItemTemplate>
</asp:Repeater>
</ul>
</div>
</div>

