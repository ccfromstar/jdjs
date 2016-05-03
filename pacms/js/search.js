function  k_search(Language,type)
 {
  if(type==1)
   {
     if(Language=="en")
      {
        En_search_1(Language)
      }
     else
      {
        search_1(Language)
      }
   }
  else
   {
      if(Language=="en")
      {
        En_search_2(Language)
      }
     else
      {
        search_2(Language)
      }
   }
 }




//-------------------中文版-----------------//
function search_1(Language)
 {
  var Keycode=escape(document.getElementById("Search_Keycode").value);
   if(Keycode=="")
    {
     alert("请输入要搜索的产品名称或型号关键字!");
     return;
    }
   else
    { 
     if(Keycode.length<2)
      {
     alert("关键字必须大于2个字符!");
     return;
      }
     else
     {
       location.href="/include/search.aspx?keycode="+Keycode+"&type=1&language="+Language;
     }
    }
 }

function search_2(Language)
 {
  var Keycode=escape(document.getElementById("Search_Keycode").value);
   if(Keycode=="")
    {
     alert("请输入要搜索的文章标题或简介关键字!");
     return;
    }
   else
    { 
     if(Keycode.length<2)
      {
     alert("关键字必须大于2个字符!");
     return;
      }
     else
     {
       location.href="/include/search.aspx?keycode="+Keycode+"&type=2&language="+Language;
     }
    }
 }


//英文版

function En_search_1(Language)
 {
  var Keycode=escape(Trim(document.getElementById("Search_Keycode").value));
   if(Keycode=="")
    {
     alert("Please enter your search product name or type keywords!");
     return;
    }
   else
    { 
     if(Keycode.length<2)
      {
     alert("Keyword must be greater than two characters!");
     return;
      }
     else
     {
       location.href="/include/search.aspx?keycode="+Keycode+"&type=1&language="+Language;
     }
    }
 }

function En_search_2(Language)
 {
  var Keycode=escape(Trim(document.getElementById("Search_Keycode").value));
   if(Keycode=="")
    {
     alert("Please enter your search to the title of the article or profile keyword!");
     return;
    }
   else
    { 
     if(Keycode.length<2)
      {
     alert("Keyword must be greater than two characters!");
     return;
      }
     else
     {
       location.href="/include/search.aspx?keycode="+Keycode+"&type=2&language="+Language;
     }
    }
 }
