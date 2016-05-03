<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="other.ascx.cs" Inherits="JDJS.Web.Controls.other" %>

<div id="other" style="height:272px;">

<div style="width:190px;height:160px"><div id="pic2"  class="newimg2"></div></div>
 <script type="text/javascript">

     // 需要你写的数据
     var data2 = [
	{ src: 'uploads/ewm1.jpg', href: 'http://www.jdjs.com.cn#' },
    { src: 'uploads/ewm2.jpg', href: 'http://www.jdjs.com.cn#' }
    //{ src: 'uploads/gg1.gif', href: '../Registration.aspx' }
  
];

     $(document).ready(function () {
         $('#pic2').d_imagechange({
             data: data2,
             bg: false,
             title: false,
             desc: false,
             btn: false,
             btnText: false,
             width: 190,
             height: 160,
             bgHeight: 24,
             playTime: 6000,
             animateStyle: 'o'//默认值'o',可以不写	
         });
     });
     

</script>
<div class="integral"><img alt="" src="style/images/integralbg.gif" /></div>
    <table style="width:195px; margin-left:3px;">      
        
        
        <tr>
            <td style=" padding:0px; height:15px;">用户名</td>
            <td style=" padding:0px; height:15px;">当年积分</td>
            <td style=" padding:0px; height:15px;">总积分</td>
        </tr>
        <asp:Repeater ID="Repintegral" runat="server">
        <ItemTemplate>
        <tr>
            <td style=" padding:0px; height:15px;"><%#Eval("id")%></td>
            <td style=" padding:0px; height:15px;"><%#Eval("current_point")%></td>
            <td style=" padding:0px; height:15px;"><%#Eval("point")%></td>
        </tr>
        </ItemTemplate>
        </asp:Repeater>
    </table>

</div>

