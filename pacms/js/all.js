function ShowSubMenu(id,num) //显示下拉
 {
   if(typeof(submenu_style)=="undefined")
    {
      submenu_style=2;  //1表示纵向下拉，2表示横向下拉,其他数值则关闭
    }
   switch(submenu_style)
    {
      case 1:
       document.write('<link rel="stylesheet" type="text/css" href="/incs/dropmenu.css" />');
       if(document.all){addHover("MainMenu","li","hover")}
      break;

     case 2:
       document.write('<link rel="stylesheet" type="text/css" href="/incs/submenu.css" />');
       HorisontalSubMenu(id,num);
     break;
   }
 }

function addHover(id,tag,classname) //IE增加hover效果
 {
    var sfEls =document.getElementById(id).getElementsByTagName(tag);
    for (var i=0; i<sfEls.length;i++) 
        {
          sfEls[i].onmouseover=function() 
            {
             this.className+=" "+classname;
            }
          sfEls[i].onmouseout=function() {
          this.className=this.className.replace(new RegExp("( ?|^)"+classname+"\\b"),"");
        }
      }
 }


function HorisontalSubMenu(id,num)
 {
   var classname="hover";
   var MenuItem=document.getElementsByName("MainMenuItem");
   var firstA;
   if(MenuItem.length<1)
   {
     return;
   }
   for(i=0;i<MenuItem.length;i++)
    {
      firstA=MenuItem[i].getElementsByTagName("a")[0];
      firstA.className="menu_"+num;
      MenuItem[i].className=MenuItem[i].className.replace(new RegExp("( ?|^)"+classname+"\\b"),"");
      if(MenuItem[i].getElementsByTagName("a")[0].id=="Menu_"+id)
       {
         MenuItem[i].className+=" "+classname;
         firstA.className="menu_current_"+num;
       }
      firstA.onmouseover=function(){HorisontalSubMenu(this.id.replace("Menu_",""),num)};
    }
 }

function FontZoom(Size,LineHeight,Id)
 {
   var Obj=document.getElementById(Id);
   Obj.style.fontSize=Size; 
   Obj.style.lineHeight=LineHeight; 
 }

function  ShowImage(Url)
 {
   window.open("/include/showimage.aspx?src="+Url, "newwindow", "top=50,left=50,height=550, width=850, toolbar=no, menubar=no, scrollbars=yes, resizable=yes, location=no, status=no") 
 }


function getOffsetLeft(obj) 
{

var n = obj.offsetLeft;
while (obj = obj.offsetParent) n+= obj.offsetLeft;
return n;
}

function setPicRange(obj,maxW,maxH)
{
 if(obj.width>maxW || obj.height>maxH )
 {
  if(obj.width/obj.height>maxW/maxH  )
   obj.width=maxW;
  else 
   obj.height=maxH;
 }
}




//评论输入验证
function Check_Comments(Language)
  {  
   var C_value=Trim(document.getElementById("c_content").value);
   if(C_value=="")
    {
      if(Language=="en")
       {
        alert("Please enter a comment!");
       }
      else
       {
        alert("请输入评论内容!");
       }
      document.getElementById("c_content").focus();
      return false;
    }
   C_value=Trim(document.getElementById("c_yzm").value);
   if(C_value=="")
    {
     if(Language=="en")
       {
        alert("Please enter the verification code!");
       }
      else
       {
        alert("请输入验证码!");
       }
      document.getElementById("c_yzm").focus();
      return false;
    }

  }

