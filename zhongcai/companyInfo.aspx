<%@ Page Language="C#" MasterPageFile="dsMasterPage.Master" AutoEventWireup="true" CodeBehind="companyInfo.aspx.cs" Inherits="JDJS.Web.zhongcai.companyInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="dscmpinfo">
    <asp:Label ID="CPBody" runat="server" ></asp:Label>
    </div>

<div class="dspagtitle"><span>团队风采</span></div>
<div id="divTD"></div>
<div class="dsRYZZ"> 
     
      <ul >
        <asp:Repeater ID="CmpTD" runat="server">
        <ItemTemplate>
                               
                <li>
                
                <a  href="<%#Eval("pic") %>" target="_blank"><img alt="<%#Eval("title") %>" src="<%#Eval("pic") %>" /></a>
                <a  href="<%#Eval("pic") %>" target="_blank"><%#Eval("title")%></a><br/>
                </li>
 
        </ItemTemplate>
         </asp:Repeater>   
        </ul>  
        
</div>

<div class="dspagtitle"><span>企业风貌</span></div>
<div id="divFM"></div>
<div class="dsRYZZ"> 
     
      <ul >
        <asp:Repeater ID="CmpFM" runat="server">
        <ItemTemplate>
                               
                <li>
                
                <a  href="<%#Eval("pic") %>" target="_blank"><img alt="<%#Eval("title") %>" src="<%#Eval("pic") %>" /></a>
                <a  href="<%#Eval("pic") %>" target="_blank"><%#Eval("title")%></a><br/>
                </li>
 
        </ItemTemplate>
         </asp:Repeater>   
        </ul>  
        
</div>
</asp:Content>

