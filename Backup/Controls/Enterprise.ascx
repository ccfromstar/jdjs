<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Enterprise.ascx.cs" Inherits="JDJS.Web.Controls.Enterprise" %>
<div class="Enterprise">
<div class="enttitle"><a href="MarketList.aspx?Part=4">更多建材企业>></a></div>
<div class="entbody" >
<div id="demo" style=" width:787px; height:130px; margin-top:5px;">
    <div id="indemo">
        <div id="demo1">
            <ul class="entul">
                <asp:Repeater ID="Repent" runat="server">
                <ItemTemplate>
                    <li><a href="MarketDetail.aspx?Part=4&Id=<%#Eval("cid") %>" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),34,"...") %></a></li>
                </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div id="demo2"></div>
    </div>
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
</div>