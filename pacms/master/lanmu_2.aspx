<% @ Page Language="C#" Inherits="PageAdmin.lanmu_2" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="lanmu_1" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>栏目导航设置</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">

<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25><b>当前栏目：</b><%=Request.QueryString["lanmu1"]%></td>
 </tr>
</table>

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td   height=25>  

             <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
               <tr>
                <td bgcolor=#ffffff>
                 <asp:DataList id="lanmulist" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0
                   OnItemDataBound="PageAdmin_Data_Bound"  OnDeleteCommand="PageAdmin_Data_Delete"> 
                    <HeaderTemplate> 
                      <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle >
                      <tr>
                      <td align=center width=25% class=white height=20>导航栏名称</td>
                      <td align=center width=20% class=white>导航栏类型</td>
                      <td align=center width=15% class=white>导航栏位置</td>
                      <td align=center width=10% class=white>序号</td>
                      <td align=center width=10% class=white>显示</td>
                      <td align=center width=20% class=white>管理</td>
                    </tr>
                   </table>
                    </HeaderTemplate> 
                    <ItemTemplate>

                   <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                      <tr  title='ID：Nav_<%#DataBinder.Eval(Container.DataItem,"id")%>'>
                      <td align=center width=25% class=tdstyle  height=20><asp:TextBox id="tb_name" runat="server"  size="16" maxlength="100" Text='<%#DataBinder.Eval(Container.DataItem,"lanmu2")%>'/></td>
                      <td align=center width=20% class=tdstyle>
                     <asp:DropDownList id="DL_Type" runat="server" >
                     <asp:listItem value="menu">子栏目</asp:ListItem>
                     <asp:listItem value="article" style="color:#339900">文章列表</asp:ListItem>
                     <asp:listItem value="product" style="color:#ff0000">产品列表</asp:ListItem>
                     <asp:listItem value="introduct" style="color:#0066FF">自定义内容</asp:ListItem>
                     <asp:listItem value="zdymodel" style="color:#ff9900">自定义模型</asp:ListItem>
                     </asp:DropDownList>
                      </td>
                   <td align=center width=15% class=tdstyle>
                     <asp:DropDownList id="DL_Layout" runat="server" >
                     <asp:listItem value="0" >页面左侧</asp:ListItem>
                     <asp:listItem value="1" style="color:#ff0000">页面右侧</asp:ListItem>
                     </asp:DropDownList>
                      </td>

                      <td align=center width=10% class=tdstyle><asp:TextBox id="tb_xuhao" runat="server" size="3" maxlength="5" Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>'/></td>
                      <td align=center width=10% class=tdstyle>
                     <asp:DropDownList id="DL_Show" runat="server" >
                     <asp:listItem value="1">显示</asp:ListItem>
                     <asp:listItem value="0" style="color:#ff0000">隐藏</asp:ListItem>
                     </asp:DropDownList>
                     </td>
                      <td align=left width=20% class=tdstyle>
                         <asp:Label id="Id"  runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' Visible="false" />
                         <asp:Label id="Lb_type"  runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"thetype")%>' Visible="false" />
                         <asp:Label id="Lb_show"  runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"show")%>' Visible="false" />
                         <asp:Label id="Lb_layout"  runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"layout")%>' Visible="false" />
                         <asp:Hyperlink   id="Lanmu_set"    runat="server" Text="子栏目设置" visible="false"      NavigateUrl='<%#"lanmu_3.aspx?lanmu1id="+Request.QueryString["lanmu1id"]+"&lanmu2id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu2="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu2").ToString())+"&thetype="+Request.QueryString["thetype"]%>' />
                         <asp:Hyperlink   id="Lanmu_style_set"    runat="server" Text="样式设置" visible="false"  NavigateUrl='<%#"lanmu_2_menustyle.aspx?lanmu1id="+Request.QueryString["lanmu1id"]+"&lanmu2id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu2="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu2").ToString())+"&thetype="+Request.QueryString["thetype"]%>' />
                         <asp:Hyperlink   id="Product_set"  runat="server" Text="产品列表设置" visible="false"    NavigateUrl='<%#"lanmu_2_product.aspx?lanmu1id="+Request.QueryString["lanmu1id"]+"&lanmu2id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu2="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu2").ToString())+"&thetype="+Request.QueryString["thetype"]%>' />
                         <asp:Hyperlink   id="Article_set"  runat="server" Text="文章列表设置" visible="false"    NavigateUrl='<%#"lanmu_2_article.aspx?lanmu1id="+Request.QueryString["lanmu1id"]+"&lanmu2id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu2="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu2").ToString())+"&thetype="+Request.QueryString["thetype"]%>' />
                         <asp:Hyperlink   id="zdy_set"  runat="server" Text="自定义内容设置" visible="false"      NavigateUrl='<%#"lanmu_2_introduct.aspx?lanmu1id="+Request.QueryString["lanmu1id"]+"&lanmu2id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu2="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu2").ToString())+"&thetype="+Request.QueryString["thetype"]%>' />
                         <asp:Hyperlink   id="Model_set"  runat="server" Text="自定义模型调用" visible="false"    NavigateUrl='<%#"lanmu_2_model.aspx?lanmu1id="+Request.QueryString["lanmu1id"]+"&lanmu2id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu2="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu2").ToString())+"&thetype="+Request.QueryString["thetype"]%>' />
                         <asp:LinkButton  id="Delete" CommandName="Delete" runat="server" Text="删除" />
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
<br>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center class=table_style2>
<tr>
  <td valign=top>
    <table border=0 cellpadding=0 cellspacing=2 width=100% align=center>
    <tr><td  colspan=3 height=25><b>增加导航栏</b></td>
    </tr>
      <tr>
        <td  height=25 align="left">
<asp:Label id="Lanmu1Id"    runat="server"  visible="false"/>
<asp:Label id="Lanmu1"    runat="server"  visible="false"/>
导航栏名称：<asp:TextBox  id="Add_Name"  maxlength="100" size="25"  runat="server" />
导航栏类型：<asp:DropDownList id="Add_Type" runat="server" >
                     <asp:listItem value="menu">子栏目</asp:ListItem>
                     <asp:listItem value="article" style="color:#339900">文章列表</asp:ListItem>
                     <asp:listItem value="product" style="color:#ff0000">产品列表</asp:ListItem>
                     <asp:listItem value="introduct" style="color:#0066FF">自定义内容</asp:ListItem>
                     <asp:listItem value="zdymodel" style="color:#ff9900">自定义模型</asp:ListItem>
       </asp:DropDownList> 

导航栏位置：<asp:DropDownList id="Add_Layout" runat="server" >
                     <asp:listItem value="0" >页面左侧</asp:ListItem>
                     <asp:listItem value="1" style="color:#ff0000">页面右侧</asp:ListItem>
</asp:DropDownList>

序号：<asp:TextBox       id="AddXuhao"  text="0" maxlength=5 size=5 runat="server" />
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



