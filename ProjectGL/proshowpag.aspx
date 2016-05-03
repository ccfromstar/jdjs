<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="proshowpag.aspx.cs" Inherits="JDJS.Web.ProjectGL.proshowpag" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="style/base.css" rel="Stylesheet" type="text/css" />
    <link href="style/layout.css" rel="Stylesheet" type="text/css" />
    <link href="style/model.css" rel="Stylesheet" type="text/css" />
     <link rel="Stylesheet" href="../style/datePicker.css" type="text/css" />
    <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="js/onload.js" type="text/javascript"></script>
            <script type="text/javascript" src="../js/jquery.core.js"></script>
    <script type="text/javascript" src="../js/jquery.datePicker.js"></script>
    <script type="text/javascript">
        jQuery(function () {
            $(".date-pick").datepicker({ changeMonth: true, changeYear: true });
        }); 
</script>
    <style type="text/css">
        .style1
        {
            height: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="工程ID："></asp:Label>
        <asp:Label ID="LabelID" runat="server" Text="Label"></asp:Label>
         <div class="detailtitle"><asp:Label ID="lbTitle" runat="server" ></asp:Label></div>
         <div class="detailtime"><asp:Label ID="lbTime" runat="server"></asp:Label></div>
        <table style="width: 100%;">
                    <tr>
                        <td width=20%>
                            工程类型：
                        </td>
                        <td>
                            <asp:Label ID="lbType" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            工程状态：
                        </td>
                        <td class="style1">
                            <asp:Label ID="lbstate" runat="server" Font-Bold="True" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            工程地区：
                        </td>
                        <td>
                           <asp:Label ID="lbplace" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            施工地址：
                        </td>
                        <td class="style1">
                           <asp:Label ID="lbaddress" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            开工日期：
                        </td>
                        <td>
                            <asp:Label ID="lbstime" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            竣工日期：
                        </td>
                        <td>
                            <asp:Label ID="lbftime" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                           投资规模(万元)：
                        </td>
                        <td class="style1">
                           <asp:Label ID="lbmoney" runat="server" ></asp:Label>
                        </td>
                    </tr>
                     <tr>
                         <td class="style1">
                             工程描述： 
                         </td>
                         <td class="style1">
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
                        <td>
                            <asp:Label ID="ownertext" runat="server" Font-Bold="True">业主/开发商：</asp:Label>
                        </td>
                        <td class="prolink">
                              <asp:Label ID="lbowner" runat="server" Visible="False"></asp:Label>
                              <asp:Repeater ID="Repproowner" runat="server">
                                  <ItemTemplate>
                                      <tr class="dataTableBody">
                                          <tr>
                                              <td style="">
                                                  <%#LTP.Common.StringPlus.StrCut(Eval("juese").ToString(), 82, "...")%>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td style="">
                                                  <%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td style="">
                                                  联系人：<%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 82, "...")%></td>
                                              <td style="">
                                                  <%#LTP.Common.StringPlus.StrCut(Eval("chenghu").ToString(), 82, "...")%>
                                              </td>
                                              <td style="">
                                                  <%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 82, "...")%>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td style="">
                                                  <%#LTP.Common.StringPlus.StrCut(Eval("phone").ToString(), 82, "...")%>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td style="">
                                                  <%#LTP.Common.StringPlus.StrCut(Eval("fax").ToString(), 82, "...")%>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td style="">
                                                  <%#LTP.Common.StringPlus.StrCut(Eval("email").ToString(), 82, "...")%>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td style="">
                                                  <%#LTP.Common.StringPlus.StrCut(Eval("address").ToString(), 82, "...")%>
                                              </td>
                                          </tr>
                                          <td>
                                              <a class="zPushBtn" 
                                                  href='promatshow.aspx?proid=<%#Eval("proid") %>&amp;pepid=<%#Eval("pepid") %>'>
                                              <img src="style/Icons/icon003a3.gif" width="20" height="20" />
                                              <b>查看详情&nbsp;</b></a></td>
                                      </tr>
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
                        <td>
                            <asp:Label ID="designertext" runat="server" Font-Bold="True">建筑师/设计院：</asp:Label>
                        </td>
                        <td class="prolink">
                            <asp:Label ID="lbdesigner" runat="server" Visible="False"></asp:Label>
                        <asp:Repeater ID="Repprodesigner" runat="server">
                                  <ItemTemplate>
                                        <tr class="dataTableBody">
                                           <tr>
                                            <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("juese").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr>
                                            <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr>
                                            <td style="">联系人：<%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 82, "...")%></td>
                                            <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("chenghu").ToString(), 82, "...")%></td>
                                            <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr>
                                            <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("phone").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr>
                                            <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("fax").ToString(), 82, "...")%></td>              
                                           </tr>
                                           <tr>
                                           <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("email").ToString(), 82, "...")%></td>
                                           </tr>
                                           <tr>
                                           <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("address").ToString(), 82, "...")%></td>
                                           </tr>
                               
                                           
                                        <td>                       
                                             <a href="promatshow.aspx?proid=<%#Eval("proid") %>&pepid=<%#Eval("pepid") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>查看详情&nbsp;</b></a></td>
                                        </tr>
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
                        <td class="style4">
                            <asp:Label ID="buildertext" runat="server" Font-Bold="True">承建商：</asp:Label>
                        </td>
                        <td class="prolink">
                            <asp:Label ID="lbbuilder" runat="server" Visible="False"></asp:Label>
                        <asp:Repeater ID="Repprobuilder" runat="server">
                                  <ItemTemplate>
                                        <tr class="dataTableBody">
                                           <tr>
                                            <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("juese").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr>
                                            <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr>
                                            <td style="">联系人：<%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 82, "...")%></td>
                                            <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("chenghu").ToString(), 82, "...")%></td>
                                            <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr>
                                            <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("phone").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr>
                                            <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("fax").ToString(), 82, "...")%></td>              
                                           </tr>
                                           <tr>
                                           <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("email").ToString(), 82, "...")%></td>
                                           </tr>
                                           <tr>
                                           <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("address").ToString(), 82, "...")%></td>
                                           </tr>
                               
                                           
                                        <td>                       
                                             <a href="promatshow.aspx?proid=<%#Eval("proid") %>&pepid=<%#Eval("pepid") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>查看详情&nbsp;</b></a></td>
                                        </tr>
                                    </ItemTemplate>
                              </asp:Repeater>
                            </td>
                    </tr>
                  
                    
                </table>
    </asp:Panel>
    </form>
</body>
</html>
