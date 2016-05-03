<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Market.aspx.cs" Inherits="JDJS.Web.Market" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="SubMain">
    <img alt="" src="style/images/Market-tl.gif" />
    <div class="SubCenter">
       <div class="subtitle"  style=" background:url(style/images/Market-md1.gif);"></div>
       <div class="subbody">
           <table style="width: 100%; ">
               <tr>
                   <td height=30 colspan="2" align=center>
                        <asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>
                       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                       <ContentTemplate>
                       <asp:RadioButton ID="rb2" runat="server" GroupName="Seach" Checked="true" />材料名
                       <asp:RadioButton ID="rb1" runat="server" GroupName="Seach" />公司名
                       <asp:RadioButton ID="rb3" runat="server" GroupName="Seach" />规格型号
                       <asp:RadioButton ID="rb4" runat="server" GroupName="Seach" />品牌
                       <asp:DropDownList ID="ddlyear" runat="server" AutoPostBack="True" 
                           onselectedindexchanged="ddlyear_SelectedIndexChanged">
                       </asp:DropDownList>
                       年<asp:DropDownList ID="ddlmonth" runat="server">
                       </asp:DropDownList>
                       月
                       </ContentTemplate></asp:UpdatePanel></td>
               </tr>
               <tr>
                   <td height=30 width=70% align=right>
                       <asp:TextBox ID="txtSeach" runat="server" Width="300px"></asp:TextBox>
                   </td>
                   <td align=left>
                       <asp:Button ID="btnSeach" runat="server" Text="搜索" Height="25px" 
                           onclick="btnSeach_Click" Width="70px" />
                   </td>
               </tr>
               </table>
       </div>
       <div class="subfoot"></div>
    </div>
    <div class="SubCenter">
       <div class="subtitle" style=" background:url(style/images/Market-md2.gif);"><span><a href="MarketPrice.aspx?Part=2">更多>></a></span></div>
       <div class="subbody">
        <table style="width:627px;border-collapse:collapse; color:#003399;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"   >   
                <tr style=" background:#003399; color:#ffffff; font-weight:bold;" >
                    <td height=30 align=center >名称</td>
                    <td style=" width:100px;" align=center>单位</td>
                    <td style=" width:100px;" align=center>价格</td>
                    <td style=" width:100px;" align=center>发布时间</td>
                </tr>
            <asp:Repeater ID="RepInfo2" runat="server">
                <ItemTemplate>
                   <tr>
                        <td align=center height=30 ><%#Eval("name")%></td>
                        <td align=center><%#Eval("unit")%></td>
                        <td style=" font-size:14px;" align=center><%#Eval("price","{0:c}")%></td>
                        <td align=center><%#Eval("date","{0:yyyy-MM-dd}")%></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
</table>
       </div>
<%--       <div class="subfoot"></div>--%>
    </div>
    <div class="SubCenter">
       <div class="subtitle"  style=" background:url(style/images/Market-md3.gif);"><span><a href="SeachReal.aspx">更多>></a></span></div>
       <div class="subbody">
        <table style="width:627px;border-collapse:collapse; color:#003399;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc"   >   
        <tr style=" background:#003399; color:#ffffff; font-weight:bold;" >
            <td width=150 height=30 align=center>材料名称</td>
            <td width=50 align=center>品牌</td>
            <td width=80 align=center>型号</td>
            <td width=80 align=center>规格</td>
            <td width=60 align=center>材质</td>
            <td width=60 align=center>产地</td>
            <td width=75 align=center>生产厂商</td>
            <td width=70 align=center>发布日期</td>
        </tr>
        <asp:Repeater ID="RepInfo3" runat="server">
        <ItemTemplate>
            <tr>
                <td height=30 align=center><%#Eval("zname")%></td>
                <td align=center><%#Eval("Class")%></td>
                <td align=center><%#Eval("model")%></td>
                <td align=center><%#Eval("standard")%></td>
                <td align=center><%#Eval("material")%></td>
                <td align=center><%#Eval("place")%></td>
                <td align=center><%#Eval("cpname")%></td>
                <td align=center><%#Eval("ptime","{0:yyyy-MM-dd}")%></td>
            </tr>
        </ItemTemplate>
        </asp:Repeater>
    </table>
       </div>
    </div>
    <div class="SubCenter">
       <div class="subtitle"  style=" background:url(style/images/Market-md4.gif);"><span><a href="MarketList.aspx?Part=4">更多>></a></span></div>
       <div class="subbody">
       <div id="demo" style=" width:624px; height:130px;">
        <div id="indemo">
            <div id="demo1">
            <ul class="subbdulEnt">
            <asp:Repeater ID="RepInfo4" runat="server">
                <ItemTemplate>
                    <li><a href="MarketDetail.aspx?Part=4&Id=<%#Eval("cid") %>" title="<%#Eval("title") %>" <%#GetStyle(Eval("webshow").ToString()) %>><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),34,"...") %><%#GetStyle1(Eval("webshow").ToString()) %></a></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
            </div>
        <div id="demo2"></div>
        </div>
        </div>
       </div>
       <div class="subfoot"></div>
    </div>
    <script>
<!--
    var speed = 50;
    var tab = document.getElementById("demo");
    var tab1 = document.getElementById("demo1");
    var tab2 = document.getElementById("demo2");
    tab2.innerHTML = tab1.innerHTML;
    function Marquee() {
        if (tab2.offsetHeight - tab.scrollTop <= 0)
            tab.scrollTop -= tab1.offsetHeight 
        else {
            tab.scrollTop++;
        }
    }
    var MyMar = setInterval(Marquee, speed);
    tab.onmouseover = function() { clearInterval(MyMar) };
    tab.onmouseout = function() { MyMar = setInterval(Marquee, speed) };
-->
</script>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
