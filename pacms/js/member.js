
function regmember() 
{
window.open("/protocol/regmember.html", "regmember", "toolbars=no, scrollbars=no,top=10,left=50,status=yes,menubar=no, left=50,width=770, height=600");
}

var promptleft="<span  style='padding:0 0 0 0;border: 1px solid; border-color: #485E00;color:#485E00;background-color:#F7FFDD;'>&nbsp;"
var promptright="&nbsp;&nbsp;</span>"
var errorleft="<span style='padding:0 0 0 0;border: 1px solid; border-color: #FF7300;color:#333333;background-color:#FFF5D8;'><img src='/images/public/pic_error.gif' width=16px height=16px  align=absmiddle>"
var errorright="&nbsp;&nbsp;</span>"
var allright="<img src='/images/public/pic_right.gif' width=16px height=16px align=absmiddle>"


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



function IsStr(temp)//检测字符串是否为合法字符
  {
	validStr=new String("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_");
	for(i=0;i<temp.length;i++)
	{
		if(validStr.indexOf(temp.charAt(i))==-1)
		{
	      return false;
		}
	}
	
	return true;
  }

//注册内容
function bk0(u_nme)
 {
  var objQueryStat = document.getElementById("div_regtype");
  if(u_nme=="0")
   {
      objQueryStat.innerHTML = errorleft+"请选择注册的会员类型"+errorright;
      return false;
   }
  else
   {
      objQueryStat.innerHTML=allright;
      return true;
   }
 }

//用户名
function fk1()
 {
  var objQueryStat = document.getElementById("div_name");

  objQueryStat.innerHTML = promptleft+"4-16个字符(只能是字母、数字、下划线)。"+promptright;
  
 }
function bk1(u_nme)
 {
   var objQueryStat = document.getElementById("div_name");
 
  if (u_nme.length <4 || u_nme.length > 16)
      {
       objQueryStat.innerHTML = errorleft+"用户名长度需要在4-16之间"+errorright;
        document.getElementById("div_name").focus();
        return false;
      }
   else
     {
        if(!IsStr(u_nme))
          {
            objQueryStat.innerHTML = errorleft+"含有非法字符，只能由数字，字母，下划线组成"+errorright;
            return false;
          }
        else
         {
           objQueryStat.innerHTML=allright;
            return true;
         }
      }

 }

//密码
function fk2()
 {
  var objQueryStat = document.getElementById("div_pwd");

  objQueryStat.innerHTML =promptleft+"5-16个字符(只能是字母、数字、下划线)。"+promptright;;
  
 }
function bk2(u_nme)
 {
   var objQueryStat = document.getElementById("div_pwd");
 
  if (u_nme.length <6 || u_nme.length > 16)
      {
       objQueryStat.innerHTML = errorleft+"登录密码长度需要在6-16之间"+errorright;
       document.getElementById("div_pwd").focus();
       return false;
      }
   else
     {
        if(!IsStr(u_nme))
         {
           objQueryStat.innerHTML = errorleft+"含有非法字符，只能由数字，字母，下划线组成"+errorright;
          document.getElementById("div_pwd").focus();
           return false;
         }
        else
         {
           objQueryStat.innerHTML=allright;
           return true;
         }
      }

 }

//密码确认
function fk3()
 {
  var objQueryStat = document.getElementById("div_pwd1");

  objQueryStat.innerHTML = promptleft+"请再次输入设置的密码。"+promptright;
  
 }
function bk3(u_nme)
 { 

   var objQueryStat = document.getElementById("div_pwd1");
  if (u_nme.length <5 || u_nme.length > 16)
      {
       objQueryStat.innerHTML = errorleft+"密码长度需要在5-16之间"+errorright;
       document.getElementById("div_pwd1").focus();
       return false;
      }
  else
   {
      if (u_nme!=document.getElementById("password").value)
          {
           objQueryStat.innerHTML = errorleft+"两次输入的密码不一致。"+errorright;
            document.getElementById("div_pwd1").focus();
           return false;
           }
       else
         {
         objQueryStat.innerHTML=allright;
          return true;
         } 
   }

 }

//公司名称
function fk4()
 {
  var objQueryStat = document.getElementById("div_cname");

  objQueryStat.innerHTML = promptleft+"企事业单位请填写单位名称。"+promptright;
  
 }
