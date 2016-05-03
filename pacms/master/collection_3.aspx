<% @ Page Language="C#" Inherits="PageAdmin.collection_3" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="collection_1" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1 align="left"><b>采集参数获取</b></td></tr>
 <tr><td height=10 ></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top  align="left">
<div id="tabdiv">
<ul>
<li id="tab" name="tab"    onclick="location.href='collection_2.aspx?id=<%=Request.QueryString["id"]%>&table=<%=Request.QueryString["table"]%>&name=<%=Server.UrlEncode(Request.QueryString["name"])%>&tab=0'">列表规则</li>
<li id="tab" name="tab"    onclick="location.href='collection_2.aspx?id=<%=Request.QueryString["id"]%>&table=<%=Request.QueryString["table"]%>&name=<%=Server.UrlEncode(Request.QueryString["name"])%>&tab=1'" >内容规则</li>
<li id="tab" name="tab"    onclick="location.href='#'" style="font-weight:bold">开始采集</li>
</ul>
</div>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top  align="left">
 <table border=0 cellpadding=5  width=95% align=center>
    <tr>
     <td  align="left"><b>当前采集：</b><%=Request.QueryString["name"]%></td>
    </tr>
    <tr>
     <td  align="left" height="5"></td>
    </tr>
  </table>
<form>
 <table border=0 cellpadding=5  width=95% align=center>
    <tr>
     <td  align="left" width=100px>待采集网址</td>
       <td  align="left"><TextArea name="List_Url" id="List_Url" cols="70" rows="8" ><%=Collection_List_Url%></TextArea>
       </td>
     </tr>
    <tr>
     <tr>
         <td  height=25 >导入类别</td>
         <td>
<select id="Sort_1" name="Sort_1" onchange="Sort1_Change(this.selectedIndex)">
<option value="0">----请选择大类----</option>
</select>
<select id="Sort_2" name="Sort_2" style="display:none" onchange="Sort2_Change()">
<option value="0">----请选择小类----</option>
</select>
<input type="hidden" id="Sort_1_text" name="Sort_1_text"><input type="hidden" id="Sort_2_text" name="Sort_2_text">
        </td>
     </tr>
    <tr>
     <tr>
         <td  height=25 >默认显示</td>
         <td><select id="DefaultShow" name="DefaultShow">
<option value="1">显示</option>
<option value="0">隐藏</option>
</select><td>
     </tr>
  <tr>
         <td  height=25 >采集时间间隔</td>
         <td><input type="textbox" id="C_time"  maxlength=2  size="5" onkeyup="if(isNaN(value))execCommand('undo')" value="4"> 秒 注：根据目标网站速度设置，太小会导致采集失败。<td>
    </tr>
    </table>

<div   style="display:none" id="D_CollectionInfo">
   <table border=0 cellpadding=5  width=95% align=center>
     <tr>
     <td  align="left" width=100px>采集进度</td>
       <td  align="left"><TextArea name="Collection_Info" id="Collection_Info" cols="70" rows="10"></TextArea></td>
     </tr>
    </table>
</div>
<br>
   <table border=0 cellpadding=5  width=95% align=center>
     <tr>
     <td  align="left" >
     <span id="C_Count"></span>&nbsp;&nbsp;<span id="C_Bar"></span>&nbsp;&nbsp;<span id="C_Error"></span>
     </td>
     </tr>
    </table>
<br>
<div align=center>

<input  type="button"  id="tijiao" value="开始采集"  Class="button" onclick="return CheckForm()" >
&nbsp;&nbsp;<input type="button" value="返回"  Class="button" OnClick="location.href='collection_1.aspx'">
</div>
</form>
<br>
</td>
</tr>
</table>
</td>
</tr>
</table>
</center>

