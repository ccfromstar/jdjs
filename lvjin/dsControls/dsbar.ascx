<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="dsbar.ascx.cs" Inherits="JDJS.Web.lvjin.dsControls.dsbar" %>
<div id="bar">
            
            <ul id="topnav" class="dsmainbar">
                <li><a href="./dsDefault.aspx">首页</a></li>
              
                <li><a href="./supply.aspx">产品展示</a>

                </li>
                
                <li><a href="./companyInfo.aspx">公司简介</a>
               
                </li>
                
               
                <li><a href="./companyRyzz.aspx">荣誉资质</a>
                
                </li>
               
                
                <li><a href="./contact.aspx">联系我们</a>
                </li>
                
                
            </ul>
            <!--<script type="text/javascript">
                $(document).ready(function() {
                    function megaHoverOver() {
                        $(this).find(".sub").stop().fadeTo('fast', 1).show();

                        //计算UL的所有宽度
                        (function($) {
                            jQuery.fn.calcSubWidth = function() {
                                rowWidth = 0;
                                //计算行
                                $(this).find("ul").each(function() {
                                    rowWidth += $(this).width();
                                });
                            };
                        })(jQuery);

                        if ($(this).find(".row").length > 0) { //如果行存在...
                            var biggestRow = 0;
                            //计算每一行
                            $(this).find(".row").each(function() {
                                $(this).calcSubWidth();
                                //寻找最大的行
                                if (rowWidth > biggestRow) {
                                    biggestRow = rowWidth;
                                }
                            });
                            //设置宽度
                            $(this).find(".sub").css({ 'width': biggestRow });
                            $(this).find(".row:last").css({ 'margin': '0' });
                        } else { //如果行不存在...

                            $(this).calcSubWidth();
                            //设置宽度
                            $(this).find(".sub").css({ 'width': rowWidth });

                        }
                    }
                    function megaHoverOut() {
                        $(this).find(".sub").stop().fadeTo('fast', 0, function() {
                            $(this).hide();
                        });
                    }
                    var config = {
                        sensitivity: 2, // 灵敏度值（必须为1或更高）
                        interval: 100, // onmouseover响应时间
                        over: megaHoverOver, // onmouseover回调函数
                        timeout: 500, // onMouseOut延迟时间
                        out: megaHoverOut //nMouseOut回调函数
                    };
                    $("ul#topnav li .sub").css({ 'opacity': '0' });
                    $("ul#topnav li").hoverIntent(config);
                });
            </script>-->
        </div>