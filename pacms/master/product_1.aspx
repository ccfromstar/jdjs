<% @ Page Language="C#" Inherits="PageAdmin.product_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="product_2" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>产品明细管理</b></td></tr>
 <tr><td height=10></td></tr>
</table>

<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top  align="left">

<form runat="server" >
<asp:PlaceHolder id="Holder1" runat="server" Visible="false">
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  height=25><b>产品明细管理</b></td>
 </tr>
</table>
    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2 height=25>

          <asp:DataList id="dtl1" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0 OnItemDataBound="PageAdmin_Data_Bound">  
            <headerTemplate>
               <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td height=25 align=center width=15%  class=white>名称</td>
                  <td height=25 align=center width=10%  class=white >大类</td>
                  <td height=25 align=center width=10%  class=white >小类</td>
                  <td height=25 align=center width=10%  class=white >日期</td>
                  <td height=25 align=center width=10%  class=white >状态</td>
                  <td height=25 align=center width=7%  class=white >会员</td>
                  <td height=25 align=center width=38%  class=white >操作</td>
                </tr>
                </table>
            </headerTemplate>
             <ItemTemplate>
              <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle style="table-layout:fixed;">
               <tr>
                  <td height=25  width=15%  class=tdstyle  title="型号：<%#DataBinder.Eval(Container.DataItem,"xinghao")%>"><a href="<%#GetUrl(DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString())%>" target=_blank><span <asp:Literal text="style='color:#cccccc'" runat="server" visible='<%#!Get_Bool(DataBinder.Eval(Container.DataItem,"show").ToString())%>' />><%#Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%></span></a></td>
                  <td height=25  width=10%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"sort1")%></td>
                  <td height=25  width=10%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"sort2")%></td>
                  <td height=25  width=10%  class=tdstyle title="<%#DataBinder.Eval(Container.DataItem,"thedate")%>"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></td>
                  <td height=25  width=10%  class=tdstyle><asp:Label runat="server" Text="推荐品"  visible='<%#Get_Bool(DataBinder.Eval(Container.DataItem,"tuijian").ToString())%>' CssClass="redfont" /><asp:Label runat="server" Text=" 新产品"  visible='<%#Get_Bool(DataBinder.Eval(Container.DataItem,"new").ToString())%>' CssClass="redfont" /></td>
                  <td height=25  width=7%   class=tdstyle><a href='member_info.aspx?username=<%#DataBinder.Eval(Container.DataItem,"username")%>'><%#DataBinder.Eval(Container.DataItem,"username")%></a></td> 
                  <td height=25  width=38%  class=tdstyle >
<asp:LinkButton runat="server" Text="取消推荐"   OnCommand="Prod_Set"  CommandName="qxtj"  CommandArgument='<%#DataBinder.Eval(Container.DataItem,"id")%>'   visible='<%#Get_Bool(DataBinder.Eval(Container.DataItem,"tuijian").ToString())%>' />
<asp:LinkButton runat="server" Text="推荐"       OnCommand="Prod_Set"  CommandName="settj"   CommandArgument='<%#DataBinder.Eval(Container.DataItem,"id")%>'   visible='<%#!Get_Bool(DataBinder.Eval(Container.DataItem,"tuijian").ToString())%>' />

<asp:LinkButton runat="server" Text="取消新品"   OnCommand="Prod_Set"  CommandName="qxnew" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"id")%>'   visible='<%#Get_Bool(DataBinder.Eval(Container.DataItem,"new").ToString())%>' />
<asp:LinkButton runat="server" Text="设为新品"   OnCommand="Prod_Set"  CommandName="setnew"  CommandArgument='<%#DataBinder.Eval(Container.DataItem,"id")%>'   visible='<%#!Get_Bool(DataBinder.Eval(Container.DataItem,"new").ToString())%>' />

<asp:LinkButton runat="server" Text="显示" forecolor="#ff0000"  OnCommand="Prod_Set"      CommandName="show"   CommandArgument='<%#DataBinder.Eval(Container.DataItem,"id")%>'   visible='<%#!Get_Bool(DataBinder.Eval(Container.DataItem,"show").ToString())%>' />
<asp:LinkButton runat="server" Text="隐藏"  OnCommand="Prod_Set"      CommandName="hide"   CommandArgument='<%#DataBinder.Eval(Container.DataItem,"id")%>'   visible='<%#Get_Bool(DataBinder.Eval(Container.DataItem,"show").ToString())%>' />