function bk4(u_nme)
 {
   var objQueryStat = document.getElementById("div_cname");
   objQueryStat.innerHTML=allright;
    return true;
 }



//联系人
function fk5()
 {
  var objQueryStat = document.getElementById("div_lxname");

  objQueryStat.innerHTML = promptleft+"请填写真实的联系人姓名。"+promptright;
  
 }
function bk5(u_nme)
 {
   var objQueryStat = document.getElementById("div_lxname");
 
  if (u_nme=="")
      {
       objQueryStat.innerHTML = errorleft+"此项不能为空。"+errorright;
       document.getElementById("div_lxname").focus();
       return false;
      }
   else
     {
       objQueryStat.innerHTML=allright;
        return true;
     }
 }

//Email油箱
function fk6()
 {
  var objQueryStat = document.getElementById("div_eml");

  objQueryStat.innerHTML = promptleft+"重要的联系方式，请填写一个常用的邮件地址。"+promptright;
  
 }
function bk6(u_nme)
 {
   var objQueryStat = document.getElementById("div_eml");
 
   if(u_nme.length==0)
     {
       objQueryStat.innerHTML = errorleft+"此项不能为空。"+errorright;
       document.getElementById("div_eml").focus();
       return false;
     } 
   else
    {
      if (u_nme.charAt(0)=="." || u_nme.charAt(0)=="@" || u_nme.indexOf('@', 0) == -1 || u_nme.indexOf('.', 0) == -1 || u_nme.lastIndexOf("@")==u_nme.length-1 || u_nme.lastIndexOf(".")==u_nme.length-1)
        {
          objQueryStat.innerHTML = errorleft+"Email地址格式不正确。"+errorright;
          document.getElementById("div_eml").focus();
          return false;
        }
      else
       {
         objQueryStat.innerHTML=allright;
          return true;
       }
   }
 }

//省份
function fk7()
 {
  var objQueryStat = document.getElementById("div_pro");

  objQueryStat.innerHTML = promptleft+"填写您您所在的省份。"+promptright;
  
 }
function bk7(u_nme)
 {
   var objQueryStat = document.getElementById("div_pro");
 
   if (u_nme=="")
      {
       objQueryStat.innerHTML = errorleft+"未选择。"+errorright;
       document.getElementById("div_pro").focus();
       return false;
      }
   else
     {
       objQueryStat.innerHTML=allright;
        return true;
     } 

 }

//所在城市
function fk8()
 {
  var objQueryStat = document.getElementById("div_city");

  objQueryStat.innerHTML = promptleft+"填写您所在的城市。"+promptright;
  
 }
function bk8(u_nme)
 {
   var objQueryStat = document.getElementById("div_city");
   if (u_nme=="")
      {
       objQueryStat.innerHTML = errorleft+"请填写您所在的城市。"+errorright;
       document.getElementById("div_city").focus();
       return false;
      }
   else
     {
       objQueryStat.innerHTML=allright;
       return true;
     } 

 }

//联系地址
function fk9()
 {
  var objQueryStat = document.getElementById("div_add");

  objQueryStat.innerHTML = promptleft+"请填写您的详细联系地址。"+promptright;
  
 }
function bk9(u_nme)
 {
   var objQueryStat = document.getElementById("div_add");
 
  if (u_nme.length <4)
      {
       objQueryStat.innerHTML = errorleft+"请填写详细联系地址。"+errorright;
       document.getElementById("div_add").focus();
       return false;
      }
   else
     {
       objQueryStat.innerHTML=allright;
        return true;
     } 
 }
//邮编
function fk10()
 {
  var objQueryStat = document.getElementById("div_cde");

  objQueryStat.innerHTML = promptleft+"请输入您的邮编，如：528427"+promptright;
  
 }
function bk10(u_nme)
 {
   var objQueryStat = document.getElementById("div_cde");
 
   if(!IsNum(u_nme))
    {
      objQueryStat.innerHTML = errorleft+"邮编只能由数字组成。"+errorright;
       document.getElementById("div_cde").focus();
      return false;
    }
   else
    {
     if(u_nme.length!=6)
      {
       objQueryStat.innerHTML = errorleft+"邮编应该是6位数字。"+errorright;
       document.getElementById("div_cde").focus();
        return false;
      }
     else
      {
       objQueryStat.innerHTML=allright;
         return true;
      }
   }
 }

