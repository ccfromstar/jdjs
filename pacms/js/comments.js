var C_PageSize=5;
var C_PageCount=1;
if((C_PLCount % C_PageSize)==0)
  {
    C_PageCount=C_PLCount/C_PageSize;
  } 
  else
  {
    C_PageCount=C_PLCount/C_PageSize+1;
  } 
C_PageCount=parseInt(C_PageCount);
var Objs=document.getElementsByName("CommentsItem");
function Load_Pl(Page)
 { 
    Hide_Pl();
    var StartIndex=C_PageSize*(Page-1);
    var EndIndex=C_PageSize*Page;
    if(EndIndex>C_PLCount)
     {
       EndIndex=C_PLCount;
     }
    for(i=StartIndex;i<EndIndex;i++)
     {
      Objs[i].style.display="";
     }
   if(C_PageCount>1)
    {
      YCHTML=Page+"\/"+C_PageCount;
      Obj1=document.getElementById("PageCurrent_Top");
      Obj2=document.getElementById("PageCurrent_Bottom");
      Obj1.innerHTML=YCHTML;
      Obj2.innerHTML=YCHTML;
    }
 }

if(C_PLCount>0)
{
  Load_Pl(1);
}

if(C_PageCount>1)
{
  Build_Page();
  document.getElementById("pllist_bottom").style.display="";
}

function Hide_Pl()
   {
    for(i=0;i<Objs.length;i++)
     {

      Objs[i].style.display="none";
    }
  }

function Build_Page()
 {
   PageHtml="";
   for(i=1;i<=C_PageCount;i++)
   {
     PageHtml+="&nbsp;<a href='javascript:Load_Pl("+i+")' style='padding:2px 4px 2px 4px;border:1px solid #cccccc'>"+i+"</a>";
   }
  Obj1=document.getElementById("Comment_Page_Top");
  Obj2=document.getElementById("Comment_Page_Bottom");
  Obj1.innerHTML=PageHtml;
  Obj2.innerHTML=PageHtml;
 }


function InsertQuot(id,b)
 {
   obj1=document.getElementById("User_"+id);
   obj2=document.getElementById("Date_"+id);
   obj3=document.getElementById("Content_"+id);
   obj4=document.getElementById(b); 
   obj4.focus();
   var Va;
   if(C_Language=="en")
    {
     Va="[quote]"+"Quote:\r\n"+obj1.innerHTML+" Released time: "+obj2.innerHTML+"\r\n"+obj3.innerHTML+"[/quote]\r\n";
    }
   else
    {
     Va="[quote]"+"引用:\r\n"+obj1.innerHTML+"于"+obj2.innerHTML+"发表\r\n"+obj3.innerHTML+"[/quote]\r\n";
    }
   Va=replaceAll(Va,"<br>","\r\n");
   Va=replaceAll(Va,"&nbsp;"," ");
   Va=replaceAll(Va,"<span class=\"quote\">","[quote]");
   Va=replaceAll(Va,"<span class=quote>","[quote]");
   Va=replaceAll(Va,"</span>","[/quote]");
   obj4.value=Va;

 }
