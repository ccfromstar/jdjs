<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="WebDiscount.aspx.cs" Inherits="JDJS.Web.WebDiscount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div style="text-align:center">
<table>
<tr class="dataTableHead"><td colspan="2" >客户信息登记</td></tr></table>
<table class="dataTable">
<tr>
    <td>
   <asp:Label ID="Label2" runat="server" Text="公司名称："></asp:Label></td>
   <td style="text-align:left">
   <asp:TextBox ID="SQcmp"
        runat="server" Width="330px"></asp:TextBox>
        
    </td>
 </tr>
  <tr>
    <td>
    <asp:Label ID="Label3"
        runat="server" Text="联系人："></asp:Label></td>
    <td style="text-align:left"><asp:TextBox ID="SQman" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    <asp:Label ID="Label4" runat="server" Text="地址："></asp:Label></td>
    <td style="text-align:left">
        <asp:TextBox ID="SQaddr"
            runat="server" Width="330px"></asp:TextBox></td>
            </tr>
            <tr>
   <td>
    <asp:Label ID="Label5" runat="server" Text="电话号码："></asp:Label></td>
    <td style="text-align:left"><asp:TextBox ID="SQpho" runat="server"></asp:TextBox></td>
    </tr>
    <tr style=" height:50px">
    <td colspan="2">
    <asp:Label ID="Label6" runat="server"
                Text="请输入您的真实信息，以便我们与您取得联系！"></asp:Label>
    </td>
 </tr>
 </table>
</div>
<div class="discount"> 
     <table>
     <tr class="dataTableHead"><td colspan="2" >优惠项目选择列表</td></tr></table>
      <ul>
        <asp:Repeater ID="Discnt" runat="server">
        <ItemTemplate>
                 <table class="dataTable">        
                
                <tr><td>优惠项目</td><td><%#Eval("det_title")%></td></tr>
                
                <tr><td colspan="2" ><%#LTP.Common.StringPlus.StrCut(Eval("det_rek").ToString(), 280, "...")%></td></tr>
                              
                <tr><td>单价</td><td><%#Eval("Dis_monry")%><asp:Label ID="Labmoney" runat="server" Visible="False" Text='<%#Eval("Dis_monry")%>'></asp:Label>（元）</td></tr>
                <tr><td>选中优惠</td><td>
                    <asp:CheckBox ID="CheckBox2" runat="server"  Checked='<%#Getstyle(Eval("checktype").ToString(),0)%>' Enabled='<%#Getstyle(Eval("checktype").ToString(),1)%>'/>
                    <asp:Label ID="Label1" runat="server" Visible="False" Text='<%#Eval("Dis_d_id")%>'></asp:Label>
                    </td></tr>
                
                
                              
                </table>      
        </ItemTemplate>
         </asp:Repeater>   
       </ul>  
    
</div>
<div>
    <asp:Label ID="Label7" runat="server" Text="优惠验证码：" Visible="false"></asp:Label><asp:Label ID="Label8"
        runat="server" Text="" Visible="false"></asp:Label></div>
<div style="text-align:center">
        <asp:Button ID="SQButton" runat="server" Text="点此获取优惠码" 
            onclick="SQButton_Click" />
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
