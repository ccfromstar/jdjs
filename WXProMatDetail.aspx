<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WXProMatDetail.aspx.cs" Inherits="JDJS.Web.WXProMatDetail" %>
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
    <div id="NOlogined" runat="server" visible="false">
                <table class="wrap">
                    <tr>
                          <td class="fontstl3">
                          <asp:Label ID="Label2" runat="server">请先在页面顶端使用“建定通”帐号登录后方可查看相关信息！</asp:Label>
                          </td>
                    </tr>
                 </table>  
      </div>
      <div id="HSlogined" runat="server" visible="false" >          
                <div class="fontstl3"><asp:Label ID="lbTitle" runat="server" Text="采购详情" ></asp:Label></div>           
            <div>
            
                <table class="wrap" style="text-align:left;"  border="1">
                    <tr>
                            <td  width="30%" align="center"><asp:Label ID="zname" runat="server">采购产品名称：</asp:Label></td>
                            <td><asp:Label ID="matname" runat="server"></asp:Label></td>
                        </tr>
                         <tr>
                            <td  width="30%" align="center"><asp:Label ID="zptime" runat="server">信息发布日期：</asp:Label></td>
                            <td ><asp:Label ID="ptime" runat="server"></asp:Label></td>
                        </tr>
                          <tr>
                            <td  width="30%" align="center"><asp:Label ID="zrecstate" runat="server">当前状态：</asp:Label></td>
                            <td><asp:Label ID="recstate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="30%" align="center"><asp:Label ID="project" runat="server" Font-Bold="True" 
                                    ForeColor="Blue">所属工程项目名称：</asp:Label></td>
                            <td>
                                <asp:HyperLink ID="proname" runat="server" Font-Bold="True" ForeColor="Blue" 
                                    Target="_self" ToolTip="点击查看工程详情" Font-Underline="True" >HyperLink</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%" align="center"><asp:Label ID="zunit" runat="server">计量单位：</asp:Label></td>
                            <td><asp:Label ID="matunit" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="30%" align="center"><asp:Label ID="zclass" runat="server">要求品牌：</asp:Label></td>
                            <td><asp:Label ID="matclass" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="30%" align="center"><asp:Label ID="zxh" runat="server">产品型号：</asp:Label></td>
                            <td><asp:Label ID="matxh" runat="server"></asp:Label></td>
                        </tr>
                        
                        <tr>
                            <td width="30%" align="center"><asp:Label ID="zgg" runat="server">产品规格：</asp:Label></td>
                            <td><asp:Label ID="matgg" runat="server"></asp:Label></td>
                        </tr>
                         <tr>
                            <td width="30%" align="center"><asp:Label ID="zrek" runat="server">备注：</asp:Label></td>
                            <td><asp:Label ID="matrek" runat="server"></asp:Label></td>
                        </tr>

                        <tr>
                            <td width="30%" align="center"><asp:Label ID="zamount" runat="server">采购总量：</asp:Label></td>
                            <td><asp:Label ID="matamount" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="30%" align="center"><asp:Label ID="zlprice" runat="server">采购方采购单价：</asp:Label></td>
                            <td><asp:Label ID="matlprice" runat="server"></asp:Label></td>
                        </tr>

                         <tr>
                            <td width="30%" align="center"><asp:Label ID="zstime" runat="server">采购起始日期：</asp:Label></td>
                            <td><asp:Label ID="stime" runat="server"></asp:Label></td>
                        </tr>

                         <tr>
                            <td width="30%" align="center"><asp:Label ID="zftime" runat="server">采购截止日期：</asp:Label></td>
                            <td><asp:Label ID="ftime" runat="server"></asp:Label></td>
                        </tr>


                        <tr>
                            <td width="30%" align="center"><asp:Label ID="zgycid" runat="server">成交供应商：</asp:Label></td>
                            <td><asp:Label ID="gycompany" runat="server"></asp:Label></td>
                        </tr>

                         <tr>
                            <td width="30%" align="center"><asp:Label ID="zcount" runat="server">已成交总量：</asp:Label></td>
                            <td><asp:Label ID="matcount" runat="server"></asp:Label></td>
                        </tr>

                          <tr>
                            <td width="30%" align="center"><asp:Label ID="zpprice" runat="server">成交单价：</asp:Label></td>
                            <td><asp:Label ID="matpprice" runat="server"></asp:Label></td>
                        </tr>
                           
                         <tr>
                            <td width="30%" align="center"><asp:Label ID="zbtime" runat="server">成交日期：</asp:Label></td>
                            <td><asp:Label ID="btime" runat="server"></asp:Label></td>
                        </tr>
                        

                        <tr>
                            <td width="30%" align="center"><asp:Label ID="zlinkman" runat="server" Font-Bold="True" 
                                    ForeColor="Red">采购负责人：</asp:Label></td>
                                    
                            <td>
                            <asp:HyperLink ID="linkman" runat="server" Font-Bold="True" ForeColor="Blue" 
                                    Target="_self" ToolTip="点击查看采购负责人详情" Font-Underline="True" >HyperLink</asp:HyperLink>
                           </td>
                        </tr>

                        <tr>
                            <td width="30%" align="center"><asp:Label ID="zphone" runat="server" Font-Bold="True" 
                                    ForeColor="Red">采购负责人所属公司</asp:Label></td>
                            <td><asp:HyperLink ID="Lcompany" runat="server" Font-Bold="True" ForeColor="Blue" 
                                    Target="_self" ToolTip="点击查看采购负责人所属公司详情" Font-Underline="True" >HyperLink</asp:HyperLink>
                            </td>
                        </tr>
                        
                    </table>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
