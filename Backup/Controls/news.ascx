<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="news.ascx.cs" Inherits="JDJS.Web.Controls.news" %>
<div class="news">
<div class="news-left">
     <div class="news-right">
        <a target="_blank" href="http://www.shhsdl.com.cn/"><img alt="宏胜电缆" src="uploads/gg4.gif" /></a>
        <a href="http://www.xlxfjc.com/"><img  style=" margin-top:2px;" alt="希黎消防" src="uploads/gg4-1.gif" /></a>
        <!--<a target="_blank" href="http://www.shlvjin.com/"><img style=" margin-top:2px;" alt="绿锦电工" src="uploads/gg4-2.gif" /></a>
        <a target="_blank" href=""><img alt="" src="uploads/gg4.gif" /></a><a href=""><img  style=" margin-top:2px;" alt="" src="uploads/gg4-1.gif" /></a><a target="_blank" href=""><img style=" margin-top:2px;" alt="" src="uploads/gg4-2.gif" /></a>-->
     </div>
<div class="newlist">
    <div class="newlist-tl"><a href="NewsList.aspx?Part=1">更多>></a></div>
    <div class="list">
        <ul>
            <asp:Repeater ID="RepNews" runat="server">
            <ItemTemplate>
            <li><span>[<%#Eval("ptime", "{0:yyyy-MM-dd}")%>]</span><a href="NewsDetail.aspx?Part=1&Id=<%#Eval("id") %>" title='<%#Eval("title")%>'><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),45,"...")%></a><%#NewStr(Eval("ptime", "{0:yyyy-MM-dd}").ToString())%></li>
            </ItemTemplate>
            </asp:Repeater>
            
        </ul>
    </div>
    <script>

// 需要你写的数据
var data = [
	{ src: 'uploads/fm-01.jpg', href: 'Qkjj.aspx' },
	//{ src: 'uploads/fm-02.jpg', href: 'Wykd.aspx' },
//{ src: 'uploads/fm-03.jpg', href: 'uploads/jdjx.htm' },
    {src: 'uploads/fm-08.jpg', href: 'Qkjj.aspx' }
];
	
$(document).ready(function(){
	$('#pic1').d_imagechange({
	data: data,
	bg:false,
    title:false,
    desc:false,
    btn:false,
    btnText:false,
	width:140,
    height:145,
    bgHeight: 24,
    playTime:5000,
	animateStyle:'o'//默认值'o',可以不写	
	});
});
function document.onkeydown() 
{
    var e = event.srcElement;
    if (event.keyCode == 13) {
        document.getElementById("<%=ImageSeach.ClientID %>").click();
        return true;
    }
}

</script>
<style type="text/css">
#pic1 div{ overflow:visible;}
</style>
    <div class="newimg"><div id="pic1" style="width:140px; height:120px;"></div></div>
    <div class="newimgtl">
        <ul>
           
            <li>- <a href="Qkjj.aspx">期刊简介</a></li>
            <li>- <a href="OnLine.aspx">下载试读</a></li>
            <li>- <a href="Registration.aspx">免费获取</a></li>
            <li>- <a href="Wykd.aspx">我要刊登</a></li>
            <li>- <a href="Contact.aspx">联系我们</a></li>
        </ul>
        
    </div>
    </div>
    
    <div class="seach">
    <!--<div style=" height:35px; padding-left:160px; "><a style=" display:block; float:left; width:111px; height:33px; background:url(../style/images/cjj.jpg);"  href="SeachReal.aspx"></a><a style=" display:block;float:left; width:111px; height:33px; background:url(../style/images/cjj-2.jpg);"  href="Trend.aspx"></a></div>-->
        <ul>
            <li style=" width:430px; padding-top:5px;">
              <script type="text/javascript">
                  function selecttype(obj2) 
                  {
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
                            data: ({Year:index}),
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
    </div>
</div>
<!--<div class="news-right">
    <a target="_blank" href="http://www.shhsdl.com.cn/"><img alt="宏胜电缆" src="uploads/gg4.gif" /></a>
    <a href="http://www.xlxfjc.com/"><img  style=" margin-top:2px;" alt="希黎消防" src="uploads/gg4-1.gif" /></a>
    <a target="_blank" href="http://www.shlvjin.com/"><img style=" margin-top:2px;" alt="绿锦电工" src="uploads/gg4-2.gif" /></a>
<a target="_blank" href=""><img alt="" src="uploads/gg4.gif" /></a><a href=""><img  style=" margin-top:2px;" alt="" src="uploads/gg4-1.gif" /></a><a target="_blank" href=""><img style=" margin-top:2px;" alt="" src="uploads/gg4-2.gif" /></a>-->
</div>