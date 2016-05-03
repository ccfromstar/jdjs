<% @ Control language="c#" Inherits="PageAdmin.hrjoin"%>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1"><%=Tags_1%> &gt; <%=Lanmu_site%></li>
<li class="uc_lanmu_site_2"><%=Lanmu_3%></li>
</ul>
</div>
<div class="uc_lanmu_content">
<form method="post" action="<%=PostUrl%>">
<div align=center id="Div1">
<table border=1 cellpadding=0 cellspacing=0 align="center" class="hrjoin_table">
     <tr>
      <td width="80px"   align=center>个人资料</td>
      <td  align="center">
  <table border=0 cellpadding=5 cellspacing=0 width="100%" align="center" >
     <tr>
       <td width=110 align=right>应聘职位</td>
      <td align=left>
         <select name="Post" id="Post"><option value="0">=====请选择=====</option></select>
      </td>
    </tr>

     <tr class="hrjoin_item">
       <td width=110 align=right>姓名</td><td align=left><input type=text id="Name"  name="Name" Maxlength="40" size=20 class="tb" />
   </td>
     </tr>
     <tr>
       <td width=110 align=right>性别</td>
       <td align=left><select name="Xingbie" id="Xingbie"><option value="男" checked>男</option><option value="女">女</option></select></td>
     </tr>
     <tr class="hrjoin_item">
       <td width=110 align=right >出身年月</td>
    <td align=left><select id="Year" name="Year">
					<option value="1960">1960</option>
					<option value="1961">1961</option>
					<option value="1962">1962</option>
					<option value="1963">1963</option>
					<option value="1964">1964</option>
					<option value="1965">1965</option>
					<option value="1966">1966</option>
					<option value="1967">1967</option>
					<option value="1968">1968</option>
					<option value="1969">1969</option>
					<option value="1970">1970</option>
					<option value="1971">1971</option>
					<option value="1972">1972</option>
					<option value="1973">1973</option>
					<option value="1974">1974</option>
					<option value="1975">1975</option>
					<option value="1976">1976</option>
					<option value="1977">1977</option>
					<option value="1978">1978</option>
					<option value="1979">1979</option>
					<option value="1980" selected>1980</option>
					<option value="1981">1981</option>
					<option value="1982">1982</option>
					<option value="1983">1983</option>
					<option value="1984">1984</option>
					<option value="1985">1985</option>
					<option value="1986">1986</option>
					<option value="1987">1987</option>
					<option value="1988">1988</option>
					<option value="1989">1989</option>
					<option value="1990">1990</option>
					<option value="1991">1991</option>
					<option value="1992">1992</option>
					<option value="1993">1993</option>
					<option value="1994">1994</option>
					<option value="1995">1995</option>
					<option value="1996">1996</option>
					<option value="1997">1997</option>
					<option value="1998">1998</option>
					<option value="1999">1999</option>
					<option value="2000">2000</option>
					<option value="2001">2001</option>
					<option value="2002">2002</option>
					<option value="2003">2003</option>
					<option value="2004">2004</option>
					<option value="2005">2005</option>
					<option value="2006">2006</option>
					<option value="2007">2007</option>
					<option value="2008">2008</option>
					<option value="2009">2009</option>
					<option value="2010">2010</option>
					<option value="2011">2011</option>
					<option value="2012">2012</option>
					<option value="2013">2013</option>
					<option value="214">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
					<option value="2019">2019</option>
					<option value="2020">2020</option>
					</select>

               <select id="Month" name="Month">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					</select> 
        <select id="Day"  name="Day" >
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
					</select>
    </td>
     </tr>
   <tr>
       <td width=110 align=right>婚否</td>
       <td align=left>
      <select id="Marry" name="Marry">
       <option value="未婚">未婚</option>
       <option value="已婚">已婚</option>
       </select>
      </td>
     </tr>
   <tr class="hrjoin_item">
       <td width=110 align=right>籍贯</td>
       <td align=left>
