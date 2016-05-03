<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProGLTop.ascx.cs" Inherits="JDJS.Web.ProjectGL.Controls.ProGLTop" %>
<div id="content">
    <div id="top">
        <div class="top-1">
        <div class="logo"><!--<img alt="" src="style/images/logo.gif" />--></div>
        <div class="manager">当前用户：<strong><asp:Label ID="lbUser" runat="server"></asp:Label></strong>  [ <a href="Login.aspx" >退出登录</a> <!--| <a href="ChangePwd.aspx"  target="FramContent">修改密码</a> -->]</div>
    </div>
    <div class="top-2">
        <div class="SeachType">
          <table border="0" cellspacing="0" cellpadding="0">
                <tr id="Hidetr" >
                    <td style="padding-left:5px; ">当前版本:</td>
                    <td><div class="seachinput"><img style=" float:right;" alt="" src="style/images/arrow.gif" /><div style=" float:left; padding-top:2px; padding-left:5px;">建定工程通 V1.0</div></div></td>
                    <td style="padding-left:5px;"><img id="HideImg" alt="隐藏" src="style/images/selectsite_hide.gif" /></td>
                </tr>
                <tr id="Showtr" style=" display:none;">
                    <td style="padding-left:5px;"><img id="ShowImg" alt="显示" src="style/images/selectsite_show.gif" /></td>
                </tr>
            </table>
        </div>
        <div class="menu"></div>
    </div>
    </div>

</div>