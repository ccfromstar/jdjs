<% @ Page Language="C#" Inherits="PageAdmin.information_1" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="article_2" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>文章明细管理</b></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">

<form runat="server" >
<asp:PlaceHolder id="Holder1" runat="server" Visible="false">
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  width=50% height=25><b>文章明细管理</b></td>
  <td width=50%  height=25 align=right></td>
 </tr>
</table>
    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2 height=25>

          <asp:DataList id="dtl1" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0 
          OnItemDataBound="PageAdmin_Data_Bound">  
            <headerTemplate>
               <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td height=25 align=center width=28%  class=white >标题</td>
                  <td height=25 align=center width=8%  class=white >大类</td>
                  <td height=25 align=center width=8%  class=white >小类</td>
                  <td height=25 align=center width=10%  class=white >日期</td>
                  <td height=25 align=center width=10%  class=white >备注</td>
                  <td height=25 align=center width=6%  class=white >会员</td>
                  <td height=25 align=center width=30%  class=white >操作</td>
                </tr>
                </table>
            </headerTemplate>
             <ItemTemplate>
              <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle style="table-layout:fixed;">
               <tr>
                  <td height=25  width=28%  class=tdstyle><%#Get_Image(DataBinder.Eval(Container.DataItem,"upload").ToString())%><a href="<%#GetUrl(DataBinder.Eval(Container.DataItem,"id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu1id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu3id").ToString())%>" target=_blank><span <asp:Literal text="style='color:#cccccc'" runat="server" visible='<%#!Get_Bool(DataBinder.Eval(Container.DataItem,"show").ToString())%>' />><%#Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"title").ToString())%></span></a></td>
                  <td height=25  width=8%  align=center class=tdstyle><%#DataBinder.Eval(Container.DataItem,"sort1").ToString()%></td>
                  <td height=25  width=8%  align=center class=tdstyle><%#DataBinder.Eval(Container.DataItem,"sort2").ToString()%></td>      
                  <td height=25  width=10%  align=center class=tdstyle title="<%#DataBinder.Eval(Container.DataItem,"thedate")%>"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></td>
                  <td height=25  width=10%  class=tdstyle>
<asp:Label runat="server" Text="推荐"  style="color:#ff0000"  visible='<%#Get_Bool(DataBinder.Eval(Container.DataItem,"tuijian").ToString())%>' />
<asp:Label runat="server" Text="专题"  style="color:#0066FF"  visible='<%#Get_Bool(DataBinder.Eval(Container.DataItem,"zhuanti").ToString())%>' />
                  </td>
                  <td height=25 align=center width=6%   class=tdstyle><a href='member_info.aspx?username=<%#DataBinder.Eval(Container.DataItem,"username")%>'><%#DataBinder.Eval(Container.DataItem,"username")%></a></td>
                  <td height=25  width=30%   class=tdstyle >
<asp:LinkButton runat="server" Text="取消推荐"   OnCommand="infor_Set"  CommandName="qxtj"  CommandArgument='<%#DataBinder.Eval(Container.DataItem,"id")%>'    visible='<%#Get_Bool(DataBinder.Eval(Container.DataItem,"tuijian").ToString())%>' />
<asp:LinkButton runat="server" Text="推荐"   OnCommand="infor_Set"      CommandName="settj"   CommandArgument='<%#DataBinder.Eval(Container.DataItem,"id")%>'   visible='<%#!Get_Bool(DataBinder.Eval(Container.DataItem,"tuijian").ToString())%>' />

<asp:LinkButton runat="server" Text="取消专题"   OnCommand="infor_Set"  CommandName="qxzt"  CommandArgument='<%#DataBinder.Eval(Container.DataItem,"id")%>'    visible='<%#Get_Bool(DataBinder.Eval(Container.DataItem,"zhuanti").ToString())%>' />
<asp:LinkButton runat="server" Text="专题"   OnCommand="infor_Set"      CommandName="setzt"   CommandArgument='<%#DataBinder.Eval(Container.DataItem,"id")%>'   visible='<%#!Get_Bool(DataBinder.Eval(Container.DataItem,"zhuanti").ToString())%>' />

<asp:LinkButton runat="server" Text="显示" forecolor="#ff0000"  OnCommand="infor_Set"      CommandName="set_Show"   CommandArgument='<%#DataBinder.Eval(Container.DataItem,"id")%>'   visible='<%#!Get_Bool(DataBinder.Eval(Container.DataItem,"show").ToString())%>' />
<asp:LinkButton runat="server" Text="隐藏"  OnCommand="infor_Set"      CommandName="set_Hide"   CommandArgument='<%#DataBinder.Eval(Container.DataItem,"id")%>'   visible='<%#Get_Bool(DataBinder.Eval(Container.DataItem,"show").ToString())%>' />

<a href='information_3.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>&infor1id=<%#DataBinder.Eval(Container.DataItem,"sort1id")%>&infor2id=<%#DataBinder.Eval(Container.DataItem,"sort2id")%>&username=<%#Request.QueryString["username"]%>&check=<%#Request.QueryString["check"]%>'>编辑</a> 
<asp:LinkButton Text="删除"  id="Delete"  OnCommand="S_Data_Delete"  CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" />
<input type="checkbox" id="CK" Name="CK" Value="<%#DataBinder.Eval(Container.DataItem,"id")%>">
</td>         

                </tr>
                </table>
             </ItemTemplate>
          </asp:DataList>
<br>
<div align=right>
<input type="button" class="button" value="删除" onclick="P_Delete()"/>
<input type="button" class="button" value="反选" onclick="CheckBox_Inverse('CK')"/>
</div>
<div align=left>

        共<asp:Label id="Lblrecordcount"  Text=0 runat="server" />条记录 
&nbsp;当前页次: <asp:Label id="Lblcurrentpage"  runat="server" />/<asp:Label id="LblpageCount"  runat="server" />&nbsp;
<asp:Button  text="上一页"  id="LblPrev"  class=button runat="server"  CommandName="Prev"   OnCommand="Bt_Click" />&nbsp;
<asp:Button  text="下一页"  id="LblNext"  class=button runat="server"  CommandName="Next"   OnCommand="Bt_Click" />&nbsp;
转到:&nbsp;<asp:DropDownList id="DLpage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Page_Changed"  /> 页&nbsp;
</div>
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


<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  height=25><b>文章显示</b></td>
 </tr>
<tr>
  <td  height=25>分类显示：
<asp:DropDownList id="Dl_Infor1" runat="server" DataTextField="sort_name" DataValueField="id"  AutoPostBack="true" OnSelectedIndexChanged="Infor1_Changed" />
<asp:Label id="LbTishi1" Text=" 文章小类：" Visible="false"  runat="server"/>
<asp:DropDownList id="Dl_Infor2" runat="server" Visible="false"  DataTextField="sort_name" DataValueField="id" AutoPostBack="true" OnSelectedIndexChanged="Infor2_Changed"/>
</td>
</tr>
<tr>
<td  height=25 >文章标题：<asp:TextBox id="Sname" Size="30" Maxlength=40 runat="server" />
<asp:Button  Text="确定" CssClass="button" runat="server" onclick="Title_Search" />
<asp:Label id="Lberror" runat="server" />
</td>
</tr>
</table>
 </td>
 <tr>
</table>
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
      location.href="?infor1id=<%=Infor1id%>&infor2id=<%=Infor2id%>&act=p_delete&ids="+IDS;
     }
   }
 }


</script>
</body>
</html>  



