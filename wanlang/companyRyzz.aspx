<%@ Page Language="C#" MasterPageFile="dsMasterPage.Master" AutoEventWireup="true" CodeBehind="companyRyzz.aspx.cs" Inherits="JDJS.Web.wanlang.companyRyzz" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">


<div class="dspagtitle"><span>企业荣誉</span></div>
<div id="divRY"></div>
<div class="dsRYZZ"> 
     
      <ul >
        <asp:Repeater ID="CmpRY" runat="server">
        <ItemTemplate>
                               
                <li>
                
                <a  href="<%#Eval("pic") %>" target="_blank"><img alt="<%#Eval("title") %>" src="<%#Eval("pic") %>" /></a>
                <a  href="<%#Eval("pic") %>" target="_blank"><%#Eval("title")%></a><br/>
                </li>
 
        </ItemTemplate>
         </asp:Repeater>   
        </ul>  
        
</div>

<div class="dspagtitle"><span>企业资质</span></div>
<div id="divZZ"></div>
<div class="dsRYZZ">
    
      
      <ul>
        <asp:Repeater ID="CmpZZ" runat="server">
        <ItemTemplate>         
                
                <li>                      
                <a  href="<%#Eval("pic") %>" target="_blank"><img alt="<%#Eval("title") %>" src="<%#Eval("pic") %>" /></a>
                
                <a  href="<%#Eval("pic") %>" target="_blank"><%#Eval("title")%></a><br/>
                </li>
        </ItemTemplate>
         </asp:Repeater>   
        </ul> 
        
</div>

<div class="dspagtitle"><span>以往案例</span></div>
<div id="divAL"></div>
<div class="dsRYZZ">

    
      <ul>
        <asp:Repeater ID="CmpAL" runat="server">
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
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
