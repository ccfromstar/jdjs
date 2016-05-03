
<%@ Page Language="C#" MasterPageFile="ProMaster.master" AutoEventWireup="true" CodeBehind="CustContent.aspx.cs" Inherits="JDJS.Web.ProjectGL.CustContent" %>

<%@ Register Assembly="UcfarPager" Namespace="UcfarPagerControls" TagPrefix="uc1" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">

    <script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="js/onload.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/jquery.core.js"></script>
    <script type="text/javascript" src="../js/jquery.datePicker.js"></script>
    <script type="text/javascript">
        jQuery(function () {
            $(".date-pick").datepicker({ changeMonth: true, changeYear: true });
        });
     </script>
    <script type="text/javascript">
        function SelectArea(obj6) {
            var index6 = obj6.options[obj6.selectedIndex].value;
            $.ajax({
                type: "post",
                url: "/Controls/SelectArea.ashx",
                dataType: "html",
                data: ({ spcode: index6 }),
                beforeSend: function (XMLHttpRequest5) {

                },
                success: function (msg5) {
                    $("#" + "<%=area.ClientID %>").html(msg5);

                },

                complete: function (XMLHttpRequest5, textStatus5) {

                },
                error: function () {

                }
            });

        }

        $(function () {
            $('[data-type="checkbox"]').click(function () {
                var data_value = $(this).attr('data-value'),
			txtalso = $.trim($(".txtValue").val());
                if ($(this).prop("checked")) {
                    if (txtalso.length > 0) {
                        if (txtalso.indexOf(data_value + ',') != -1) {
                            return;
                        } else {
                            txtalso += data_value + ',';
                        }
                    } else {
                        txtalso = data_value + ',';
                    }
                } else {
                    if (txtalso.indexOf(data_value + ',') != -1) {
                        txtalso = txtalso.replace(data_value + ',', '');
                                        
                    }
                }
                $(".txtValue").val(txtalso);
            });
            $('[data-type="checkall"]').click(function () {
                var str = '';
                if ($(this).prop("checked")) {
                    $.each($('[data-type="checkbox"]'), function (i) {
                        str += $(this).attr('data-value') + ',';
                    });
                    $('[data-type="checkbox"]').prop('checked', true);
                } else {
                    $('[data-type="checkbox"]').prop('checked', false);
                }
                $(".txtValue").val(str);
            });
        });
</script>

<div style="width:88%; padding-top:0px; float:right">
    <table border="0" cellspacing="0" cellpadding="0" width="100%"  >
   

