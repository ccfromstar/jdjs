<%@ Page Title="工程信息网 热线电话：021-54591008 021-64281662 客服专用QQ ：[1621734271] 上海工程信息网 免费注册试用 建设工程信息 建筑工程项目信息 工程建设信息 工程建设项目信息" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ProjectInforDetail.aspx.cs" Inherits="JDJS.Web.ProjectInforDetail" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .style1
        {
            height: 22px;
        }
        .style2
        {
            font-size: medium;
            font-weight: bold;
        }
        .style3
        {
            height: 27px;
        }
        .style4
        {
            height: 22px;
        }
        .stylelink
        {
            font-weight: bold;Font-Size:12pt; text-decoration: underline; color:Blue;
         }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">
    <img alt="" src="style/images/Project-tl.gif" />
    <div class="SubCenter">
       <asp:Image ID="ImgBg" runat="server" /><div class="subbody">
            <div class="detailtitle"><asp:Label ID="lbTitle" runat="server" ></asp:Label></div>
            <div class="detailtime"><asp:Label ID="lbTime" runat="server"></asp:Label></div>
            <div class="detailbody">
            <asp:Panel ID="Plinvite" runat="server" Visible="False">
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
                        <td>
                            工程状态：
                        </td>
                        <td>
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
                        <td>
                            施工地址：
                        </td>
                        <td>
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
                        <td>
                           投资规模(万元)：
                        </td>
                        <td>
                           <asp:Label ID="lbmoney" runat="server" ></asp:Label>
                        </td>
                    </tr>
                     <tr>
                         <td>
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
                        <td>
                            <asp:Label ID="ownertext" runat="server" Font-Bold="True">业主/开发商：</asp:Label>
                        </td>
                        <td class="prolink">
                            <asp:Label ID="lbowner" runat="server" ></asp:Label>
                        </td>
                        <div class="ProRep">    
                            <asp:Repeater ID="Repproowner" runat="server" Visible="false">
                                  <ItemTemplate>
                                       
                                          <tr style="width:100%; color:Blue">
                                            <td colspan="2"><%#LTP.Common.StringPlus.StrCut(Eval("juese").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr style="width:100%">
                                            <td colspan="2"><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr style="width:100%">
                                             <td colspan="2">
                                            <span>联系人：<%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 20, "...")%>&nbsp;&nbsp;</span><span><%#LTP.Common.StringPlus.StrCut(Eval("chenghu").ToString(), 20, "...")%>&nbsp;&nbsp;&nbsp;&nbsp;</span><span><%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 40, "...")%></span></tr>
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
                                    </ItemTemplate>
                              </asp:Repeater>
                              </div>
                              
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
                            <asp:Label ID="lbdesigner" runat="server" ></asp:Label>
                            
                        </td>
                        <div class="ProRep">  
                            <asp:Repeater ID="Repprodesigner" runat="server" Visible="false">
                                  <ItemTemplate>
                                      
                                           <tr style="width:100%; color:Blue">
                                            <td colspan="2"><%#LTP.Common.StringPlus.StrCut(Eval("juese").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr style="width:100%">
                                            <td colspan="2"><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr style="width:100%">
                                             <td colspan="2">
                                            <span>联系人：<%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 20, "...")%>&nbsp;&nbsp;</span><span><%#LTP.Common.StringPlus.StrCut(Eval("chenghu").ToString(), 20, "...")%>&nbsp;&nbsp;&nbsp;&nbsp;</span><span><%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 40, "...")%></span></tr>
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
                                    </ItemTemplate>
                              </asp:Repeater>
                            </div>
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
                            <asp:Label ID="lbbuilder" runat="server" ></asp:Label>
                            </td>
                            <div class="ProRep">
                             <asp:Repeater ID="Repprobuilder" runat="server" Visible="false">
                                  <ItemTemplate>
                                        
                                           <tr style="width:100%; color:Blue">
                                            <td colspan="2"><%#LTP.Common.StringPlus.StrCut(Eval("juese").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr style="width:100%">
                                            <td colspan="2"><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%></td>
                                            </tr>
                                            <tr style="width:100%">
                                             <td colspan="2">
                                            <span>联系人：<%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 20, "...")%>&nbsp;&nbsp;</span><span><%#LTP.Common.StringPlus.StrCut(Eval("chenghu").ToString(), 20, "...")%>&nbsp;&nbsp;&nbsp;&nbsp;</span><span><%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 40, "...")%></span></tr>
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
                                   
                                    </ItemTemplate>
                              </asp:Repeater>
                           </div>
                    </tr>
                    <tr>
                        <td colspan="2" class="style3">
                            <asp:Label ID="lbOther" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                    <td class="style4"></td>
                    <td>
                        <asp:HyperLink ID="freepro" runat="server" Font-Bold="True" 
                            Font-Overline="False" Font-Size="12pt" Font-Underline="True" 
                            ForeColor="Red" NavigateUrl="~/FreeProjectinfor.aspx" Target="_self">[免费试看项目]</asp:HyperLink>
                        &nbsp;
                        <a href="javascript:history.back(-1)" class="stylelink">[返回上页]</a>
                        &nbsp;<a href="ProjectInforBase.aspx?Part=3" class="stylelink">[查看更多项目]</a></td>
                    </tr>
                    <tr>
                    <td colspan="2"></td>
                    </tr>
                     <tr>
                        <td colspan="2" align="center" class="style2">
                            <asp:Button ID="btnSeach" runat="server" Height="30px" onclick="btnSeach_Click" 
                                Text="点击免费查询工程相关企业信息及人脉列表" Width="360px" Font-Bold="True" 
                                Font-Size="Medium" ForeColor="Red" />
                            <br />
                            </td>
                    </tr>
                </table>
                </asp:Panel>
                <asp:Panel ID="Plresult" runat="server" Visible="False">
                <table style="width: 100%;">
                    <tr>
                        <td width="20%">
                            中标类型：
                        </td>
                        <td>
                            <asp:Label ID="lbZbType" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           招标单位：
                        </td>
                        <td>
                            <asp:Label ID="lbZbCp" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            中标价(万元)：
                        </td>
                        <td>
                           <asp:Label ID="lbZbPrice" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            工程名称：
                        </td>
                        <td>
                           <asp:Label ID="lbZbTitle" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            建设地点：
                        </td>
                        <td>
                            <asp:Label ID="lbZbAdd" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           中标单位：
                        </td>
                        <td>
                            <asp:Label ID="lbZbzbCp" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           建筑面积(平方米)：
                        </td>
                        <td>
                           <asp:Label ID="lbZbArea" runat="server" ></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td>
                           中标日期：
                        </td>
                        <td>
                           <asp:Label ID="lbZbTime" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           工期：
                        </td>
                        <td>
                            <asp:Label ID="lbZbGTime" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           中标通知书编号：
                        </td>
                        <td>
                            <asp:LinkButton ID="lbZbNb" runat="server" ></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           发包方式：
                        </td>
                        <td>
                             <asp:Label ID="lbZbBag" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            招标代理单位：</td>
                        <td>
                            <asp:Label ID="lbZbDl" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            项目负责人姓名：</td>
                        <td>
                            <asp:Label ID="lbFzr" runat="server" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="style1">
                            备 注： 
                        </td>
                        <td class="style1">
                            <asp:Label ID="lbZbRemark" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lbOther1" runat="server" Font-Bold="True" Font-Size="Medium" 
                                ForeColor="Blue"><a href="Login.aspx">会员登录后显示</a></asp:Label>
                            <asp:Label ID="lbOther2" runat="server" Font-Bold="True" Font-Size="Medium" 
                                ForeColor="Blue">您尚未购买此地区工程信息，购买后即可显示全部内容</asp:Label>
                             <asp:Label ID="lbOther3" runat="server" Font-Bold="True" Font-Size="Medium" 
                                ForeColor="Blue">您的建定币余额不足，充值后即可显示全部内容</asp:Label>
                        </td>
                    </tr>
                </table>
                </asp:Panel>
            </div>      
       </div>
       <div class="subfoot"></div>
    </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>