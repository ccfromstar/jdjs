<% @  Control Language="c#" Inherits="PageAdmin.mem_articledtl" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 文章编辑</li>
<li class="uc_lanmu_site_2">文章编辑</li>
</ul>
</div>
<div class="uc_lanmu_content">

<form  name="form1" method='post'  Enctype='multipart/form-data'>
<table border=0 cellpadding=5px cellspacing=0  align=center  class="member_table">
<tr>
  <td  height=25 width=100px>文章类别</td>
  <td>
<select id="Sort_1" name="Sort_1" onchange="Sort1_Change(this.selectedIndex,1)">
<option value="0">----请选择类别----</option>
</select>
<select id="Sort_2" name="Sort_2" style="display:none" onchange="Sort2_Change()">
<option value="0">----请选择子类别----</option>
</select>
<input type="hidden" id="Sort_1_text" name="Sort_1_text" value="<%=Sort1%>"><input type="hidden" id="Sort_2_text" name="Sort_2_text" value="<%=Sort2%>">
        </td>
     </tr>

      <tr>
          <td  height=25>标题</td>
          <td><input type="textbox"  Name="TBtitle" id="TBtitle" Maxlength="100"  size=60 class="tb" value="<%=Title%>">
        </td>
      </tr>

      <tr>
          <td width=100px height=25 >作者</td>
          <td><input type="textbox" name="TBAuthor" id="TBAuthor"  Maxlength="100"  size=30 class="tb" value="<%=Author%>" >
【<span  onclick="document.getElementById('TBAuthor').value=this.innerHTML" style="cursor:pointer;color:#666666"><%=TrueName%></span>】
【<span  onclick="document.getElementById('TBAuthor').value=this.innerHTML" style="cursor:pointer;color:#666666"><%=UserName%></span>】
【<span  onclick="document.getElementById('TBAuthor').value=this.innerHTML" style="cursor:pointer;color:#666666">佚名</span>】
【<span  onclick="document.getElementById('TBAuthor').value=this.innerHTML" style="cursor:pointer;color:#666666">不详</span>】
        </td>
      </tr>
      <tr>
          <td width=100px height=25 >来源</td>
          <td><input type="textbox" name="TBSource" id="TBSource" Maxlength="100"  size=30 class="tb"  value="<%=Source%>" >
【<span  onclick="document.getElementById('TBSource').value=this.innerHTML" style="cursor:pointer;color:#666666">本站</span>】
        </td>
      </tr>

      <tr>
          <td  height=25 >发布时间</td>
          <td><input type="textbox"   name="TBtime" id="TBtime"  Maxlength=30 size=25 value="<%=TBtime%>"   class="tb"><a href="javascript:open_calendar('TBtime')"><img src=/images/public/calendar_bnt.gif border=0 height=20 hspace=2 align=absbottom></a></td>
     </tr>

      <tr style="display:<%=Upload_Show%>">
          <td  height=25 >文章图片</td>
          <td>
            <input type="file" name="UploadFile"  size=40 class="tb">&nbsp;<%=Upload_View%>
             <input type="hidden" name="UploadPath"  size=40 value="<%=UploadPath%>">
             <input type="hidden" name="ThumbnailPath"  size=40 value="<%=ThumbnailPath%>">
          </td>
      </tr>

      <tr>
          <td width=100px height=25 >seo标题</td>
          <td><input type="textbox" name="TBHeadTitle" Maxlength="100"  size=60 class="tb" value="<%=Head_Title%>">
        </td>
      </tr>


      <tr>
          <td width=100px height=25 >seo关键字</td>
          <td><input type="textbox" name="TBkeywords" Maxlength="100"  size=60 class="tb" value="<%=Keywords%>">
        </td>
      </tr>
      <tr>
          <td width=100px height=25 >seo描述(200字以内)</td>
          <td><Textarea name="TBdescription"  Cols="55"  rows="5" onkeyup="if(this.value.length>200){this.value=this.value.substring(0,200)}" class="tb"><%=Description%></Textarea>
        </td>
      </tr>


   <tr>
          <td>文章简介</td>
          <td>
<Textarea type="textbox" id="Introduct" name="Introduct" ><%=Introduct%></Textarea>
<script type="text/javascript" src="/incs/fckeditor/fckeditor.js"></script>
<script  type="text/javascript"> 
var FCKeditor = new FCKeditor("Introduct"); 
FCKeditor.BasePath = "/incs/fckeditor/"; 
FCKeditor.Height = 150; 
FCKeditor.Config['LinkBrowser'] = false ;
FCKeditor.Config['ImageBrowser'] =false ;
FCKeditor.Config['FlashBrowser'] = false ;
FCKeditor.Config['LinkUpload'] = true ;
FCKeditor.Config['ImageUpload'] = true ;
FCKeditor.Config['FlashUpload'] = true ;
FCKeditor.ToolbarSet ="Simple"; 
FCKeditor.ReplaceTextarea(); 
</script>
          </td>
      </tr>

      <tr>
          <td>文章内容</td>
          <td>
<Textarea type="textbox" id="Content" name="Content" ><%=Content%></Textarea>
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
          <td   height=25 colspan=2 align=center>
<input type="hidden" name="tijiao"  value="yes">
<input type="submit"   value="提交"   class="bt" onclick="return Check_Information_Form()" style="display:<%=Edit_Show%>">&nbsp;&nbsp;
<input type="button" value=" 返 回 "    class="bt" onclick="location.href='<%=Get_Url("mem_articlelst")%>'"/>
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
 }


//初始化
obj1.value="<%=Sort1Id%>";
var SelectedIndex=obj1.selectedIndex;
Sort1_Change(SelectedIndex,0);
obj2.value=<%=Sort2Id%>;
//初始化结束

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