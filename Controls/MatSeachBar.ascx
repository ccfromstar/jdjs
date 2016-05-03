<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MatSeachBar.ascx.cs" Inherits="JDJS.Web.Controls.MatSeachBar" %>
<div class="seach">
    <div style=" height:35px; padding-left:160px; "><a style=" display:block; float:left; width:111px; height:33px; background:url(../style/images/cjj.jpg);"  href="SeachReal.aspx"></a><a style=" display:block;float:left; width:111px; height:33px; background:url(../style/images/cjj-2.jpg);"  href="Trend.aspx"></a></div>
        <ul>
            <li style=" width:60px;padding-top:5px;"><asp:RadioButton ID="rb2" Checked="true" runat="server" GroupName="seach"  />材料名</li>
            <li style=" width:60px; padding-top:5px;"><asp:RadioButton ID="rb1" runat="server" GroupName="seach" />公司名</li>
            <li style=" width:70px;padding-top:5px;"><asp:RadioButton ID="rb3" runat="server" GroupName="seach" />规格型号</li>
            <li style=" width:60px;padding-top:5px;"><asp:RadioButton ID="rb4" runat="server" GroupName="seach" />品牌</li>
            <li style=" width:140px;padding-top:5px;">
                <script type="text/javascript">
                    function selectmonth(obj) {
                        var index = obj.options[obj.selectedIndex].value;
                        $.ajax({
                            type: "post",
                            url: "/Controls/SelectMonth.ashx",
                            dataType: "html",
                            data: ({ Year: index }),
                            beforeSend: function (XMLHttpRequest) {
                                //                                $("#" + "<%=ddlmonth.ClientID %>").html("正在查询...");
                                //Pause(this,100000);
                            },
                            success: function (msg) {
                                $("#" + "<%=ddlmonth.ClientID %>").html(msg);
                            },
                            complete: function (XMLHttpRequest, textStatus) {
                                //隐藏正在查询图片
                            },
                            error: function () {
                                //错误处理
                            }
                        });
                    }
                </script>
                <asp:DropDownList ID="ddlyear" runat="server" onchange="javascript:selectmonth(this);" ></asp:DropDownList>
                年<asp:DropDownList ID="ddlmonth" runat="server"></asp:DropDownList>月
            </li>
            <li style="width:190px; padding-left:10px; padding-top:3px;">
                <asp:TextBox ID="txtSeach" runat="server" Height="23px" Width="190px" 
                    BorderWidth="0px" ></asp:TextBox></li>
            <li style=" width:30px;"><asp:ImageButton ID="ImageSeach" runat="server" 
                    Height="30px" Width="30px" ImageUrl="~/style/images/SeachBG.gif" 
                    onclick="ImageSeach_Click" /></li>
        </ul>
 </div>