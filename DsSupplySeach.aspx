<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="DsSupplySeach.aspx.cs" Inherits="JDJS.Web.DsSupplySeach" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
 <div class="dsindextitle" style=" width:100%"><span>商城-搜建材</span></div>

<div class="dsindexseach">
    <asp:Label ID="Label1" runat="server" Text="产品关键字："></asp:Label><asp:TextBox ID="keyw"
        runat="server"></asp:TextBox>
    
    <asp:Label ID="Label2" runat="server" Text="品牌："></asp:Label>
    <asp:TextBox ID="dsclass"
        runat="server" Width="80px"></asp:TextBox>
        
    <asp:Label ID="Label3" runat="server" Text="规格型号："></asp:Label><asp:TextBox ID="dsstan"
        runat="server"></asp:TextBox>
        
    <asp:Label ID="Label4" runat="server" Text="厂商："></asp:Label>
    <asp:TextBox ID="dscomp"
        runat="server" style="margin-bottom: 0px"></asp:TextBox>           
        
    <br/>
    <span>价格区间：</span>
 
 <asp:TextBox ID="minprice"
        runat="server" style="margin-bottom: 0px">不限</asp:TextBox>
        
   <span>  至  </span>
    <asp:TextBox ID="maxprice"
        runat="server" style="margin-bottom: 0px">不限</asp:TextBox>
                 
 <span>&nbsp;&nbsp;</span>
<asp:ImageButton ID="ImageButton1" ImageUrl="~/uploads/SeachDS.jpg"
        runat="server" onclick="ImageButton1_Click" />
 <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
    <asp:ImageButton ID="ImageButton2" ImageUrl="~/uploads/findsp.jpg" 
        runat="server" onclick="ImageButton2_Click" />
   
</div>

<div class ="dspaixu">
 <ul>
                <li>产品排序：</li>
                <li>
                    <asp:LinkButton ID="newer" runat="server" onclick="LinkButton1_Click">[最新]</asp:LinkButton></li>

                <li>
                    <asp:LinkButton ID="exce" runat="server" onclick="exce_Click">[最贵]</asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="chea" runat="server" onclick="chea_Click">[最便宜]</asp:LinkButton></li>
             
</ul>
            </div>

<div>
      <ul class="dssupply">
        <asp:Repeater ID="matspecial" runat="server">
        <ItemTemplate>
           
            <div>
                
                <li>
                       
                <a  href="<%#GetSupplyUrl(Eval("id").ToString())%>mat_infor.aspx?id=<%#Eval("id")%>"><img alt="点击查看产品详情" src="<%#Getpic(Eval("pic").ToString())%>" /></a>
                
                <span>[<%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%>]</span><span style=" padding-right:20px"><%#Eval("lprice")%>元 <%#Eval("zunit")%></span>
                <a  href="<%#GetSupplyUrl(Eval("id").ToString())%>mat_infor.aspx?id=<%#Eval("id")%>" title="<%#Eval("zname") %>" style=" padding-left:20px"><%#LTP.Common.StringPlus.StrCut(Eval("zname").ToString(), 60, "...")%></a>
                <br/><a href="<%#Getcompany(Eval("cid").ToString())%>" title="点击进入该商家商铺" style="padding-right:15px; float:right"><%#Eval("company")%> </a>
                <span style=" font-size:12px" ><%#LTP.Common.StringPlus.StrCut(Eval("rek").ToString(), 200, "...")%></span></li>
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
