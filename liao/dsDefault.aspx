<%@ Page Title="" Language="C#" MasterPageFile="dsMasterPage.Master" AutoEventWireup="true" CodeBehind="dsDefault.aspx.cs" Inherits="JDJS.Web.liao.dsDefault" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
     <div class="dsindextitle"><span>公司简介</span></div>
     <div class="dsindexcmpinfo">
    <asp:Label ID="CPindexBody" runat="server" ></asp:Label><a href="./companyInfo.aspx" title="点击查看详情">[查看全部]</a>
    </div>
   
   <div class="dsindextitle"><span>产品展厅</span><a href="./supply.aspx">更多产品</a></div>
   <div class="dsindexZT">
                       
      <div align="center" style="margin:0 auto" >
      <ul class="dsindexsupply" >
        <asp:Repeater ID="indexsupply" runat="server">
        <ItemTemplate>
                       
                <li>                       
                <a  href="mat_infor.aspx?id=<%#Eval("id")%>" target="_self"><img alt="<%#Eval("zname") %>" src="<%#Getpic(Eval("pic").ToString())%>" /></a>
               
                <a  href="mat_infor.aspx?id=<%#Eval("id")%>" target="_self" title="<%#Eval("zname") %>"><%#LTP.Common.StringPlus.StrCut(Eval("zname").ToString(), 24, "...")%></a> 
                     
                </li>
        </ItemTemplate>
         </asp:Repeater>   
        </ul> 
          
        </div> 
        
    </div>
        
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
