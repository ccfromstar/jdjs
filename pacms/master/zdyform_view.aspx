<% @ Page Language="C#" Inherits="PageAdmin.zdyform_view" %>
<% @ Register TagPrefix="aspcn" TagName="uc_fckeditor" src="/incs/fckeditor/fckeditor.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="zdyform_1"/> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>获取表单</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">
<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
<tr>
  <td  width="100px" height=25 align="right"><b>表单名称</b>：<td align="left"><%=Request.QueryString["fname"]%></td>
 </tr>
 <tr><td>表单HTMl代码</td>
  <td><asp:TextBox id="Content" TextMode="MultiLine"  runat="server" />
      <aspcn:uc_fckeditor  Tb_Id="Content" Fck_Height="400" Fck_Style="Default" runat="server"/>
  </td>
   </tr>
  <tr><td colspan=2 height=10px></td></tr>

 <tr>
  <td>搜索HTML代码</td>
  <td><asp:TextBox id="Search" TextMode="MultiLine"  runat="server" />
      <aspcn:uc_fckeditor  Tb_Id="Search" Fck_Height="300" Fck_Style="Default" runat="server"/>
<br>用法：表单modelid的value默认为0，调用时候请改为对应的模型ID。
  </td>
   </tr>

  <tr><td colspan=2 height=10px></td></tr>

  <tr style="display:<%=Show_sort_code%>"><td>分类HTML代码</td>
  <td><textArea cols="80" rows="10">
<select id="Sort_1" name="Sort_1" onchange="Sort1_Change(this.selectedIndex)">
<option value="0">----请选择大类----</option>
</select>
<select id="Sort_2" name="Sort_2" style="display:none" onchange="Sort2_Change()">
<option value="0">----请选择小类----</option>
</select>
<input type="hidden" id="Sort_1_text" name="Sort_1_text">
<input type="hidden" id="Sort_2_text" name="Sort_2_text">
<script language="javascript">
var obj1=document.getElementById("Sort_1");
var obj2=document.getElementById("Sort_2");
var   Sort1_Name="<%=Sort1_Name%>";
var   Sort1_Id="<%=Sort1_Id%>";
var   Sort2_Id="<%=Sort2_Id%>";
var   Sort2_Name="<%=Sort2_Name%>";
if(Sort1_Id!="")
 {

  var  A_Sort1_Id=Sort1_Id.split(',');
  var  A_Sort1_Name=Sort1_Name.split(',');
  var  A_Sort2_Id=Sort2_Id.split('@');
  var  A_Sort2_Name=Sort2_Name.split('@');
  for(var i=0;i<A_Sort1_Id.length-1;i++)
  {
   obj1.options.add(new Option(A_Sort1_Name[i],A_Sort1_Id[i]));
  }
 }
else
 {
   obj1.style.display="none";
   objtr.style.display="none";
 }

function Sort1_Change(I)
 {
 document.getElementById("Sort_1_text").value=obj1.text;
  if(I=="0")
   {
    return false;
   }
  obj2.options.length = 1;   
  var A_Id=A_Sort2_Id[I-1].split(',');
  var A_Name=A_Sort2_Name[I-1].split(',');
  if(A_Id.length==1)
   {
     obj2.style.display="none";
     return false;
   }
  else
   {
     obj2.style.display="";
   }
  for(var i=0;i<A_Id.length-1;i++)
   {
     obj2.options.add(new Option(A_Name[i],A_Id[i]));
   }
 }

function Sort2_Change()
 {
  document.getElementById("Sort_2_text").value=obj2.text;
 }
</script>
   </textArea>
<br>
用法：如果需要用前台显示分类，请将分类代码拷贝到以上表单源代码的&lt;form&gt;&lt;/form&gt;标签之间。
  </td>
   </tr>
</table>
</td>
</tr>
</table>
<br>
注：切换到源代码模式可获取表单代码，在不修改表单项目基础上可自行完善。
</td>
</tr>
</table>
<div align="center">
<input type="button" class=button  value="返回"  onclick="location.href='zdyform_1.aspx'">
</div>
<br>
</form>
</center>
</body>
</html>  



