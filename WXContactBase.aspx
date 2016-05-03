<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WXContactBase.aspx.cs" Inherits="JDJS.Web.WXContactBase" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/WXlogin.ascx" TagName="WXlogin" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title></title>
    <script type="text/javascript">
        function checkfocus(num) {
            if (num == 1) document.getElementById("Imagelogin").focus();
            else if (num == 2) document.getElementById("btnSeach").focus();
            //else if (num == 3) document.getElementById("Button3").focus();
        }
        function keyDown(typ) {
            var e = event.srcElement;
            if (event.keyCode == 13) {
                if (typ == 1) document.getElementById("Imagelogin").focus();
                else if (typ == 2) document.getElementById("btnSeach").focus();
                //document.getElementById("Button1").click();  
            }
        }  
        
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
     <uc1:WXlogin id="login" runat="server"></uc1:WXlogin>
            <div class="fontstl3"><span>“建定工程”微信服务号 建筑、建设工程行业人脉</span>库</div>
            <div class="fontstl4"><span>可在页面顶部使用“建定通”帐号登录查看从业人员及公司详细信息</span></div>
            <br/>
    
        <table class="wrap">
            <tr>
               
                <td align="left">
                    人员姓名：<asp:TextBox ID="linkmantxt" runat="server" onmousedown="checkfocus(2)"  onkeydown="keyDown(2)"></asp:TextBox>
                    <asp:Button ID="btnSeach" runat="server" Text="点击搜索" onclick="btnSeach_Click"/>
                    </td>
              
             </tr>  
             <tr>
                <td align="left">
                    所属公司：<asp:TextBox ID="companytxt" runat="server" onmousedown="checkfocus(2)" onkeydown="keyDown(2)"></asp:TextBox>
                </td>
               </tr>
               <tr>
                    <td align="left">
                    部门职务：<asp:TextBox ID="partjob" runat="server" onmousedown="checkfocus(2)"  onkeydown="keyDown(2)"></asp:TextBox>
                    </td>
                <!--<td>所在省市 <asp:DropDownList ID="ddlClass1" runat="server"  >
                 <asp:ListItem Selected="True" Value="全部地区">全部地区</asp:ListItem>
                        <asp:ListItem>上海</asp:ListItem>
                        <asp:ListItem>江苏</asp:ListItem>
                        <asp:ListItem>浙江</asp:ListItem>
                       
                    </asp:DropDownList>
                      
                </td>-->
                
                         
            <!--<td class="style3"><a href="Registration.aspx"><span class="style4">点此注册</span></a><span id="Span2" class="style5">☜</span></td>-->
            </tr>
          
        
        
        </table>
        
   <br/>
       <table style="border-collapse:collapse; color:#003399; text-align:center;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc" class="wrap">
                 

                    <tr style=" background:#003399; color:#ffffff; font-weight:bold;">     
                       
                                <td style=" width:20%">
                                <span><b>人员姓名</b></span></td>
                                    <td style=" width:60%">
                               
                                    <span><b>所属公司</b></span></td>
                              
                                
                                <td style=" width:20%">
                                    <span><b>部门职务</b></span></td>
                        
                    </tr>
                    
                    
                    <asp:Repeater ID="RepInfo" runat="server">
                        <ItemTemplate>
                            <tr class="dataTableBody">
                    
                                <td style="padding-top:10px; padding-bottom:10px;">
                                   <a href="WXContactinfo.aspx?Id=<%#Eval("id") %>"><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 32, "...")%></a>
                                </td>
                                
                                <td style="padding-top:10px; padding-bottom:10px;">
                                     <a href="WXcompany.aspx?id=<%#Eval("cid") %>"><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%></a>
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    [<%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 32, "...")%>]
                                </td>
                              
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                                
                 <tr>
                    <td colspan="3" align="center">
                     <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
     
    </div>

   
    </form>
</body>
</html>