//联系电话
function fk11()
 {
  var objQueryStat = document.getElementById("div_tel");

  objQueryStat.innerHTML = promptleft+"请输入您的联系电话，以便我们更好的为您服务。"+promptright;
  
 }
function bk11(u_nme)
 {
   var objQueryStat = document.getElementById("div_tel");
 
   if(u_nme.length<8)
    {
      objQueryStat.innerHTML = errorleft+"请正确填写联系电话。"+errorright;
       document.getElementById("div_tel").focus();
     return false;
    }
   else
    {
      objQueryStat.innerHTML=allright;
       return true;
    }
 }
//传真
function fk12()
 {
  var objQueryStat = document.getElementById("div_fax");

  objQueryStat.innerHTML = promptleft+"举例：0760-3119139"+promptright;
  
 }
function bk12(u_nme)
 {
   var objQueryStat = document.getElementById("div_fax");
 
      objQueryStat.innerHTML=allright;
 }


//qq
function fk13()
 {
  var objQueryStat = document.getElementById("div_oicq");

  objQueryStat.innerHTML = promptleft+"方便我们为您提供QQ在线支持服务。"+promptright;
  
 }
function bk13(u_nme)
 {
   var objQueryStat = document.getElementById("div_oicq");
 
      objQueryStat.innerHTML=allright;
 }

//msn
function fk14()
 {
  var objQueryStat = document.getElementById("div_msn");

  objQueryStat.innerHTML = promptleft+"方便我们为您提供MSN在线支持服务。"+promptright;
  
 }

function bk14(u_nme)
 {
   var objQueryStat = document.getElementById("div_msn");
 
  objQueryStat.innerHTML=allright;
 }


//msn
function fk15()
 {
  var objQueryStat = document.getElementById("div_yzm");

  objQueryStat.innerHTML = promptleft+"请输入所显示的验证码 。"+promptright;
  
 }

function bk15(u_nme)
 {
   var objQueryStat = document.getElementById("div_yzm");
   if (u_nme=="")
      {
       objQueryStat.innerHTML = errorleft+"请输入验证码。"+errorright;
       document.getElementById("div_yzm").focus();
       return false;
      }
   else
     {
       objQueryStat.innerHTML=allright;
       return true;
     }
 }


function tonyixieyi(v_alue)
 {
   document.getElementById("sub").disabled=!v_alue;
 }
function  CheckInput()
 {

   var reg_r1=bk0(document.getElementById("Reg_type").value) &&  bk1(document.getElementById("username").value) && bk2(document.getElementById("password").value) && bk3 (document.getElementById("password1").value);
   reg_r1=reg_r1 && bk5(document.getElementById("truename").value) && bk6(document.getElementById("email").value) && bk7(document.getElementById("province").value) && bk8(document.getElementById("city").value) && bk9(document.getElementById("address").value) && bk10(document.getElementById("postcode").value) && bk11(document.getElementById("tel").value) && bk15(document.getElementById("yzm").value); 
   return reg_r1;
 }

function  Check_mem_mdy()
 {

   var reg_r1=bk5(document.getElementById("truename").value) && bk6(document.getElementById("email").value) && bk7(document.getElementById("province").value) && bk8(document.getElementById("city").value) && bk9(document.getElementById("address").value) && bk10(document.getElementById("postcode").value) && bk11(document.getElementById("tel").value); 
   return reg_r1;
 }


function  Check_pass_mdy()
 {
   var reg_r1=bk2(document.getElementById("password").value) && bk3 (document.getElementById("password1").value);
   return reg_r1;
 }



//登陆区

function  login_check()
 {
    var UserName = document.getElementById("username").value;
    var Password = document.getElementById("password").value;
    if(UserName.length<4)
     {
        alert("用户名必须大于4个字符!");
        document.getElementById("username").focus();
        return false;
     }

    if(!IsStr(UserName))
      {
        alert("用户只能由数字，字母，下划线组成!");
        document.getElementById("username").focus();
        return false;
      }

     if(Password.length<5)
     {
        alert("密码必须大于5个字符!");
        document.getElementById("password").focus();
        return false;
     }

     if(!IsStr(Password))
      {
        alert("密码只能由数字，字母，下划线组成!");
        document.getElementById("password").focus();
        return false;
      }
   return true;

 }

