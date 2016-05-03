<% @ Page Language="C#" Inherits="PageAdmin.lanmu_3"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="lanmu_3" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>子栏目设置</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top  align="left">

<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25><b>当前栏目</b>：<%=Request.QueryString["lanmu1"]%> > <%=Request.QueryString["lanmu2"]%></td>
 </tr>
</table>

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2 height=25>  
             <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
               <tr>
                <td>
                 <asp:DataList id="lanmulist" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0
                   OnItemDataBound="PageAdmin_Data_Bound"  OnDeleteCommand="PageAdmin_Data_Delete"> 
                    <HeaderTemplate> 
                      <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle >
                      <tr>
                      <td align=center width=20% class=white height=20>子栏目</td>
                      <td align=center width=10% class=white>子栏目类型</td>
                      <td align=center width=20% class=white>自定义链接</td>
                      <td align=center width=10% class=white>链接目标</td>
                      <td align=center width=10% class=white>显示</td>
                      <td align=center width=5% class=white>序号</td>
                      <td align=center width=25% class=white>管理</td>
                    </tr>
                  </table>
                    </HeaderTemplate> 
                    <ItemTemplate>
                      <table border=0 cellpadding=0 cellspacing=0 width=100%  class=tablestyle>
                       <tr>
                        <td align=center width=20% class=tdstyle>
                          <asp:TextBox id="Tb_Lanmu"  Text='<%#DataBinder.Eval(Container.DataItem,"lanmu3")%>' runat="server" size="16" maxlength="100" />
                       </td>
                     <td align=center width=10%  class=tdstyle>
                        <asp:DropDownList id="DL_LanmuType" runat="server" >
                     <asp:listItem value="introduct">普通简介</asp:ListItem>
                     <asp:listItem value="article" style="color:#ff0000">文章列表</asp:ListItem>
                     <asp:listItem value="product" style="color:#0066FF">产品列表</asp:ListItem>
                     <asp:listItem value="feedback" style="color:#990000">用户反馈</asp:ListItem>
                     <asp:listItem value="hrzp" style="color:#339900">人才招聘</asp:ListItem>
                     <asp:listItem value="hrjoin" style="color:#666600">在线应聘</asp:ListItem>
                     <asp:listItem value="network" style="color:#66CCFF">销售网络</asp:ListItem>
                     <asp:listItem value="model" style="color:#ff9900">自定义模型</asp:ListItem>

                     </asp:DropDownList>
                     </td>
                <td align=center width=20%  class=tdstyle><asp:TextBox id="Tb_Url" Text='<%#DataBinder.Eval(Container.DataItem,"url")%>' runat="server" size=20  maxlength=100 /></td>
                
                  <td align=center width=10%  class=tdstyle>
                     <asp:DropDownList id="DL_Target" runat="server" >
                     <asp:listItem value="_self">本窗口</asp:ListItem>
                     <asp:listItem value="_blank" style="color:#ff0000">新窗口</asp:ListItem>
                     </asp:DropDownList>
                   </td>

                <td align=center width=10%  class=tdstyle>
                     <asp:DropDownList id="DL_Show" runat="server" >
                     <asp:listItem value="1">显示</asp:ListItem>
                     <asp:listItem value="0" style="color:#ff0000">隐藏</asp:ListItem>
                     </asp:DropDownList>
                     </td>

                  <td align=center width=5% class=tdstyle><asp:TextBox id="Xuhao"  Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>' runat="server"  size=3  maxlength=3 /></td>
                         <td width=25% class=tdstyle>
                             <asp:Label   id="Id"  Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server"  visible="false" />
                             <asp:Label   id="Lb_Type"  Text='<%#DataBinder.Eval(Container.DataItem,"thetype")%>' runat="server"  visible="false" />
                             <asp:Label   id="Lb_Show"  Text='<%#DataBinder.Eval(Container.DataItem,"show")%>'   runat="server"  visible="false" />
                             <asp:Label   id="Lb_Target"  Text='<%#DataBinder.Eval(Container.DataItem,"lanmu3_target")%>'   runat="server"  visible="false" />

                             <asp:LinkButton id="Delete" runat="server" Text="删除" CommandName="Delete" />
                             <asp:Hyperlink  id="Edit"  runat="server" Text="简介编辑"  NavigateUrl='<%#"lanmu_3_introduct.aspx?lanmu1id="+Request.QueryString["lanmu1id"]+"&lanmu2id="+Request.QueryString["lanmu2id"]+"&lanmu2xuhao="+Request.QueryString["lanmu2xuhao"]+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu2="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu2").ToString())+"&lanmu3="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu3").ToString())+"&id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu3type="+DataBinder.Eval(Container.DataItem,"thetype")%>'  visible="false"/>
                             <asp:Hyperlink  id="Edit_Header"  runat="server" Text="页头+权限设置"  NavigateUrl='<%#"lanmu_3_introduct.aspx?lanmu1id="+Request.QueryString["lanmu1id"]+"&lanmu2id="+Request.QueryString["lanmu2id"]+"&lanmu2xuhao="+Request.QueryString["lanmu2xuhao"]+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu2="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu2").ToString())+"&lanmu3="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu3").ToString())+"&id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu3type="+DataBinder.Eval(Container.DataItem,"thetype")%>'  visible="true"/>
                             <asp:Hyperlink  id="Article_Set"  runat="server" Text="文章列表设置"  NavigateUrl='<%#"lanmu_3_article.aspx?lanmu1id="+Request.QueryString["lanmu1id"]+"&lanmu2id="+Request.QueryString["lanmu2id"]+"&lanmu2xuhao="+Request.QueryString["lanmu2xuhao"]+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu2="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu2").ToString())+"&lanmu3="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu3").ToString())+"&id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu3type="+DataBinder.Eval(Container.DataItem,"thetype")%>'  visible="false"/>

                             <asp:Hyperlink  id="Prod_Set"   runat="server" Text="产品列表设置"  NavigateUrl='<%#"lanmu_3_product.aspx?lanmu1id="+Request.QueryString["lanmu1id"]+"&lanmu2id="+Request.QueryString["lanmu2id"]+"&lanmu2xuhao="+Request.QueryString["lanmu2xuhao"]+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu2="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu2").ToString())+"&lanmu3="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu3").ToString())+"&id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu3type="+DataBinder.Eval(Container.DataItem,"thetype")%>'  visible="false"/>

                             <asp:Hyperlink  id="Feedback_Set"   runat="server" Text="用户反馈设置"  NavigateUrl='<%#"lanmu_3_feedback.aspx?lanmu1id="+Request.QueryString["lanmu1id"]+"&lanmu2id="+Request.QueryString["lanmu2id"]+"&lanmu2xuhao="+Request.QueryString["lanmu2xuhao"]+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu2="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu2").ToString())+"&lanmu3="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu3").ToString())+"&id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu3type="+DataBinder.Eval(Container.DataItem,"thetype")%>'  visible="false"/>
                             <asp:Hyperlink  id="Model_Set"  runat="server" Text="自定义模型设置"  NavigateUrl='<%#"lanmu_3_model.aspx?lanmu1id="+Request.QueryString["lanmu1id"]+"&lanmu2id="+Request.QueryString["lanmu2id"]+"&lanmu2xuhao="+Request.QueryString["lanmu2xuhao"]+"&lanmu1="+Server.UrlEncode(Request.QueryString["lanmu1"])+"&lanmu2="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu2").ToString())+"&lanmu3="+Server.UrlEncode(DataBinder.Eval(Container.DataItem,"lanmu3").ToString())+"&id="+DataBinder.Eval(Container.DataItem,"id")+"&lanmu3type="+DataBinder.Eval(Container.DataItem,"thetype")%>'  visible="false"/>
 
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
&nbsp;&nbsp;<input type="button" value="返回" Class="button" OnClick="location.href='lanmu_2.aspx?lanmu1id=<%=Request.QueryString["lanmu1id"]%>&lanmu1=<%=Server.UrlEncode(Request.QueryString["lanmu1"])%>&thetype=<%=Request.QueryString["thetype"]%>'">
</div>
  </td>
  <tr>
 </table>
