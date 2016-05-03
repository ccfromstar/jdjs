<% @ Page Language="C#" Inherits="PageAdmin.zdyform_data_2" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="zdydata"/> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<script type="text/javascript" src="/incs/fckeditor/fckeditor.js"></script>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>编辑数据</b></td></tr>
 <tr><td height=10></td></tr>
</table>

<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top  align="left">

<div id="tabdiv">
<ul>
<li id="tab" name="tab"  onclick="showtab_zdyform(0)" style="font-weight:bold">自定义字段</li>
<li id="tab" name="tab"  onclick="showtab_zdyform(1)">预定义字段</li>
</ul>
</div>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td   height=25><b>当前表单</b>：<%=Request.QueryString["fname"]%></td>
 </tr>
</table>
<form name="<%=Form_Table%>" method="post"  Enctype="multipart/form-data">
<div name="tabcontent" id="tabcontent">
<table border=0 cellpadding=5 cellspacing=0  align=center width=95%>
<tr id="Sort_tr">
<td align=left width='100px'>选择类别</td>
<td>
<select id="Sort_1" name="Sort_1" onchange="Sort1_Change(this.selectedIndex,1)">
<option value="0">----请选择大类----</option>
</select>
<select id="Sort_2" name="Sort_2" style="display:none" onchange="Sort2_Change()">
<option value="0">----请选择小类----</option>
</select>
<input type="hidden" id="Sort_1_text" name="Sort_1_text" value="<%=Current_Sort1_Name%>">
<input type="hidden" id="Sort_2_text" name="Sort_2_text" value="<%=Current_Sort2_Name%>">
</td>
</tr>
<%=FormHtml%>
</table>
</div>

<div name="tabcontent" id="tabcontent" style="display:none">
<table border=0 cellpadding=5 cellspacing=0  align=center width=95%>
<tr>
       <td  height=25>发布时间</td>
       <td><input type="text" name="TBtime" id="TBtime" Maxlength=40 size=20  value="<%=TBtime%>" ><a href="javascript:open_calendar('TBtime')"><img src=images/calendar_bnt.gif border=0 height=20 hspace=2 align=absbottom></a>
</td>
<tr>
<td align=left width='100px'>浏览数</td>
<td><input  type='text'  name='Clicks' maxlength='10' size="20"  onkeyup="if(isNaN(this.value))execCommand('undo')"  value="<%=Clicks%>"></td>
</tr>

<tr>
<td align=left width='100px'>SEO标题</td>
<td><input type=text name='Head_Title' Maxlength='150'  size='80' value="<%=Head_Title%>"></td>
</tr>


<tr>
<td align=left width='100px'>SEO关键字</td>
<td><input type=text name='KeyWords' Maxlength='150'  size='80' value="<%=KeyWords%>"></td>
</tr>

<tr>
<td align=left width='100px'>SEO描述</td>
<td><TextArea name='Description' cols='65'  rows='5'><%=Description%></TextArea></td>
</tr>

<tr><td align=left width='100px'>其他设置</td>
<td><select name='Comments_Style' id='Comments_Style'>
<option value=''>==评论功能设置==</option>
<option value='0'>评论关闭</option>
<option value='1'>评论开启(需要审核)</option>
<option value='2'>评论开启(直接显示)</option></select></td>
</tr>
</table>
</div>

<div align=center>
<input type='submit'  class='button' value='提交' onclick="return Check_ZdyForm('<%=Form_Table%>','<%=P_language%>')"> 
<input type='button' value='返回' class='button' onclick="location.href='zdyform_data.aspx?fid=<%=FormId%>&ftable=<%=Form_Table%>&fname=<%=Server.UrlEncode(Form_Name)%>'">
</div>
</form>
<br>
</td>
</tr>
</table>
</center>
</body>
<script language="javascript">
var objtr=document.getElementById("Sort_tr");
var obj1=document.getElementById("Sort_1");
var obj2=document.getElementById("Sort_2");
var   Comments_Style="<%=Comments_Style%>";
document.getElementById("Comments_Style").value=Comments_Style;
var   Sort1_Name="<%=Sort1_Name%>";
var   Sort1_Id="<%=Sort1_Id%>";
var   Sort2_Id="<%=Sort2_Id%>";
var   Sort2_Name="<%=Sort2_Name%>";
var Current_Sort1_Id="<%=Current_Sort1_Id%>";
var Current_Sort2_Id="<%=Current_Sort2_Id%>";

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

  obj1.value=Current_Sort1_Id;
  var SelectedIndex=obj1.selectedIndex;

  Sort1_Change(SelectedIndex,0);
  obj2.value=Current_Sort2_Id;

 }
else
 {
   obj1.style.display="none";
   objtr.style.display="none";
 }



function Sort1_Change(I,changesort2)
 {
  if(changesort2==1)
   {
    document.getElementById("Sort_1_text").value=obj1.options[obj1.selectedIndex].text;
    document.getElementById("Sort_2_text").value="";
   }

  if(I=="0")
   {
     obj2.options.length=1; 
     obj2.style.display="none";
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
  document.getElementById("Sort_2_text").value=obj2.options[obj2.selectedIndex].text;
 }
</script>
</html>  