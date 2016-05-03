<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="matseach.ascx.cs" Inherits="JDJS.Web.Controls.matseach" %>
<div style="margin-top:10px;">
    <img width="787" height="40" alt="建材市场" src="uploads/jcscindex.gif" border="0" />
</div>
<div class="seach" style=" border-bottom:1px #004fa8 solid;">
    <!--<div style=" height:35px; padding-left:160px; "><a style=" display:block; float:left; width:111px; height:33px; background:url(../style/images/cjj.jpg);"  href="SeachReal.aspx"></a><a style=" display:block;float:left; width:111px; height:33px; background:url(../style/images/cjj-2.jpg);"  href="Trend.aspx"></a></div>-->
        <ul>
            <li style=" width:430px; padding-top:5px;">
              <script type="text/javascript">
                  function selecttype(obj2) {
                      var index2 = obj2.options[obj2.selectedIndex].value;
                      $.ajax({
                          type: "post",
                          url: "/Controls/SelectType.ashx",
                          dataType: "html",
                          data: ({ spcode: index2 }),
                          beforeSend: function (XMLHttpRequest1) {
                              //                                $("#" + "<%=itemDL.ClientID %>").html("正在查询...");
                              //Pause(this,100000);
                          },
                          success: function (msg1) {
                              $("#" + "<%=itemDL.ClientID %>").html(msg1);
                          },
                          complete: function (XMLHttpRequest1, textStatus1) {
                              //隐藏正在查询图片
                          },
                          error: function () {
                              //错误处理
                          }
                      });
                  }
               </script>
                |材料大类|<asp:DropDownList ID="specialDL" runat="server" 
                    onchange="javascript:selecttype(this);" Width="140px" ></asp:DropDownList>
                |材料小类|<asp:DropDownList ID="itemDL" runat="server" Width="140px"></asp:DropDownList>
            
            </li>
            
            <li style=" width:130px;padding-top:5px;"> |查询范围|<asp:RadioButton ID="rb2" Checked="true" runat="server" GroupName="seach"  />材料名</li>
            <li style=" width:60px; padding-top:5px;"><asp:RadioButton ID="rb1" runat="server" GroupName="seach" />公司名</li>
            <li style=" width:70px;padding-top:5px;"><asp:RadioButton ID="rb3" runat="server" GroupName="seach" />规格型号</li>
            <li style=" width:60px;padding-top:5px;"><asp:RadioButton ID="rb4" runat="server" GroupName="seach" />品牌</li>
            <li style=" width:282px;padding-top:5px;">
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
                |发布日期|<asp:DropDownList ID="ddlyear" runat="server" onchange="javascript:selectmonth(this);" ></asp:DropDownList>
                年<asp:DropDownList ID="ddlmonth" runat="server"></asp:DropDownList>月  |查询关键字|
            </li>
            <li style="width:190px; padding-left:1px; padding-top:3px;">
            <asp:TextBox ID="txtSeach" runat="server" Height="23px" Width="180px" 
                    BorderWidth="1px" ></asp:TextBox></li>
            <li style=" width:210px;"><asp:ImageButton ID="ImageSeach" runat="server" 
                    Height="30px" Width="200px" ImageUrl="~/style/images/SeachBG2012.gif" alt="建材价格查询" 
                    onclick="ImageSeach_Click" /></li>
            <!--<li style=" width:210px;"><img style=" margin-top:2px;" alt="建材价格查询通道" src="~/style/images/SeachBG.gif" />
                   </li>-->
        </ul>
        <div style="width:785px;float:left;">
    

        <ul class="indexmatul2">
        <asp:Repeater ID="matspecial" runat="server">
        <ItemTemplate>
          <li> <a  href="Matitempage.aspx?specialCode=<%#Eval("specialCode")%>" target="_self"title="<%#Eval("name") %>"><%#LTP.Common.StringPlus.StrCut(Eval("name").ToString(), 22, "...")%></a>
          </li>

        </ItemTemplate>
         </asp:Repeater>
        </ul>
</div>
</div>