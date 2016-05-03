function Open_Editor(Table,Field,Id,Refresh)
 {
  window.open("fckeditor.aspx?table="+Table+"&field="+Field+"&id="+Id+"&refresh="+Refresh,"edit","height=600px,width=800px,top=60px,left=140px,toolbar=no,menubar=no,scrollbars=no, resizable=yes,location=no, status=no");
 }


function Sign_Editor(Path)
 {
   window.open(Path,"signedit","height=600,width=800,top=60,left=140,toolbar=no,menubar=no,scrollbars=no,resizable=yes,location=yes,status=no");
 }

function link_Js_Code(Lik1id,Target,Num,Type)
 {
  window.open("js_view.aspx?tid="+Lik1id+"&target="+Target+"&num="+Num+"&type="+Type,"jsview","height=300px,width=700px,top=140px,left=140px,toolbar=no,menubar=no,scrollbars=no, resizable=yes,location=no, status=no");
 }

function slide_Js_Code(Id,Style,Type)
 {
  window.open("js_view.aspx?id="+Id+"&style="+Style+"&type="+Type,"jsview","height=300px,width=700px,top=140px,left=140px,toolbar=no,menubar=no,scrollbars=no, resizable=yes,location=no, status=no");
 }

function open_calendar(Id)
 {
  var Val=window.showModalDialog("/incs/pgcalendar.html","calendar","dialogWidth:15.5em; dialogHeight:15.5em;help:no;resizable:no;status:no");
  if(Val!=null)
   {
    document.getElementById(Id).value=Val;
   }
    document.getElementById(Id).blur();
 }

function foreColor(id,Addstr){
  if(!Error())	return;
  var arr = showModalDialog("/incs/color.html", "foreColor", "dialogWidth:18.5em; dialogHeight:17.5em;status:0;help:no;resizable:no;");
  if (arr != null) 
  document.getElementById(id).value=Addstr+arr;
}


function Open_Memberpublish(Path)
 {
   window.open(Path,"Memberpublish","height=500px,width=600px,top=60px,left=140px,toolbar=no,menubar=no,scrollbars=no, resizable=yes,location=no, status=no");
 }

function ShowObj(id)
 {
    var obj=document.getElementById(id);
    if(obj.style.display=="none")
     {
      obj.style.display="";
     }
   else
     {
      obj.style.display="none";
     }
 }

//顶部快捷菜单
function hideall(Obj)
   {
    var h=0;
    for(h=0;h<Obj.length;h++)
     {
      Obj[h].style.display="none";
    }
  }


function quick_1()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   hideall(Obj);
   Obj[0].style.display="";
   parent.frames["right"].location.href="set_1.aspx";
 }

function quick_2()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   hideall(Obj);
   Obj[3].style.display="";
   parent.frames["right"].location.href="lanmu_1.aspx";
 }

function quick_3()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   hideall(Obj);
   Obj[2].style.display="";
   parent.frames["right"].location.href="order_1.aspx";
 }

function quick_4()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   hideall(Obj);
   Obj[2].style.display="";
   parent.frames["right"].location.href="feedback_1.aspx";
 }

function quick_5()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   hideall(Obj);
   Obj[4].style.display="";
   parent.frames["right"].location.href="product_2.aspx";
 }

function quick_6()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   hideall(Obj);
   Obj[5].style.display="";
   parent.frames["right"].location.href="information_2.aspx";
 }
function quick_7()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   hideall(Obj);
   Obj[0].style.display="";
   parent.frames["right"].location.href="tongji.aspx";
 }



function showtab(num,changelocation)
 {
   if(changelocation==0)
    {
      var Obj=document.getElementsByName("tabcontent");
      hideall(Obj);
      var Obj1=document.getElementsByName("tab");
      var k=0;
     for(k=0;k<Obj1.length;k++)
      {
       Obj1[k].style.fontWeight="normal";
      }
     Obj[num].style.display="";
     Obj1[num].style.fontWeight="bold";
   }
  else
   {
     if(location.href.indexOf("tab=")<0)
       {
        location.href=location.href+"&tab="+num;
      }
     else
      {
       location.href=location.href.replace(/tab=([0-9]+)/,"tab="+num)
      }
  }
 }

