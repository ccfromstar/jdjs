var Str_post,Str_name,Str_xingbie,Str_birthdaye,Str_marry,Str_province,Str_hight,Str_weight,Str_tel,Str_email,Str_address,Str_xueli,Str_school,Str_gradutime,Str_enlevel,Str_computerlevel,Str_zhuanye,Str_workyears,Str_gzjl,Str_gzjn;
function Check_Hrjoin() 
  {  
   Str_post=Trim(document.getElementById("Post").value);
   if(Str_post=="0")
    {
      alert("请选择应聘职位!");
      document.getElementById("Post").focus();
      return false;
    }

   document.getElementById("PostText").value=document.getElementById("Post").options[document.getElementById("Post").selectedIndex].text;
   Str_post=document.getElementById("PostText").value;

   Str_name=Trim(document.getElementById("Name").value);
   if(Str_name=="")
    {
      alert("请输入您的姓名!");
      document.getElementById("Name").focus();
      return false;
    }
  Str_xingbie=document.getElementById("Xingbie").value;
  Str_birthdaye=document.getElementById("Year").value+"-"+document.getElementById("Month").value+"-"+document.getElementById("Day").value;
  Str_marry=document.getElementById("Marry").value;
  Str_province=document.getElementById("Province").value;
  Str_hight=Trim(document.getElementById("High").value);
  Str_weight=Trim(document.getElementById("Weight").value);


   Str_tel=Trim(document.getElementById("Tel").value);
   if(Str_tel.length<5)
    {
      alert("请输入联系电话!");
      document.getElementById("Tel").focus();
      return false;
    }

   Str_email=Trim(document.getElementById("Email").value);
   if(Str_email=="")
    {
     alert("请输入您的邮箱!");
     document.getElementById("Email").focus();
     return false;
     }
     if (Str_email.charAt(0)=="." || Str_email.charAt(0)=="@" || Str_email.indexOf('@', 0) == -1 || Str_email.indexOf('.', 0) == -1 || Str_email.lastIndexOf("@")==Str_email.length-1 || Str_email.lastIndexOf(".")==Str_email.length-1)
        {
           alert("邮箱格式错误，请重新输入!");
          document.getElementById("Email").focus();
          return false;
        }


   Str_address=Trim(document.getElementById("Address").value);
   if(Str_address.length<5)
    {
      alert("请输入居住地址!");
      document.getElementById("Address").focus();
      return false;
    }

   Str_xueli=Trim(document.getElementById("Xueli").value);
   if(Str_xueli.length=="")
    {
      alert("请选择您的学历!");
      document.getElementById("Xueli").focus();
      return false;
    }


   Str_school=Trim(document.getElementById("School").value);
   if(Str_school.length<4)
    {
      alert("请输入毕业学校!");
      document.getElementById("School").focus();
      return false;
    }



   Str_gradutime=Trim(document.getElementById("Gradutime").value);
   if(Str_gradutime.length<6)
    {
      alert("请输入毕业时间,如：2003-09-01");
      document.getElementById("Gradutime").focus();
      return false;
    }

   Str_enlevel=Trim(document.getElementById("Enlevel").value);
   if(Str_enlevel.length=="")
    {
      alert("请描述一下您的英语水平!");
      document.getElementById("Enlevel").focus();
      return false;
    }

   Str_computerlevel=Trim(document.getElementById("Computerlevel").value);
   if(Str_computerlevel.length=="")
    {
      alert("请描述一下您的计算机水平!");
      document.getElementById("Computerlevel").focus();
      return false;
    }


  Str_zhuanye=Trim(document.getElementById("Zhuanye").value);
   if(Str_zhuanye=="")
    {
      alert("请输入所学专业!");
      document.getElementById("Zhuanye").focus();
      return false;
    }

  Str_workyears=Trim(document.getElementById("Workyears").value);
   if(Str_workyears=="")
    {
      alert("请输入工作年限!");
      document.getElementById("Workyears").focus();
      return false;
    }

  Str_gzjl=document.getElementById("Gzjl").value;
   if(Str_gzjl=="")
    {
      alert("请描述一下您的工作经历!");
      document.getElementById("Gzjl").focus();
      return false;
    }
  Str_gzjl=replaceAll(Str_gzjl,"\r\n","<br>");
  Str_gzjl=replaceAll(Str_gzjl," ","&nbsp;")



  Str_gzjn=document.getElementById("Gzjn").value;
   if(Str_gzjn=="")
    {
      alert("请描述一下您的工作技能!");
      document.getElementById("Gzjn").focus();
      return false;
    }
  Str_gzjn=replaceAll(Str_gzjn,"\r\n","<br>");
  Str_gzjn=replaceAll(Str_gzjn," ","&nbsp;");
  return true;
  }


