<% @ Page Language="C#" Inherits="PageAdmin.zdymodel_2" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="zdyform_2"/> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>自定义模型</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">
<form runat="server" >
<div id="tabdiv">
<ul>
<li id="tab" name="tab"  onclick="showtab(0,1)" style="font-weight:bold">导航模型</li>
<li id="tab" name="tab"  onclick="showtab(1,1)">模块模型</li>
<li id="tab" name="tab"  onclick="showtab(2,1)">子栏目模型</li>
<li id="tab" name="tab"  onclick="showtab(3,1)">数据页模型</li>
<li id="tab" name="tab"  onclick="showtab(4,1)">搜索显示模型</li>
</ul>
</div>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
   <table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
    <tr>
    <td colspan="3"><b>模型名称：</b><%=Request.QueryString["name"]%></td>
   </tr>
   <tr>
    <td width=100px >字段调用</td>
    <td width=150px align=left>
    <select Name="Fields" id="Fields" size="8"  onclick="Get_FieldUse(this.options[this.selectedIndex].value)">
     <option value="id" style="background-color:#cccccc">以下为可能用到的预定义字段</option>
     <option value="sort1">sort1(大类)</option>
     <option value="sort2">sort2(小类)</option>
     <option value="head_title">head_title(seo标题)</option>
     <option value="keywords">keywords(seo关键字)</option>
     <option value="description">description(seo描述)</option>
     <option value="clicks">clicks(浏览次数)</option>
     <option value="thedate">thedate(发布时间)</option>
     <option value="ip">ip(发布IP)</option>
     <option style="background-color:#cccccc">以下为用户自定义字段</option>
    </select>
   </td>
    <td align=left>数据区字段值调用语法：<input type="Text" size="55" id="Field_Use" maxlength="200"></td>
   </tr>
   </table>

   <div name="tabcontent" id="tabcontent">
    <table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
     <tr><td width="100px">模型头部</td>
     <td><TextArea name="Nav_head_model"  Cols="80" rows="8" ><%=Nav_head_model%></TextArea></td>
     </tr>
     <tr><td width="100px">数据列表区<span style="color:#ff0000">*</span></td>
     <td><TextArea name="Nav_list_model"  Cols="80" rows="15" ><%=Nav_list_model%></TextArea></td>
     </tr>
     <tr><td width="100px">模型底部</td>
     <td><TextArea name="Nav_bottom_model"  Cols="80" rows="8" ><%=Nav_bottom_model%></TextArea></td>
     </tr>
    </table>
   </div>

   <div name="tabcontent" id="tabcontent" style="display:none">
    <table border=0 cellpadding=0 cellspacing=5 width=95% align=center>

     <tr><td width="100px">模型头部</td>
     <td><TextArea name="Template_head_model"  Cols="80" rows="8" ><%=Template_head_model%></TextArea></td>
     </tr>
     <tr><td width="100px">数据列表区<span style="color:#ff0000">*</span></td>
     <td><TextArea name="Template_list_model"  Cols="80" rows="15" ><%=Template_list_model%></TextArea></td>
     </tr>
     <tr><td width="100px">模型底部</td>
     <td><TextArea name="Template_bottom_model"  Cols="80" rows="8" ><%=Template_bottom_model%></TextArea></td>
     </tr>
    </table>
   </div>

   <div name="tabcontent" id="tabcontent" style="display:none">
    <table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
     <tr><td width="100px">模型头部</td>
     <td><TextArea name="Lanmu_head_model"  Cols="80" rows="8" ><%=Lanmu_head_model%></TextArea></td>
     </tr>
     <tr><td width="100px">数据列表区<span style="color:#ff0000">*</span></td>
     <td><TextArea name="Lanmu_list_model"  Cols="80" rows="15" ><%=Lanmu_list_model%></TextArea></td>
     </tr>
     <tr><td width="100px">模型头部</td>
     <td><TextArea name="Lanmu_bottom_model"  Cols="80" rows="8" ><%=Lanmu_bottom_model%></TextArea></td>
     </tr>
    </table>
   </div>

   <div name="tabcontent" id="tabcontent" style="display:none">
    <table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
     <tr><td width="100px">模型头部</td>
     <td><TextArea name="Detail_head_model"  Cols="80" rows="8" ><%=Detail_head_model%></TextArea></td>
     </tr>
     <tr><td width="100px">数据显示区</td>
     <td><TextArea name="Detail_model"  Cols="80" rows="20" ><%=Detail_model%></TextArea></td>
     </tr>
     <tr><td width="100px">模型头部</td>
     <td><TextArea name="Detail_Bottom_model"  Cols="80" rows="8" ><%=Detail_bottom_model%></TextArea></td>
     </tr>
    </table>
   </div>

 <div name="tabcontent" id="tabcontent" style="display:none">
    <table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
     <tr><td width="100px">模型头部</td>
     <td><TextArea name="Search_head_model"  Cols="80" rows="8" ><%=Search_head_model%></TextArea></td>
     </tr>
     <tr><td width="100px">数据显示区</td>
     <td><TextArea name="Search_list_model"  Cols="80" rows="20" ><%=Search_list_model%></TextArea></td>
     </tr>
     <tr><td width="100px">模型头部</td>
     <td><TextArea name="Search_Bottom_model"  Cols="80" rows="8" ><%=Search_bottom_model%></TextArea></td>
     </tr>
    </table>
   </div>
</td>
</tr>
</table>
<br>
<div align=left>注：字段只能在数据区调用</div>
</td>
</tr>
</table>
<div align="center">
<asp:Button cssclass="button"  Text="保存" onclick="PageAdmin_Data_Update" Runat="server" />
<input type="button" class=button  value="返回"  onclick="location.href='zdymodel_1.aspx'">
</div>
<br>
</form>
</center>
<script language="javascript">
var Field_Names="<%=Field_Names%>"
var Fields_Titles="<%=Fields_Titles%>"
var AField_Names=Field_Names.split(',');
var AFields_Titles=Fields_Titles.split(',');
var obj=document.getElementById("Fields");
for(var i=0;i<AField_Names.length-1;i++)
 {
   obj.options.add(new Option(AField_Names[i]+"("+AFields_Titles[i]+")",AField_Names[i]));
 }


function Get_FieldUse(Vars)
 {
   var obj=document.getElementById("Field_Use");
   if(Vars!="")
    {
      obj.value="<"+"%#DataBinder.Eval(Container.DataItem,\""+Vars+"\")%"+">";
    }
 }
</script>
</body>
<script language="javascript">
var C_Tab="<%=Request.QueryString["tab"]%>";
if(C_Tab!="")
 {
   showtab(C_Tab,0);
 }   
</script>
</html>  



