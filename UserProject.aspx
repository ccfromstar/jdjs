<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="UserProject.aspx.cs" Inherits="JDJS.Web.UserProject" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc2" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">

<div class="SubMain">
     <div class="SubTop">
     <div class="pagmidtitle"><p>我的工程</p></div>
        <table style="width: 624px;">
            <tr>
                <td width="70px" align="center">工程名称：
                </td>
                <td width="138px">
                    <asp:TextBox ID="txtTitle" runat="server" Width="130px"></asp:TextBox>
                </td>
                <td width="70px" align="center">工程分类：</td>
                <td colspan="1" >
                    <asp:DropDownList ID="ddlClass" runat="server" Width="130px"  >
                        <asp:ListItem Selected="True" Value="全部信息">全部信息</asp:ListItem>
                        <asp:ListItem>办公楼</asp:ListItem>
                        <asp:ListItem>酒店</asp:ListItem>
                        <asp:ListItem>市政工程</asp:ListItem>
                        <asp:ListItem>工业</asp:ListItem>
                        <asp:ListItem>住宅</asp:ListItem>
                        <asp:ListItem>医疗</asp:ListItem>
                        <asp:ListItem>别墅</asp:ListItem>
                        <asp:ListItem>教育</asp:ListItem>
                        <asp:ListItem>商业</asp:ListItem>
                        <asp:ListItem>停车厂</asp:ListItem>
                        <asp:ListItem>社区</asp:ListItem>
                        <asp:ListItem>教育</asp:ListItem>
                        <asp:ListItem>展览</asp:ListItem>
                        <asp:ListItem>基本建设</asp:ListItem>
                        <asp:ListItem>园林</asp:ListItem>
                        <asp:ListItem>司法</asp:ListItem>
                        <asp:ListItem>开采</asp:ListItem>
                        <asp:ListItem>石油及天燃气</asp:ListItem>
                        <asp:ListItem>文娱</asp:ListItem>
                        <asp:ListItem>零售</asp:ListItem>
                        <asp:ListItem>开发</asp:ListItem>
                        <asp:ListItem>机场及交通枢纽</asp:ListItem>
                        <asp:ListItem>公用事业</asp:ListItem>
                        <asp:ListItem>机场</asp:ListItem>
                        <asp:ListItem>厂房</asp:ListItem>
                        <asp:ListItem>装修</asp:ListItem>
                        <asp:ListItem>精装修</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="center">工程状态：</td><td><asp:DropDownList ID="ddlClass0" runat="server"  >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="center" class="style2">发布日期：</td>
                <td class="style1">
                    <asp:TextBox ID="txtBg" runat="server" Width="130px" CssClass="date-pick"></asp:TextBox>
                </td>
                <td align="center" class="style2">- 至 -</td>
                <td width="138px" class="style1">
                    <asp:TextBox ID="txtEnd" runat="server" Width="130px" CssClass="date-pick"></asp:TextBox>
                </td>
                <td align="center" class="style1"> </td>
                        <td class="style1"></td>
            </tr>
            <tr>
            <td width="70px" align="center" class="style2">开工日期：</td>
            <td width="138px" class="style1">
                    <asp:TextBox ID="txtBg0" runat="server" Width="130px" CssClass="date-pick"></asp:TextBox>
                </td>
            <td width="70px" align="center" class="style2">- 至 -</td>
            <td width="138px" class="style1">
                    <asp:TextBox ID="txtEnd0" runat="server" Width="130px" CssClass="date-pick"></asp:TextBox>
                </td>
                <td align="center" class="style2">工程地域：</td>
                <td class="style1"><asp:DropDownList ID="ddlClass1" runat="server"  >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
            <td width="70px" align="center">竣工日期：</td>
            <td width="138px">
                    <asp:TextBox ID="TextBox1" runat="server" Width="130px" CssClass="date-pick"></asp:TextBox>
                </td>
            <td width="70px" align="center">- 至 -</td>
            <td width="138px">
                    <asp:TextBox ID="TextBox2" runat="server" Width="130px" CssClass="date-pick"></asp:TextBox>
                </td>
            <td align="center"></td>
            <td></td>
            </tr>
            <tr>
            <td align="center">工程造价：</td>
            <td>
                    <asp:TextBox ID="txtTitle0" runat="server" Width="130px"></asp:TextBox>
                </td>
            <td align="center">- 至 -</td>
            <td>
                    <asp:TextBox ID="txtTitle1" runat="server" Width="130px"></asp:TextBox>
                </td>
            <td>万元</td>
            <td> <asp:Button ID="btnSeach" runat="server" Text="点击搜索" onclick="btnSeach_Click" 
                        Height="24px" Width="70px" /></td>
            </tr>
            <tr>
            <td align="center">开发商：</td>
            <td class="style1">
                    <asp:TextBox ID="txtTitle2" runat="server" Width="130px"></asp:TextBox>
                </td>
            <td align="center">设计院：</td>
            <td class="style1">
                    <asp:TextBox ID="txtTitle3" runat="server" Width="130px"></asp:TextBox>
                </td>
            <td class="style1"></td>
            <td class="style1"> &nbsp;</td>
            </tr>
            <tr>
            <td align="center">承建商：</td>
            <td>
                    <asp:TextBox ID="txtTitle4" runat="server" Width="130px"></asp:TextBox>
                </td>
            <td><b>配套工程：</b></td>
            <td>
                    <asp:TextBox ID="txtTitle5" runat="server" Width="130px"></asp:TextBox>
                </td>
            <td></td>
          
            </tr>
        
        </table>
        
    </div>
            <div class="SubCenter">
            <asp:Image ID="ImgBg" runat="server" />
            <div class="subbody">
                <ul class="subbdul">
                <asp:Repeater ID="RepInfo" runat="server">
                <ItemTemplate>
                    <li class="subbhadul a">
                    <span><%#Eval("prostate")%>     [<%#Eval("inforptime", "{0:yyyy-MM-dd}")%>]</span>
                    <a href="ProjectinforDetail.aspx?Part=3&Id=<%#Eval("id") %>" title="<%#ReplaceStr(Eval("prorek").ToString(),"<br>","")%>">
                    <%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 82, "...")%></a>
                    <%#NewStr(Eval("inforptime", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
                </asp:Repeater>
                </ul>
            </div>
            </div>
       <div class="subfoot"></div>
      <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
      <div style=" text-align:center">
         <a href="javascript:history.back(-1)" class="stylelink">[返回上页]</a> </div>
</div>
     
     <uc2:SubGG id="SubGG" runat="server"></uc2:SubGG>
</asp:Content>