function showtab_zdyform(num)
 {
    var Obj=document.getElementsByName("tabcontent");
    hideall(Obj);
    var Obj1=document.getElementsByName("tab");
    var k=0;
     for(k=0;k<Obj1.length;k++)
      {
       Obj1[k].style.fontWeight="normal";
      }
     Obj[num].style.display="";
     Obj1[num].style.fontWeight="bold";
 }

function IsNum(str)
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

function CheckBox_Inverse(Name)
 {
   var Obj=document.getElementsByName(Name);
   for(i=0;i<Obj.length;i++)
     {
      if(Obj[i].checked)
       {
          Obj[i].checked=false;
       }
      else
       {
          Obj[i].checked=true;
       }
     }
 }


function Check_Information_Form()
  { 
   
   var obj1=document.getElementById("Sort_1");
   var obj2=document.getElementById("Sort_2");
   var obj3=document.getElementById("TBtitle");
   var obj4=document.getElementById("TBtime");
   if(obj1.style.display!="none")
    {
     if(obj1.value=="0")
     {
      alert("请选择文章大类");
      obj1.focus();
      return false;
     }
   }
   if(obj2.style.display!="none")
    {
       if(obj2.value=="0")
        {
         alert("请选择文章小类");
         obj2.focus();
         return false;
       }
    }
  if(obj3.value=="")
   {
     alert("请输入文章标题!");
     obj3.focus();
     return false;
   }
 if(!IsDate(obj4.value))
  {
     alert("请输入正确的发布时间!");
     obj4.focus();
     return false;
  }
}

function Check_Product_Form(checkupload)
  { 
   
   var obj1=document.getElementById("Sort_1");
   var obj2=document.getElementById("Sort_2");
   var obj3=document.getElementById("TBname");
   var obj4=document.getElementById("TBtime");
   var obj5=document.getElementById("Upload");

   if(obj1.style.display!="none")
    {
     if(obj1.value=="0")
     {
      alert("请选择产品大类");
      obj1.focus();
      return false;
     }
   }
   if(obj2.style.display!="none")
    {
       if(obj2.value=="0")
        {
         alert("请选择产品小类");
         obj2.focus();
         return false;
       }
    }
  if(obj3.value=="")
   {
     alert("请输入产品名称!");
     obj3.focus();
     return false;
   }

 if(!IsDate(obj4.value))
  {
     alert("请输入正确的发布时间!");
     obj4.focus();
     return false;
  }

  if(obj5.value=="" && checkupload==1)
   {
     alert("必须上传产品图片!");
     obj5.focus();
     return false;
   }


}

//自定义表单必填项验证
 function Check_ZdyForm(formName,language)
  { 
   
   var obj1=document.getElementById("Sort_1");
   var obj2=document.getElementById("Sort_2");
   var obj3=document.getElementById("TBtime");

   if(obj1.style.display!="none")
    {
     if(obj1.value=="0")
     {
      alert("请选择大类");
      showtab_zdyform(0);
      obj1.focus();
      return false;
     }
   }
   if(obj2.style.display!="none")
    {
       if(obj2.value=="0")
        {
         alert("请选择小类");
          showtab_zdyform(0);
         obj2.focus();
         return false;
       }
    }

   var Js1="不能为空!";
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
                      showtab_zdyform(0);
                      return false;
                    }
             }
           else
             {
                if(Obj.value=="" && Obj.style.display!="none")
                {
                 alert(ANames[i]+Js1); 
                 showtab_zdyform(0);
                 Obj.focus();
                 return false;
                }
            }
        }
     }

  if(!IsDate(obj3.value))
   {
     alert("请输入正确的发布时间!");
     showtab_zdyform(1);
     obj3.focus();
     return false;
   }
  }


//基础函数
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