<a href='product_3.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>&prod1id=<%#DataBinder.Eval(Container.DataItem,"sort1id")%>&prod2id=<%#DataBinder.Eval(Container.DataItem,"sort2id")%>''>编辑</a> 
<asp:LinkButton Text="删除"  id="Delete"   OnCommand="S_Data_Delete"   CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" />
<input type="checkbox" id="CK" Name="CK" Value="<%#DataBinder.Eval(Container.DataItem,"id")%>">
</td>         
                </tr>
                </table>
             </ItemTemplate>
          </asp:DataList>
<br>
<div align=right>
<input type="button" class="button" value="反选" onclick="CheckBox_Inverse('CK')"/>
<input type="button" class="button" value="删除" onclick="P_Delete()"/>
</div>
<br>

        共<asp:Label id="Lblrecordcount"  runat="server" />条记录&nbsp;
当前页次: <asp:Label id="Lblcurrentpage"  runat="server" />/<asp:Label id="LblpageCount"  runat="server" />&nbsp;
<asp:Button  text="上一页"  id="LblPrev"  class=button runat="server"  CommandName="Prev"  OnCommand="Page_Onclick" />&nbsp;
<asp:Button  text="下一页"  id="LblNext"  class=button runat="server"  CommandName="Next"  OnCommand="Page_Onclick" />&nbsp;
转到:&nbsp;<asp:DropDownList id="DLpage"  runat="server" AutoPostBack="true" OnSelectedIndexChanged="Page_Onselect" /> 页&nbsp;
</td>
  </tr>
 </table>
 </td>
 </tr>
</table>
</asp:PlaceHolder>
<br>

<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border="0" cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25><b>产品显示</b></td>
 </tr>

<tr>
  <td  height=25  width=80>分类显示：</td>
  <td  height=25 ><asp:DropDownList id="DLprod1" AutoPostBack="true"  OnSelectedIndexChanged="DLprod1_Change" DataTextField="sort_name"  DataValueField="id"   runat="server" />
 <asp:Label id="Lbtishi" Text="产品小类：" runat="server"/><asp:DropDownList id="DLprod2" AutoPostBack="true"  OnSelectedIndexChanged="DLprod2_Change"  DataTextField="sort_name"  DataValueField="id"   runat="server" />
 </td>
</tr>

<tr>
  <td  height=25 >产品名称：</td>
  <td  height=25 ><asp:TextBox id="Sname"    Maxlength=40 runat="server" />
<asp:Button  Text="确定" CssClass="button" runat="server" CommandName="1" OnCommand="PageAdmin_Prod_Search" /></td>
</tr>

<tr>
  <td  height=25>产品型号：</td>
  <td  height=25 ><asp:TextBox id="Sxinghao" Maxlength=40 runat="server" />
<asp:Button  Text="确定" CssClass="button" runat="server" CommandName="2" OnCommand="PageAdmin_Prod_Search" />
</td>
</tr>
</table>
 </td>
 <tr>
</table>
<br>
<asp:Label  runat="server" id="LblSearch" />
</form>
</td>
</tr>
</table>
</center>
<script language="javascript">

function Get_CheckBox(Name)
 {
   var Obj=document.getElementsByName(Name);
   var ID="0";
   for(i=0;i<Obj.length;i++)
     {
      if(Obj[i].checked)
       {
         ID+=","+Obj[i].value;
       }
     }
   return ID.replace("0,","");
 }

function P_Delete()
 { 
  var IDS=Get_CheckBox("CK");
  if(IDS=="0")
   {
     alert("请选择要删除的文章!");
     return;
   }
  else
   {
    if(confirm("确定删除吗"))
     {
      location.href="?prod1id=<%=Prod1id%>&prod2id=<%=Prod2id%>&act=p_delete&ids="+IDS;
     }
   }
 }


</script>
</body>
</html>  



