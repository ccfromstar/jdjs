﻿<% @ Page Language="C#" Inherits="PageAdmin.lanmu_1_template" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="lanmu_1" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>模块设置</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">

<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25><b>当前模块栏目</b>：<%=Request.QueryString["lanmu1"]%></td>
 </tr>
</table>

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2 height=25>  
             <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
               <tr>
                <td>
                 <asp:DataList id="DataList_1" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0
                   OnItemDataBound="PageAdmin_Data_Bound"  OnDeleteCommand="PageAdmin_Data_Delete"> 
                    <HeaderTemplate> 
                      <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle >
                      <tr>
                      <td align=center width=25% class=white height=20>模块名称</td>
                      <td align=center width=15% class=white>模块类型</td>
                      <td align=center width=15% class=white>显示</td>
                      <td align=center width=15% class=white>序号</td>
                      <td align=center width=30% class=white>管理</td>
                    </tr>
                   </table>
                    </HeaderTemplate> 
                    <ItemTemplate>
                      <table border=0 cellpadding=0 cellspacing=0 width=100%  class=tablestyle>
                       <tr  title='ID：Template_<%#DataBinder.Eval(Container.DataItem,"id")%>'>
                        <td align=center width=25%  class=tdstyle>
                          <asp:TextBox id="Tb_Name"  Text='<%#DataBinder.Eval(Container.DataItem,"name")%>' runat="server" size="25" maxlength="100" /></a>
                       </td>
                     <td align=center width=15%  class=tdstyle>
                   <asp:DropDownList id="DL_Type" runat="server" >
                     <asp:listItem value="introduct">自定义内容</asp:ListItem>
                     <asp:listItem value="article" style="color:#ff0000">文章列表</asp:ListItem>
                     <asp:listItem value="product" style="color:#339900">产品列表</asp:ListItem>
                     <asp:listItem value="picture" style="color:#0066FF">图片展示</asp:ListItem>
                     <asp:listItem value="zdymodel" style="color:#ff9900">自定义模型</asp:ListItem>
                     </asp:DropDownList>
                     </td>
                <td align=center width=15%  class=tdstyle>
                     <asp:DropDownList id="DL_Show" runat="server" >
                     <asp:listItem value="1">显示</asp:ListItem>
                     <asp:listItem value="0" style="color:#ff0000">隐藏</asp:ListItem>
                     </asp:DropDownList>
                     </td>
                <td align=center width=15% class=tdstyle><asp:TextBox id="Xuhao"  Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>' runat="server"  size=5  maxlength=10 /></td>
                <td width=30% class=tdstyle>
                             <asp:Label   id="Id"  Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server"  visible="false" />
                             <asp:Label   id="Lb_Type"  Text='<%#DataBinder.Eval(Container.DataItem,"thetype")%>' runat="server"  visible="false" />
                             <asp:Label   id="Lb_Show"  Text='<%#DataBinder.Eval(Container.DataItem,"show")%>'   runat="server"  visible="false" />
                             <asp:LinkButton id="Delete" runat="server" Text="删除" CommandName="Delete" />
                             <asp:Hyperlink   id="zdy_set"  runat="server" Text="自定义内容设置" visible="false"  NavigateUrl='<%#"lanmu_template_introduct.aspx?id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu1id="+Request.QueryString["lanmu1id"]+"&template="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%>' />
                             <asp:Hyperlink   id="article_set"  runat="server" Text="文章列表设置" visible="false"  NavigateUrl='<%#"lanmu_template_article.aspx?id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu1id="+Request.QueryString["lanmu1id"]+"&template="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%>' />
                             <asp:Hyperlink   id="product_set"  runat="server" Text="产品列表设置" visible="false"  NavigateUrl='<%#"lanmu_template_product.aspx?id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu1id="+Request.QueryString["lanmu1id"]+"&template="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%>' />
                             <asp:Hyperlink   id="pic_set"  runat="server" Text="图片展示设置" visible="false"  NavigateUrl='<%#"lanmu_template_pic.aspx?id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu1id="+Request.QueryString["lanmu1id"]+"&template="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%>' />
                             <asp:Hyperlink   id="zdymodel_set"  runat="server" Text="自定义模型设置" visible="false"  NavigateUrl='<%#"lanmu_template_model.aspx?id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu1id="+Request.QueryString["lanmu1id"]+"&template="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%>' />
                        </td>
                      </tr>
                     </table>
                    </ItemTemplate>
                 </asp:DataList>
       </td>
    </tr>
   </table>
    </td>
     </tr>
 </table>
<br>
<div align=center>
<asp:Button  runat="server" Text="修改"  CssClass="button" OnClick="PageAdmin_Data_Update" />
&nbsp;&nbsp;<input type="button" value="返回" Class="button" OnClick="location.href='lanmu_1.aspx'">
</div>
  </td>
  <tr>
 </table>
<br><ul>
</ul>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center class=table_style2>
<tr>
  <td valign=top align="left">
    <table border=0 cellpadding=0 cellspacing=2 width=100% align=center>
    <tr><td  colspan=3 height=25><b>增加模块</b></td>
    </tr>
      <tr>
        <td  height=25>
<asp:Label id="Lanmu1Id"    runat="server"  visible="false"/>
<asp:Label id="Lanmu1"    runat="server"  visible="false"/>
模块名称：<asp:TextBox  id="Add_Template"  maxlength=100 size=25  runat="server" />
模块类型：<asp:DropDownList id="Template_Type" runat="server" >
                     <asp:listItem value="introduct">自定义内容</asp:ListItem>
                     <asp:listItem value="article" style="color:#ff0000">文章列表</asp:ListItem>
                     <asp:listItem value="product" style="color:#339900">产品列表</asp:ListItem>
                     <asp:listItem value="picture" style="color:#0066FF">图片展示</asp:ListItem>
                     <asp:listItem value="zdymodel" style="color:#ff9900">自定义模型</asp:ListItem>
       </asp:DropDownList>
模块序号：<asp:TextBox       id="AddXuhao"  text="0" maxlength=5 size=5 runat="server" />
<asp:button  CssClass="button"  Text="增加" runat="server" OnClick="PageAdmin_Data_Add" />
        </td>
    </tr>
   </table>
</td>
</tr>
</table>
<br>
<asp:Label id="LblErr" runat="server" />
</form>
</td>
</tr>
</table>
</center>
</body>
</html>  