//自定义表单必填项验证
 function Check_ZdyForm(formName,language,ismember)
  { 
   var sjs1,sjs2,Js1,Js2;
   if(language=="cn")
    {
      sjs1="请选择类别!";
      sjs2="请选择子类别!";
      Js1="不能为空!",
     Js2="请输入验证码!";
    }
   else
    {
      sjs1 = "Please select the category!";
      sjs2 = "Please select sub-category!";
      Js1 = " can not be empty!"
      Js2 = "Please enter the verification code!";
    }

   var obj1=document.getElementById("Sort_1");
   var obj2=document.getElementById("Sort_2");
   var obj3=document.getElementById("TBtime");
   if(obj1!=null)
    {
    if(obj1.style.display!="none")
    {
     if(obj1.value=="0")
     {
      alert(sjs1);
      obj1.focus();
      return false;
     }
   }
   if(obj2.style.display!="none")
    {
       if(obj2.value=="0")
        {
         alert(sjs2);
         obj2.focus();
         return false;
       }
    }
   }


   var Names=document.forms[formName].mustname.value;
   var Fields=document.forms[formName].mustfield.value;
   var Fieldtype=document.forms[formName].musttype.value;
   var ANames,AFields,AFieldtype,Obj;
    if(Fields!="")
     {
       ANames=Names.split(',');
       AFields=Fields.split(',');
       AFieldtype=Fieldtype.split(',');
       for(i=0;i<AFields.length-1;i++)
        {
          Obj=document.forms[formName][AFields[i]];
          if(AFieldtype[i]=="radio" || AFieldtype[i]=="checkbox")
             {
                   if(!IsChecked(Obj))
                    {
                      alert(ANames[i]+Js1);
                      return false;
                    }
             }
           else
              {
                   if(Obj.value=="" && Obj.style.display!="none")
                    {
                     alert(ANames[i]+Js1);
                     Obj.focus();
                     return false;
                   }
             }
        }
     }
    if(ismember==0)
     {
      document.forms[formName].zdyform_url.value=top.location.href;
      Obj=document.forms[formName].hscode;
      if(Obj.value=="1")
       {
         if(Trim(document.forms[formName].vcode.value)=="")
          {
            alert(Js2); 
            document.forms[formName].vcode.focus();
            return false;
          }
       }
     }

 if(obj3!=null)
  {
   if(!IsDate(obj3.value))
   {
    alert("请输入正确的发布时间!");
    obj3.focus();
    return false;
   }
  }

  }

//改变验证码
function Code_Change(Id)
 {
  Obj=document.getElementById(Id);
  if(Obj.src.indexOf("yzm.aspx")>=0)
   {
    Obj.src="/incs/yzm1.aspx";
   }
  else
   {
    Obj.src="/incs/yzm.aspx"
   }
 }

//控制pagea_control
function Go_Page(PageCount,CurrentPage)
 {
  var P1=document.getElementById("P_First");
  var P2=document.getElementById("P_Prev");
  var P3=document.getElementById("P_Next");
  var P4=document.getElementById("P_Last");
   if(CurrentPage>=PageCount)
    {
      P3.disabled="disabled";
      P3.href="#";
      P4.disabled="disabled";
      P4.href="#";
    }

    if(CurrentPage<=1)
    {
      P1.disabled="disabled";
      P1.href="#";
      P2.disabled="disabled";
      P2.href="#";
    }
   document.getElementById("P_Page").selectedIndex=CurrentPage-1;
 }


function open_calendar(Id)
 {
  var Val=window.showModalDialog("/incs/pgcalendar.html","calendar","dialogWidth:15.5em;dialogHeight:15.5em;help:no;resizable:no;status:no");
  if(Val!=null)
   {
    document.getElementById(Id).value=Val;
   }
    document.getElementById(Id).blur();
 }

//Ajax插件
PAAjax = function(){
    var http_request = false;
    var result = "";
    var method = 1;
    var anc = true;
    this.setarg = function(m, a){
        method = (m == 0) ? 0 : 1;
        anc = (a) ? true : false;
    }
    this.init = function(){
        http_request = false;
        if (window.XMLHttpRequest) { // Mozilla, Safari,...
            http_request = new XMLHttpRequest();
        }
        else 
            if (window.ActiveXObject) { // IE
                try {
                    http_request = new ActiveXObject("Msxml2.XMLHTTP");
                } 
                catch (e) {
                    try {
                        http_request = new ActiveXObject("Microsoft.XMLHTTP");
                    } 
                    catch (e) {
                        alert("Can't Creat AJAX Object!");
                        return false;
                    }
                }
            }
    }
    this.get = function(url,sendcontent,callback){
        this.init();
        http_request.onreadystatechange = function(){
            if (http_request.readyState == 4) {
                if (http_request.status == 200) {
                    result = http_request.responseText;
                    try {
                        callback(result);
                    } 
                    catch (e) {
                        alert("The CallBack Method Wrong!" + e);
                        return false;
                        
                    }
                }
            }
        };
        if (method == 1) {
            http_request.open('get', url+"?"+sendcontent, anc);
            http_request.send(null);
        }
        else {
            http_request.open('post', url, anc);
            http_request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            http_request.send(sendcontent);
           }
     }
}

