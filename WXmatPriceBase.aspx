<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WXmatPriceBase.aspx.cs" Inherits="JDJS.Web.WXmatPriceBase" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1"/>

    <title></title>
     <link rel="Stylesheet" href="style/datePicker.css" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
    <script type="text/javascript" src="js/hoverIntent.js"></script>
   
    <script type="text/javascript" src="js/jquery.core.js"></script>
    <script type="text/javascript" src="js/jquery.datePicker.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".date-pick").datepicker({ changeMonth: true, changeYear: true });
        });
    </script>
     
</head>

<body class="bodys">
<style>
.wrap{margin:0 auto;}
.bodys {text-align:center;}
.fontstl3{ font-size: x-large; font-weight:300;  color:Red}
.fontstl4{ font-weight:300;  color:blue}
</style>
    <form id="form1" runat="server">
    <div>
             <div class="fontstl3"><span>“建定工程”微信服务号 建材供应商报价查询(上海地区)</span></div>
            
            <br/>
    
        <table class="wrap">
            <tr>
                <td align="left">
                   查询优先级: <asp:DropDownList ID="ddlOrder" runat="server">
                        <asp:ListItem Value="2">材料名</asp:ListItem>
                        <asp:ListItem Value="1">公司名</asp:ListItem>
                        <asp:ListItem Value="3">规格型号</asp:ListItem>
                        <asp:ListItem Value="4">品牌</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;<asp:Button ID="btnSeach" runat="server" Text="点击搜索" onclick="btnSeach_Click"/>
                </td>
               </tr>
            <tr>
               
                 <td align="left">
                    查询关键字:<asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                </td>
             </tr>  
             
               <tr>
           
                <td align="left">发布日期:  <asp:TextBox ID="txtBg" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>&nbsp;—
                <asp:TextBox ID="txtEnd" runat="server" Width="70px" CssClass="date-pick"></asp:TextBox>
                </td>
                
                         
            <!--<td class="style3"><a href="Registration.aspx"><span class="style4">点此注册</span></a><span id="Span2" class="style5">☜</span></td>-->
            </tr>
          
        
        
        </table>
        
   <br/>
       <table style="border-collapse:collapse; color:#003399; text-align:center;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc" class="wrap">
                 

                    <tr style=" background:#003399; color:#ffffff; font-weight:bold;">     
                       
                                <td style=" width:30%">
                                <span><b>材料名称</b></span></td>
                                 <td style=" width:30%">
                                    <span><b>型号规格</b></span></td>
                                     <td style=" width:10%">
                                    <span><b>报价</b></span></td>
                                    <td style=" width:30%">
                               
                                    <span><b>供应商</b></span></td>
                              
                                
                               
                        
                    </tr>
                    
                    
                    <asp:Repeater ID="RepInfo" runat="server">
                        <ItemTemplate>
                            <tr class="dataTableBody">
                                
                                <td style="padding-top:10px; padding-bottom:10px;">
                                   <a href="WXmatPriceDetail.aspx?Id=<%#Eval("id") %>"><%#LTP.Common.StringPlus.StrCut(Eval("zname").ToString(), 82, "...")%></a>
                                </td>
                                
                                <td style="padding-top:10px; padding-bottom:10px;">
                                     [<%#Eval("standard")%>]
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                     <%#NewStr(Eval("id").ToString())%>
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                   <a href="WXmatCompanyDetail.aspx?Id=<%#Eval("cid") %>"><%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(), 82, "...")%></a>
                                </td>
                              
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                                
                 <tr>
                    <td colspan="4" align="center">
                     <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
     
    </div>
    </form>
</body>
</html>
