<% @ Control language="c#" Inherits="PageAdmin.web_top"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<asp:Literal Id="L_Head" runat="server"/>
<meta name="Author" content="PageAdmin CMS" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="<%=PageAdmin_Template%>/lanmu.css" type="text/css" rel="stylesheet" />
<link href="/incs/public.css" type="text/css" rel="stylesheet" />
<script src="/js/all.js" type="text/javascript"></script>
<%=Zdy_Head%>
</head>
<body>
<div class="page_style">
<div class="menu_box">
<asp:PlaceHolder id="P1" runat="server"  Visible="false">
<div class="menu_box_style1_1">
<ul>
<li class="menu_box_style1_1_1"><a href="/"><asp:Image id="Logo_image"  runat="server" /></a></li>
<li class="menu_box_style1_1_2"><%=Wz_Top%></li>
<li class="clear"></li>
</ul>
</div>
<%=Zdy_Lanmu%>
<asp:Repeater id="Rp_1" runat="server">
 <HeaderTemplate>
  <div class="menu_box_style1_2" id="MainMenu"><ul>
 </HeaderTemplate>
 <ItemTemplate>
  <li class="menu_style_1" id="MainMenuItem" name="MainMenuItem"><a href='<%#GetUrl(DataBinder.Eval(Container.DataItem,"thetype").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>' class="menu_1"  id='Menu_<%#DataBinder.Eval(Container.DataItem,"id")%>' target='<%#DataBinder.Eval(Container.DataItem,"target")%>'><%#DataBinder.Eval(Container.DataItem,"lanmu1")%></a><%#DataBinder.Eval(Container.DataItem,"zdy_dropmenu")%></li>
 </ItemTemplate>
 <FooterTemplate>
  </ul></div>
 </FooterTemplate>
</asp:Repeater>
<script  type="text/javascript">
<!--
var IsPageHome="<%=PageHome%>";
var Lanmu1_Id="<%=Current_MenuId%>";
var Current_MenuItem=document.getElementById("Menu_"+Lanmu1_Id);
if(document.getElementById("MainMenuItem")!=null)
{
 var MenuItem_Objs=document.getElementsByName("MainMenuItem");
 MenuItem_Objs[0].className="menu_style_1_first";
 if(Current_MenuItem!=null){Current_MenuItem.className="menu_current_1"}
 ShowSubMenu(Lanmu1_Id,1);
}



-->
</script>
</asp:PlaceHolder>

<asp:PlaceHolder id="P2" runat="server" Visible="false">
<div class="menu_box_style2_1"><%=Wz_Top%></div>
<div class="menu_box_style2_2">
   <div class="menu_box_style2_2_1"><a href="/"><asp:Image id="Logo_image_1"  runat="server" /></a></div>
   <div class="menu_box_style2_2_2"  id="MainMenu">
   <%=Zdy_Lanmu%>
  <asp:Repeater id="Rp_2" runat="server">
  <HeaderTemplate>
  <ul>
  </HeaderTemplate>
   <ItemTemplate>
      <li class="menu_style_2" id="MainMenuItem" name="MainMenuItem"><a href='<%#GetUrl(DataBinder.Eval(Container.DataItem,"thetype").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"url").ToString())%>' class="menu_2"  id='Menu_<%#DataBinder.Eval(Container.DataItem,"id")%>' target='<%#DataBinder.Eval(Container.DataItem,"target")%>'><%#DataBinder.Eval(Container.DataItem,"lanmu1")%></a><%#DataBinder.Eval(Container.DataItem,"zdy_dropmenu")%></li>
   </ItemTemplate>
 <FooterTemplate>
  </ul>
 </FooterTemplate>
  </asp:Repeater>
</div>
</div>
<script  type="text/javascript">
<!--
var IsPageHome="<%=PageHome%>";
var Lanmu1_Id="<%=Current_MenuId%>";
var Current_MenuItem=document.getElementById("Menu_"+Lanmu1_Id);
if(document.getElementById("MainMenuItem")!=null)
{
 var MenuItem_Objs=document.getElementsByName("MainMenuItem");
 MenuItem_Objs[0].className="menu_style_2_first";
 if(Current_MenuItem!=null){Current_MenuItem.className="menu_current_2"}
 ShowSubMenu(Lanmu1_Id,2);
}

-->
</script>
</asp:PlaceHolder>
</div>


