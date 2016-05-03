<% @ Control language="c#" Inherits="FredCK.FCKeditorV2.GetEditor" AutoEventWireup="false"%>
<script type="text/javascript" src="/incs/fckeditor/fckeditor.js"></script>
<script  type="text/javascript"> 
var FCKeditor = new FCKeditor("<%=Id%>"); 
FCKeditor.BasePath = "/incs/fckeditor/"; 
FCKeditor.Height = <%=Height%>; 
FCKeditor.Config['LinkBrowser'] = false ;
FCKeditor.Config['ImageBrowser'] =false ;
FCKeditor.Config['FlashBrowser'] = false ;
FCKeditor.Config['LinkUpload'] = true ;
FCKeditor.Config['ImageUpload'] = true ;
FCKeditor.Config['FlashUpload'] = true ;
FCKeditor.ToolbarSet ="<%=Style%>"; 
FCKeditor.ReplaceTextarea(); 
</script> 




