<% @ Page Language="C#"  Inherits="PageAdmin.zdyform_3"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  Type="zdyform_1" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>增加字段</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">

<form runat="server">
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
<table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
<tr>
  <td  width="150" height=25 align="right"><b>表单名称</b>：<td align="left"><%=Request.QueryString["fname"]%></td>
 </tr>
<tr>
  <td   height=25 align="right">字段标题：
  <td align="left"><input type="text" name="f_title" id="f_title" size="40" maxlength="50"> *比如：姓名</td>
 </tr>
<tr>
  <td   height=25 align="right"> 字段名称：
  <td align="left"><input type="text" name="f_name" id="f_name"  value="pa_" size="40" maxlength="50"> *为避免冲突,请以pa_开头,只能为字母、数据和下划线组成</td>
 </tr>

<tr>
  <td   height=25 align="right"> 表单类型：
  <td align="left">
<select name="f_type" id="f_type" onchange="T_Change(this.options[this.selectedIndex].value)">
<option value="text">单行文本(text)</option>
<option value="textarea">多行文本(textarea)</option>
<option value="select">下拉列表(select)</option>
<option value="radio">单选框(radio)</option>
<option value="checkbox">复选框(checkbox)</option>
<option value="file">文件(file)</option>
</select>
</td>
 </tr>
<tr id="T_0" style="display:none">
  <td   height=25 align="right">字段值类型：
  <td align="left"><input type="radio"  name="f_value" value="nvchar" checked>字符串 <input type="radio"  name="f_value"  value="int" >数值 <input type="radio"  name="f_value"  value="datetime" >日期</td>
 </tr>
<tr id="T_1" style="display:none">
  <td   height=25 align="right"> 默认值：
  <td align="left"><input type="text" name="f_dfvalue"  size="40" maxlength="50"></td>
 </tr>
<tr id="T_2" style="display:none">
  <td   height=25 align="right"> 文本框尺寸：
  <td align="left"><input name="f_style" id="f_style" type="text" size="40" maxlength="100" ></td>
 </tr>
<tr id="T_3" style="display:none">
  <td   height=25 align="right"> 选项列表：
  <td align="left"><Textarea name="f_item" id="f_item" cols="50" rows="8" ></Textarea> 每行为一个列表选项,值和文本用“,”隔开，如：1,推荐</td>
 </tr>
<tr id="T_4" style="display:none">
  <td   height=25 align="right"> 允许的扩展名：
  <td align="left"><input type="text"  name="f_ext"  value=".jpg,.gif,.doc,.rar" size="40" maxlength="100"> 过个扩展名请用“,”隔开 </td>
 </tr>
<tr id="T_5" style="display:none">
  <td   height=25 align="right"> 允许的文件大小：
  <td align="left"><input type="text" name="f_maxsize"  value="1024" size="5" maxlength="10">KB * 提示：1 MB = 1024 KB  </td>
 </tr>
<tr>
  <td   height=25 align="right"> 是否必填：
  <td align="left"><input type="radio"  name="f_mustfill" value="1" >是 <input type="radio" name="f_mustfill"  value="0" checked>否</td>
 </tr>
<tr>
  <td   height=25 align="right"> 前台显示：
  <td align="left"><input type="radio"  name="f_show" value="1" checked>是 <input type="radio" name="f_show"  value="0">否</td>
 </tr>

<tr id="T_8">
  <td   height=25 align="right"> 搜索字段：
  <td align="left"><input type="radio"  name="f_search" value="0" checked>否 <input type="radio" name="f_search"  value="1">模糊匹配 <input type="radio" name="f_search"  value="2">精确匹配</td>
 </tr>

<tr id="T_9">
  <td   height=25 align="right"> 启用编辑器：
  <td align="left"><input type="radio"  name="f_fckeditor" value="0" checked>否 <input type="radio" name="f_fckeditor"  value="1">是</td>
 </tr>

<tr>
  <td   height=25 align="right"> 排列顺序：
  <td align="left"><input type="text" name="f_xuhao" value="1" size="5" maxlength="3" ></td>
 </tr>

 <tr id="T_js">
  <td   height=25 align="right"> 验证JS：
  <td align="left"><Textarea name="f_js" cols="50" rows="4" ></Textarea></td>
 </tr>
