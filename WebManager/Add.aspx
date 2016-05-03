<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="JDJS.Web.WebManager.Add" %>
<%@Register TagPrefix="dntb" Namespace="DotNetTextBox" Assembly="DotNetTextBox"%>
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
            <asp:Panel ID="Panel1" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        添加行业动态
                    </td>
                </tr>
                <tr>
                <td>
                    <table style="width: 100%;">
                       <tr>
                            <td align=right>
                                分类：
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlType" runat="server">
                                    <asp:ListItem Value="建筑行业">新闻提要</asp:ListItem>
                                    <asp:ListItem>建筑节能材料</asp:ListItem>
                                    <asp:ListItem>协会信息</asp:ListItem>
                                    <asp:ListItem>招聘信息</asp:ListItem>
                                    <asp:ListItem>应用案例</asp:ListItem>
                                    <asp:ListItem>绿动态</asp:ListItem>
                                    <asp:ListItem>协会奖项</asp:ListItem>
                                    <asp:ListItem>绿标小贴士</asp:ListItem>
                                    
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style=" width:50px" align=right>
                                标题：
                            </td>
                            <td>
                                <asp:TextBox ID="txtTitle" runat="server" Width="400px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                内容：
                            </td>
                            <td class="WebEditor">
                            <DNTB:WebEditor id="txtBody" Systemfolder="system_dntb/" Skin="skin/xp/" 
                                    runat="server" Height="300px" Width="700px" ></DNTB:WebEditor>
                            </td>
                        </tr>
                      
                        <tr>
                            <td align=right>
                                &nbsp;</td>
                            <td>
                                    <asp:LinkButton ID="lbSubmit" CssClass="zPushBtn" runat="server" 
                                        onclick="lbSubmit_Click">
                                <img height="20" src="style/Icons/icon039a16.gif" width="20" /><b>提交&nbsp;</b></asp:LinkButton></td>
                        </tr>
                      
                    </table>
                </td>
                </tr>
                
              
                </table>
             </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        添加工程信息
                    </td>
                </tr>
                <tr>
                <td>
                    <table style="width: 100%;">
                       <tr>
                            <td style=" width:70px" align=right>
                                分类：
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                    <asp:ListItem>招标信息</asp:ListItem>
                                    <asp:ListItem>中标信息</asp:ListItem>                                    
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <asp:Panel ID="Panel9" runat="server" >
                        <tr>
                            <td style=" width:70px" align=right>
                            招标类型：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style=" width:70px" align=right>
                            报建编号：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style=" width:70px" align=right>
                            招标单位：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style=" width:70px" align=right>
                            代理单位：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            工程名称：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            建设地点：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            投资规模：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            建筑面积：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            联系人：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            电话：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            手机：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            报名日期：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox24" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            报名地点：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            报名条件：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            项目类别：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox27" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            工程类别：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox28" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            标段号：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox29" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            招标编号：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox45" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            备注：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox30" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td align=right>
                                &nbsp;</td>
                            <td>
                                    <asp:LinkButton ID="LinkButton1" CssClass="zPushBtn" runat="server" 
                                        onclick="lbSubmit_Click">
                                <img height="20" src="style/Icons/icon039a16.gif" width="20" /><b>提交&nbsp;</b></asp:LinkButton></td>
                        </tr>
                        </asp:Panel>
                       <asp:Panel ID="Panel10" runat="server" Visible="false" >
                        <tr>
                            <td style=" width:70px" align=right>
                            中标类型：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox31" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style=" width:70px" align=right>
                            招标单位：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox32" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style=" width:70px" align=right>
                            中标价：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox33" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style=" width:70px" align=right>
                            工程名称：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox34" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            建设地点：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox35" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            中标单位：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox36" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            建筑面积：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox37" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            中标日期：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox38" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            工期：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox39" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            通知书编号：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox40" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            发包方式：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox41" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            代理单位：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox42" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            项目负责人：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox43" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style=" width:70px" align=right>
                            备 注：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox44" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td align=right>
                                &nbsp;</td>
                            <td>
                                    <asp:LinkButton ID="LinkButton8" CssClass="zPushBtn" runat="server" 
                                        onclick="LinkButton8_Click">
                                <img height="20" src="style/Icons/icon039a16.gif" width="20" /><b>提交&nbsp;</b></asp:LinkButton></td>
                        </tr>
                        </asp:Panel>
                      
                    </table>
                </td>
                </tr>
                
              
                </table>
             </asp:Panel>
              <asp:Panel ID="Panel3" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        添加企业之窗
                    </td>
                </tr>
                <tr>
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td style=" width:50px" align=right>
                                会员ID：</td>
                            <td>
                                <asp:TextBox ID="TextBox12" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                公司名称： 
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" Width="400px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                公司介绍：
                            </td>
                            <td>
                                <DNTB:WebEditor id="TextBox4" Systemfolder="system_dntb/" Skin="skin/xp/" 
                                    runat="server" Height="300px" Width="700px" ></DNTB:WebEditor>
                            </td>
                        </tr>
                      
                        <tr>
                            <td align=right>
                                &nbsp;</td>
                            <td>
                                    <asp:LinkButton ID="LinkButton2" CssClass="zPushBtn" runat="server" onclick="LinkButton2_Click" 
                                        >
                                <img height="20" src="style/Icons/icon039a16.gif" width="20" /><b>提交&nbsp;</b></asp:LinkButton></td>
                        </tr>
                      
                    </table>
                </td>
                </tr>
                
              
                </table>
             </asp:Panel>
              <asp:Panel ID="Panel4" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        添加单位动态
                    </td>
                </tr>
                <tr>
                <td>
                    <table style="width: 100%;">
                       <tr>
                            <td align=right>
                                Cid：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox57" runat="server"></asp:TextBox>
                            </td>
                        </tr>
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
                            所有人：</td>
                            <td>
                                <asp:TextBox ID="TextBox60" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                      
                        <tr>
                            <td align="right">
                                联系人：</td>
                            <td>
                                <asp:TextBox ID="TextBox61" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                电话：</td>
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
                                手机：</td>
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
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        添加造价信息
                    </td>
                </tr>
                <tr>
                <td>
                    <table style="width: 100%;">
                       <tr>
                            <td align=right>
                                分类：
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList4" runat="server">
                                    <asp:ListItem>主材快讯</asp:ListItem>
                                    <asp:ListItem>定额管理</asp:ListItem>
                                    <asp:ListItem>标准管理</asp:ListItem>
                                    
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style=" width:50px" align=right>
                                标题：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox7" runat="server" Width="400px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                内容：
                            </td>
                            <td>
                                <DNTB:WebEditor id="TextBox8" Systemfolder="system_dntb/" Skin="skin/xp/" 
                                    runat="server" Height="300px" Width="700px" ></DNTB:WebEditor>
                            </td>
                        </tr>
                      
                        <tr>
                            <td align=right>
                                &nbsp;</td>
                            <td>
                                    <asp:LinkButton ID="LinkButton4" CssClass="zPushBtn" runat="server" onclick="LinkButton4_Click" 
                                        >
                                <img height="20" src="style/Icons/icon039a16.gif" width="20" /><b>提交&nbsp;</b></asp:LinkButton></td>
                        </tr>
                      
                    </table>
                </td>
                </tr>
                
              
                </table>
             </asp:Panel>
              <asp:Panel ID="Panel6" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        添加政策公示
                    </td>
                </tr>
                <tr>
                <td>
                    <table style="width: 100%;">
                       <tr>
                            <td align=right>
                                分类：
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList5" runat="server">
                                    <asp:ListItem>法律</asp:ListItem>
                                    <asp:ListItem>行政部门</asp:ListItem>
                                    <asp:ListItem>部门规章</asp:ListItem>
                                    <asp:ListItem>地方性法规和规章</asp:ListItem>
                                    <asp:ListItem>各类文件</asp:ListItem>
                                    <asp:ListItem>最新公告</asp:ListItem>
                                    <asp:ListItem>通知提示</asp:ListItem>
                                    <asp:ListItem>诚信手册</asp:ListItem>
                                    <asp:ListItem>安全生产许可证</asp:ListItem>
                                    
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style=" width:50px" align=right>
                                标题：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox9" runat="server" Width="400px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                内容：
                            </td>
                            <td>
                                <DNTB:WebEditor id="TextBox10" Systemfolder="system_dntb/" Skin="skin/xp/" 
                                    runat="server" Height="300px" Width="700px" ></DNTB:WebEditor>
                            </td>
                        </tr>
                      
                        <tr>
                            <td align=right>
                                &nbsp;</td>
                            <td>
                                    <asp:LinkButton ID="LinkButton5" CssClass="zPushBtn" runat="server" onclick="LinkButton5_Click" 
                                        >
                                <img height="20" src="style/Icons/icon039a16.gif" width="20" /><b>提交&nbsp;</b></asp:LinkButton></td>
                        </tr>
                      
                    </table>
                </td>
                </tr>
                
              
                </table>
             </asp:Panel>
              <asp:Panel ID="Panel7" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        添加相关下载
                    </td>
                </tr>
                <tr>
                <td>
                    <table style="width: 100%;">
                       <tr>
                            <td align=right>
                                分类：
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList6" runat="server">
                                    <asp:ListItem>月包</asp:ListItem>
                                    <asp:ListItem>年包</asp:ListItem>                                    
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style=" width:50px" align=right>
                                标题：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox11" runat="server" Width="400px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                文件：
                            </td>
                            <td>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </td>
                        </tr>
                      
                        <tr>
                            <td align=right>
                                日期：</td>
                            <td><asp:TextBox ID="TextBox50" runat="server" CssClass="date-pick" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                      
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td>
                                <asp:LinkButton ID="LinkButton6" runat="server" CssClass="zPushBtn" 
                                    onclick="LinkButton6_Click">
                                <img height="20" src="style/Icons/icon039a16.gif" width="20" /><b>提交&nbsp;</b></asp:LinkButton>
                            </td>
                        </tr>
                      
                    </table>
                </td>
                </tr>
                
              
                </table>
             </asp:Panel>
              <asp:Panel ID="Panel8" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        添加会员用户
                    </td>
                </tr>
                <tr>
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td style=" width:50px" align=right>
                                帐号：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox13" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                密码：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox46" runat="server" 
                                    Width="200px" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                             <tr>
                            <td align=right>
                                公司：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox14" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                      <tr>
                            <td align=right>
                                地址：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox47" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                法人：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox48" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                联系人：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox49" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                性别：
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList7" runat="server">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                电话：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox51" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                手机：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox52" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                邮编：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox53" runat="server" 
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
                                职务：
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
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        添加特供价
                    </td>
                </tr>
                <tr>
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td style=" width:60px" align=right>
                                材料名称：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox5" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                单位：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox6" runat="server" 
                                    Width="200px" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                             <tr>
                            <td align=right>
                                品牌：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox80" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                      <tr>
                            <td align=right>
                                材质：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox68" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                规格：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox69" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                型号：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox74" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                生产厂商：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox70" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                供应商：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox73" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                        <td align=right>
                                显示供应商：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox76" runat="server" 
                                    Width="200px" Text="0" ></asp:TextBox>（“0”显示供应商信息，“1”人工询价）
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                特供价：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox77" Width="200px" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                材料编号：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox71" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                产地：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox72" runat="server" 
                                    Width="200px" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                图片：
                            </td>
                            <td>
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                &nbsp;</td>
                            <td>
                                    <asp:LinkButton ID="LinkButton9" CssClass="zPushBtn" runat="server" onclick="LinkButton9_Click" 
                                        >
                                <img height="20" src="style/Icons/icon039a16.gif" width="20" /><b>提交&nbsp;</b></asp:LinkButton></td>
                        </tr>
                      
                    </table>
                </td>
                </tr>
                
              
                </table>
             </asp:Panel>
             <asp:Panel ID="Panel12" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        添加公告
                    </td>
                </tr>
                <tr>
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td style=" width:60px" align=right>
                                标题：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox75" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                内容：
                            </td>
                            <td>
                                <DNTB:WebEditor id="WebEditor1" Systemfolder="system_dntb/" Skin="skin/xp/" 
                                    runat="server" Height="300px" Width="700px" ></DNTB:WebEditor>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                &nbsp;</td>
                            <td>
                                    <asp:LinkButton ID="LinkButton10" CssClass="zPushBtn" runat="server" onclick="LinkButton10_Click" 
                                        >
                                <img height="20" src="style/Icons/icon039a16.gif" width="20" /><b>提交&nbsp;</b></asp:LinkButton></td>
                        </tr>
                      
                    </table>
                </td>
                </tr>
                
              
                </table>
             </asp:Panel>
              <asp:Panel ID="Panel13" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td >
                        原材料走势
                    </td>
                </tr>
                <tr>
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td style=" width:60px" align=right>
                                标题：
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox78" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                内容：
                            </td>
                            <td>
                                <input id="File1" type="file" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td align=right>
                                &nbsp;</td>
                            <td>
                                    <asp:LinkButton ID="LinkButton11" CssClass="zPushBtn" runat="server" onclick="LinkButton11_Click" >
                                <img height="20" src="style/Icons/icon039a16.gif" width="20" /><b>提交&nbsp;</b></asp:LinkButton></td>
                        </tr>
                      
                    </table>
                </td>
                </tr>
                
              
                </table>
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
