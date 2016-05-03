<% @  Control Language="c#" Inherits="PageAdmin.mem_fmdtl" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; <%=Form_Name%></li>
<li class="uc_lanmu_site_2"><%=Form_Name%></li>
</ul>
</div>
<div class="uc_lanmu_content">
<form name='<%=Form_Table%>' method='post'  Enctype='multipart/form-data'>

<table border=0 cellpadding=5px cellspacing=0  align=center class="member_table">
<tr id="Sort_tr">
<td align=left width='100px'>选择类别</td>
<td>
<select id="Sort_1" name="Sort_1" onchange="Sort1_Change(this.selectedIndex,1)">
<option value="0">----请选择类别----</option>
</select>
<select id="Sort_2" name="Sort_2" style="display:none" onchange="Sort2_Change()">
<option value="0">----请选择子类别----</option>
</select>
<input type="hidden" id="Sort_1_text" name="Sort_1_text" value="<%=Current_Sort1_Name%>">
<input type="hidden" id="Sort_2_text" name="Sort_2_text" value="<%=Current_Sort2_Name%>">
</td>
</tr>
<%=FormHtml%>

</table>
<div align=center style="padding:5px 0 5px 0">
<input type='submit'  class='bt' value='提交' onclick="return Check_ZdyForm('<%=Form_Table%>','<%=P_language%>',1)" style="display:<%=Edit_Show%>"> 
<input type="button" value=" 返 回 "    class="bt" onclick="location.href='<%=Get_Url("mem_fmlst")%>'">
</div>
</form>

</div>
</div>
<script language="javascript">
var objtr=document.getElementById("Sort_tr");
var obj1=document.getElementById("Sort_1");
var obj2=document.getElementById("Sort_2");


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
 }
else
 {
   obj1.style.display="none";
   objtr.style.display="none";
 }

obj1.value=Current_Sort1_Id;
var SelectedIndex=obj1.selectedIndex;
Sort1_Change(SelectedIndex,0);
obj2.value=Current_Sort2_Id;

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
