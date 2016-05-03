function IsDigit()
{
  return ((event.keyCode >= 48) && (event.keyCode <= 57));
}

function isNumeric(sText)  //检测字符串是否全为数字
{
	   var ValidChars = "0123456789";
	   var isNumber=true;
	   var Char;
	   for (i = 0; i < sText.length && isNumber == true; i++)
           { 

		  Char = sText.charAt(i); 

		  if (ValidChars.indexOf(Char) == -1){

			 isNumber = false;

		  }
	   }

          if(sText=="")
           {
             isNumber = false;
           }

	 return isNumber;
}


function IsStr(temp)  //检测字符串是否全为字符
  {
	validStr=new String("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_");
	for(i=0;i<temp.length;i++)
	{
		if(validStr.indexOf(temp.charAt(i))==-1)
		{
	        return false;
		}
	}
 
    if(temp=="")
      {
        return false;
      }

     
	return true;
  }




function checkname()
 {
 var value=document.getElementById("Name").value;
  if(value.length<2)
  {
   alert("请正确填写联系人姓名！");
   document.getElementById("Name").focus();
   return false;
  }
  return true;
 }

function checktel()
 {
  var value=document.getElementById("Tel").value;
  if(value.length<8)
   {
    alert("请正确填写联系电话！");
    document.getElementById("Tel").focus();
    return false;
   }

  return true;
 }


function checkcity()
 {
  var value=document.getElementById("City").value;
  if(value.length<2)
  {
   alert("请填写您所在的城市！");
   document.getElementById("City").focus();
   return false;
  }

  return true;

 }



function checkemail()
 {
   var u_nme=document.getElementById("Email").value;
   if(u_nme.length==0)
     {
       alert("请填写电子邮件地址。");
      document.getElementById("Email").focus();
       return false;
     } 
   else
    {
      if (u_nme.charAt(0)=="." || u_nme.charAt(0)=="@" || u_nme.indexOf('@', 0) == -1 || u_nme.indexOf('.', 0) == -1 || u_nme.lastIndexOf("@")==u_nme.length-1 || u_nme.lastIndexOf(".")==u_nme.length-1)
        {
          alert("电子邮件格式错误。");
          document.getElementById("Email").focus();
          return false;
        }
      else
       {
          return true;
       }
   }

 }

function checkpostcode()
 {
  var value=document.getElementById("PostCode").value;
  if(!isNumeric(value))
   {
    alert("邮编号码填写错误。");
    document.getElementById("PostCode").focus();
    return false;
   }

  if(value.length!=6)
  {
   alert("邮编只能由6位数字组成。");
   document.getElementById("PostCode").focus();
   return false;
  }

  return true;

 }

function checkaddress()
 {
  var value=document.getElementById("Address").value;
  if(value.length<4)
  {
    alert("请填写详细联系地址。");
    document.getElementById("Address").focus();
    return false;
  }
  return true;
 }



function checkall()
 {
  var Message=checkname() && checktel() && checkcity() && checkemail() && checkpostcode() && checkaddress();
  if(Message)
  {
   return true;
  }
  else
  {
   return false;
  }
 }