//找回密码

function  Find_Pass()
 {
    var UserName = document.getElementById("username").value;
    var Email = document.getElementById("email").value;
    if(UserName.length<4)
     {
        alert("用户名必须大于4个字符!");
        document.getElementById("username").focus();
        return false;
     }

    if(!IsStr(UserName))
      {
        alert("用户只能由数字，字母，下划线组成!");
        document.getElementById("username").focus();
        return false;
      }

     if(Email.length<5)
     {
        alert("请输入您的邮箱!");
        document.getElementById("email").focus();
        return false;
     }

    if(Email.charAt(0)=="." || Email.charAt(0)=="@" || Email.indexOf('@', 0) == -1 || Email.indexOf('.', 0) == -1 || Email.lastIndexOf("@")==Email.length-1 || Email.lastIndexOf(".")==Email.length-1)
        {
          alert("邮箱格式不正确!");
          document.getElementById("email").focus();
          return false;
        }
   return true;

 }



//发短信
 function Check_Message(thetype)
  {  

   var fb_value=Trim(document.getElementById("fb_receiver").value);
   document.getElementById('Submit').value=thetype;
   if(fb_value=="")
    {
      alert("收件人不能为空!");
      document.getElementById("fb_receiver").focus();
      return false;
    }

   fb_value=Trim(document.getElementById("fb_title").value);
   if(fb_value=="")
    {
      alert("请输入短信标题!");
      document.getElementById("fb_title").focus();
      return false;
    }
  }

//反选JS
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

function Friends_window()
 {
  var FW=window.open("mem_friendslist.aspx","frienslist","width=250,height=380,left=200,top=200");
 }

//会员留言
 function Check_MemFeedback()
  {  
   var fb_value=Trim(document.getElementById("fb_title").value);
   if(fb_value=="")
    {
      alert("请输入留言标题!");
      document.getElementById("fb_title").focus();
      return false;
    }

   fb_value=Trim(document.getElementById("fb_truename").value);
   if(fb_value=="")
    {
      alert("请输入联系人姓名!");
      document.getElementById("fb_truename").focus();
      return false;
    }
   fb_value=Trim(document.getElementById("fb_tel").value);
   if(fb_value.length<5)
    {
      alert("请输入联系电话!");
      document.getElementById("fb_tel").focus();
      return false;
    }

   fb_value=Trim(document.getElementById("fb_email").value);
   if(fb_value=="")
    {
     alert("请输入您的邮箱!");
     document.getElementById("fb_email").focus();
     return false;
     }
     if (fb_value.charAt(0)=="." || fb_value.charAt(0)=="@" || fb_value.indexOf('@', 0) == -1 || fb_value.indexOf('.', 0) == -1 || fb_value.lastIndexOf("@")==fb_value.length-1 || fb_value.lastIndexOf(".")==fb_value.length-1)
        {
           alert("邮箱格式错误，请重新输入!");
          document.getElementById("fb_email").focus();
          return false;
        }

     if(document.getElementById("fb_content").style.display=="none")
      {
        fb_value=FCKeditorAPI.GetInstance("fb_content").GetXHTML(); 
       if(fb_value=="")
        {
         FCKeditorAPI.GetInstance("fb_content").Focus();
        }
      }
     else
      {
       fb_value=Trim(document.getElementById("fb_content").value);
       if(fb_value=="")
        {
         document.getElementById("fb_content").focus();
        }
      }
     if(fb_value=="")
     {
       alert("请输入留言内容!");
       return false;
      }


  }

//留言回复
 function Check_MemReplay()
  {
     if(document.getElementById("fb_content").style.display=="none")
      {
        fb_value=FCKeditorAPI.GetInstance("fb_content").GetXHTML(); 
       if(fb_value=="")
        {
         FCKeditorAPI.GetInstance("fb_content").Focus();
        }
      }
     else
      {
       fb_value=Trim(document.getElementById("fb_content").value);
       if(fb_value=="")
        {
         document.getElementById("fb_content").focus();
        }
      }
     if(fb_value=="")
     {
       alert("请输入反馈内容!");
       return false;
     }
  }

//发布文章
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

//发布产品
function Check_Product_Form(check_upload)
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

  if(obj5.value=="" && check_upload==1)
   {
     alert("产品图片不能为空!");
     obj5.focus();
     return false;
   }

}