function Get_View()
 {
 var Jianli="<table border=1  align=center class='hrview_table'><tr><td colspan=6 height=25 align=center><b>简历预览<b></td></tr><tr><td colspan=6 height=25 align=left>应聘职位："+Str_post+"</td></tr>";
 Jianli=Jianli+"<tr><td width=100px height=25 align=center style='font-weight:bold' >姓名</td><td width=100px>"+Str_name+"</td><td width=100px  align=center style='font-weight:bold'  >性别</td><td width=100px>"+Str_xingbie+"</td><td width=100px  align=center style='font-weight:bold'  >出生年月</td><td width=100px>"+Str_birthdaye+"</td></tr>";
 Jianli=Jianli+"<tr><td width=100px height=25 align=center style='font-weight:bold' >婚姻状况</td><td width=100px>"+Str_marry+"</td><td width=100px  align=center style='font-weight:bold'  >籍贯</td><td width=100px>"+Str_province+"</td><td width=100px  align=center style='font-weight:bold'  >身高</td><td width=100px>"+Str_hight+"cm</td>";
 Jianli=Jianli+"</tr><tr><td width=100px height=25 align=center style='font-weight:bold' >联系电话</td><td width=100px>"+Str_tel+"</td><td width=100px  align=center style='font-weight:bold'  >Email</td><td width=100px>"+Str_email+"</td><td width=100px  align=center style='font-weight:bold'  >体重</td><td width=100px>"+Str_weight+"kg</td>";
 Jianli=Jianli+"</tr><tr><td width=100px height=25 align=center style='font-weight:bold' >住址</td><td colspan=5  align=left>"+Str_address+"</td></tr>";
 Jianli=Jianli+"<tr><td colspan=6 height=25></td></tr><tr><td width=100px height=25 align=center style='font-weight:bold' >学历</td><td width=100px>"+Str_xueli+"</td><td width=100px height=25 align=center style='font-weight:bold'  >毕业学校</td><td width=100px>"+Str_school+"</td><td width=100px  align=center style='font-weight:bold'  >毕业时间</td><td width=100px>"+Str_gradutime+"</td>";
 Jianli=Jianli+"</tr><tr><td width=100px height=25 align=center style='font-weight:bold'>所学专业</td><td width=100px>"+Str_zhuanye+"</td><td width=100px  align=center style='font-weight:bold'  >英语水平</td><td width=100px>"+Str_enlevel+"</td><td width=100px  align=center style='font-weight:bold'  >计算机水平</td><td width=100px>"+Str_computerlevel+"</td></tr>";
 Jianli=Jianli+"<tr><td colspan=6 height=25></td></tr>";
 Jianli=Jianli+"<tr><td width=100px height=25 align=center style='font-weight:bold'>工作年限</td><td colspan=5 align=left>"+Str_workyears+"年</td></tr>";
 Jianli=Jianli+"<tr><td width=100px height=25 align=center style='font-weight:bold'>工作经历</td><td colspan=5 align=left style='line-height:22px;'>"+Str_gzjl+"</td></tr>";
 Jianli=Jianli+"<tr><td width=100px height=25 align=center style='font-weight:bold'>工作技能</td><td colspan=5  align=left style='line-height:22px;'>"+Str_gzjn+"</td></tr></table>";
 var obj=document.getElementById("View_Jl");
 obj.innerHTML=Jianli;
 }