</table>
<br>
<div align="center">
<input type="hidden" name="submit" value="yes">
<input type="submit" class=button  value="增加" onclick="return CheckInput()" />
<input type="button" class=button  value="返回"  onclick="location.href='zdyform_2.aspx?&fid=<%=Request.QueryString["fid"]%>&ftable=<%=Request.QueryString["ftable"]%>&fname=<%=Server.UrlEncode(Request.QueryString["fname"])%>'"></div>
</form>
</td>
</tr>
</table>
<br>
<asp:Label id="LblErr" runat="server" />
</center>
<script language="javascript">
var ObJ0=document.getElementById("T_0");
var ObJ1=document.getElementById("T_1");
var ObJ2=document.getElementById("T_2");
var ObJ3=document.getElementById("T_3");
var ObJ4=document.getElementById("T_4");
var ObJ5=document.getElementById("T_5");

var ObJ6=document.getElementById("T_8");
var ObJ7=document.getElementById("T_9");

var ObJjs=document.getElementById("T_js");

var ObJtype=document.getElementById("f_type");
var ObJstyle=document.getElementById("f_style");
var ObJItem=document.getElementById("f_item");

function T_Change(Str)
 {
   HideAll();
   switch(Str)
    {
      case "text":
         ObJ0.style.display="";
         ObJ1.style.display="";
         ObJ2.style.display="";
         ObJ6.style.display="";
         ObJjs.style.display="";
         ObJstyle.value="width:200px;height:20px;";
      break;

      case "textarea":
         ObJ1.style.display="";
         ObJ2.style.display="";
         ObJ6.style.display="";
         ObJ7.style.display="";
         ObJjs.style.display="";
         ObJstyle.value="width:300px;height:100px;";
      break;

      case "file":
         ObJ2.style.display="";
         ObJ4.style.display="";
         ObJ5.style.display="";
         ObJjs.style.display="";
         ObJstyle.value="width:300px;height:25px;";
      break;
     
      case "select":
         ObJ1.style.display="";
         ObJ3.style.display="";
         ObJ6.style.display="";
         ObJjs.style.display="";
      break;

      default:
         ObJ1.style.display="";
         ObJ3.style.display="";
         ObJ6.style.display="";
      break;

    }
 }
function HideAll()
 {
  ObJ0.style.display="none";
  ObJ1.style.display="none";
  ObJ2.style.display="none";
  ObJ3.style.display="none";
  ObJ4.style.display="none";
  ObJ5.style.display="none";
  ObJ6.style.display="none";
  ObJ7.style.display="none";
  ObJjs.style.display="none";
 }

T_Change(ObJtype.value);

function CheckInput()
 {
  var Val=document.getElementById("f_title");
  if(Trim(Val.value)=="")
   {
    alert("请填写字段标题!");
    Val.focus();
    return false;
   }

  Val=document.getElementById("f_name");
  if(Trim(Val.value)=="")
   {
    alert("请填写字段名称!");
    Val.focus();
    return false;
   }

  if(Trim(Val.value)=="pa_")
   {
    alert("请填写完整的字段,比如:pa_xingming");
    Val.focus();
    return false;
   }

  if(ObJtype.value=="select" ||  ObJtype.value=="radio" || ObJtype.value=="checkbox")
   {
      if(Trim(ObJItem.value)=="")
       {
         alert("请填写选项列表");
         ObJItem.focus();
         return false;
       }
      else
       {
         if(ObJItem.value.indexOf("|")>=0)
          {
            alert("选项列表不能带'|'字符");
            ObJItem.focus();
            return false;
          }
         var Items=Trim(ObJItem.value).replace(/\n/ig,"|");
         var AItems=Items.split('|');
         for(i=0;i<AItems.length;i++)
          {
            if(AItems[i].indexOf(",")<=0)
             {
                alert("选项列表第"+(i+1)+"行格式错误,格式为：列表值,列表文本");
                ObJItem.focus();
                return false;
             }
          }
       }
   }

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
</script>
</body>
</html>  













