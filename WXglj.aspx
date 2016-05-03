<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WXglj.aspx.cs" Inherits="JDJS.Web.WXglj" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title></title>
</head>
<body class="bodys">
<style>
.wrap{margin:0 auto;}
.bodys {text-align:center;}
.fontstl3{ font-size:x-large; font-weight:300;  color:Red}
</style>
    <form id="form1" runat="server">
    <div>
            <div class="fontstl3"><span>“建定工程”微信服务号 工料机价格查询(上海地区)</span></div>
            <br/>
            <table class="wrap">
                <tr>                   
                    
                    <td >
                        名称\规格 <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                    </td>
                    <td style="padding-left:10px;" align="center">
                        <asp:Button ID="Button1" runat="server" Text="点击搜索"  OnClick="LinkButton2_Click"/>
                     </td>       
                </tr>
            </table>
            <br/>
            <table style="border-collapse:collapse; color:#003399; text-align:center;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc" class="wrap">
                 

                    <tr style=" background:#003399; color:#ffffff; font-weight:bold;">     
                       
                                <td style=" width:40%">
                                <span><b>名称\规格</b></span></td>
                                    <td style=" width:20%">
                               
                                    <span><b>计量单位</b></span></td>
                              <td style=" width:20%">
                                    <span><b>价格</b></span></td>
                                
                                <td style=" width:20%">
                                    <span><b>发布年月</b></span></td>
                        
                    </tr>
                    
                    
                    <asp:Repeater ID="Repmatlist" runat="server">
                        <ItemTemplate>
                            <tr class="dataTableBody">
                                
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("ysname").ToString(), 82, "...")%>
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("ysunit").ToString(), 20, "...")%>
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("price").ToString(), 32, "...")%>
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("ptime").ToString(), 20, "...")%>
                                </td>
                              
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                                
                 <tr>
                    <td colspan="4" align="center">
                    <uc1:UcfarPager ID="UcfarPager6" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>

    </div>
    <br/>
    <div><span>本功能已涵盖“建筑、安装”，“市政、公路”，“园林专用”，“供水专用”，“燃气专用”，“民防专用”等所有适用领域，输入具体建材或费率的“名称/规格”即可查询</span></div>
    </form>
</body>
</html>
