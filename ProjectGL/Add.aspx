<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="JDJS.Web.ProjectGL.Add" %>
<%@Register TagPrefix="dntb" Namespace="DotNetTextBox" Assembly="DotNetTextBox"%>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
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
        jQuery(function() {
            $(".date-pick").datepicker({ changeMonth: true, changeYear: true });
        }); 
</script>
    <style type="text/css">
        .style3
        {
            width: 200px;
        }
        .style5
        {
            width: 26px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
 <table border="0" cellspacing="0" cellpadding="0" width="100%"  >
<tr>
    <td class="left_Bg">
        <table  width="100%" cellpadding="2" cellspacing="0">
         <tr>
            <td>
               <div style="float: left">
                
                </div>
            </td>
         </tr>
         <tr>
            <td>
           
            </td>
         </tr>
         <tr>
            <td>
            
            <asp:Panel ID="Panel2" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        添加工程信息
                    </td>
                </tr>
                <tr>
                <td>
                <asp:Panel ID="Panel9" runat="server" >
                    <table style="width: 100%;">
                     
                        
                         <tr align="center">
                           
                            
                            <td colspan="6">工程ID：<asp:TextBox ID="TextID" runat="server" Enabled="False" 
                                    Font-Bold="True" ForeColor="Red"></asp:TextBox>
                              </td>
                            
                        </tr>
                        <tr align="center">
                            <td colspan="6">
                                &nbsp;工程显示与否：<asp:DropDownList ID="DropDownList10" runat="server" 
                                    AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                    <asp:ListItem>显示</asp:ListItem>
                                    <asp:ListItem>隐藏</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                         
                        </tr>
                        <tr align="center"><td colspan="6">发布日期：<asp:Label ID="Labelptime" runat="server" 
                                Text="Label"></asp:Label>
                            </td></tr>
                        <tr>
                            <td>
                            工程名称：
                            </td>
                            <td>
                                <asp:TextBox ID="Textname" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                工程类别：</td>
                            <td>
                                <asp:TextBox ID="Textsort" runat="server" Width="220px"></asp:TextBox>
                            </td>
                        </tr>

                       

                         <tr>
                            <td align=right class="style5">
                            建设地点：
                            </td>
                            <td class="style3">
                                <asp:TextBox ID="Textaddress" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td align=right class="style5">
                                省市：
                            </td>
                            <td class="style3">
                                <asp:DropDownList ID="DropDownListplace" runat="server" AutoPostBack="True" 
                                    >
                                    
                                </asp:DropDownList>
                            </td>
                              <td align=right class="style5">
                                区县：
                            </td>
                            <td class="style3">
                                <asp:TextBox ID="Textquyu" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td align=right class="style5">
                                项目状态：</td>
                            <td class="style3">
                                <asp:DropDownList ID="DropDownListstate" runat="server" AutoPostBack="True" 
                                    >
                                    
                                </asp:DropDownList>
                            </td>
                        </tr>
                         <tr>
                            <td align=right class="style5">
                                开工日期：</td>
                            <td class="style3">
                                <asp:TextBox ID="Textstime" runat="server"></asp:TextBox>
                             </td>
                             <td align=right class="style5">
                                 竣工日期：</td>
                            <td class="style3">
                                <asp:TextBox ID="Textftime" runat="server"></asp:TextBox>
                             </td>
                        </tr>
                         <tr>
                            <td align=right class="style5">
                                投资规模：</td>
                            <td class="style3">
                                <asp:TextBox ID="Textmoney" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td align=right class="style5">
                                工程描述：
                            </td>
                            <td colspan="5">
                               <DNTB:WebEditor id="txtBody" Systemfolder="system_dntb/" Skin="skin/xp/" 
                                    runat="server" Height="300px" Width="700px" ></DNTB:WebEditor>
                             </td>
                        </tr>
                         <tr>
                            <td align=right class="style5">
                                &nbsp;</td>
                            <td class="style3">
                                    <asp:LinkButton ID="LinkButton1" CssClass="zPushBtn" runat="server" 
                                        onclick="LinkButton1_Click">
                                <img height="20" src="style/Icons/icon039a16.gif" width="20" /><b>提交&nbsp;</b></asp:LinkButton></td>
                        </tr>
                         </table>
                        </asp:Panel>
                     
                   
                </td>
                </tr>
                
              
                </table>
             </asp:Panel>

              <asp:Panel ID="Panelcompany" runat="server" Visible="false">

                <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        添加工程人脉
                    </td>
                </tr>
               
                </table>
                  <asp:Panel ID="Panel1" runat="server" >
                        <table style="width: 100%;">                     
                        
                            <tr align="center">
                            <td>
                                <td>人员ID：<asp:TextBox ID="Textpcid" runat="server" 
                                    ></asp:TextBox>
                                </td>
                            
                                <td>公司名称：<asp:TextBox ID="Textcompany" runat="server" 
                                    ></asp:TextBox>
                                </td>
                                <td>姓名：<asp:TextBox ID="Textlinkman" runat="server" 
                                    ></asp:TextBox>
                                </td>
                                <td>职务/部门：<asp:TextBox ID="Textjob" runat="server" 
                                    ></asp:TextBox>
                                </td>
                                <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton2" runat="server" class="zPushBtn" onclick="LinkButton2_Click" 
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton></td>
                          </td>                        
                            
                            </tr>
                            <tr class="dataTableHead">
                                <td  colspan ="2">
                                    工程人脉列表
                                </td>
                            </tr>
                              <tr class="dataTableHead">
                                <td>
                                        <span style="float:left"><b>人员ID</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                                </td>
                   
                                <td width="150px;">
                                        <span style="float:left"><strong>操作</strong></span>
                                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                                </td>
                            </tr>
                              <asp:Repeater ID="Repcart" runat="server">
                                  <ItemTemplate>
                                        <tr class="dataTableBody">
                                            <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("pepid").ToString(), 82, "...")%></td>
                                           
                                        <td>                       
                                             <a href="add.aspx?Operat=Deletelinkman&type=Prolinkman&cartpepid=<%#Eval("pepid") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>取消添加&nbsp;</b></a></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <tr><td>
                                         <asp:LinkButton ID="LBpeplist" runat="server" class="zPushBtn" onclick="LBpeplist_Check"><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>提交人脉列表&nbsp;</b></asp:LinkButton>
                                </td></tr>
                      </table>
                      
                </asp:Panel>
              </asp:Panel>

              <asp:Panel ID="Panel3" runat="server" Visible="false" >
              <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                     <td>
                        <span style="float:left"><b>人员ID</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>公司名称</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>姓名</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>职务/部门</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                </tr>
                <asp:Repeater ID="Rep2" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("id").ToString(), 82, "...")%></td>
                    <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%></td>
                     <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 82, "...")%></td>
                      <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 82, "...")%></td>
                    <td>
                    <!--角色选择<asp:DropDownList ID="DLjs" runat="server" AutoPostBack="True" >
                             <asp:ListItem>业主/开发商</asp:ListItem>
                             <asp:ListItem>建筑师/设计院</asp:ListItem>       
                             <asp:ListItem>承建商/分包商</asp:ListItem>        
                                </asp:DropDownList>
                                工程角色<asp:TextBox ID="Textprojob" runat="server" 
                                    ></asp:TextBox>
                                    备注<asp:TextBox ID="Textrek" runat="server" 
                                    ></asp:TextBox> -->
                    <!--<a href="Edit.aspx?type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>加入人脉表&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>取消&nbsp;</b></a></td>-->
                    <a href="add.aspx?Operat=addlinkman&type=Prolinkman&cartpepid=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>加入人脉列表&nbsp;</b></a></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="2" align="center">
                    <uc1:UcfarPager ID="UcfarPager5" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
             </asp:Panel>


              <asp:Panel ID="Panel4" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        添加公司信息
                    </td>
                </tr>
                <tr>
                <td>
                    <table style="width: 100%;">
                       
                        <tr>
                            <td style=" width:50px" align=right>
                                公司名：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox58" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                地址：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox59" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                      
                       
                        <tr>
                            <td align="right">
                                公司性质：</td>
                            <td>
                                <asp:DropDownList ID="Comptype" runat="server" AutoPostBack="True" >
                                        
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                地域：</td>
                            <td>
                                <asp:TextBox ID="TextBox62" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Email：</td>
                            <td>
                                <asp:TextBox ID="TextBox63" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                传真：</td>
                            <td>
                                <asp:TextBox ID="TextBox64" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                网址：</td>
                            <td>
                                <asp:TextBox ID="TextBox65" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                邮编：</td>
                            <td>
                                <asp:TextBox ID="TextBox66" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                电话：</td>
                            <td>
                                <asp:TextBox ID="TextBox67" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                      
                        <tr>
                            <td align=right>
                                 </td>
                            <td>
                                    <asp:LinkButton ID="LinkButton3" CssClass="zPushBtn" runat="server" onclick="LinkButton3_Click" 
                                        >
                                <img height="20" src="style/Icons/icon039a16.gif" width="20" /><b>提交&nbsp;</b></asp:LinkButton></td>
                        </tr>
                      
                    </table>
                </td>
                </tr>
                
              
                </table>
             </asp:Panel>
              <asp:Panel ID="Panel5" runat="server" Visible="false">
             </asp:Panel>
              <asp:Panel ID="Panel6" runat="server" Visible="false">
             </asp:Panel>
              <asp:Panel ID="Panel7" runat="server" Visible="false">
             </asp:Panel>
              <asp:Panel ID="Panel8" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        添加人员信息
                    </td>
                </tr>
                <tr>
                <td>
                    <table style="width: 100%;">
                     <tr>
                            <td align=right>
                                所属公司：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox47" runat="server" 
                                    Width="700px" Enabled="false" ></asp:TextBox>
                                    <asp:TextBox ID="TextBox1" runat="server" 
                                    Width="200px" Visible="false" ></asp:TextBox>
                            </td>
                            
                        </tr>
                     <tr>
                        <td colspan="2">
                        <table width="100%" cellpadding="2" cellspacing="0">
                        <tr>
                    <td style=" width:80px; height:30px;" align="right">公司ID</td>
                    <td style=" width:100px;">
                      <asp:TextBox ID="TextBox6" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td style=" width:80px; height:30px;" align="right">公司名称：</td>
                    <td style=" width:100px;">
                      <asp:TextBox ID="TextBox7" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    
                    
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton4" runat="server" class="zPushBtn"  OnClick="LinkButton4_Check"
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton><!--<input type="button" value="搜索"  />--></td>
                    <td></td>
                    
                </tr>
                </table>
                         <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                          <tr class="dataTableHead">
                            <td>
                                <span style="float:left"><b>公司ID</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                            </td>
                            <td>
                                <span style="float:left"><b>公司名称</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                            </td>
                   
                            <td width="150px;">
                                <span style="float:left"><strong>操作</strong></span>
                                <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                            </td>
                         </tr>
                            <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                            <tr class="dataTableBody">
                                <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("pcid").ToString(), 22, "...")%></td>
                                <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(), 82, "...")%></td>
                               
                                <td>
                                <a href="Add.aspx?type=<%=Part%>&pcid=<%#Eval("pcid")%>&company=<%#Eval("company")%>" class="zPushBtn" ><img src="style/Icons/icon003a2.gif" width="20" height="20" /><b>选择公司&nbsp;</b></a>
                               
                                </td>
                            </tr>
                            </ItemTemplate>
                            </asp:Repeater>
                       
                          </table>
                        
                        </td>
                        </tr>
                        <tr>
                            <td style=" width:50px" align=right>
                                姓名：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox13" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                       
                            
                     
                       
                        <tr>
                            <td align=right>
                                地域：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox48" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                地址：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox49" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                称谓：
                            </td>
                            <td>
                                <asp:DropDownList ID="lmchenghu" runat="server">
                                
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                电话/手机：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox51" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                       
                        <tr>
                            <td align=right>
                                Email：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox54" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                传真：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox55" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                职称/职务：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox56" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                &nbsp;</td>
                            <td>
                                    <asp:LinkButton ID="LinkButton7" CssClass="zPushBtn" runat="server" onclick="LinkButton7_Click" 
                                        >
                                <img height="20" src="style/Icons/icon039a16.gif" width="20" /><b>提交&nbsp;</b></asp:LinkButton></td>
                        </tr>
                      
                    </table>
                </td>
                </tr>
                
              
                </table>
             </asp:Panel>
             <asp:Panel ID="Panel11" runat="server" Visible="false">
             </asp:Panel>
             <asp:Panel ID="Panel12" runat="server" Visible="false">
             </asp:Panel>
              <asp:Panel ID="Panel13" runat="server" Visible="false">
             </asp:Panel>
            </td>
         </tr>
        </table>
        
    </td>
    <td class="right_Bg"></td>
</tr>
</table>
    </form>
</body>
</html>
