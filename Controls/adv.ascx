<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="adv.ascx.cs" Inherits="JDJS.Web.Controls.adv" %>
<div class="Adv">
<div class="enttitle"><a href="ProjectInforBase.aspx?Part=3">更多工程信息>></a></div>
<div class="entbody" >
<div id="demo3" style=" width:787px; height:128px; margin-top:5px;">
    <div id="indemo1">
        <div id="demo4">
            <ul class="indexproul">
                <asp:Repeater ID="Repent" runat="server">
                <ItemTemplate>
                    <li><span>[<%#Eval("prostate")%>] [<%#Eval("proplace")%>] [<%#Eval("inforptime", "{0:yyyy-MM-dd}")%>]</span><a href="ProjectInforDetail.aspx?Part=3&Id=<%#Eval("id") %>" title="<%#Eval("proname") %>"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 80, "...")%></a></li>
                </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div id="demo5"></div>
    </div>
</div>
<script>
<!--
    var speed = 100;
    var tab3 = document.getElementById("demo3");
    var tab4 = document.getElementById("demo4");
    var tab5 = document.getElementById("demo5");
    tab5.innerHTML = tab4.innerHTML;
    function Marquee1() {
        if (tab5.offsetHeight - tab3.scrollTop <= 0)
            tab3.scrollTop -= tab4.offsetHeight
        else {
            tab3.scrollTop++;
        }
    }
    var MyMar1 = setInterval(Marquee1, speed);
    tab3.onmouseover = function () { clearInterval(MyMar1) };
    tab3.onmouseout = function () { MyMar1 = setInterval(Marquee1, speed) };
-->
</script>
</div>
</div>