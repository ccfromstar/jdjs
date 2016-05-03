function Check_Feedback()//中文
  {  

   var fb_value=Trim(document.getElementById("fb_truename").value);
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

  fb_value=Trim(document.getElementById("fb_content").value);
   if(fb_value=="")
    {
      alert("请输入留言内容!");
      document.getElementById("fb_content").focus();
      return false;
    }

  fb_value=Trim(document.getElementById("fb_yzm").value);
   if(fb_value=="")
    {
      alert("请输入验证码!");
      document.getElementById("fb_yzm").focus();
      return false;
    }


  }


function En_Check_Feedback()//英文
  {  

   var fb_value=Trim(document.getElementById("fb_truename").value);
   if(fb_value=="")
    {
      alert("Please enter a contact name!");
      document.getElementById("fb_truename").focus();
      return false;
    }
   fb_value=Trim(document.getElementById("fb_tel").value);
   if(fb_value.length<5)
    {
      alert("Please enter a contact telephone!");
      document.getElementById("fb_tel").focus();
      return false;
    }

   fb_value=Trim(document.getElementById("fb_email").value);
   if(fb_value=="")
    {
     alert("Please enter your E-mail!");
     document.getElementById("fb_email").focus();
     return false;
     }
     if (fb_value.charAt(0)=="." || fb_value.charAt(0)=="@" || fb_value.indexOf('@', 0) == -1 || fb_value.indexOf('.', 0) == -1 || fb_value.lastIndexOf("@")==fb_value.length-1 || fb_value.lastIndexOf(".")==fb_value.length-1)
        {
           alert("E-mail format error!");
          document.getElementById("fb_email").focus();
          return false;
        }

   fb_value=Trim(document.getElementById("fb_content").value);
   if(fb_value=="")
    {
      alert("Please enter a message!");
      document.getElementById("fb_content").focus();
      return false;
    }

   fb_value=Trim(document.getElementById("fb_yzm").value);
   if(fb_value=="")
    {
      alert("Please enter the verification code!");
      document.getElementById("fb_yzm").focus();
      return false;
    }

  }

