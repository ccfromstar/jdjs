<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Quite.aspx.cs" Inherits="JDJS.Web.Quite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
.quite{ float:left; width:130px;}
.quite ul{ margin:0; padding:0; list-style:none;}
.quite li{ display:block; border-bottom:1px #e5e5e5 solid; height:30px; line-height:30px; text-align:center;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div style=" padding-top:10px; width:100%; border:1px #e5e5e5 solid;">
    <asp:Repeater ID="repQuite" runat="server">
    <HeaderTemplate>
        <div class="quite">
            <ul>
                <li style=" height:120px; line-height:120px;">当前对比产品</li>
                <li>材料名称</li>
                <li>品牌</li>
                <li>型号</li>
                <li>规格</li>
                <li>单位</li>
                <li>材质</li>
                <li>产地</li>
                <li>本站特供价</li>
                <li>生产厂商</li>
                <li>供应商信息</li>
                <li>发布日期</li>
                <li>人工询价</li>
            </ul>
        </div>
    </HeaderTemplate>
    <ItemTemplate>
        <div class="quite">
            <ul>
                <li style=" height:120px; line-height:120px;">
                    <img style="width:100px; height:100px;" alt="" src="<%#GetNoImg(Eval("imgpath").ToString()) %>" />
                </li>
                <li><%#Eval("zname") %></li>
                <li><%#Eval("Class")%></li>
                <li><%#Eval("model")%></li>
                <li><%#Eval("standard")%></li>
                <li><%#Eval("zunit")%></li>
                <li><%#Eval("material")%></li>
                <li><%#Eval("place")%></li>
                <li>￥<%#Eval("bid")%></li>
                <li><%#Eval("cpname")%></li>
                <li><a href="Gys.aspx?Id=<%#Eval("cid") %>"><%#GetCpName(Eval("cid").ToString())%></a></li>
                <li><%#Eval("ptime")%></li>
                <li><a href="Rgxj.aspx?Id=<%#Eval("id") %>">人工询价</a></li>
            </ul>
        </div>
    </ItemTemplate>
    </asp:Repeater>
    <asp:Button ID="btnReturn" runat="server" Text="返回继续查询" 
        onclick="btnReturn_Click" />
</div>
</asp:Content>
