<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="indexpromat.ascx.cs" Inherits="JDJS.Web.Controls.indexpromat" %>
<div class="promattitle"></div>

<div class="entbody">
<div id="demo10" style=" width:200px; height:130px; margin-top:5px;">
    <div id="indemo10">
        <div id="demo11">
            <ul class="entul">
                <asp:Repeater ID="Repmat" runat="server">
                <ItemTemplate>
                    <li><a href="promatinfo.aspx?Id=<%#Eval("id") %>" title="<%#Eval("matname") %>"><%#LTP.Common.StringPlus.StrCut(Eval("matname").ToString(),20, "...")%></a> <span>[<%#Getrecstate(Eval("id").ToString())%>]</span></li>
                   
                </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div id="demo12"></div>
    </div>
    
</div>
<div class="promatfoot"><a href="promatindex.aspx">更多采购信息>></a></div>


<script type="text/javascript">
    var speed3 = 50;
    var tab10 = document.getElementById("demo10");
    var tab11 = document.getElementById("demo11");
    var tab12 = document.getElementById("demo12");
    tab12.innerHTML = tab11.innerHTML;
    function Marquee3() 
    {
        if (tab12.offsetHeight - tab10.scrollTop <= 0)
            tab10.scrollTop -= tab11.offsetHeight
        else {
            tab10.scrollTop++;
        }
    }
  var MyMar3=setInterval(Marquee3,speed3);
  tab10.onmouseover = function () { clearInterval(MyMar3) };
  tab10.onmouseout = function () { MyMar3 = setInterval(Marquee3, speed3)};
  </script>
 </div>
