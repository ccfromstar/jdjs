<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="JDJS.Web.WebManager.Main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
     <link href="style/base.css" rel="Stylesheet" type="text/css" />
    <link href="style/layout.css" rel="Stylesheet" type="text/css" />
    <link href="style/model.css" rel="Stylesheet" type="text/css" />
    <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="js/onload.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="content">
<div id="top">
    <div class="top-1">
        <div class="logo"><!--<img alt="" src="style/images/logo.gif" />--></div>
        <div class="manager">当前用户：<strong><asp:Label ID="lbUser" runat="server"></asp:Label></strong>  [ <a href="Login.aspx" >退出登录</a> | <a href="ChangePwd.aspx"  target="FramContent">修改密码</a> ]</div>
    </div>
    <div class="top-2">
        <div class="SeachType">
          <table border="0" cellspacing="0" cellpadding="0">
                <tr id="Hidetr" >
                    <td style="padding-left:5px; ">当前站点：</td>
                    <td><div class="seachinput"><img style=" float:right;" alt="" src="style/images/arrow.gif" /><div style=" float:left; padding-top:2px; padding-left:5px;">建定建设工程信息网</div></div></td>
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
<div id="center">
<table style="width:100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td style="height:8px;width:110px;background:url(style/images/jiao.gif) right bottom no-repeat;"></td>
        <td style="background:url(style/images/tabpageBar_bg.gif) left bottom repeat-x;"></td>
        <td style="width:4px;background:url(style/images/jiao1.gif) left bottom no-repeat;"></td>
    </tr>
    <tr>
        <td style="background:url(style/images/v_tabpageBar_bg.gif) top right repeat-y;" valign="top">
            <div id="classA" runat="server">
            <ul class="LeftTab">            
                <li class="unchecked"><a href="Content.aspx?type=News" target="FramContent"><img alt="" src="style/Icons/icon040a1.gif" width="20" height="20" />行业动态</a></li>
                <li class="unchecked"><a href="Content.aspx?type=Company" target="FramContent"><img alt="" src="style/Icons/icon040a1.gif" width="20" height="20" />单位管理</a></li>
                <li class="unchecked"><a href="Content.aspx?type=Project" target="FramContent"><img alt="" src="style/Icons/icon040a13.gif" width="20" height="20" />工程信息</a></li>
                <li class="unchecked"><a href="Content.aspx?type=Market" target="FramContent"><img alt="" src="style/Icons/icon021a11.gif" width="20" height="20" />企业之窗</a></li>
                <li class="unchecked"><a href="Content.aspx?type=Corner" target="FramContent"><img alt="" src="style/Icons/icon031a1.gif" width="20" height="20" />造价园地</a></li>
                <li class="unchecked"><a href="Content.aspx?type=Policy" target="FramContent"><img alt="" src="style/Icons/icon1.gif" width="20" height="20" />政策公示</a></li>
                <li class="unchecked"><a href="Content.aspx?type=Download" target="FramContent"><img alt="" src="style/Icons/icon008a16.gif" width="20" height="20" />相关下载</a></li>
                <li class="unchecked"><a href="Content.aspx?type=User" target="FramContent"><img alt="" src="style/Icons/icon021a12.gif" width="20" height="20" />会员中心</a></li>
                <li class="unchecked"><a href="Content.aspx?type=Tj" target="FramContent"><img alt="" src="style/Icons/icon024a1.gif" width="20" height="20" />特供建材</a></li>
                <li class="unchecked"><a href="Content.aspx?type=Notice" target="FramContent"><img alt="" src="style/Icons/icon003a1.gif" width="20" height="20" />系统公告</a></li>
                <li class="unchecked"><a href="Content.aspx?type=WHtml" target="FramContent"><img alt="" src="style/Icons/icon_board.gif" width="20" height="20" />添加Word</a></li>
                <li class="unchecked"><a href="GG.aspx" target="FramContent"><img alt="" src="style/Icons/icon_board.gif" width="20" height="20" />TOP广告</a></li>            
            </ul>
          </div>

          <div id="classD" runat="server">
            <ul class="LeftTab">            
                <li class="checked"><a href="Content.aspx?type=Discount" target="FramContent"><img alt="" src="style/Icons/icon040a1.gif" width="20" height="20" />产品管理</a></li>             
            </ul>
          </div>

          <div id="classH" runat="server">
            <ul class="LeftTab">            
                <li class="checked"><a href="Content.aspx?type=SQ" target="FramContent"><img alt="" src="style/Icons/icon040a1.gif" width="20" height="20" />合作项目</a></li>             
            </ul>
          </div>
        </td>
        <td style="padding:5px;">
            <table id="tbContent"  style="width:100%;" border="0" cellspacing="0" cellpadding="0">
                <tr>                  
                    <!--<td valign=top><iframe id="FramContent" name="FramContent" frameborder="0" width="100%" height="600;" src="Content.aspx?type=News" scrolling="auto"></iframe></td></td>-->
                    <td valign=top><iframe id="FramContent" name="FramContent" frameborder="0" width="100%" height="600;" src="" scrolling="auto"></iframe></td></td>
                </tr>
            </table>
        
        <td style=" background:url(style/images/v_tabpageBar_bg1.gif) top left repeat-y;"></td>
    </tr>
    <tr>
        <td style="height:8px;background:url(style/images/jiao3.gif) top right no-repeat;"></td>
        <td style=" background:url(style/images/tabpageBar_bg1.gif) top left repeat-x;"></td>
        <td style=" background:url(style/images/jiao2.gif) top left no-repeat;"></td>
    </tr>
</table>
</div>
</div>
    </form>
</body>
</html>
