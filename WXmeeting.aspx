<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WXmeeting.aspx.cs" Inherits="JDJS.Web.WXmeeting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1"/>

    <title>微信报名</title>
</head>

<body class="bodys">
<style>
.wrap{margin:0 auto;}
.bodys {text-align:center; background:url(uploads/metsign2.png) no-repeat  center center;}
.fontstl1{ font-size:x-large; font-weight:bolder;  color:Blue}
.fontstl2{ font-weight:bolder;  color:Blue}
.fontstl3{ font-size:x-large; font-weight:300;  color:Red}
.fontstl4{ font-size:small}
</style>
    <form id="form1" runat="server">
    <div id="signup" runat="server" class="wrap">
    <table class="wrap" border="2px">
        <tr align="center" class="fontstl1">
            <td colspan="2">
                <asp:Label ID="Label7"
                    runat="server" Text=""></asp:Label>
            </td>
        </tr>
    
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="姓名：(必填)" class="fontstl2"></asp:Label></td>
            <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
    
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="所属公司：" class="fontstl2"></asp:Label></td>
             <td>   <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="邮寄地址：" class="fontstl2"></asp:Label></td>
             <td>   <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>

         <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="联系电话/手机：(必填)" class="fontstl2"></asp:Label></td>
             <td>   <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr align="center">
            <td colspan="2">
                
                <asp:Button ID="Button1" runat="server" Text="点击提交" onclick="Button1_Click" />
                
            </td>
        </tr>
    
    </table>
    </div>
    
    <div id="Div1" runat="server" class="wrap">
        <table class="wrap" border="2px">
         <tr align="center" class="fontstl3">
            <td>
            
                <asp:Label ID="Label5" runat="server" Text="提交成功，稍后会有工作人员和您联系！"></asp:Label>
            
            </td>
        </tr>
         <tr align="center">
        <td>
            <asp:Label ID="Label8" runat="server" Text="请点击左上角 返回 按钮继续阅读。"></asp:Label>
            <asp:Button ID="Button2" runat="server" Visible="false" Text="继续报名" onclick="Button2_Click" />
            </td>
        </tr>
        </table>
    </div>
    <div id="Div2" runat="server" class="wrap">
        <table  class="wrap" style="font-size:small">
         <tr align="left">
            <td>
            
                <asp:Label ID="Label9" runat="server" Text="" Visible="false"></asp:Label>
            
            </td>
           
        </tr>
        <tr>
         <td>
             <asp:Image ID="Image1" runat="server"  Visible="false" /></td>
        </tr>
         <!--<tr align="left">
            <td>
            
                <asp:Label ID="Label10" runat="server" Text="<br>会议日程：<br><br> 第一天 6月18日 星期四<br>08:30～09:30  会议签到、领取资料、自由交流、客户引见<br>09:30～12:00  主题演讲、专题讨论、头脑风暴、茶歇交流<br>12:00～14:00  会议午餐、圆桌午餐会、自助交流会<br>14:00～16:30	主题演讲、专题讨论、互动问答、茶歇交流<br>"></asp:Label>            
            </td>
        </tr>

         <tr align="left">
            <td>
            
                <asp:Label ID="Label11" runat="server" Text=" 第二天 6月19日 星期五<br>08:30～09:30  会议签到、领取资料、自由交流、客户引见<br>09:30～12:00  主题演讲、专题讨论、头脑风暴、茶歇交流<br>12:00～14:00  会议午餐、圆桌午餐会、自助交流会<br>14:00～16:30	主题演讲、专题讨论、互动问答、茶歇交流<br>"></asp:Label>            
            </td>
        </tr>-->
         
        </table>
    </div>
    
    </form>
</body>
</html>
