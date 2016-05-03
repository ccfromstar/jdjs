<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProGLleft.ascx.cs" Inherits="JDJS.Web.ProjectGL.Controls.ProGLleft" %>
<div id="center"  style="width:10%; float:left" >
<table  border="0" cellspacing="0" cellpadding="0">
    <!--<tr>
        <td style="height:8px;width:110px;background:url(style/images/jiao.gif) right bottom no-repeat;"></td>
        <td style="background:url(style/images/tabpageBar_bg.gif) left bottom repeat-x;"></td>
        <td style="width:4px;background:url(style/images/jiao1.gif) left bottom no-repeat;"></td>
    </tr>-->
    <tr>
    <td>
        <!--<td style="background:url(style/images/v_tabpageBar_bg.gif) top right repeat-y;" valign="top">-->
            <div id="classA" runat="server">
            <ul class="LeftTab">            

                <li class="checked"><a href="Content.aspx?type=Project" target="FramContent"><img alt="" src="style/Icons/icon040a13.gif" width="20" height="20" />工程管理</a></li>
                <li class="unchecked"><a href="Content.aspx?type=Renmai" target="FramContent"><img alt="" src="style/Icons/icon021a11.gif" width="20" height="20" />人脉管理</a></li>             
            </ul>
          </div>
          <div id="classC" runat="server" style=" text-decoration:underline">
            <ul>            

                <li class="checked"><a href="CustContent.aspx?type=Project" ><img alt="" src="style/Icons/icon040a13.gif" width="20" height="20" />工程管理</a></li>
                <li class="unchecked"><a href="CustContent.aspx?type=Renmai" ><img alt="" src="style/Icons/icon021a11.gif" width="20" height="20" />人脉管理</a></li>
                <li class="unchecked"><a href="CustContent.aspx?type=Mat" ><img alt="" src="style/Icons/icon021a14.gif" width="20" height="20" />采购资讯</a></li>
                <li class="unchecked"><a href="CustContent.aspx?type=MatProject" ><img alt="" src="style/Icons/icon002a12.gif" width="20" height="20" />清单项目</a></li>               
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
        <!--<td style="padding:5px;">
               
                 <table id="tbContent"  style="width:100%;" border="0" cellspacing="0" cellpadding="0">
                <tr>                  
                < <td valign="top"><iframe id="FramContent" name="FramContent" frameborder="0" width="100%" height="600;" src="" scrolling="auto">
                    </iframe></td>
              
                </tr>
                
            </table>
        </td>-->
       <!--<td style=" background:url(style/images/v_tabpageBar_bg1.gif) top left repeat-y;"></td>-->
    </tr>
    <!--<tr>
        <td style="height:8px;background:url(style/images/jiao3.gif) top right no-repeat;"></td>
        <td style=" background:url(style/images/tabpageBar_bg1.gif) top left repeat-x;"></td>
        <td style=" background:url(style/images/jiao2.gif) top left no-repeat;"></td>
    </tr>-->
</table>
</div>