<script language="javascript">
var obj1=document.getElementById("Sort_1");
var obj2=document.getElementById("Sort_2");
var obj3=document.getElementById("List_Url");
var objinfo=document.getElementById("Collection_Info");
var D_Info=document.getElementById("D_CollectionInfo");
var C_Bar=document.getElementById("C_Bar");
var C_Error=document.getElementById("C_Error");
var C_Count=document.getElementById("C_Count");
if(obj3.value.indexOf("http://")<0)
 {
   document.getElementById("tijiao").disabled=true;
 }

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
function Sort1_Change(I)
 {
  document.getElementById("Sort_1_text").value=obj1.options[obj1.selectedIndex].text;
  document.getElementById("Sort_2_text").value="";

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

var C_order;
var C_urls;
var A_C_urls;
var Count;
var sendurl;
var C_Time;
var curret_url;
function CheckForm()
 {
  if(obj1.style.display!="none")
    {
     if(obj1.value=="0")
     {
      alert("请选择要导入的大类");
      obj1.focus();
      return false;
     }
   }
   if(obj2.style.display!="none")
    {
       if(obj2.value=="0")
        {
         alert("请选择要导入的小类");
         obj2.focus();
         return false;
       }
    }

    C_order="<%=C_order%>";
    C_Time=document.getElementById("C_time").value;
    if(obj3.value.indexOf("http://")>=0)
     {
       obj1.disabled=true;
       obj2.disabled=true;
       obj3.disabled=true;
       document.getElementById("tijiao").disabled=true;
       document.getElementById("C_time").disabled=true;
       document.getElementById("DefaultShow").disabled=true;
       D_Info.style.display="";
       C_urls=obj3.value;
       if(C_urls.indexOf("\r\n")>=0)
        {
          C_urls=obj3.value.replace(/\r\n/ig,",");
        }
       else
        {
         C_urls=C_urls.replace(/\n/ig,",");
        }
       A_C_urls=C_urls.split(',');
       Count=A_C_urls.length;
       C_Count.innerHTML="待采集数："+Count;
       sendurl="collection_5.aspx?sort1id="+obj1.value+"&sort2id="+obj2.value+"&sort1="+escape(document.getElementById("Sort_1_text").value)+"&sort2="+escape(document.getElementById("Sort_2_text").value)+"&show="+document.getElementById("DefaultShow").value+"&language=<%=P_Language%>&saveimage=<%=C_detail_saveimage%>&table=<%=Table%>&cid=<%=Cid%>&c_list_domain=<%=C_list_domain%>&c_encode=<%=C_encode%>&collection=yes";
       objinfotr=true;
       objinfo.value="采集开始...\r\n";
       c_setInterval=setInterval(StartHttp,3000);
     }
   else
    {
      alert("无待采集网址");
    }
 }

var i=0;
var errornum=0;
var XmlHttp=CreateXmlHttp();;
var Url;
var c_setInterval;

function StartHttp()
 {
  if(C_order=="0")
   {
     Url=sendurl+"&c_url="+escape(A_C_urls[i]);
   }
  else
   {
     Url=sendurl+"&c_url="+escape(A_C_urls[Count-i-1]);
   }
   //location.href=Url;
   XmlHttp.onreadystatechange=SendHTTP;  // 这onreadystatechange很关键,在IE里没有它可以,到了其他浏览器行不通
   XmlHttp.open("get",Url,true);// 还有这里的true是关键,在火狐下false运行不了,所以只能用true了
   XmlHttp.send(null);//火狐下必须加null,IE有没有都没问题 
 }

function SendHTTP()
 {

   if(XmlHttp.readyState==4)  // 判断传送完全
    {
      curret_url=A_C_urls[i];
      C_Bar.innerHTML="采集进度："+((i+1)/Count*100).toFixed(0)+"%";
      objinfo.value+=curret_url+"采集中...\r\n";
      if(XmlHttp.status==200)
      {
        if(XmlHttp.responseText=="ok")
          {
            objinfo.value+="采集成功\r\n";
          }
        else
          {
           errornum++;
           C_Error.innerHTML="采集失败："+errornum;
           objinfo.value+="远程读取失败\r\n";
          }
        i++;
        if(i>=Count)
         {
           objinfo.value+="采集结束!";
           clearInterval(c_setInterval);
         }
      }
    else
     {
       errornum++;
       C_Error.innerHTML="采集失败："+errornum;
       objinfo.value+="采集失败，出现"+XmlHttp.status+"错误\r\n";
       i++;
        if(i>=Count)
         {
           objinfo.value+="采集结束!";
           clearInterval(c_setInterval);
         }
     }
   }
  
}

function CreateXmlHttp()
{
   var xmlHttp;
   var activeKey = new Array("MSXML2.XMLHTTP.6.0","MSXML2.XMLHTTP.5.0","MSXML2.XMLHTTP.4.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP");
   if(window.ActiveXObject)
      {
       for(var i=0;i<activeKey.length;i++)
        {
          try
          {
              xmlHttp = new ActiveXObject(activeKey[i]);
              if(xmlHttp!=null)
               return xmlHttp;
          }
          catch(error)
          {
            throw new Error("您的浏览器不支持ajax!");
          }
       }
    }
  else if(window.XMLHttpRequest)
    {
      xmlHttp = new XMLHttpRequest();
    }
  else
    {
       throw new Error("您的浏览器不支持ajax!");
    }  
   return xmlHttp;
} 

</script>

</body>
</html>  



