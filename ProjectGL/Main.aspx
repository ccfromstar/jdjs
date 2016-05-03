<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="JDJS.Web.ProjectGL.Main" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
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

                <li class="checked"><a href="Content.aspx?type=Project" target="FramContent"><img alt="" src="style/Icons/icon040a13.gif" width="20" height="20" />工程管理</a></li>
                <li class="unchecked"><a href="Content.aspx?type=Renmai" target="FramContent"><img alt="" src="style/Icons/icon021a11.gif" width="20" height="20" />人脉管理</a></li>             
            </ul>
          </div>
          <div id="classC" runat="server">
            <ul class="LeftTab">            

                <li class="checked"><a href="CustContent.aspx?type=Project" target="FramContent"><img alt="" src="style/Icons/icon040a13.gif" width="20" height="20" />工程管理</a></li>
                <li class="unchecked"><a href="CustContent.aspx?type=Renmai" target="FramContent"><img alt="" src="style/Icons/icon021a11.gif" width="20" height="20" />人脉管理</a></li>             
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
                <td valign=top><iframe id="FramContent" name="FramContent" frameborder="0" width="100%" height="600;" src="" scrolling="auto">
                    </iframe></td></td>      
              <asp:Panel ID="Panel9" runat="server" Visible="false">
             <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td style=" width:80px; height:30px;" align="right">工程状态：</td>
                    <td style=" width:100px;">
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            
                        </asp:DropDownList>
                    </td>
                    <td width=70px align=center>
                       关键字：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox1" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        发布日期 从</td>
                    <td width=80px>
                        <asp:TextBox ID="TextBox2" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td width=70px align=center>
                        至</td>
                    <td width=80px>
                       <asp:TextBox ID="TextBox3" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton2" runat="server" class="zPushBtn" onclick="LinkButton2_Click" 
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                </tr>
                </table>
            </td>
         </tr>
        </asp:Panel>
       
       

              <asp:Panel ID="PanelCust" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style="float:left"><b>项目名称</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>发布日期</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    
                 
                </tr>
                <asp:Repeater ID="RepCust" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><a href="proshowpag.aspx?proid=<%#Eval("id") %>"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 82, "...")%></a></td>
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("inforptime").ToString(), 22, "...")%></td>
                
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="2" align="center">
                    <uc1:UcfarPager ID="UcfarPagerCust" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
             </asp:Panel>
                 
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
