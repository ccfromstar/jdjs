<% @ Page Language="C#" Inherits="PageAdmin.lanmu_3_feedback" %>
<% @ Register TagPrefix="aspcn" TagName="uc_fckeditor" src="/incs/fckeditor/fckeditor.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" />  
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>用户反馈设置</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">

<form runat="server" >
<div id="tabdiv">
<ul>
<li id="tab" name="tab"  onclick="showtab(0,1)" style="font-weight:bold">参数设置</li>
<li id="tab" name="tab"  onclick="showtab(1,1)">页头编辑</li>
<li id="tab" name="tab"  onclick="showtab(2,1)">SEO优化</li>
<li id="tab" name="tab"  onclick="showtab(3,1)">访问权限</li>
</ul>
</div>
<table border=0 cellpadding=5 cellspacing=1 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  colspan=2 height=25><b>当前栏目</b>：<%=Request.QueryString["lanmu1"]%> > <%=Request.QueryString["lanmu2"]%> > <%=Request.QueryString["lanmu3"]%></td>
 </tr>
</table>

<div name="tabcontent" id="tabcontent">
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td  width="100px" height="25px">显示样式</td>
  <td><asp:DropDownList id="Show_style" runat="server">
     <asp:ListItem value="0">反馈表单</asp:ListItem>
     <asp:ListItem value="1">留言本</asp:ListItem>
   </asp:DropDownList></td>
 </tr>

<tr>
  <td  width="100px" height="25px">显示审核</td>
  <td><asp:DropDownList id="Show_check" runat="server">
     <asp:ListItem value="0">无需审核</asp:ListItem>
     <asp:ListItem value="1">需审核</asp:ListItem>

   </asp:DropDownList></td>
 </tr>

<tr>
  <td  width="100px" height="25px">屏蔽关键字</td>
  <td><asp:TextBox id="I_keyword" TextMode="multiLine" Columns="60" rows="6" runat="server" /></td>
 </tr>

<tr>
  <td  height=25 >每页显示</td>
  <td><asp:TextBox id="Show_num" runat="server"  Maxlength="3" size="5" /> 条数据
<asp:RequiredFieldValidator   ControlToValidate="Show_num" display="Dynamic" type="integer"  runat="server">
不能为空</asp:RequiredFieldValidator>
<asp:RangeValidator   ControlToValidate="Show_num" display="Static" type="integer" MinimumValue="1" MaximumValue="100" runat="server">
请输入1—100之间的数字</asp:RangeValidator></td>
 </tr>
</table>
</div>

<div name="tabcontent" id="tabcontent" style="display:none">
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td width=60px><b>内容编辑</b></td>
  <td><asp:TextBox  id="Content"  TextMode="MultiLine"  runat="server" />
      <aspcn:uc_fckeditor  Tb_Id="Content" Fck_Height="400" Fck_Style="Normal" runat="server"/>
  </td>
 </tr>
</table>
</div>


<div name="tabcontent" id="tabcontent"  style="display:none">
<table border=0 cellpadding=5 cellspacing=2 width=95% align=center>
<tr>
  <td align="left"  width=60px>标题</td>
  <td align="left" ><asp:textBox TextMode="singleLine"  id="tb_title" runat="server" size=80 maxlength="150"  />
</td>
 </tr>

<tr>
  <td align="left">关键字</td>
 <td align="left" title="关键字之间用半角逗号分开"><asp:textBox TextMode="singleLine"  id="tb_keywords" runat="server" size=80 maxlength="150"  />
</td>
 </tr>

<tr>
  <td align="left" >描述</td>
 <td align="left" title="控制在250字以内"><asp:TextBox TextMode="multiLine" Columns="70" rows="6"  id="tb_description"    runat="server" onkeyup="if(this.value.length>250)this.value=this.value.substring(0,250)"/>
</td>
 </tr>
</table>
</div>

<div name="tabcontent" id="tabcontent" style="display:none">
 <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>

    <tr>
        <td height=25  width="100px">栏目访问权限</td>
       <td>
        <input type="checkbox" name="Visiter_all" id="Visiter_0" value="0"  onclick="select_all()">所有来访者<br>
        <asp:Repeater id="P1" runat="server">
         <ItemTemplate>
           <input type="checkbox" name="Visiter" id="Visiter_<%#DataBinder.Eval(Container.DataItem,"id")%>" value="<%#DataBinder.Eval(Container.DataItem,"id")%>" ><%#DataBinder.Eval(Container.DataItem,"m_type")%>&nbsp;
         </ItemTemplate>
        </asp:Repeater>
      </td>
     </tr>
     <tr>
     <td height=25  width="100px">未登陆用户提示</td>
       <td><TextArea Name="Tishi_1" Cols="50" rows="5"   onkeyup="if(this.value.length>150)this.value=this.value.substring(0,150)"><%=Tishi_1%></TextArea></td>
     </tr>
     <tr>
     <td height=25  width="100px">无权限用户提示</td>
       <td><TextArea Name="Tishi_2" Cols="50" rows="5"  onkeyup="if(this.value.length>150)this.value=this.value.substring(0,150)"><%=Tishi_2%></TextArea></td>
     </tr>
  </table>
<br>注：用户提示处留空则默认系统预设提示,可自定义JS代码,总长度不要超过150个字符。
<script Language="javascript">
var Visitor="<%=Visitor%>";
var AVisitor=Visitor.split(',');
if(Visitor=="" || Visitor=="0")
 {
   document.getElementById("Visiter_0").checked=true;
   lock_mem_check();
 }
else
 {
   for(i=0;i<AVisitor.length;i++)
    {
      try{
         document.getElementById("Visiter_"+AVisitor[i]).checked=true;
         }
       catch(ex)
         {
         }
    }
 }

function lock_mem_check()
 {
  for(i=0;i<document.forms[0].Visiter.length;i++)
     {
       document.forms[0].Visiter[i].checked=true;
       document.forms[0].Visiter[i].disabled=true;
    }
 }

function unlock_mem_check()
 {
  for(i=0;i<document.forms[0].Visiter.length;i++)
     {
       document.forms[0].Visiter[i].checked=false;
       document.forms[0].Visiter[i].disabled=false;
    }
 }

function select_all()
 {
   var obj=document.getElementById("Visiter_0");
   if(obj.checked)
    {
      lock_mem_check();
    }
   else
    {
     unlock_mem_check()
    }
 }
</script>
</div>

<br>
<div align=center>
<asp:Button      Cssclass=button   text="提交"   runat="server" onclick="PageAdmin_Data_Update" />
<input type="button" class=button  value="返回"  onclick="location.href='lanmu_3.aspx?lanmu1id=<%=Request.QueryString["lanmu1id"]%>&lanmu1=<%=Server.UrlEncode(Request.QueryString["lanmu1"])%>&lanmu2id=<%=Request.QueryString["lanmu2id"]%>&lanmu2=<%=Server.UrlEncode(Request.QueryString["lanmu2"])%>&lanmu2xuhao=<%=Request.QueryString["lanmu2xuhao"]%>&thetype=normal'">             
</div>

</td>
</tr>
</table>
<br>
注：屏蔽关键字之间用","分开,长度控制在250字符以内。
</form>
</td>
</tr>
</table>
</center>
</body>
<script language="javascript">
var C_Tab="<%=Request.QueryString["tab"]%>";
if(C_Tab!="")
 {
   showtab(C_Tab,0);
 }   
</script>
</html>  

