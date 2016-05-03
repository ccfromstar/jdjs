var InnerPage,PageHtml,TheContent;
TheContent=document.getElementById("Infor_Content").innerHTML;
var sp='{page}' 
var A_TheContent=TheContent.split(sp);
function Build_InnerPage()
 {
   document.write('<br><div id="internal_page" align="center"></div><br>');
   InnerPage=document.getElementById("internal_page");
   PageHtml="";
   for(i=0;i<A_TheContent.length;i++)
   {
     PageHtml+="<a href='javascript:ShowContent("+i+")' class='innerpage' id='ainnerpage' name='ainnerpage'>"+(i+1)+"</a>&nbsp;";
   }
  InnerPage.innerHTML=PageHtml;
 }

function ShowContent(j)
{ 
 document.documentElement.scrollTop=0;
 var aobj=document.getElementsByName("ainnerpage");
 document.getElementById("Infor_Content").innerHTML=A_TheContent[j];
 for(i=0;i<aobj.length;i++)
  {
    aobj[i].style.fontWeight="normal";
    aobj[i].style.backgroundColor="#ffffff";
  }
 aobj[j].style.fontWeight="bold";
 aobj[j].style.backgroundColor="#eeeeee";
}

if(A_TheContent.length>1)
 {
  Build_InnerPage();
  ShowContent(0);
 }