<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="GLJindex.aspx.cs" Inherits="JDJS.Web.GLJindex" %>
<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<link rel="Stylesheet" href="style/datePicker.css" type="text/css" />
     <script type="text/javascript" src="js/jquery.core.js"></script>
      <script type="text/javascript" src="js/jquery.datePicker.js"></script>
     <script type="text/javascript">
         jQuery(function () {
             $(".date-pick").datepicker({ changeMonth: true, changeYear: true });
         }); 
</script>
 <script type="text/javascript">
     function selecttype(obj3) {
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

    

<div class="dspagtitle"><span>工料机价格</span></div>

<table>
<tr>
    <td align="center">
                    <tr>
                    <td align=center>
                        适用领域</td>
                    <td>
                        <asp:DropDownList ID="bsort" runat="server" 
                            onchange="javascript:selecttype(this);" 
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
 <table style="width:765px;border-collapse:collapse; color:#003399; text-align:center;" border="1" cellpadding="0" cellspacing="0" bordercolor="#3366cc">
                 

                    <tr style=" background:#003399; color:#ffffff; font-weight:bold;">     
                       
                                <td style=" width:40%">
                                <span><b>名称\规格</b></span></td>
                                    <td style=" width:20%">
                               
                                    <span><b>计量单位</b></span></td>
                              <td style=" width:20%">
                                    <span><b>价格</b></span></td>
                                
                                <td style=" width:20%">
                                    <span><b>发布年月</b></span></td>
                        
                    </tr>
                    
                    
                    <asp:Repeater ID="Repmatlist" runat="server">
                        <ItemTemplate>
                            <tr class="dataTableBody">
                                
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("ysname").ToString(), 82, "...")%>
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("ysunit").ToString(), 20, "...")%>
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("price").ToString(), 32, "...")%>
                                </td>
                                <td style="padding-top:10px; padding-bottom:10px;">
                                    <%#LTP.Common.StringPlus.StrCut(Eval("ptime").ToString(), 20, "...")%>
                                </td>
                              
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                                 
                 <tr>
                    <td colspan="4" align="center">
                    <uc1:UcfarPager ID="UcfarPager6" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
</asp:Content>
