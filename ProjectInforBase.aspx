<%@ Page Title="工程信息网 上海工程信息网 免费注册试用上海拟在建建设工程信息、建筑工程项目信息、工程建设信息、工程建设项目信息。客服热线：021-54591008 021-64281662 客服专用QQ ：[1621734271]" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ProjectInforBase.aspx.cs" Inherits="JDJS.Web.ProjectInforBase" %>

<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
        .style2
        {
            height: 23px;
        }
        .style3
        {
            font-size: medium;
            font-weight: bold;
            font-style: italic;
            color: #FF0000;
        }
        .style4
        {
            color: #FF0000;
        }
        .style5
        {
            color: #FF0000;
            text-decoration: underline;
        }
        
        </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
  <link rel="Stylesheet" href="style/datePicker.css" type="text/css" />
    <script type="text/javascript" src="js/jquery.core.js"></script>
    <script type="text/javascript" src="js/jquery.datePicker.js"></script>
     <script type="text/javascript">
         jQuery(function () {
             $(".date-pick").datepicker({ changeMonth: true, changeYear: true });
         }); 
</script>
<div class="SubMain">
    <img alt="" src="style/images/Project-tl.gif" />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" 
        ForeColor="#FF0066" style="text-align: center" 
        
        
        Text="获取全部详尽工程信息及相关人脉资料，请速拨打：021-54591008、021-64281662 客服专用QQ ：[1621734271]"></asp:Label>
<div class="SubTop">
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
            <td class="style3"><a href="Registration.aspx"><span class="style4">点此注册</span></a><span id="Span2" class="style5">☜</span></td>
            </tr>
        
        </table>
        
    </div>
    <div class="SubCenter">
       <asp:Image ID="ImgBg" runat="server" /><div class="subbody">
            <ul class="subbdul">
                <asp:Repeater ID="RepInfo" runat="server">
                <ItemTemplate>
                    <li class="<%#Getstyle(Eval("Id").ToString())%>"><span><%#Eval("prostate")%>     [<%#Eval("inforptime", "{0:yyyy-MM-dd}")%>]</span><a href="ProjectinforDetail.aspx?Part=<%#Part%>&Id=<%#Eval("id") %>" title="<%#ReplaceStr(Eval("prorek").ToString(),"<br>","")%>"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 82, "...")%></a><%#NewStr(Eval("inforptime", "{0:yyyy-MM-dd}").ToString())%></li>
                </ItemTemplate>
                </asp:Repeater>
            </ul>
       </div>
       <div class="subfoot"></div>
       <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>