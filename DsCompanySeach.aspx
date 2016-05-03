<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="DsCompanySeach.aspx.cs" Inherits="JDJS.Web.DsCompanySeach" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="dsindextitle" style=" width:100%" ><span>商城-找商铺</span></div>
<div class="dsindexseach">
    <asp:Label ID="Label1" runat="server" Text="公司关键字：" Font-Bold="True" 
        Font-Size="14pt"></asp:Label>
    <asp:TextBox ID="keyw" runat="server"></asp:TextBox>
    <span>&nbsp;&nbsp;</span>
    <asp:ImageButton ID="ImageButton1" ImageUrl="~/uploads/SeachDS.jpg"
        runat="server" onclick="ImageButton1_Click"/>
        <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
    <asp:ImageButton ID="ImageButton2" ImageUrl="~/uploads/sojc.jpg" runat="server" 
        onclick="ImageButton2_Click" />
   
</div>
<div>
      <ul class="dssupply">
        <asp:Repeater ID="matspecial" runat="server">
        <ItemTemplate>
           
            <div>
                
                <li>
                       
                <a href="<%#Eval("mulu")%>/dsDefault.aspx"><img alt="点击进入商铺" src="<%#Getpic(Eval("logo").ToString())%>" /></a>
                
          
                <a href="<%#Eval("mulu")%>/dsDefault.aspx" title="点击进入该商家商铺" style="padding-left:20px"><%#Eval("HtmlTitle")%></a>
                <span></span></li>
            </div>
        </ItemTemplate>
         </asp:Repeater>   
        </ul>

    
    
</div>
  <div>
    <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
