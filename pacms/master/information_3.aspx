<% @ Page Language="C#" Inherits="PageAdmin.information_3" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="article_3" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>编辑文章</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=100% >
 <tr>
<td valign=top align="left">

<form  name="form1" method='post'  Enctype='multipart/form-data'>
<table border=0 cellpadding=5 cellspacing=0  width=95% align=center  class=table_style2>
<tr>
  <td valign=top>
<table border=0 cellpadding=0 cellspacing=2 width=100% align=center>
<tr>
  <td  colspan=2 height=25><b>增加文章</b></td>
 </tr>
</table>
    <table border=0 cellpadding=2 cellspacing=4 width=100% align=center>
<tr>
         <td  height=25 >文章类别 <span style="color:#ff0000">*</span></td>
         <td>
<select id="Sort_1" name="Sort_1" onchange="Sort1_Change(this.selectedIndex,1)">
<option value="0">----请选择大类----</option>
</select>
<select id="Sort_2" name="Sort_2" style="display:none" onchange="Sort2_Change()">
<option value="0">----请选择小类----</option>
</select>
<input type="hidden" id="Sort_1_text" name="Sort_1_text" value="<%=Sort1%>"><input type="hidden" id="Sort_2_text" name="Sort_2_text" value="<%=Sort2%>">
        </td>
     </tr>

      <tr>
          <td width=100px height=25>标题 <span style="color:#ff0000">*</span></td>
          <td><input type="textbox"  Name="TBtitle" id="TBtitle" Maxlength="100"  size=80 value="<%=TheTitle%>">
        </td>
      </tr>

      <tr>
          <td width=100px height=25 >标题样式</td>
          <td><input type="textbox"  name="TBtitlestyle" id="TBtitlestyle" Maxlength="100"  size=30 value="<%=Title_Style%>"><a href="javascript:foreColor('TBtitlestyle','color:')"><img src=images/color.gif border=0 height=21 align=absbottom></a>
        </td>
      </tr>


      <tr>
          <td width=100px height=25 >作者</td>
          <td><input type="textbox" name="TBAuthor" id="TBAuthor"  Maxlength="100"  size=30 value="<%=Author%>">
【<span  onclick="document.getElementById('TBAuthor').value=this.innerHTML" style="cursor:pointer;color:#666666"><%=Author_UserName%></span>】
【<span  onclick="document.getElementById('TBAuthor').value=this.innerHTML" style="cursor:pointer;color:#666666"><%=Author_TrueName%></span>】
【<span  onclick="document.getElementById('TBAuthor').value=this.innerHTML" style="cursor:pointer;color:#666666">佚名</span>】
【<span  onclick="document.getElementById('TBAuthor').value=this.innerHTML" style="cursor:pointer;color:#666666">不详</span>】
        </td>
      </tr>
      <tr>
          <td width=100px height=25 >来源</td>
          <td><input type="textbox" name="TBSource" id="TBSource" Maxlength="100"  size=30 value="<%=Source%>">
【<span  onclick="document.getElementById('TBSource').value=this.innerHTML" style="cursor:pointer;color:#666666">本站</span>】
【<span  onclick="document.getElementById('TBSource').value=this.innerHTML" style="cursor:pointer;color:#666666">办公室</span>】
【<span  onclick="document.getElementById('TBSource').value=this.innerHTML" style="cursor:pointer;color:#666666">公司</span>】
【<span  onclick="document.getElementById('TBSource').value=this.innerHTML" style="cursor:pointer;color:#666666">集团</span>】
        </td>
      </tr>


      <tr>
          <td  height=25 >发布时间</td>
          <td><input type="textbox"   name="TBtime" id="TBtime" Maxlength=40 size=25 value="<%=TBtime%>" ><a href="javascript:open_calendar('TBtime')"><img src=images/calendar_bnt.gif border=0 height=20 hspace=2 align=absbottom></a></td>
     </tr>
      <tr>
          <td width=100px height=25 >点击数</td>
          <td><input type="textbox" name="TBClicks" Maxlength="20"  size=20  onkeyup="if(isNaN(value))execCommand('undo')" value="<%=Clicks%>" >
        </td>
     <tr>

      <tr>
          <td width=100px height=25 >自定义url</td>
          <td><input type="textbox" name="TBurl" Maxlength="100"  size=50 value="<%=Url%>">
        </td>
      </tr>


      <tr>
          <td  height=25 >文章图片</td>
          <td >
  <select name="Dl_Thumbnail" id="Thumbnail">
     <option value="1">生成缩略图</option>
     <option value="0">关闭缩略图</option>
   </select>
  <select name="Dl_Watermark" id="Watermark">
     <option value="1">增加水印</option>
     <option value="0">关闭水印</option>
   </select>
