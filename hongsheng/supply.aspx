<%@ Page Language="C#" MasterPageFile="dsMasterPage.Master" AutoEventWireup="true" CodeBehind="supply.aspx.cs" Inherits="JDJS.Web.hongsheng.supply" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
 <div class ="dspaixu">
 <ul>
                <li>产品排序：</li>
                <li><a  href="<%=Geturl("id",1)%>" target="_self">[最新]</a></li>
                <li><a  href="<%=Geturl("lprice",1)%>" target="_self">[最贵]</a></li>
                <li><a  href="<%=Geturl("lprice",0)%>" target="_self">[最便宜]</a></li>
</ul>
            </div>

<div>
      <ul class="dssupply">
        <asp:Repeater ID="matspecial" runat="server">
        <ItemTemplate>
           
            <div>
                
                <li>
                       
                <a  href="mat_infor.aspx?id=<%#Eval("id")%>" target="_self"><img alt="点击查看产品详情" src="<%#Getpic(Eval("pic").ToString())%>" /></a>
                <span>[<%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%>]</span><span style=" padding-right:20px"><%#Eval("lprice")%>元 <%#Eval("zunit")%></span><a  href="mat_infor.aspx?id=<%#Eval("id")%>" target="_self"title="<%#Eval("zname") %>" style=" padding-left:20px"><%#LTP.Common.StringPlus.StrCut(Eval("zname").ToString(), 60, "...")%></a><span style=" font-size:12px" ><%#LTP.Common.StringPlus.StrCut(Eval("rek").ToString(), 200, "...")%></span></li>
            </div>
        </ItemTemplate>
         </asp:Repeater>   
        </ul>

    
    
</div>
  <div>
    <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
    </div>

</asp:Content>

