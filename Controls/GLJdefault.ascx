<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GLJdefault.ascx.cs" Inherits="JDJS.Web.Controls.GLJdefault" %>

 <script type="text/javascript">
     function selectgljtype(obj3) {
         var index3 = obj3.options[obj3.selectedIndex].value;
         $.ajax({
             type: "post",
             url: "/Controls/SelectGLJtype.ashx",
             dataType: "html",
             data: ({ spcode: index3 }),
             beforeSend: function (XMLHttpRequest2) {

             },
             success: function (msg2) {
                 $("#" + "<%=ssort.ClientID %>").html(msg2);

             },

             complete: function (XMLHttpRequest2, textStatus2) {

             },
             error: function () {

             }
         });

     }
   
   </script>
<div style="margin-top:10px;">
    <img width="787" height="40" alt="工料机价格" src="uploads/glj-index.gif" border="0" />
</div>
<div class="seach" style="border:1px #004fa8 solid ;border-bottom-width:1px;">    


<table>
<tr>
    <td align="center">
                    <tr>
                    <td align=center>
                        适用领域</td>
                    <td>
                        <asp:DropDownList ID="bsort" runat="server" 
                            onchange="javascript:selectgljtype(this);" 
                            >
        </asp:DropDownList>
                    </td>


                     <td align=center>
                         分类</td>
                    <td >
                        <asp:DropDownList ID="ssort" runat="server" >
        </asp:DropDownList>
                    </td>
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:Button ID="Button1" runat="server" Text="点击搜索"  OnClick="LinkButton2_Click"/>
                     </td>

                    </tr>
                     <td align=center>
                       名称\规格
                    </td>
                    <td >
                        <asp:TextBox ID="txtTitle" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td align=center>
                        年月</td>
                    <td>
                        <asp:DropDownList ID="gljym" runat="server">
        </asp:DropDownList>
                    </td>
        
                   
                    
         </td>
     </tr>
  </table>
</div>