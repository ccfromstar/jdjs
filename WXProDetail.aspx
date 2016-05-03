<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WXProDetail.aspx.cs" Inherits="JDJS.Web.WXProDetail" %>
<%@ Register Src="~/Controls/WXlogin.ascx" TagName="WXlogin" TagPrefix="uc1" %>
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
    <uc1:WXlogin id="login" runat="server"></uc1:WXlogin>
                <div class="fontstl3"><asp:Label ID="lbTitle" runat="server" ></asp:Label></div>
            <div><asp:Label ID="lbTime" runat="server"></asp:Label></div>
            <div>
            
                <table class="wrap" style="text-align:left;"  border="1">
                    <tr>
                        <td width="30%" align="center">
                            工程类型：
                        </td>
                        <td>
                            <asp:Label ID="lbType" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            工程状态：
                        </td>
                        <td>
                            <asp:Label ID="lbstate" runat="server" Font-Bold="True" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            工程地区：
                        </td>
                        <td>
                           <asp:Label ID="lbplace" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            施工地址：
                        </td>
                        <td>
                           <asp:Label ID="lbaddress" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            开工日期：
                        </td>
                        <td>
                            <asp:Label ID="lbstime" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            竣工日期：
                        </td>
                        <td>
                            <asp:Label ID="lbftime" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                           投资规模(万元)：
                        </td>
                        <td>
                           <asp:Label ID="lbmoney" runat="server" ></asp:Label>
                        </td>
                    </tr>
                     <tr>
                         <td align="center">
                             工程描述： 
                         </td>
                         <td>
                             <asp:Label ID="lbRemark" runat="server"></asp:Label>
                         </td>
                    </tr>
                     <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td  align="center">
                            <asp:Label ID="ownertext" runat="server" Font-Bold="True">业主/开发商：</asp:Label>
                        </td>
                        <td class="prolink">
                            <asp:Label ID="lbowner" runat="server" ></asp:Label>
                        
                            <asp:Repeater ID="Repproowner" runat="server" Visible="false">
                                  <ItemTemplate>
                                        <table  style="width:100%;margin:0 auto;">
                                          <tr style="width:100%; color:Blue">
                                            <td colspan="2"><%#LTP.Common.StringPlus.StrCut(Eval("juese").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr style="width:100%">
                                            <td colspan="2">
                                             <a href="WXcompany.aspx?id=<%#Eval("cid") %>"><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%></a>
                                            </td>
                                            </tr>
                                            <tr style="width:100%">
                                             <td colspan="2">
                                            <span>联系人：<a href="WXContactinfo.aspx?id=<%#Eval("pepid") %>"><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 32, "...")%></a>&nbsp;&nbsp;</span><span><%#LTP.Common.StringPlus.StrCut(Eval("chenghu").ToString(), 20, "...")%>&nbsp;&nbsp;&nbsp;&nbsp;</span><span><%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 40, "...")%></span></tr>
                                            </td>
                                            </tr>
                                            <tr style="width:100%">
                                            <td colspan="2">电话：<%#LTP.Common.StringPlus.StrCut(Eval("phone").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr style="width:100%">
                                            <td colspan="2">传真：<%#LTP.Common.StringPlus.StrCut(Eval("fax").ToString(), 82, "...")%></td>              
                                           </tr>
                                           <tr style="width:100%">
                                           <td colspan="2">Email：<%#LTP.Common.StringPlus.StrCut(Eval("email").ToString(), 82, "...")%></td>
                                           </tr>
                                           <tr style="width:100%">
                                           <td colspan="2">地址：<%#LTP.Common.StringPlus.StrCut(Eval("address").ToString(), 82, "...")%></td>
                                           </tr>
                                           <tr style="width:100%; height:30px"><td></td></tr>
                                           </table>
                                    </ItemTemplate>
                              </asp:Repeater>
                             
                              </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            &nbsp;</td>
                        <td class="style1">
                        </td>
                    </tr>
                    <tr>
                        <td  align="center">
                            <asp:Label ID="designertext" runat="server" Font-Bold="True">建筑师/设计院：</asp:Label>
                        </td>
                        <td class="prolink">
                            <asp:Label ID="lbdesigner" runat="server" ></asp:Label>
                       
                            <asp:Repeater ID="Repprodesigner" runat="server" Visible="false">
                                  <ItemTemplate>
                                      <table  style="width:100%;margin:0 auto;">
                                           <tr style="width:100%; color:Blue">
                                            <td colspan="2"><%#LTP.Common.StringPlus.StrCut(Eval("juese").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr style="width:100%">
                                            <td colspan="2">
                                             <a href="WXcompany.aspx?id=<%#Eval("cid") %>"><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%></a>
                                            </td>
                                            </tr>
                                            <tr style="width:100%">
                                             <td colspan="2">
                                            <span>联系人：<a href="WXContactinfo.aspx?id=<%#Eval("pepid") %>"><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 32, "...")%></a>&nbsp;&nbsp;</span><span><%#LTP.Common.StringPlus.StrCut(Eval("chenghu").ToString(), 20, "...")%>&nbsp;&nbsp;&nbsp;&nbsp;</span><span><%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 40, "...")%></span></tr>
                                            </td>
                                            </tr>
                                            </tr>
                                            <tr style="width:100%">
                                            <td colspan="2">电话：<%#LTP.Common.StringPlus.StrCut(Eval("phone").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr style="width:100%">
                                            <td colspan="2">传真：<%#LTP.Common.StringPlus.StrCut(Eval("fax").ToString(), 82, "...")%></td>              
                                           </tr>
                                           <tr style="width:100%">
                                           <td colspan="2">Email：<%#LTP.Common.StringPlus.StrCut(Eval("email").ToString(), 82, "...")%></td>
                                           </tr>
                                           <tr style="width:100%">
                                           <td colspan="2">地址：<%#LTP.Common.StringPlus.StrCut(Eval("address").ToString(), 82, "...")%></td>
                                           </tr>
                                           <tr style="width:100%; height:30px"><td></td></tr>
                                           </table>
                                    </ItemTemplate>
                              </asp:Repeater>
                            
                            </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td  align="center">
                            <asp:Label ID="buildertext" runat="server" Font-Bold="True">承建商：</asp:Label>
                        </td>
                        <td class="prolink">
                            <asp:Label ID="lbbuilder" runat="server" ></asp:Label>
                            
                             <asp:Repeater ID="Repprobuilder" runat="server" Visible="false">
                                  <ItemTemplate>
                                       <table  style="width:100%;margin:0 auto;"> 
                                           <tr style="width:100%; color:Blue">
                                            <td colspan="2"><%#LTP.Common.StringPlus.StrCut(Eval("juese").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr style="width:100%">
                                            <td colspan="2">
                                             <a href="WXcompany.aspx?id=<%#Eval("cid") %>"><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%></a>
                                            </td>
                                            </tr>
                                            <tr style="width:100%">
                                             <td colspan="2">
                                            <span>联系人：<a href="WXContactinfo.aspx?id=<%#Eval("pepid") %>"><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 32, "...")%></a>&nbsp;&nbsp;</span><span><%#LTP.Common.StringPlus.StrCut(Eval("chenghu").ToString(), 20, "...")%>&nbsp;&nbsp;&nbsp;&nbsp;</span><span><%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 40, "...")%></span></tr>
                                            </td>
                                            </tr>
                                            <tr style="width:100%">
                                            <td colspan="2">电话：<%#LTP.Common.StringPlus.StrCut(Eval("phone").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr style="width:100%">
                                            <td colspan="2">传真：<%#LTP.Common.StringPlus.StrCut(Eval("fax").ToString(), 82, "...")%></td>              
                                           </tr>
                                           <tr style="width:100%">
                                           <td colspan="2">Email：<%#LTP.Common.StringPlus.StrCut(Eval("email").ToString(), 82, "...")%></td>
                                           </tr>
                                           <tr style="width:100%">
                                           <td colspan="2">地址：<%#LTP.Common.StringPlus.StrCut(Eval("address").ToString(), 82, "...")%></td>
                                           </tr>
                                           <tr style="width:100%; height:30px"><td></td></tr>
                                      </table>
                                    </ItemTemplate>
                              </asp:Repeater>
                           
                           </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="style3">
                           
                            <asp:Label ID="lbOther1" runat="server" Font-Bold="True" Font-Size="Medium" 
                                ForeColor="Blue" Visible="false">欲知项目参与人详情请使用“建定通”帐号登录或致电建定客服：021-54591008 转 8009 叶小姐</asp:Label></td>
                    </tr>
                    </table>
    </div>
    </div>
    </form>
</body>
</html>