<br>
<div style="margin:0 0 5px 0;line-height:20px;"><span style="color:#ff0000;">说明：</span>自定义链接优先于默认链接<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页对应栏目无默认链接,只能自定义链接。</div>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center class=table_style2>
<tr>
  <td valign=top  align="left">
    <table border=0 cellpadding=0 cellspacing=2 width=100% align=center>
    <tr><td  colspan=3 height=25><b>增加子栏目</b></td>
    </tr>
      <tr>
        <td  height=25>
<asp:Label id="Lanmu1Id"    runat="server"  visible="false"/>
<asp:Label id="Lanmu1"    runat="server"  visible="false"/>
<asp:Label id="Lanmu2Id"    runat="server"  visible="false"/>
<asp:Label id="Lanmu2"    runat="server"  visible="false"/>
子栏目名称：<asp:TextBox  id="AddLanmu"  maxlength=100 size=25  runat="server" />
子栏目类型：<asp:DropDownList id="Add_LanmuType" runat="server" >
                     <asp:listItem value="introduct">普通简介</asp:ListItem>
                     <asp:listItem value="article" style="color:#ff0000">文章列表</asp:ListItem>
                     <asp:listItem value="product" style="color:#0066FF">产品列表</asp:ListItem>
                     <asp:listItem value="feedback" style="color:#990000">用户反馈</asp:ListItem>
                     <asp:listItem value="hrzp" style="color:#339900">人才招聘</asp:ListItem>
                     <asp:listItem value="hrjoin" style="color:#666600">在线应聘</asp:ListItem>
                     <asp:listItem value="network" style="color:#66CCFF">销售网络</asp:ListItem>
                     <asp:listItem value="model" style="color:#ff9900">自定义模型</asp:ListItem>
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



