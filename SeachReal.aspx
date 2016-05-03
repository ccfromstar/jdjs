<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="SeachReal.aspx.cs" Inherits="JDJS.Web.SeachReal" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="style/datePicker.css" type="text/css" />
<script type="text/javascript" src="js/jquery.core.js"></script>
<script type="text/javascript" src="js/jquery.datePicker.js"></script>
<style>
.bodytb{width:765px;border-collapse:collapse; color:#003399;}
.bodytb a{ color:#003399; text-decoration:underline;}
.bodytb td{ line-height:18px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <script type="text/javascript">
        jQuery(function () {
            $(".date-pick").datepicker({ changeMonth: true, changeYear: true });
            $("input:checkbox").click(function () {
                var idx = 0;
                $(".bodytb input:checkbox").each(function () {
                    if ($(this).attr("checked")) {
                        if (idx >= 5) {
                            alert("最多选择5项！");
                            $(this).attr("checked", false);
                        }
                        else {
                            idx += 1;
                        }
                    }
                });
            });
        });

</script>
<div class="SubMainBig">
    <img alt="" src="style/images/EspPrice-tl.gif" />
    <div class="SubTopBig">
       <table style="width: 760px;">
            <tr>
                <td align=right style="width:70px">
                    查询方式：</td>
                <td width=100px align=right style="width: 30px">
                    <asp:DropDownList ID="ddlOrder" runat="server" Width="100">
                        <asp:ListItem Value="1">材料名</asp:ListItem>
                        <asp:ListItem Value="2">规格型号</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width=70px align=right>
                    开始日期：</td>
                <td width=100px align=right>
                    <asp:TextBox ID="txtBg" runat="server" Width="100px" CssClass="date-pick"></asp:TextBox>
                </td>
                <td width=70px align=right>
                    结束日期：</td>
                <td width=100px align=right>
                   <asp:TextBox ID="txtEnd" runat="server" Width="100px" CssClass="date-pick"></asp:TextBox>
                </td>
                <td align="center" rowspan="2"><asp:Button ID="btnSeach" runat="server" Text="搜索" onclick="btnSeach_Click" 
                        Height="24px" Width="70px" /></td>
            </tr>
            <tr>
                <td width=70px align=right>
                   关键字：</td>
                <td width=100px>
                    <asp:TextBox ID="txtTitle" runat="server" Width="100px"></asp:TextBox>
                </td>
                <td width=70px align=right>
                    生产厂商：</td>
                <td width=100px align=right>
                    <asp:TextBox ID="txtCpname" runat="server" Width="100px"></asp:TextBox>
                </td>
                <td width=70px align=right>
                    品牌：</td>
                <td width=100px align=right>
                    <asp:TextBox ID="txtClass" runat="server" Width="100px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <table class="bodytb" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"   >   
        <tr style=" background:#003399; color:#ffffff; font-weight:bold;" >
            <td width=30>
                <asp:LinkButton ID="lbQuite" runat="server" ForeColor="White" 
                    onclick="lbQuite_Click">比较</asp:LinkButton></td>
            <td width=150 height=30 align=center>材料名称</td>
            <td width=50 align=center>品牌</td>
            <td width=80 align=center>型号</td>
            <td width=80 align=center>规格</td>
            <td width=60 align=center>材质</td>
            <td width=60 align=center>产地</td>
            <td width=100 align=center>生产厂商</td>
            <td width=70 align=center>发布日期</td>
            <td width=80 align=center>操作</td>
        </tr>
        <asp:Repeater ID="RepSeach" runat="server">
        <ItemTemplate>
            <tr>
                <td align="center"><asp:CheckBox ID="ckBox" runat="server" /><asp:HiddenField ID="hfValue" runat="server" Value='<%#Eval("id") %>' />
                </td>
                <td height=30 align=center><a href="RealDetail.aspx?Id=<%#Eval("id") %>"><%#Eval("zname")%></a></td>
                <td align=center><%#Eval("Class")%></td>
                <td align=center><%#Eval("model")%></td>
                <td align=center><%#Eval("standard")%></td>
                <td align=center><%#Eval("material")%></td>
                <td align=center><%#Eval("place")%></td>
                <td align=center><%#Eval("cpname")%></a></td>
                <td align=center><%#Eval("ptime","{0:yyyy-MM-dd}")%></td>
                <td align=center style=" line-height:20px;">
                    <a href="RealDetail.aspx?Id=<%#Eval("id") %>">材料详情</a><br />
                    <a href="<%#GetUrl(Eval("mid").ToString())+".aspx?Id="+Eval("cid") %>">供应商详情</a><br />
                    <%#Bstr(Eval("id").ToString(),Eval("bid").ToString())%>
                    <a href="Rgxj.aspx?Id=<%#Eval("id") %>">人工询价</a></td>
            </tr>
        </ItemTemplate>
        </asp:Repeater>
    </table>
    <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
</div>
</asp:Content>
