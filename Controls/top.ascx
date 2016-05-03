<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="top.ascx.cs" Inherits="JDJS.Web.Controls.top" %>
<script type="text/javascript" src="/js/imagechange.js"></script>
<div id="top">
<div class="top">
<img style="width:209px;height:202px;float:left; border:1px #004fa8 solid ;border-right-width:0px;border-top-width:0px;" alt="" src="style/images/blank.gif" />
<div id="topbarimg" style="width:794px; height:203px;float:left;">
    <img alt="" src="uploads/topimg/0.jpg" />
</div>
<div style="width:794px; height:203px;float:left;" >
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="794" height="203">
  <param name="movie" value="viewer.swf" />
  <param name="quality" value="high" />
  <embed src="viewer.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="794" height="203"></embed>
</object>
</div>
</div>
<script type="text/javascript">
    function LostTop() {
        $("#topbarimg").hide();
    }
    setTimeout(LostTop, 8000);
</script>
</div>