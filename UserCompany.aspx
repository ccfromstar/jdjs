<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="UserCompany.aspx.cs" Inherits="JDJS.Web.UserCompany" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc2" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">

 <div class="SubMain">
 <div class="SubTop">
 <div class="pagmidtitle"><p>我的人脉</p></div>
    <table style="width: 624px;">
        
        <tr>
        <td align="center">
               <br/><b><span class="style6">请输入工程相关单位企业名称中的<span class="style2">“关键字”</span>进行查询</span><span 
                   class="style1"><br/></span></b><br/><br/>
        </td>
        </tr>
        <tr>
        <td align="center" class="style1">
       
        试例一：“上海<span class="style2">建定</span>建设工程信息网” 则输入：<span class="style2">“建定”<br/>
            </span>
        试例二：“上海<span class="style2">第二</span>市政工程设备有限公司” 则输入：<span class="style2">“第二”</span><br/><br/>
                   <table><tr><td><span class="style7">公司关键字：</span></td><td><asp:TextBox ID="txtTitle" runat="server" 
                Width="130px" ForeColor="Red"></asp:TextBox>
            &nbsp;
            <asp:Button ID="btnSeach" runat="server" Text="点击查询" onclick="btnSeach_Click" 
                        Height="24px" Width="70px" /></td></tr></table>
        
                <asp:DropDownList ID="ddlClassWT" runat="server" Width="130px" 
                Visible="False"  >
                    </asp:DropDownList>
        
            <br />
        
        </td>
        </tr>
        <tr>
        <td align="center">
        注意：输入的“关键字”越短得到的查询结果越精确。<br /> <br />
            点击公司名称可查看该公司详细信息及人员列表。<br />
        </td>
        </tr>
    </table>
    </div>

           <div class="SubCenter">
                <asp:Image ID="Image1" runat="server" />
                <div class="subbody">
                        <ul class="subbdul">
                                <asp:Repeater ID="Repcmp" runat="server">
                                <ItemTemplate>
                                    <li class="subbhadul a"><span>[<%#Eval("cphone")%>]-[<%#Eval("cplace")%>]</span><a href="Companyinfo.aspx?Id=<%#Eval("pcid")%>" title="<%#Eval("company")%>"><%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(), 60, "...")%></a></li>               
                                </ItemTemplate>
                                </asp:Repeater>
                        </ul>                 
                </div>    
             </div>
       <div class="subfoot"></div>
       <uc1:ucfarpager ID="pagecmp" runat="Server" PagePara="cmpPage" PageStyle="前后缩略"></uc1:ucfarpager>
       <div style=" text-align:center">
         <a href="javascript:history.back(-1)" class="stylelink">[返回上页]</a> </div>
     
 </div>
        
     <uc2:SubGG id="SubGG" runat="server"></uc2:SubGG>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
