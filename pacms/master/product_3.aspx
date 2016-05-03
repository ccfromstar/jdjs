<% @ Page Language="C#"  Inherits="PageAdmin.product_3"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="product_2" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>产品编辑</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top>

<form method="post" Enctype="multipart/form-data">
<table border=0 cellpadding=5 cellspacing=4  width=100% align=center  class=table_style2>
<tr>
  <td valign=top  align="left">
<table border=0 cellpadding=0 cellspacing=2 width=100% align=center>
<tr>
  <td  colspan=2 height=25><b>发布产品</b></td>
 </tr>
</table>
    <table border=0 cellpadding=0 cellspacing=4 width=100% align=center>
  <tr>
          <td  height=25 >产品类别 <span style="color:#ff0000">*</span></td>
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
          <td width="100px" height=25 >产品名称 <span style="color:#ff0000">*</span></td>
          <td><input type="text" name="TBname" id="TBname" Maxlength=50 size=40 value="<%=Name%>"></td>
      </tr>
      <tr>
          <td  height=25 >产品型号</td>
          <td ><input type="text" name="TBxinghao" Maxlength=40 size=40  value="<%=Xinghao%>"></td>
      </tr>
</tr>  
     <tr>
          <td  height=25 >产品价格</td>
          <td ><input type="text" name="TBprice"   Maxlength=15 size=10 value="<%=Price%>" onkeyup="if(isNaN(value))execCommand('undo')" > 单位：<input type="text" name="TBunit"  Maxlength=15 size=6 value="<%=Unit%>">
      <input type="button" value="会员价" class=bt onclick="ShowObj('M_Table')">
     <br>
    <table id="M_Table" border=0 cellpadding=0 cellspacing=0 width=100% style="display:none"> 
   <asp:Repeater id="P1" runat="server">
     <ItemTemplate>
     <tr title="<%#DataBinder.Eval(Container.DataItem,"m_type")%>价格">
      <td>
        <input type="hidden" name="TBMtypeid"   value="<%#DataBinder.Eval(Container.DataItem,"id")%>">
        <input type="text" name="TBMprice"  Maxlength=15 size=10 onkeyup="if(isNaN(value))execCommand('undo')" value="<%#Get_Price(DataBinder.Eval(Container.DataItem,"id").ToString())%>"> <%#DataBinder.Eval(Container.DataItem,"m_type")%>
     </td>
     </tr>
     </ItemTemplate>
    </asp:Repeater>
    </table>
         </td>
      </tr>  

<tr>
       <td  height=25>发布时间</td>
       <td><input type="text" name="TBtime" id="TBtime" Maxlength=40 size=20  value="<%=TBtime%>"><a href="javascript:open_calendar('TBtime')"><img src=images/calendar_bnt.gif border=0 height=20 hspace=2 align=absbottom></a>
</td>

     <tr>
          <td  height=25 >产品图片 <span style="color:#ff0000">*</span></td>
          <td >
  <select name="Dl_Thumbnail" id="Thumbnail">
     <option value="1">生成缩略图</option>
     <option value="0">关闭缩略图</option>
   </select>
  <select name="Dl_Watermark" id="Watermark">
     <option value="1">增加水印</option>
     <option value="0">关闭水印</option>
   </select>
<input type="file"  size=40  name="Upload" id="Upload" > <%=Upload_View%>
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
  <td  height=25>其他设置</td>
  <td>
   <select name="Dl_Show_order" id="Dl_Show_order" title="在线订购功能">
     <option value="">==在线订购功能==</option>
     <option value="0">关闭</option>
     <option value="1">开启</option>
     </select>&nbsp;&nbsp;

   <select name="Dl_Show_Style" id="Dl_Show_Style"  title="产品介绍样式">
     <option value="">==产品介绍样式==</option>
     <option value="0">显示所有参数</option>
     <option value="1">仅显示产品介绍</option>
     </select>&nbsp;&nbsp;

   <select name="Dl_Comments_Style" id="Dl_Comments_Style" title="评论功能设置">
     <option value="">==评论功能设置==</option>
     <option value="0">评论关闭</option>
     <option value="1">评论开启(需要审核)</option>
     <option value="2">评论开启(直接显示)</option>
     </select>(不选择则默认子栏目中的设置)
</td>


     <tr>
          <td>产品简介</td>
          <td>
            <textarea name="TBIntroduct" id="TBIntroduct"><%=Introduct%></textarea>
<script type="text/javascript" src="/incs/fckeditor/fckeditor.js"></script>
<script  type="text/javascript"> 
var FCKeditor = new FCKeditor("TBIntroduct"); 
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
          <td>详细介绍</td>
          <td>
            <textarea name="Content" id="Content"><%=Content%></textarea>
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
<input type="submit" value=" 提 交 "     class="button" onclick="return Check_Product_Form(0)">
<input type="button" value="返回"    class="button" onclick="location.href='Product_1.aspx?prod1id=<%=Request.QueryString["prod1id"]%>&prod2id=<%=Request.QueryString["prod2id"]%>'"/>
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
document.getElementById("Dl_Show_order").value="<%=Show_Order%>";
document.getElementById("Dl_Show_Style").value="<%=Show_Style%>";
document.getElementById("Dl_Comments_Style").value="<%=Comments_Style%>";
//初始化结束

function Sort1_Change(I,ChangeSort)
 {
  if(ChangeSort==1)
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
