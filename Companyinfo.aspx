<%@ Page Title="上海建定建设工程信息网-行业人脉-公司信息" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Companyinfo.aspx.cs" Inherits="JDJS.Web.Companyinfo" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .stylelink
        {
            font-weight: bold;Font-Size:12pt; text-decoration: underline; color:Blue;
         }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div class="SubMain">    
    <img alt="" src="style/images/renmai.gif" />
    <div class="SubCenter">
        <asp:Image ID="ImgBg" runat="server" />
        <div class="subbody">
            <div class="detailtitle"><asp:Label ID="cpname" runat="server" ></asp:Label></div>
            <div class="detailtime"></div>
            <div class="detailtime">
                <asp:Panel ID="Plinvite" runat="server" Visible="False">
                    <table style="width: 100%;" border="1" cellpadding="1" cellspacing="1">
                        <tr>
                            <td><asp:Label ID="tcptype" runat="server">公司性质：</asp:Label></td>
                            <td><asp:Label ID="cptype" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="tpplace" runat="server">所在地：</asp:Label></td>
                            <td><asp:Label ID="cpplace" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="tpaddress" runat="server">地址：</asp:Label></td>
                            <td><asp:Label ID="cpaddress" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="tppost" runat="server">邮编：</asp:Label></td>
                            <td><asp:Label ID="cppost" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="tpphone" runat="server">电话：</asp:Label></td>
                            <td><asp:Label ID="cpphone" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="tpfax" runat="server">传真：</asp:Label></td>
                            <td><asp:Label ID="cpfax" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="tpemail" runat="server">Email:</asp:Label></td>
                            <td><asp:Label ID="cpemail" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="tpweb" runat="server">公司网址：</asp:Label></td>
                            <td><asp:Label ID="cpweb" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label1" runat="server">现有人脉：</asp:Label></td>
                            <td><asp:Label ID="Labcnt" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                    
                </asp:Panel>
                    
                        <div class="detailtime"><br/>注：1、登录后能“解锁”该公司人脉列表，可查看员工联系方式等详细信息。
                        <br/>   
                         <br/>                           2、每次“解锁”人脉列表消耗2个“建定币”每个公司只需解锁一次。
                        
                        
                        </div>
                                   
                <div class="detailtitle"><a href="project_company_seach.aspx" class="stylelink">[查找其他公司]</a></div>
                <div class="detailtitle">
                
                    <asp:Button ID="Button1" runat="server" Text="注册/登录" Font-Bold="True" 
                        ForeColor="Blue" Height="28px" style="margin-top: 0px" 
                        Visible="False" onclick="Button1_Click" />
                    <asp:Button ID="BUY" runat="server" Text="解锁人脉列表" Font-Bold="True" 
                        ForeColor="Red" Height="28px" onclick="BUY_Click" style="margin-top: 0px" 
                        Visible="False" />
                </div>
                
                
            </div>
            


        </div>
         <div class="subfoot"></div>
    </div>
    <div class="detailtitle">
                          <asp:Label ID="prolist" runat="server">相关参与工程列表</asp:Label>
                    </div>
                     <div class="SubCenter">
                        <asp:Image ID="Image1" runat="server" />
                        <div class="subbody">
                            <ul class="subbdul">
                                <asp:Repeater ID="Repeaterpro" runat="server">
                                    <ItemTemplate>
                                      <li class="<%#Getstyle(Eval("Id").ToString())%>"><span><%#Eval("prostate")%>     [<%#Eval("inforptime", "{0:yyyy-MM-dd}")%>]</span><a href="ProjectinforDetail.aspx?Part=3&Id=<%#Eval("id") %>" title="<%#ReplaceStr(Eval("prorek").ToString(),"<br>","")%>"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 62, "...")%></a><%#NewStr(Eval("inforptime", "{0:yyyy-MM-dd}").ToString())%></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        
                        </div>
                            <div class="subfoot"></div>
                            <uc1:UcfarPager ID="Pager" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                    </div>
    <asp:Panel ID="StaffTab" runat="server" Visible="False">
                <div class="detailtitle">人脉列表</div>
                <div class="detailtime">点击员工姓名可查看该员工全部信息</div>
                <br />
                <asp:Repeater ID="RepInfo" runat="server">
                <ItemTemplate>
                    <table width="99%" border="1" cellpadding="1" cellspacing="1">
                       
                        <tr>
                           <td style=" width:10%;text-align:center;height:20px"><a href="Staffinfo.aspx?Id=<%#Eval("id")%>" title="点击查看该员工详细信息" style=" width:15%"><u><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 10, "...")%></u></a></td>
                           <td style=" width:10%;text-align:center;height:20px">[<%#Eval("chenghu")%>]</td>
                           <td style=" width:25%;text-align:center;height:20px">[<%#Eval("job")%>]</td>
                           <td style=" width:25%;text-align:center;height:20px">[<%#Eval("phone")%>]</td>
                           <td style=" width:30%;text-align:center;height:20px"><%#LTP.Common.StringPlus.StrCut(Eval("address").ToString(), 28, "...")%></td>
                        <tr>
                    </table>               
                </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>