//滚动插件
function PARoll(a)
{
	this.TheA = a;
	this.TheA.IsPlay = 1;
	this.$(a.box).style.overflow = "hidden";
                if(a.width!="")
                 {this.$(a.box).style.width = a.width;}
                if(a.height!="")
                 {this.$(a.box).style.height = a.height; }
	this.$(a.box2).innerHTML=this.$(a.box1).innerHTML;
	this.$(a.box).scrollTop=this.$(a.box).scrollHeight;
        this.$(this.TheA.box).scrollTop=0;
	this.Marquee();
	this.$(a.box).onmouseover=function() {eval(a.objname+".clearIntervalRoll();");}
	this.$(a.box).onmouseout=function() {eval(a.objname+".setTimeoutRoll();")}
}
PARoll.prototype.$ = function(Id)
{
	return document.getElementById(Id);
}
PARoll.prototype.getV = function(){ 
alert(this.$(this.TheA.box2).offsetWidth-this.$(this.TheA.box).scrollLeft);
alert(this.$(this.TheA.box2).offsetWidth);
alert(this.$(this.TheA.box).scrollLeft);}
PARoll.prototype.Marquee = function()
{
	this.MyMar=setTimeout(this.TheA.objname+".Marquee();",this.TheA.speed);
	if(this.TheA.IsPlay == 1)
	{
		if(this.TheA.direction == "top")
		{
			if(this.$(this.TheA.box).scrollTop>=this.$(this.TheA.box2).offsetHeight)
				this.$(this.TheA.box).scrollTop-=this.$(this.TheA.box2).offsetHeight;
			else{
				this.$(this.TheA.box).scrollTop++;
			}
		}
		
		if(this.TheA.direction == "down")
		{
			if(this.$(this.TheA.box1).offsetTop-this.$(this.TheA.box).scrollTop>=0)
				this.$(this.TheA.box).scrollTop+=this.$(this.TheA.box2).offsetHeight;
			else{
				this.$(this.TheA.box).scrollTop--;
			}
		}
		if(this.TheA.direction == "left")
		{
			if(this.$(this.TheA.box2).offsetWidth-this.$(this.TheA.box).scrollLeft<=0)
				this.$(this.TheA.box).scrollLeft-=this.$(this.TheA.box1).offsetWidth;
			else{
				this.$(this.TheA.box).scrollLeft++;
			}
		}
		
		if(this.TheA.direction == "right")
		{
			if(this.$(this.TheA.box).scrollLeft<=0)
				this.$(this.TheA.box).scrollLeft+=this.$(this.TheA.box2).offsetWidth;
			else{
				this.$(this.TheA.box).scrollLeft--;
			}
		}

	}
}
PARoll.prototype.clearIntervalRoll = function()
{
  this.TheA.IsPlay = 0;
}
PARoll.prototype.setTimeoutRoll = function()
{
   this.TheA.IsPlay = 1;
}

//基础函数



function Trim(str)  //去除空格 
 { 
  var Astr=str.split('');
  var str1="";
  for(i=0;i<Astr.length;i++)
   {
    str1+=Astr[i].replace(" ","");
   }
  return str1;
 }


function ShowItem(id,url)
 {
    var obj=document.getElementById(id);
    if(url!="#" || obj==null)
     {
       return;
     }
    if(obj.style.display=="none")
     {
      obj.style.display="";
     }
   else
     {
      obj.style.display="none";
     }
 }

function IsChecked(obj)  //检测radid或checkbox是否有选择
{
 var k=0;
 for(k=0;k<obj.length;k++) 
  { 
   if(obj[k].checked) 
    {
     return true;
    }
  }
 return false;
} 



function IsNum(str)  //是否是数字
 {
   var str1="0123456789";
   var Astr=str.split('');
   for(i=0;i<Astr.length;i++)
    {
      if(str1.indexOf(Astr[i])<0)
       {
        return false;
       }
    }
  return true;

 }

function IsDate(str)   
 {  
 
  var reg1=/^(\d{1,2})\/(\d{1,2})\/(\d{4})$/; 
  var reg2=/^(\d{1,2})\/(\d{1,2})\/(\d{4}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/; 
  var reg3=/^(\d{1,2})\/(\d{1,2})\/(\d{4}) (\d{1,2}):(\d{1,2}):(\d{1,2}) ([a-zA-Z]{0,2})$/; 
  var reg4=/^(\d{4})-(\d{1,2})-(\d{1,2})$/;    
  var reg5=/^(\d{4})-(\d{1,2})-(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;   
  if(str=="")
   {
     return  false;  
   } 
  if(!reg1.test(str) && !reg2.test(str) && !reg3.test(str) && !reg4.test(str) && !reg5.test(str))
   {    
      return  false;   
   }   
   return true;   
  }   



function replaceAll(str,str1,str2)
{
  str=str.toLowerCase();
  while(str.indexOf(str1)>= 0)
  {
   str=str.replace(str1,str2);
  }
  return str;
}




