<% @ Page language="c#" Inherits="PageAdmin.link" %>
function LoadLink_<%=Id%>()
{
document.write("<div class='link_box'><%=LinkHtml%></div>");
}

LoadLink_<%=Id%>();
function Link_Open(link,Target)
 {
   if(link!="")
    {
     if(Target=="1")
      {
       window.open(link,"_target");
      }
     else
      {
       location.href=link;
      }
    }
 }