<tr>
    <td class="left_Bg">
        <table  cellpadding="2" cellspacing="0">
    

         



     
        <asp:Panel ID="Panel9" runat="server" Visible="false">
        
                <table width="100%">
                <tr>
                    <td style=" width:230px">工程状态：
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            
                        </asp:DropDownList>
                    </td>
                    <td style=" width:240px">工程类别：
                        <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Selected="True" Value="全部信息">全部信息</asp:ListItem>
                        <asp:ListItem>办公楼</asp:ListItem>
                        <asp:ListItem>酒店</asp:ListItem>
                        <asp:ListItem>市政</asp:ListItem>
                        <asp:ListItem>工业</asp:ListItem>
                        <asp:ListItem>住宅</asp:ListItem>
                        <asp:ListItem>医疗</asp:ListItem>
                        <asp:ListItem>别墅</asp:ListItem>
                        <asp:ListItem>教育</asp:ListItem>
                        <asp:ListItem>商业</asp:ListItem>
                        <asp:ListItem>停车厂</asp:ListItem>
                        <asp:ListItem>社区</asp:ListItem>
                        <asp:ListItem>教育</asp:ListItem>
                        <asp:ListItem>展览</asp:ListItem>
                        <asp:ListItem>基本建设</asp:ListItem>
                        <asp:ListItem>园林</asp:ListItem>
                        <asp:ListItem>司法</asp:ListItem>
                        <asp:ListItem>开采</asp:ListItem>
                        <asp:ListItem>石油及天燃气</asp:ListItem>
                        <asp:ListItem>文娱</asp:ListItem>
                        <asp:ListItem>零售</asp:ListItem>
                        <asp:ListItem>开发</asp:ListItem>
                        <asp:ListItem>机场及交通枢纽</asp:ListItem>
                        <asp:ListItem>公用事业</asp:ListItem>
                        <asp:ListItem>机场</asp:ListItem>            
                        <asp:ListItem>其他</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    
                    <td style=" width:140px">省/直辖市：               
                        <asp:DropDownList ID="DropDownList3" runat="server" 
                        onchange="javascript:SelectArea(this);">
                            
                        </asp:DropDownList>
                    </td>
                    <td style=" width:140px">市/区：                    
                        <asp:DropDownList ID="area" runat="server">
                            
                        </asp:DropDownList>
                    </td>
                    
                    <td>装修情况：<asp:DropDownList ID="ZhuangXiu" runat="server">
                        <asp:ListItem Selected="True" Value="全部信息">全部信息</asp:ListItem>
                        <asp:ListItem>不确定</asp:ListItem>
                        <asp:ListItem>无装修</asp:ListItem>
                        <asp:ListItem>简单全装修</asp:ListItem>
                        <asp:ListItem>部分装修</asp:ListItem>
                        <asp:ListItem>精装修</asp:ListItem>
                        
                        </asp:DropDownList>
                    </td>
                    </tr> 
                    <tr>               
                    <td>
                       工程名称：
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                  <td>
                       工程地址：
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButton2" runat="server" class="zPushBtn" onclick="LinkButton2_Click" 
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20"  alt="点击查询"/><b>搜索&nbsp;</b></asp:LinkButton>
                          
                            </td><td><input class="txtValue" type="text" name="name" value="" style="visibility:hidden"/></td>
                    
                    </tr>
                    <tr>
                    <td>
                        发布日期：
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="date-pick"></asp:TextBox>-
                    </td>
                    <td>
                        
                       -<asp:TextBox ID="TextBox3" runat="server"  CssClass="date-pick"></asp:TextBox>
                    </td>
                    </tr>
                    <tr>
                    <td>
                        开工日期：
                        <asp:TextBox ID="TextBox9" runat="server"  CssClass="date-pick"></asp:TextBox>-
                    </td>
                   <td>
                        
                       -<asp:TextBox ID="TextBox10" runat="server"  CssClass="date-pick"></asp:TextBox>
                    </td>
                    </tr>
                    <tr>
                    <td>
                        竣工日期：
                        <asp:TextBox ID="TextBox12" runat="server"  CssClass="date-pick"></asp:TextBox>-
                    </td>
                    <td>
                        
                       -<asp:TextBox ID="TextBox13" runat="server" CssClass="date-pick"></asp:TextBox>
                    </td>
                    </tr>
                     <tr>
                    <td>
                        工程造价：
                        <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>-
                    </td>
                    <td>
                        
                       -<asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>（万RMB）                      
                    </td>
                    
                    </tr>
                  
                </table>
        </asp:Panel>
       
       
      
     
     
       
         <tr>
            <td>
           
            <asp:Panel ID="Panel2" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td width="60px;"> <span style="float:left"><b><input type="checkbox" data-type="checkall"/>全选</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right"></td>
                    <td>
                        <span style="float:left"><b>项目名称</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                     <td width="120px;">
                        <span style="float:left"><strong>项目阶段</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="100px;">
                        <span style="float:left"><strong>工程造价(估算)</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="100px;">
                        <span style="float:left"><strong>发布日期</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    
                    <!--<td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>-->
                </tr>
                <asp:Repeater ID="Rep2" runat="server">
                <ItemTemplate>
                <tr>
                    <td>
                         <span style="float:left"><input type="checkbox"  data-type="checkbox"  data-value="<%#Eval("id") %>" /></span>
                    </td>
                    <td  class="dataTableBody"><a href="CustProShow.aspx?proid=<%#Eval("id") %>" title="<%#ReplaceStr(Eval("prorek").ToString(),"<br>","")%>" target="_blank"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 150, "...")%></a></td>
                    <td  class="dataTableBody"><%#LTP.Common.StringPlus.StrCut(Eval("prostate").ToString(), 22, "...")%></td>
                    <td  class="dataTableBody"><%#LTP.Common.StringPlus.StrCut(Eval("promoney").ToString(), 22, "...")%></td>
                    <td  class="dataTableBody"><%#ReplacetimeStr(Eval("inforptime").ToString())%></td>
                    <!--<td><%#LTP.Common.StringPlus.StrCut(Eval("inforptime").ToString(), 22, "...")%></td>-->
                   <!--<td><a href="Edit.aspx?type=<%=Part%>&proid=<%#Eval("id") %>&Act=EditPro" class="zPushBtn"><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>-->
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="2" align="center">
                    <uc1:UcfarPager ID="UcfarPager5" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
             </asp:Panel>

            <asp:Panel ID="Panel3" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td style="height:30px;" align="right">人员ID</td>
                    <td>
                      <asp:TextBox ID="TextBox6" runat="server" Width="60px"></asp:TextBox>
                    </td>
                    <td style="height:30px;" align="right">姓名：</td>
                    <td>
                      <asp:TextBox ID="TextBox7" runat="server" Width="80px"></asp:TextBox>
                    </td>
                    <td style=" width:80px; height:30px;" align="right">职务/职称：</td>
                    <td>
                      <asp:TextBox ID="TextBox5" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td align="center">
                       所属公司：
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                    
                    <td style=" width:280px" align="center" colspan="3">
                        <asp:LinkButton ID="LinkButton1" runat="server" class="zPushBtn"  OnClick="linkmanLB_Check"
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton>
                    <a href="CustContent.aspx?type=company" class="zPushBtn" ><img src="style/Icons/icon003a2.gif" width="20" height="20" /><b>公司板块&nbsp;</b></a></td>
                </tr>
                </table>
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style="float:left"><b>人员ID</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                     <td>
                        <span style="float:left"><b>姓名</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>职务</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>所属公司</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <!--<td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>-->
                </tr>
                <asp:Repeater ID="Rep3" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("id").ToString(), 12, "...")%></td>
                    
                    <td><a  target="_blank" href="Contactinfo.aspx?id=<%#Eval("id") %>"><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 32, "...")%></a></td>
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("job").ToString(), 32, "...")%></td>    
                    <td><a  target="_blank" href="Companyinfo.aspx?id=<%#Eval("cid") %>"><%#LTP.Common.StringPlus.StrCut(Eval("companyname").ToString(), 82, "...")%></a></td>
                   <!-- <td><a href="Edit.aspx?type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>-->
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="2" align="center">
                    <uc1:UcfarPager ID="UcfarPager6" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
             </asp:Panel>

              <asp:Panel ID="Panel1" runat="server" Visible="false">
              <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    
                    <td width=70px align=center>
                       公司名称：
                    </td>
                    <td width=138px>
                        <asp:TextBox ID="TextBox11" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    
                    <td style=" width:100px; padding-left:50px;" align="center">
                        <asp:LinkButton ID="LinkButton3" runat="server" class="zPushBtn"  OnClick="CompanyLB_Check"
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton></td>
                    <td></td>
                    <td><a href="CustContent.aspx?type=Renmai" class="zPushBtn" ><img src="style/Icons/icon003a2.gif" width="20" height="20" /><b>人员板块&nbsp;</b></a></td>
                </tr>
                </table>
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style="float:left"><b>公司名称</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>公司性质</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <!--<td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>-->
                </tr>
                <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><a target="_blank" href="Companyinfo.aspx?id=<%#Eval("pcid") %>"><%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(), 82, "...")%></a></td>
                    
                    <td style=""><%#LTP.Common.StringPlus.StrCut(Eval("ctype").ToString(), 82, "...")%></td>
                    <!--<td><a href="Edit.aspx?id=<%#Eval("pcid") %>&type=<%=Part%>" class="zPushBtn" ><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("pcid") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>-->
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="2" align="center">
                    <uc1:UcfarPager ID="UcfarPager1" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
             </asp:Panel>
              <asp:Panel ID="Panel4" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0">
                <tr>
                    <td>材料名称：
                      <asp:TextBox ID="TMatname" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td>相关工程名称：
                      <asp:TextBox ID="TPro" runat="server" Width="120px"></asp:TextBox>
                    </td>
                    <td>采购负责人：
                      <asp:TextBox ID="TLinkman" runat="server" Width="80px"></asp:TextBox>
                    </td>
                    <td>
                       采购人所属公司：
                    
                        <asp:TextBox ID="TCmp" runat="server" Width="120px"></asp:TextBox>
                    </td>
                    <td>采购阶段：<asp:DropDownList ID="TBuySt" runat="server">
                        <asp:ListItem Selected="True" Value="全部信息">全部信息</asp:ListItem>
                        <asp:ListItem>采购未开始</asp:ListItem>
                        <asp:ListItem>采购进行中</asp:ListItem>
                        <asp:ListItem>采购已完成</asp:ListItem>
                     
                        </asp:DropDownList>
                    </td>
                    
                    <td align="center">
                        <asp:LinkButton ID="LinkButton4" runat="server" class="zPushBtn"  OnClick="LinkButton4_Click"
                            ><img src="style/Icons/icon040a15.gif" width="20" height="20" /><b>搜索&nbsp;</b></asp:LinkButton>
                    </td>
                </tr>
                </table>
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td>
                        <span style="float:left"><b>材料名称</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                     <td>
                        <span style="float:left"><b>采购负责人</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>所属公司</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>相关工程名称</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>采购阶段</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                   
                </tr>
                <asp:Repeater ID="RepMat" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><a target="_blank" href="MatBuyinfo.aspx?Id=<%#Eval("id") %>" title="点击查看采购详情"><%#LTP.Common.StringPlus.StrCut(Eval("matname").ToString(), 32, "...")%></a></td>
                    
                    <td><a target="_blank"href="Contactinfo.aspx?id=<%#Eval("pepid") %>" title="点击查看相关采购负责人信息"><%#LTP.Common.StringPlus.StrCut(Eval("linkman").ToString(), 32, "...")%></a></td>
                    
                    <td><a target="_blank" href="Companyinfo.aspx?id=<%#Eval("pcid") %>" title="点击查看相关采购单位详情"><%#LTP.Common.StringPlus.StrCut(Eval("company").ToString(), 82, "...")%></a></td>
                    <td><a target="_blank" href="CustProShow.aspx?proid=<%#Eval("proid") %>" title="点击查看相关工程信息"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 82, "...")%></a></td>
                   <td><%#GetMatstate(Eval("recstate").ToString())%></td>
                   
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="2" align="center">
                    <uc1:UcfarPager ID="UcfarPager2" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
             </asp:Panel>
              <asp:Panel ID="Panel5" runat="server" Visible="false">
            <table width="100%" cellpadding="2" cellspacing="0" class="dataTable">
                <tr class="dataTableHead">
                    <td width="70%">
                        <span style="float:left"><b>项目名称</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td>
                        <span style="float:left"><b>工程地域</b></span><img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    <td width="150px;">
                        <span style="float:left"><strong>发布日期</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>
                    
                    <!--<td width="150px;">
                        <span style="float:left"><strong>操作</strong></span>
                        <img src="style/images/icon_sort.gif" width="12" height="12" style="float:right">
                    </td>-->
                </tr>
                <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                <tr class="dataTableBody">
                    <td><a target="_blank" href="CustProShow.aspx?proid=<%#Eval("id") %>" title="<%#ReplaceStr(Eval("prorek").ToString(),"<br>","")%>"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 82, "...")%></a></td>
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("proplace").ToString(), 22, "...")%></td>
                    <td><%#LTP.Common.StringPlus.StrCut(Eval("inforptime").ToString(), 22, "...")%></td>
                   <!--<td><a href="Edit.aspx?type=<%=Part%>&proid=<%#Eval("id") %>&Act=EditPro" class="zPushBtn"><img src="style/Icons/icon003a4.gif" width="20" height="20" /><b>编辑&nbsp;</b></a><a href="Content.aspx?Operat=delete&type=<%=Part%>&id=<%#Eval("id") %>" class="zPushBtn" ><img src="style/Icons/icon003a3.gif" width="20" height="20" /><b>删除&nbsp;</b></a></td>-->
                </tr>
                </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="2" align="center">
                    <uc1:UcfarPager ID="UcfarPager3" runat="Server" PagePara="Page" PageStyle="前后缩略"></uc1:UcfarPager>
                   </td>
                </tr>
                </table>
             </asp:Panel>
            </td>
         </tr>
        </table>
        
    </td>
    <td class="right_Bg"></td>
</tr>
</table>
</div>


</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .date-pick
        {
            margin-bottom: 0px;
        }
    </style>
</asp:Content>

