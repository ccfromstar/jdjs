<% @  Control Language="c#"  Inherits="PageAdmin.mem_pay" %>
<div class="uc_lanmu_box">
<div class="uc_lanmu_site">
<ul>
<li class="uc_lanmu_site_1">当前位置：首页 &gt; <a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 在线支付</li>
<li class="uc_lanmu_site_2">在线支付</li>
</ul>
</div>
<div class="uc_lanmu_content">

<table border=0 cellpadding=5 cellspacing=0 width="90%" align=center>
    <tr>
      <td height="100" align="center">
       <select id="Pay_Type">
        <option value="">请选择一个在线支付平台</option>
        <%
          string[] A_Type=P_Type.Split(',');
          string[] A_Name=P_Name.Split(',');
          for(int i=0;i<A_Type.Length-1;i++)
           {
            Response.Write("<option value='"+A_Type[i]+"'>"+A_Name[i]+"</option>");
           }
        %>
      </select>
&nbsp;<input type="button" class="bt" value="确 定" onclick="GoToPay()">
     </td>
    </tr>
</TABLE>

</div>
</div>
<script language="javascript">
 function GoToPay()
 { 
   var P_type=document.getElementById("Pay_Type").value;
   if(P_type=="")
    {
     alert("请选择在线支付平台")
     return;
    }
   switch(P_type)
    {
      case "alipay":
       window.open("/member/onlinepay/alipay/Default.aspx","onlinepay")
      break;

      case "chinabank":
       window.open("/member/onlinepay/chinabank/Default.aspx","onlinepay")
      break;
    }
 }
 </script>