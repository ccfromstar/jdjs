<% @  Control Language="c#" Inherits="PageAdmin.mem_prodadd" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 发布产品</li>
<li class="uc_lanmu_site_2">发布产品</li>
</ul>
</div>
<div class="uc_lanmu_content">
<form  name="form1" method='post'  Enctype='multipart/form-data'>

<table border=0 cellpadding=5px cellspacing=0  align=center class="member_table">
<tr>
  <td  height=25 width=100px>产品类别</td>
         <td>
<select id="Sort_1" name="Sort_1" onchange="Sort1_Change(this.selectedIndex)">
<option value="0">----请选择类别----</option>
</select>
<select id="Sort_2" name="Sort_2" style="display:none" onchange="Sort2_Change()">
<option value="0">----请选择子类别----</option>
</select>
<input type="hidden" id="Sort_1_text" name="Sort_1_text"><input type="hidden" id="Sort_2_text" name="Sort_2_text">
        </td>
      </tr> 

      <tr>
          <td  height=25 >产品名称 <span style="color:#ff0000">*</span></td>
          <td><input type="text" name="TBname" id="TBname" Maxlength=50 size=40 class="tb"></td>
      </tr>
      <tr>
          <td  height=25 >产品型号</td>
          <td ><input type="text" name="TBxinghao" Maxlength=40 size=40 class="tb"></td>
      </tr>
</tr>  
     <tr>
          <td  height=25 >产品价格</td>
          <td><input type="text" name="TBprice"   Maxlength=15 size=10 value="0" onkeyup="if(isNaN(value))execCommand('undo')" class="tb"> 单位：<input type="text" name="TBunit"  Maxlength=15 size=6 value="<%=Unit%>" class="tb">
          <input type="button" value="会员价" class=bt onclick="ShowObj('M_Table')">
        <br>
      <div id="M_Table"  style="display:none"> 
      <asp:Repeater id="P1" runat="server">
     <ItemTemplate>
     <ul title="<%#DataBinder.Eval(Container.DataItem,"m_type")%>价格">
      <li>
        <input type="hidden" name="TBMtypeid"   value="<%#DataBinder.Eval(Container.DataItem,"id")%>">
        <input type="text" name="TBMprice"     Maxlength=15 size=10 value="0" onkeyup="if(isNaN(value))execCommand('undo')" class="tb"> <%#DataBinder.Eval(Container.DataItem,"m_type")%>
     </li>
     </ul>
     </ItemTemplate>
    </asp:Repeater>
   </div>

         </td>
      </tr>  

<tr>
       <td  height=25>发布时间</td>
       <td><input type="text"  name="TBtime" id="TBtime"  Maxlength=40 size=20  value="<%=TBtime%>"  class="tb"><a href="javascript:open_calendar('TBtime')"><img src=/images/public/calendar_bnt.gif border=0 height=20 hspace=2 align=absbottom></a>
</td>

     <tr>
          <td  height=25 >产品图片 <span style="color:#ff0000">*</span></td>
          <td><input type="file"  size=40  name="Upload" id="Upload" class="tb"></td>
      </tr> 
 
      <tr>
          <td width=100px height=25 >seo标题</td>
          <td><input type="textbox" name="TBHeadTitle" Maxlength="100"  size=60 class="tb">
        </td>
      </tr>

      <tr>
          <td  height=25 >seo关键字</td>
          <td><input  type="text" name="TBkeywords" Maxlength="100"  size=60 class="tb">
        </td>
      </tr>
      <tr>
          <td height=25 >seo描述</td>
          <td><textarea name="TBdescription" Cols="55"  rows="5" onkeyup="if(this.value.length>250){this.value=this.value.substring(0,250)}" class="tb"></textarea>
        </td>
      </tr>

     <tr>
          <td>产品简介</td>
          <td>
            <textarea name="Introduct" id="Introduct"></textarea>
<script type="text/javascript" src="/incs/fckeditor/fckeditor.js"></script>
<script  type="text/javascript"> 
var FCKeditor = new FCKeditor("Introduct"); 
FCKeditor.BasePath = "/incs/fckeditor/"; 
FCKeditor.Height = 150; 
FCKeditor.Config['LinkBrowser'] = false;
FCKeditor.Config['ImageBrowser'] =false;
FCKeditor.Config['FlashBrowser'] = false;
FCKeditor.Config['LinkUpload'] = true;
FCKeditor.Config['ImageUpload'] = true;
FCKeditor.Config['FlashUpload'] = true;
FCKeditor.ToolbarSet ="Simple"; 
FCKeditor.ReplaceTextarea(); 
</script>
          </td>
      </tr> 

      <tr>
          <td>详细介绍</td>
          <td>
            <textarea name="Content" id="Content"></textarea>
<script type="text/javascript" src="/incs/fckeditor/fckeditor.js"></script>
<script  type="text/javascript"> 
var FCKeditor = new FCKeditor("Content"); 
FCKeditor.BasePath = "/incs/fckeditor/"; 
FCKeditor.Height = 400; 
FCKeditor.Config['LinkBrowser'] = false ;
FCKeditor.Config['ImageBrowser'] =false ;
FCKeditor.Config['FlashBrowser'] = false ;
FCKeditor.Config['LinkUpload'] = true ;
FCKeditor.Config['ImageUpload'] = true ;
FCKeditor.Config['FlashUpload'] = true ;
FCKeditor.ToolbarSet ="Basic"; 
FCKeditor.ReplaceTextarea(); 
</script>
          </td>
      </tr> 
      <tr>
          <td  height=25 colspan=2 align=center>
<input type="hidden" name="tijiao"  value="yes">
<input type="submit" id="submit" value=" 发 布 "     class="bt" onclick="return Check_Product_Form(1)">
<input type="button" value=" 返 回 "    class="bt" onclick="location.href='<%=Get_Url("mem_prodlst")%>'">
</td>
      <tr>       
    </table>
 </td>
 <tr>
</table>
</form>
</div>
</div>

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
   document.getElementById("submit").disabled="disabled";
 }

function Sort1_Change(I)
 {
  document.getElementById("Sort_1_text").value=obj1.options[obj1.selectedIndex].text;
  document.getElementById("Sort_2_text").value="";

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
