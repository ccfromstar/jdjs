<DIV class=table4>
<DIV class=foot>
<DIV class=foot_1>
<#ZC_BLOG_COPYRIGHT#> | DESIGN BY <A href="http://www.seanloo.cn/" target="_blank">Seanloo.cn</A>
</DIV>
<DIV class=foot_2>POWER BY <a href="http://www.rainbowsoft.org/" >Z-Blog <#ZC_BLOG_VERSION#></a>.</DIV>
</DIV>
</DIV>
</BODY>
</HTML>

<script language="JavaScript" type="text/javascript">
$(document).ready(function(){
try{
	var elScript = document.createElement("script");
	elScript.setAttribute("language", "JavaScript");
	elScript.setAttribute("src", "<#ZC_BLOG_HOST#>function/c_html_js.asp?act=batch"+unescape("%26")+"view=" + escape(strBatchView)+unescape("%26")+"inculde=" + escape(strBatchInculde)+unescape("%26")+"count=" + escape(strBatchCount));
	document.getElementsByTagName("body")[0].appendChild(elScript);
	}
catch(e){};

});
<!--   
$("#tabsmenu li").click(function()   
{   
       $("#tabsmenu li").each(function()   
         {   
                $(this).removeClass("on");   
                $(this).addClass("off");   
                $("#list_"+$(this).attr("id")).hide();   
         });   
$(this).removeClass("off");   
$(this).addClass("on");   
$("#list_"+$(this).attr("id")).show();   
}   
);
//-->
</script>