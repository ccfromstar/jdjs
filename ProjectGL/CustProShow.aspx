<%@ Page Title="" Language="C#" MasterPageFile="~/ProjectGL/ProMaster.Master" AutoEventWireup="true" CodeBehind="CustProShow.aspx.cs" Inherits="JDJS.Web.ProjectGL.CustProShow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <title></title>
    <link href="../style/page.css" type="text/css" rel="stylesheet" />
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


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div style="width:88%; padding-top:0px; float:right;" class="left_Bg">
  <asp:Panel ID="Panel1" runat="server" class="trc2">
 
        <table style="width: 100%;" class="trc2">
                    <tr style=" text-align:center">
                        <td colspan="2">
                            <asp:Label ID="Label1" runat="server" Text="工程ID："></asp:Label>
                            <asp:Label ID="LabelID" runat="server" Text="Label"></asp:Label>
                            <div class="Protitle"><asp:Label ID="lbTitle" runat="server" ></asp:Label></div>
                            <div style="font-weight:bolder;"><asp:Label ID="lbTime" runat="server"></asp:Label></div>
                        </td>
                    </tr>
                    <tr class="trc1">
                        <td width=20% style=" text-align:center;font-weight:bolder">
                            工程类型：
                        </td>
                        <td>
                            <asp:Label ID="lbType" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style=" text-align:center;font-weight:bolder" >
                            工程状态：
                        </td>
                        <td class="style1">
                            <asp:Label ID="lbstate" runat="server" Font-Bold="True" ></asp:Label>
                        </td>
                    </tr>
                    <tr class="trc1">
                        <td style=" text-align:center;font-weight:bolder">
                            工程地区：
                        </td>
                        <td>
                           <asp:Label ID="lbplace" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style=" text-align:center;font-weight:bolder">
                            施工地址：
                        </td>
                        <td class="style1">
                           <asp:Label ID="lbaddress" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr class="trc1">
                        <td style=" text-align:center;font-weight:bolder">
                            开工日期：
                        </td>
                        <td>
                            <asp:Label ID="lbstime" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style=" text-align:center;font-weight:bolder">
                            竣工日期：
                        </td>
                        <td>
                            <asp:Label ID="lbftime" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr class="trc1">
                        <td style=" text-align:center;font-weight:bolder">
                           投资规模(万元)：
                        </td>
                        <td class="style1">
                           <asp:Label ID="lbmoney" runat="server" ></asp:Label>
                        </td>
                    </tr>
                     <tr>
                         <td style=" text-align:center; font-weight:bolder">
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
                        <td align="center" class="tdbr">
                            <asp:Label ID="ownertext" runat="server" Font-Bold="True">业主/开发商：</asp:Label>
                        </td>
                        <td class="prolink">
                              <asp:Label ID="lbowner" runat="server" Visible="False"></asp:Label>

                              <asp:Repeater ID="Repproowner" runat="server">
                                  <ItemTemplate>
                                      <table  style="width:100%;" class="tableb">
                                          <tr class="trc1">
                                              <td style="">
                                                  工程角色：<%#LTP.Common.StringPlus.StrCut(Eval("juese").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc2">
                                              <td style="">
                                                  <a href="Companyinfo.aspx?id=<%#Eval("cid") %>" title="点击查看该公司详细信息"><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 200, "...")%></a>  
                                                  
                                              </td>
                                          </tr>

                                          <tr class="trc1" >
                                              <td style="">
                                              联系人：<a href="Contactinfo.aspx?Id=<%#Eval("pepid")%>" title="点击查看该员工详细信息"><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 10, "...")%></a>--<%#LTP.Common.StringPlus.StrCut(Eval("chenghu").ToString(), 82, "...")%>--