<select  id="Province" name="Province">
<option value=北京>北京</option>
<option value=上海>上海</option>
<option value=天津>天津</option>
<option value=重庆>重庆</option>
<option value=广东>广东</option>
<option value=浙江>浙江</option>
<option value=福建>福建</option>
<option value=安徽>安徽</option>
<option value=广西>广西</option>
<option value=云南>云南</option>
<option value=贵州>贵州</option>
<option value=四川>四川</option>
<option value=湖北>湖北</option>
<option value=湖南>湖南</option>
<option value=海南>海南</option>
<option value=江苏>江苏</option>
<option value=江西>江西</option>
<option value=山东>山东</option>
<option value=山西>山西</option>
<option value=陕西>陕西</option>
<option value=河北>河北</option>
<option value=河南>河南</option>
<option value=黑龙江>黑龙江</option>
<option value=辽宁>辽宁</option>
<option value=吉林>吉林</option>
<option value=宁夏>宁夏</option>
<option value=青海>青海</option>
<option value=西藏>西藏</option>
<option value=新疆>新疆</option>
<option value=内蒙古>内蒙古</option>
<option value=甘肃>甘肃</option>
<option value=香港>香港</option>
<option value=台湾>台湾</option>
<option value=澳门>澳门</option>
<option value=其他>其他</option>
</select>

      </td>
     </tr>
     <tr>
       <td width=110 align=right >身高</td><td align=left><input type="text" name="High"  id="High"   Maxlength="40" size=20 class="tb"/> 厘米</td>
     </tr>
     <tr class="hrjoin_item">
       <td width=110 align=right >体重</td><td align=left><input type="text" name="Weight"  id="Weight" Maxlength="40" size=20 class="tb"/> 公斤</td>
     </tr>
     <tr >
       <td width=110 align=right >联系电话</td><td align=left><input type="text" name="Tel" id="Tel"  Maxlength="40" size=20  class="tb" /></td>
     </tr>
     <tr class="hrjoin_item">
       <td width=110 align=right >E_mail</td><td align=left><input type="text" name="Email" id="Email"  Maxlength="50" size=20  class="tb" />
    </td>
     </tr>
     <tr>
       <td width=110 align=right >居住地址</td><td align=left><input type="text" name="Address" id="Address"   Maxlength="40" size=40  class="tb"/></td>
     </tr>
   </table>
   </td>
  </tr>

  <tr style="padding:0 0 0 0">  
    <td colspan="2" height="20"  style="padding:0 0 0 0"></td>
  </tr>

   <tr>
    <td width="80px" align="center">专业介绍</td>
    <td align="center">

    <table border=0 cellpadding=5 cellspacing=0 width="100%" align="center" >
     <tr >
       <td width=110px align=right >学历</td>
      <td align=left>
       <select name="Xueli" id="Xueli">
                                <option value="">－请选择－</option>
                                <option value="博士后">博士后</option>
                                <option value="博士">博士</option>
                                <option value="硕士">硕士</option>
                                <option value="双学位">双学位</option>
                                <option value="本科">本科</option>
                                <option value="专科">专科</option> 
                                <option value="高中">高中</option>
                                <option value="高中">高中以下</option>

       </select>
    </td>
     </tr>
     <tr class="hrjoin_item">
       <td width=110px align=right >毕业学校</td><td align=left><input type="text" id="School" name="School"   Maxlength="40" size=20 class="tb"/></td>
     </tr>
      <tr>
       <td width=110px align=right >毕业时间</td><td align=left><input type="text" id="Gradutime"  name="Gradutime"   Maxlength="40" size=20  class="tb"/></td>
     </tr>
     <tr class="hrjoin_item">
       <td width=110 align=right >英语水平</td><td align=left><input type="text" id="Enlevel" name="Enlevel"   Maxlength="40" size=20  class="tb"/> </td>
     </tr>
      <tr>
       <td width=110 align=right >计算机水平</td><td align=left><input type="text"  id="Computerlevel" name="Computerlevel"   Maxlength="40" size=20  class="tb"/></td>
     </tr>
     <tr class="hrjoin_item">
       <td width=110 align=right >所学专业</td><td align=left><input type="text"  id="Zhuanye" name="Zhuanye" Maxlength="40" size=20  class="tb"/></td>
     </tr>
      <tr>
       <td width=110 align=right >工作年限</td><td align=left><input type="text"  id="Workyears" name="Workyears"  Maxlength="40" size=20  class="tb"/> 年</td>
     </tr>
     <tr class="hrjoin_item">
       <td width=110 align=right >工作经历<br>(300字内)</td><td align=left><TextArea id="Gzjl" name="Gzjl"  cols="50" rows="8"></TextArea></td>
     </tr>
     <tr>
       <td width=110 align=right >工作技能<br>(300字内)</td><td align=left><TextArea id="Gzjn" name="Gzjn"  cols="50" rows="8"></TextArea></td>
     </tr>
   </table>
   </td>
  </tr>
 </table> 
<br>
<input type="hidden" name="submit" value="1" />
<input type="hidden" name="PostText" id="PostText" />
<input type="button" value=" 简历预览 " class="bt1" onclick="Show_Div2()">
<input type="reset" value=" 重新填写 " class="bt1">
</div>
<div align=center id="Div2" style="display:none">
<div id="View_Jl"></div>
<br>
<input type="button" value=" 返回修改 " class="bt1"  onclick="Show_Div1()">
<input type="submit" value=" 提交简历 " class="bt1" onclick="return confirm('是否确定提交?')">
</div>
<br>
</form>


</div></div>
<script src="/js/hrjoin.js" language="javascript"></script>
<script language="javascript">
var PostDetail="<%=PostDetail%>";
var Field_Names="<%=Zhiweis%>"
var Fields_Titles="<%=ZhiweisId%>"
var AField_Names=Field_Names.split(',');
var AFields_Titles=Fields_Titles.split(',');
var obj=document.getElementById("Post");
var ALength=AField_Names.length-1;
for(i=0;i<ALength;i++)
 {
   obj.options.add(new Option(AField_Names[i],AFields_Titles[i]));
 }
if(PostDetail!="")
 {
  obj.value=PostDetail;
 }

var  obj1=document.getElementById("Div1");
var  obj2=document.getElementById("Div2");
var  obj3=document.getElementById("View_Jl");

function Show_Div1()
 {
   obj1.style.display="";
   obj2.style.display="none";
   obj3.innerHTML="";
 }

function Show_Div2()
 {
  if(Check_Hrjoin())
   {
     obj1.style.display="none";
     obj2.style.display="";
     Get_View();
   }
 }
</script>