<input type="file" name="UploadFile"  size=40>&nbsp;<%=Upload_View%>
<input type="hidden" name="UploadPath"  size=40 value="<%=UploadPath%>">
<input type="hidden" name="ThumbnailPath"  size=40 value="<%=ThumbnailPath%>">
</td>
      </tr>

   <tr>
          <td  height=25>SEO标题</td>
          <td><input  type="text" name="TBHeadTitle" Maxlength="100"  size=80 value="<%=Head_Title%>">
        </td>
      </tr>


      <tr>
          <td  height=25>SEO关键字</td>
          <td><input  type="text" name="TBkeywords" Maxlength="100"  size=80 value="<%=Keywords%>">
        </td>
      </tr>
      <tr>
          <td height=25>SEO描述</td>
          <td><textarea name="TBdescription" Cols="65"  rows="5" onkeyup="if(this.value.length>250){this.value=this.value.substring(0,250)}"><%=Description%></textarea>
        </td>
      </tr>


      <tr>
          <td  height=25 style="color:#339900">下载地址</td>
          <td style="color:#339900"><input type="textbox" name="TBdownload" Maxlength=100 size=50 value="<%=DownLoad%>">&nbsp;&nbsp;文件备注 <input type="textbox" name="TBdownload_beizhu" Maxlength=50 size=30 value="<%=DownLoadBeizhu%>"></td>
      </tr>

  <td  height=25>其他设置</td>
  <td>
  <select name="Dl_Show_Style" id="Dl_Show_Style" title="文章样式设置">
     <option  value="">==文章样式设置==</option>
     <option  value="0">普通样式</option>
     <option  value="1">图文样式</option>
     </select>
   <select name="Dl_Comments_Style" id="Dl_Comments_Style" title="评论功能设置">
     <option value="">==评论功能设置==</option>
     <option value="0">评论关闭</option>
     <option value="1">评论开启(需要审核)</option>
     <option value="2">评论开启(直接显示)</option>
     </select>(不选择则默认子栏目中的设置)
</td>
 </tr>
      <tr>
          <td>简介</td>
          <td >
<Textarea type="textbox" id="" name="TBIntro"><%=Introduct%></Textarea>
<script type="text/javascript" src="/incs/fckeditor/fckeditor.js"></script>
<script  type="text/javascript"> 
var FCKeditor = new FCKeditor("TBIntro"); 
FCKeditor.BasePath = "/incs/fckeditor/"; 
FCKeditor.Height = 200; 
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
          <td>内容</td>
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
<input type="submit"   value="提交"   class="button" onclick="return Check_Information_Form()">
<input type="button" value="返回"    class="button" onclick="location.href='information_1.aspx?infor1id=<%=Request.QueryString["infor1id"]%>&infor2id=<%=Request.QueryString["infor2id"]%>&username=<%=Request.QueryString["username"]%>&check=<%=Request.QueryString["check"]%>'"/>
</td>
      <tr>       
    </table>
 </td>
 <tr>
</table>
<br>
</form>
</td>
</tr>
</table>
</center>
<script language="javascript">
var Thumbnail_Open="<%=Thumbnail_Open%>"
var Watermark_Open="<%=Watermark_Open%>";
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

if(Thumbnail_Open=="0")
 {
   document.getElementById("Thumbnail").style.display="none";
 }

if(Watermark_Open=="0")
 {
   document.getElementById("Watermark").style.display="none";
 }

//初始化
obj1.value="<%=Sort1Id%>";
var SelectedIndex=obj1.selectedIndex;
Sort1_Change(SelectedIndex,0);
obj2.value=<%=Sort2Id%>;
document.getElementById("Dl_Show_Style").value="<%=Article_info_style%>";
document.getElementById("Dl_Comments_Style").value="<%=Comments_style%>";
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

</body>
</html>  