<%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 82, "...")%>
                                              
                                              </td>
                                          </tr>
                                          
                                          <tr class="trc2">
                                              <td style="">
                                                  电话/手机：<%#LTP.Common.StringPlus.StrCut(Eval("phone").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc1">
                                              <td style="">
                                                 传真：<%#LTP.Common.StringPlus.StrCut(Eval("fax").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc2">
                                              <td style="">
                                                  邮箱：<%#LTP.Common.StringPlus.StrCut(Eval("email").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc1">
                                              <td style="">
                                                  地址：<%#LTP.Common.StringPlus.StrCut(Eval("address").ToString(), 200, "...")%></td>
                                          </tr>
                                          <tr>
                                          <td>
                                              <a class="zPushBtn" 
                                                  href='CustProMat.aspx?proid=<%#Eval("proid") %>&amp;pepid=<%#Eval("pepid") %>'>
                                              <img src="style/Icons/icon003a3.gif" width="20" height="20" />
                                              <b>查看详情&nbsp;</b></a></td>
                                           </tr>
                                           <tr style=" height:20px"><td></td></tr>
                                      </table>
                                  </ItemTemplate>
                              </asp:Repeater>
                            </td>
                    </tr>
                   <tr>
                       <td align="center" class="tdbr">
                           <asp:Label ID="designertext" runat="server" Font-Bold="True">建筑师/设计院：</asp:Label>
                       </td>
                       <td class="prolink">
                           <asp:Label ID="lbdesigner" runat="server" Visible="False"></asp:Label>
                           <asp:Repeater ID="Repprodesigner" runat="server">
                               <ItemTemplate>
                                    <table  style="width:100%;" class="tableb">
                                          <tr class="trc1">
                                              <td style="">
                                                  工程角色：<%#LTP.Common.StringPlus.StrCut(Eval("juese").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc2">
                                              <td style="">
                                                  <a href="Companyinfo.aspx?id=<%#Eval("cid") %>" title="点击查看该公司详细信息"><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 200, "...")%></a>  
                                                  
                                              </td>
                                          </tr>
                                          <tr class="trc1" >
                                             <td>联系人：<a href="Contactinfo.aspx?Id=<%#Eval("pepid")%>" title="点击查看该员工详细信息" style=" width:15%"><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 10, "...")%></a>--<%#LTP.Common.StringPlus.StrCut(Eval("chenghu").ToString(), 82, "...")%>--<%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc2">
                                              <td style="">
                                                  电话/手机：<%#LTP.Common.StringPlus.StrCut(Eval("phone").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc1">
                                              <td style="">
                                                 传真：<%#LTP.Common.StringPlus.StrCut(Eval("fax").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc2">
                                              <td style="">
                                                  邮箱：<%#LTP.Common.StringPlus.StrCut(Eval("email").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc1">
                                              <td style="">
                                                  地址：<%#LTP.Common.StringPlus.StrCut(Eval("address").ToString(), 200, "...")%></td>
                                          </tr>
                                          <tr>
                                          <td>
                                              <a class="zPushBtn" 
                                                  href='CustProMat.aspx?proid=<%#Eval("proid") %>&amp;pepid=<%#Eval("pepid") %>'>
                                              <img src="style/Icons/icon003a3.gif" width="20" height="20" />
                                              <b>查看详情&nbsp;</b></a></td>
                                           </tr>
                                           <tr style=" height:20px"><td></td></tr>
                                      </table>
                               </ItemTemplate>
                           </asp:Repeater>
                       </td>
                    </tr>
                    <tr>
                        <td align="center" class="tdbr">
                            <asp:Label ID="buildertext" runat="server" Font-Bold="True">承建商：</asp:Label>
                        </td>
                        <td class="prolink">
                            <asp:Label ID="lbbuilder" runat="server" Visible="False"></asp:Label>
                        <asp:Repeater ID="Repprobuilder" runat="server">
                                  <ItemTemplate>
                                       <table  style="width:100%;" class="tableb">
                                          <tr class="trc1">
                                              <td style="">
                                                  工程角色：<%#LTP.Common.StringPlus.StrCut(Eval("juese").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc2">
                                              <td style="">
                                                  <a href="Companyinfo.aspx?id=<%#Eval("cid") %>" title="点击查看该公司详细信息"><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 200, "...")%></a>  
                                                  
                                              </td>
                                          </tr>
                                          <tr class="trc1" >
                                             <td>联系人：<a href="Contactinfo.aspx?Id=<%#Eval("pepid")%>" title="点击查看该员工详细信息" style=" width:15%"><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 10, "...")%></a>--<%#LTP.Common.StringPlus.StrCut(Eval("chenghu").ToString(), 82, "...")%>--<%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc2">
                                              <td style="">
                                                  电话/手机：<%#LTP.Common.StringPlus.StrCut(Eval("phone").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc1">
                                              <td style="">
                                                 传真：<%#LTP.Common.StringPlus.StrCut(Eval("fax").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc2">
                                              <td style="">
                                                  邮箱：<%#LTP.Common.StringPlus.StrCut(Eval("email").ToString(), 82, "...")%></td>
                                          </tr>
                                          <tr class="trc1">
                                              <td style="">
                                                  地址：<%#LTP.Common.StringPlus.StrCut(Eval("address").ToString(), 200, "...")%></td>
                                          </tr>
                                          <tr>
                                          <td>
                                              <a class="zPushBtn" 
                                                  href='CustProMat.aspx?proid=<%#Eval("proid") %>&amp;pepid=<%#Eval("pepid") %>'>
                                              <img src="style/Icons/icon003a3.gif" width="20" height="20" />
                                              <b>查看详情&nbsp;</b></a></td>
                                           </tr>
                                           <tr style=" height:20px"><td></td></tr>
                                      </table>
                                    </ItemTemplate>
                              </asp:Repeater>
                            </td>
                    </tr>
                  
                    
                </table>
    </asp:Panel>
    </div>
</asp:Content>
