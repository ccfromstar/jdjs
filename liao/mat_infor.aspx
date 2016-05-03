<%@ Page Title="" Language="C#" MasterPageFile="dsMasterPage.Master" AutoEventWireup="true" CodeBehind="mat_infor.aspx.cs" Inherits="JDJS.Web.liao.mat_infor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">

        <!--<div style=" float:left;"><img alt="" src="<%=Getpic()%>" onmousemove="zoom()" id="srcImg" /></div>
        <div style="overflow:hidden;float:left" ><img id="zoomImg" alt=""  src=""/></div>-->
        
<script type="text/javascript">
//<![CDATA[
    function zoomBox() { this.index.apply(this, arguments) }
    zoomBox.prototype = {
        index: function (win, zoom) {
            var win = document.getElementById(win);
            var box = document.getElementById(zoom);
            var img = box.getElementsByTagName('IMG')[0];
            var zoom = img.width / win.getElementsByTagName('IMG')[0].width;
            var z = Math.round(box.offsetWidth / 2);
            win.onmousemove = function (e) {
                e = e || window.event;
                var x = e.clientX, y = e.clientY, ori = win.getBoundingClientRect();
                if (x > ori.right + 20 || y > ori.bottom + 20 || x < ori.left - 20 || y < ori.top - 20) box.style.display = 'none';
                x -= ori.left;
                y -= ori.top;
                box.style.left = x - z + 'px';
                box.style.top = y - z + 'px';
                img.style.left = -x * zoom + z + 'px';
                img.style.top = -y * zoom + z + 'px';
            }
            win.onmouseover = function () { box.style.display = '' }
        }
    };
    window.onload = function () {
        x = new zoomBox('zoomPan', 'zoom')
    }
 //]]>
</script>

 <div class="zoomPan" id="zoomPan" >
    <img src="<%=Getpic()%>" alt=""  />
    <div id="zoom" class="sh"><img src="<%=Getfdpic()%>" alt="" /></div>
</div>


 

<div class="dsmatinfo">
     <table>
     <tr><td style=" width:100px">产品名称：</td>
     <td><asp:Label ID="Zname" runat="server" Text="Label"></asp:Label></td>
     </tr>
     <tr><td style=" width:100px">产品价格：</td>
     <td><asp:Label ID="Zlprice" runat="server" Text="Label"></asp:Label></td>
     </tr>
     <tr><td style=" width:100px">发布日期：</td>
     <td><asp:Label ID="Zptime" runat="server" Text="Label"></asp:Label></td>
     </tr>
     <tr><td style=" width:100px">产地：</td>
     <td><asp:Label ID="Zplace" runat="server" Text="Label"></asp:Label></td>
     </tr>
     <tr><td style=" width:100px">供应量：</td>
     <td><asp:Label ID="Zaut" runat="server" Text="Label"></asp:Label></td>
     </tr>
      <tr><td style=" width:100px">材质：</td>
     <td><asp:Label ID="Zmat" runat="server" Text="Label"></asp:Label></td>
     </tr>
      <tr><td style=" width:100px">规格型号：</td>
     <td><asp:Label ID="Zsta" runat="server" Text="Label"></asp:Label></td>
     </tr>
      <tr><td style=" width:100px">【产品简介】：</td>
     <td><asp:Label ID="Zrek" runat="server" Text="Label"></asp:Label></td>
     </tr>
   
    </table>
    <a href="javascript:history.back(-1)" class="stylelink">[返回上页]</a> 
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>

