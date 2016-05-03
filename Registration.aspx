<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="JDJS.Web.Registration" %>
<%@ Register Src="~/Controls/SubGG.ascx" TagName="SubGG" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        p.MsoNormal
	{margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Times New Roman","serif";
	        margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
        .style3
        {
            height: 50px;
            width: 676px;
        }
        .style4
        {
            border-collapse: collapse;
            font-size: 10.5pt;
            font-family: Calibri, sans-serif;
            border-style: none;
            border-color: inherit;
            border-width: medium;
        }
        .style5
        {
            width: 128px;
        }
        .style8
        {
            width: 177px;
        }
        .style13
        {
            height: 35px;
            width: 175px;
        }
        .style14
        {
            width: 175px;
        }
        .style15
        {
            color: blue;
        }
        .style16
        {
            color: #FF9900;
        }
        .style17
        {
            color: red;
        }
        .style18
        {
            color: blue;
            font-size: x-large;
        }
        .style19
        {
            font-size: x-large;
        }
        .style20
        {
            color: #FF9900;
            font-size: x-large;
        }
        .style21
        {
            color: red;
            font-size: x-large;
        }
        .style22
        {
            width: 438.55pt;
            height: 31pt;
        }
        .style23
        {
            font-size: medium;
        }
        .style24
        {
            text-align: left;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="SubMain">
    <img alt="" src="style/images/user-tl.gif" />
 <div class="SubCenter">
 
     <asp:Panel ID="PanOk" runat="server">
     <table style="width: 624px; line-height:22px;">
        <tr>
            <td align=center class="style3">
                <p align="center" class="MsoNormal" style="text-align: center">
                    <span style="font-family:方正粗圆简体;
color:black;letter-spacing:-.3pt;mso-font-kerning:0pt;mso-bidi-font-weight:
bold" class="style19">“上海建定建设工程信息网”网员登记表</span><span 
                        style="mso-bidi-font-size:10.5pt;color:black;mso-font-kerning:0pt">
                    </span>
                    <span lang="EN-US" 
                        style="font-size: 9.0pt; font-family: 宋体; mso-bidi-font-family: 宋体; color: black; mso-font-kerning: 0pt">
                    <p>
                        <span class="style23">
                        <asp:Button ID="btnOk1" runat="server" Font-Bold="True" Font-Size="Large" 
                            ForeColor="Red" Height="60px" onclick="btnOk_Click" style="text-align: center" 
                            Text="填写注册信息" Width="130px" />
                        </span>
                    </p>
                    </span>
                    <p>
                    </p>
                    <div align="center">
                        <table border="1" cellpadding="0" cellspacing="0" class="style4" 
                            style="mso-table-layout-alt: fixed; mso-border-alt: solid windowtext .25pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt; mso-border-insideh: .25pt solid windowtext; mso-border-insidev: .25pt solid windowtext" 
                            width="585">
                            <tr style="mso-yfti-irow: 0; mso-yfti-firstrow: yes; ">
                                <td class="style22" colspan="8" 
                                    style="border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .25pt; padding: 0cm 5.4pt 0cm 5.4pt; " 
                                    width="585">
                                    <p align="center" class="MsoNormal" style="text-align: center">
                                        <b style="mso-bidi-font-weight: normal"><span class="style18" lang="EN-US" 
                                            style="font-family: 宋体; mso-bidi-font-family: Calibri; mso-font-kerning: 0pt">
                                        [1</span><span class="style18" 
                                            style="font-family: 宋体; mso-bidi-font-family: Calibri; mso-font-kerning: 0pt">类</span><span 
                                            class="style19" 
                                            style="font-family: 宋体; mso-bidi-font-family: Calibri; mso-font-kerning: 0pt"><span 
                                            class="style15" lang="EN-US">]</span></span><span 
                                            style="font-size: 11.0pt; font-family: 宋体; mso-bidi-font-family: Calibri; color: black; mso-font-kerning: 0pt"><span 
                                            class="style18" 
                                            style="font-family: 宋体; mso-bidi-font-family: Calibri; mso-font-kerning: 0pt">网员入网费：￥<span 
                                            lang="EN-US">600</span>元<span lang="EN-US">/</span>年（普通）</span></span></b></p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 1">
                                <td style="width: 78.15pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .25pt; mso-border-top-alt: .25pt; mso-border-left-alt: .5pt; mso-border-bottom-alt: .25pt; mso-border-right-alt: .5pt; mso-border-color-alt: windowtext; mso-border-style-alt: solid; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    width="104">
                                    <p class="MsoNormal">
                                        <span lang="EN-US" 
                                            style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        [1</span><span 
                                            style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">类<span 
                                            lang="EN-US">]</span>网员</span><span 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt">
                                        <span lang="EN-US">
                                        <p>
                                        </p>
                                        </span></span>
                                        <p>
                                        </p>
                                        <p class="MsoNormal">
                                            <span style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                            服务内容</span><span lang="EN-US" 
                                                style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                            </p>
                                            </span>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                        </p>
                                    </p>
                                </td>
                                <td class="style24" colspan="7" 
                                    style="width: 360.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: .25pt; mso-border-left-alt: .5pt; mso-border-bottom-alt: .25pt; mso-border-right-alt: .5pt; mso-border-color-alt: windowtext; mso-border-style-alt: solid; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    valign="top" width="481">
                                    <p class="MsoNormal">
                                        1<span style="font-size:10.0pt;font-family:宋体">、<span lang="EN-US"><span style="font-size:10.0pt;font-family:宋体;
mso-bidi-font-family:&quot;Times New Roman&quot;;mso-font-kerning:1.0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA">从入网起12个月内每月以邮寄、挂号或快递发放《建定建材》上海建设工程造价信息资料壹本；</span><p>
                                        </p>
                                        </span></span>
                                        <p>
                                        </p>
                                        <p class="MsoNormal">
                                            <span style="font-size:10.0pt;font-family:宋体">2、<span lang="EN-US"><span style="font-size:10.0pt;font-family:宋体;
mso-bidi-font-family:&quot;Times New Roman&quot;;mso-font-kerning:1.0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA">网员赠送60点建定币，可通过查询“工程信息”、“人脉查询”频道内使用扣除，扣除后获得相应积分，参加“上海建定建设工程信息网”年末积分活动；</span><p>
                                            </p>
                                            </span></span>
                                            <p>
                                            </p>
                                            <p class="MsoNormal">
                                                3<span style="font-size:10.0pt;font-family:宋体">、<span style="font-size:10.0pt;font-family:宋体;
mso-bidi-font-family:&quot;Times New Roman&quot;;mso-font-kerning:1.0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA">提供网员单位“人工询价”服务（网员单位须填写工程概况表，需加盖公章核实信息）；</span><span lang="EN-US"><p>
                                                </p>
                                                </span></span>
                                                <p>
                                                </p>
                                                <p class="MsoNormal">
                                                    4<span style="font-size:10.0pt;font-family:宋体">、<span lang="EN-US"><span style="font-size:10.0pt;font-family:宋体;
mso-bidi-font-family:&quot;Times New Roman&quot;;mso-font-kerning:1.0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA">提供网员单位在“上海建定建设工程信息网”相关频道内刊登企业招聘信息；</span><p>
                                                    </p>
                                                    </span></span>
                                                    <p>
                                                    </p>
                                                    <p class="MsoNormal">
                                                        5<span style="font-size:10.0pt;font-family:宋体">、<span lang="EN-US"><span style="font-size:10.0pt;font-family:宋体;
mso-bidi-font-family:&quot;Times New Roman&quot;;mso-font-kerning:1.0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA">为网员单位推荐各类材料合格供应商（网员单位须提供真实有效的项目信息）</span><p>
                                                        </p>
                                                        </span></span>
                                                        <p class="MsoNormal">
                                                            &nbsp;<p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                            <p>
                                                            </p>
                                                        </p>
                                                    </p>
                                                </p>
                                            </p>
                                        </p>
                                    </p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 2">
                                <td style="width: 78.15pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .25pt; mso-border-top-alt: .25pt; mso-border-left-alt: .5pt; mso-border-bottom-alt: .25pt; mso-border-right-alt: .5pt; mso-border-color-alt: windowtext; mso-border-style-alt: solid; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    width="104">
                                    <p class="MsoNormal">
                                        <span lang="EN-US" 
                                            style="color: black; mso-font-kerning: 0pt; mso-bidi-font-size: 10.5pt;">
                                        <p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p class="MsoNormal">
                                            <span style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                            邮寄形式</span><span lang="EN-US" 
                                                style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                            </p>
                                            </span>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                        </p>
                                    </p>
                                </td>
                                <td colspan="7" 
                                    style="width: 360.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: .25pt; mso-border-left-alt: .5pt; mso-border-bottom-alt: .25pt; mso-border-right-alt: .5pt; mso-border-color-alt: windowtext; mso-border-style-alt: solid; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    valign="top" width="481">
                                    <p class="MsoNormal">
                                        <span style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        □<span style="font-size:10.0pt;font-family:宋体;
mso-bidi-font-family:&quot;Times New Roman&quot;;letter-spacing:-.1pt;mso-font-kerning:
1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:
AR-SA">外省市地区快递：另加<span lang="EN-US">150</span>元<span lang="EN-US">/</span>年快递费。□外省市地区挂号：另加<span lang="EN-US">80</span>元<span 
                                            lang="EN-US">/</span>年挂号费。</span></span></p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 8; ">
                                <td class="style22" colspan="8" 
                                    style="border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .25pt; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;" 
                                    width="585">
                                    <p align="center" class="MsoNormal" style="text-align: center">
                                        <b style="mso-bidi-font-weight: normal"><span class="style20" lang="EN-US" 
                                            style="font-family: 宋体; mso-font-kerning: 0pt">[2</span><span 
                                            class="style20" style="font-family: 宋体; mso-font-kerning: 0pt">类</span><span 
                                            class="style19" style="font-family: 宋体; mso-font-kerning: 0pt"><span 
                                            class="style16" lang="EN-US">]</span></span><span 
                                            style="font-size: 11.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt"><span 
                                            class="style20" style="font-family: 宋体; mso-font-kerning: 0pt">网员入网费：￥<span 
                                            lang="EN-US">980</span>元<span lang="EN-US">/</span>年（<span lang="EN-US">VIP</span>）</span></span></b></p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 9">
                                <td style="width: 78.15pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .25pt; mso-border-top-alt: .25pt; mso-border-left-alt: .5pt; mso-border-bottom-alt: .25pt; mso-border-right-alt: .5pt; mso-border-color-alt: windowtext; mso-border-style-alt: solid; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    width="104">
                                    <p class="MsoNormal">
                                        <span lang="EN-US" 
                                            style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        [2</span><span 
                                            style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">类<span 
                                            lang="EN-US">]</span>网员</span><span 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt">
                                        <span lang="EN-US">
                                        <p>
                                        </p>
                                        </span></span>
                                        <p>
                                        </p>
                                        <p class="MsoNormal">
                                            <span style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                            服务内容</span><span lang="EN-US" 
                                                style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                            </p>
                                            </span>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                        </p>
                                    </p>
                                </td>
                                <td class="style24" colspan="7" 
                                    style="width: 360.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: .25pt; mso-border-left-alt: .5pt; mso-border-bottom-alt: .25pt; mso-border-right-alt: .5pt; mso-border-color-alt: windowtext; mso-border-style-alt: solid; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    valign="top" width="481">
                                    <p class="MsoNormal">
                                        <span lang="EN-US" style="font-size: 10.0pt; font-family: 宋体; ">1</span><span 
                                            style="font-size: 10.0pt; font-family: 宋体; ">、享受<span lang="EN-US">[1</span>类<span 
                                            lang="EN-US">]</span>网员的服务内容，并另加送<span lang="EN-US">38</span>点建定币（合计赠送<span 
                                            lang="EN-US">98</span>点建定币）；<span lang="EN-US"><p>
                                        </p>
                                        </span></span>
                                        <p>
                                        </p>
                                        <p class="MsoNormal">
                                            <span lang="EN-US" style="font-size: 10.0pt; font-family: 宋体">
                                            <p>
                                            </p>
                                            </span>
                                            <p>
                                            </p>
                                            <p class="MsoNormal">
                                                <span lang="EN-US" style="font-size:10.0pt;font-family:宋体">2</span><span 
                                                    style="font-size:10.0pt;font-family:宋体">、初次或续约办理网员赠送《信息大全<span lang="EN-US">DVD</span>增强版》（软件售价：<span 
                                                    lang="EN-US">500</span>元<span lang="EN-US">/</span>套）；<span lang="EN-US"><p>
                                                </p>
                                                </span></span>
                                                <p>
                                                </p>
                                                <p class="MsoNormal">
                                                    <span lang="EN-US" style="font-size: 10.0pt; font-family: 宋体">
                                                    <p>
                                                    </p>
                                                    </span>
                                                    <p>
                                                    </p>
                                                    <div class="style24">
                                                        <span lang="EN-US" style="font-size:10.0pt;font-family:
宋体;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-font-kerning:1.0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA">3</span><span style="font-size:10.0pt;font-family:宋体;mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;
mso-bidi-language:AR-SA">、从付费办理注册网员后提供<span lang="EN-US">11</span>个月《信息大全增强版》<span lang="EN-US">CD</span>软件升级服务。</span></div>
                                                    <p class="MsoNormal">
                                                        &nbsp;<p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                    </p>
                                                </p>
                                            </p>
                                        </p>
                                    </p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 10">
                                <td style="width: 78.15pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .25pt; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    width="104">
                                    <p class="MsoNormal">
                                        <span lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt">
                                        <p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p class="MsoNormal">
                                            <span style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                            邮寄方式</span><span lang="EN-US" 
                                                style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                            </p>
                                            </span>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                        </p>
                                    </p>
                                </td>
                                <td colspan="7" 
                                    style="width: 360.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: .25pt; mso-border-left-alt: .5pt; mso-border-bottom-alt: .25pt; mso-border-right-alt: .5pt; mso-border-color-alt: windowtext; mso-border-style-alt: solid; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    valign="top" width="481">
                                    <p class="MsoNormal">
                                        <span lang="EN-US" 
                                            style="color: black; mso-font-kerning: 0pt; mso-bidi-font-size: 10.5pt;">
                                        <span style="font-size:10.0pt;font-family:宋体;
mso-bidi-font-family:&quot;Times New Roman&quot;;mso-font-kerning:1.0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA">外省市地区快递：另加<span lang="EN-US">150</span>元<span lang="EN-US">/</span>年快递费。</span></span></p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 7">
                                <td colspan="8" 
                                    style="width: 438.55pt; border: none; border-bottom: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    width="585">
                                </td>
                            </tr>
                            <tr>
                                <td class="style22" colspan="8" 
                                    style="border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .25pt; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;" 
                                    width="585">
                                    <b style="mso-bidi-font-weight: normal"><span lang="EN-US" 
                                        style="font-size: 11.0pt; font-family: 宋体; mso-font-kerning: 0pt">
                                    <span class="style21" 
                                        style="font-family: 黑体; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt">★</span></span><span 
                                        class="style21" lang="EN-US" style="font-family: 宋体; mso-font-kerning: 0pt">[3</span><span 
                                        class="style21" style="font-family: 宋体; mso-font-kerning: 0pt">类</span><span 
                                        class="style19" style="font-family: 宋体; mso-font-kerning: 0pt"><span 
                                        class="style17" lang="EN-US">]充值积点网员</span></span><span 
                                        style="font-size: 11.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt"><span 
                                        class="style21" style="font-family: 宋体; mso-font-kerning: 0pt"><b 
                                        style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;font-family:宋体;mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;
mso-bidi-language:AR-SA">（充值单位）：￥200</span></b></span></span></b></td>
                            </tr>
                            <tr>
                                <td colspan="8" 
                                    style="width: 438.55pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .25pt; mso-border-top-alt: .25pt; mso-border-left-alt: .5pt; mso-border-bottom-alt: .25pt; mso-border-right-alt: .5pt; mso-border-color-alt: windowtext; mso-border-style-alt: solid; padding: 0cm 5.4pt 0cm 5.4pt; height: 60.5pt" 
                                    width="585">
                                    <p class="MsoNormal">
                                        <span style="font-size: 11.0pt; font-family: 黑体; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt">
                                        ★</span><span 
                                            style="mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt">若需获取详尽工程信息及相关资料，请联系客服专用<b 
                                            style="mso-bidi-font-weight: normal"><span lang="EN-US">QQ</span>：<span 
                                            lang="EN-US">1621734271</span></b>，同时欢迎广大新老客户来电垂询。<b 
                                            style="mso-bidi-font-weight: normal">客户部主管<span lang="EN-US">:</span><personname 
                                            productid="徐" w:st="on">
                                        </personname>
                                        叶 小姐（转<span lang="EN-US">800</span>9）联系电话：<span lang="EN-US">54591008</span>、<span 
                                            lang="EN-US">64281662</span></b>。</span></p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="8" 
                                    style="width: 438.55pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .25pt; mso-border-top-alt: .25pt; mso-border-left-alt: .5pt; mso-border-bottom-alt: .25pt; mso-border-right-alt: .5pt; mso-border-color-alt: windowtext; mso-border-style-alt: solid; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    width="585">
                                    <p class="MsoNormal">
                                        <span style="font-size: 10.0pt; font-family: 宋体">服务内容：</span></p>
                                    <p class="MsoNormal">
                                        <span lang="EN-US" style="font-size:10.0pt;font-family:宋体;
">1</span><span style="font-size:10.0pt;font-family:宋体">、充值即获等值建定币（建定币：上海建定建设工程信息网专用的消费虚拟币）；<span lang="EN-US"><p>
                                        </p>
                                        </span></span>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 12; height: 14.2pt">
                                <td colspan="8" 
                                    style="width: 438.55pt; border: none; border-bottom: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    width="585">
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 12; ">
                                <td class="style22" colspan="8" 
                                    style="border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .25pt; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;" 
                                    width="585">
                                    <b style="mso-bidi-font-weight: normal"><span lang="EN-US" 
                                        style="font-size: 11.0pt; font-family: 宋体; mso-font-kerning: 0pt">
                                    <span class="style21" 
                                        style="font-family: 黑体; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt">★</span></span><span 
                                        class="style21" lang="EN-US" style="font-family: 宋体; mso-font-kerning: 0pt">[4</span><span 
                                        class="style21" style="font-family: 宋体; mso-font-kerning: 0pt">类</span><span 
                                        class="style19" style="font-family: 宋体; mso-font-kerning: 0pt"><span 
                                        class="style17" lang="EN-US">]</span></span><span 
                                        style="font-size: 11.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt"><span 
                                        class="style21" style="font-family: 宋体; mso-font-kerning: 0pt"> 
                                    建定通网员（项目及人脉信息查询）:<b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;font-family:宋体;mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;
mso-bidi-language:AR-SA"> ￥<span lang="EN-US">2000</span>元起<span lang="EN-US">/</span>年</span></b></span></span></b></td>
                            </tr>
                            <tr style="mso-yfti-irow: 13; height: 60.5pt">
                                <td colspan="8" 
                                    style="width: 438.55pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .25pt; mso-border-top-alt: .25pt; mso-border-left-alt: .5pt; mso-border-bottom-alt: .25pt; mso-border-right-alt: .5pt; mso-border-color-alt: windowtext; mso-border-style-alt: solid; padding: 0cm 5.4pt 0cm 5.4pt; height: 60.5pt" 
                                    width="585">
                                    <p class="MsoNormal">
                                        <span style="font-size: 11.0pt; font-family: 黑体; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt">
                                        ★</span><span 
                                            style="mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt">若需获取详尽工程信息及相关资料，请联系客服专用<b 
                                            style="mso-bidi-font-weight: normal"><span lang="EN-US">QQ</span>：<span 
                                            lang="EN-US">1621734271</span></b>，同时欢迎广大新老客户来电垂询。<b 
                                            style="mso-bidi-font-weight: normal">客户部主管<span lang="EN-US">:</span><personname 
                                            productid="徐" w:st="on">
                                            叶</personname>
                                        小姐（转<span lang="EN-US">8009</span>）联系电话：<span lang="EN-US">54591008</span>、<span 
                                            lang="EN-US">64281662</span></b>。</span><span lang="EN-US" 
                                            style="font-size: 11.0pt; font-family: 黑体; mso-bidi-font-family: 宋体; mso-font-kerning: 0pt"></span></p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 15">
                                <td colspan="8" 
                                    style="width: 438.55pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .25pt; mso-border-top-alt: .25pt; mso-border-left-alt: .5pt; mso-border-bottom-alt: .25pt; mso-border-right-alt: .5pt; mso-border-color-alt: windowtext; mso-border-style-alt: solid; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    width="585">
                                    <p class="MsoNormal">
                                        <span style="font-size:10.0pt;font-family:宋体;
mso-bidi-font-family:&quot;Times New Roman&quot;;mso-font-kerning:1.0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA">选择地区：□上海地区<span lang="EN-US"><span style="mso-spacerun:yes">&nbsp;&nbsp;
                                        </span></span>□江苏地区<span lang="EN-US"><span style="mso-spacerun:yes">&nbsp;&nbsp; </span>
                                        </span>□浙江地区</span></p>
                                    <p class="MsoNormal">
                                        <span style="font-size:10.0pt;font-family:宋体;
mso-bidi-font-family:&quot;Times New Roman&quot;;mso-font-kerning:1.0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA">相关费用</span><span style="font-size: 10.0pt; font-family: 宋体">：<span 
                                            lang="EN-US" style="font-size:10.0pt;font-family:
宋体;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-font-kerning:1.0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA">1</span><span style="font-size:10.0pt;font-family:宋体;mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;
mso-bidi-language:AR-SA">个地区<span lang="EN-US">2000</span>元<span lang="EN-US">/</span>年、<span lang="EN-US">2</span>个地区<span 
                                            lang="EN-US">3000</span>元<span lang="EN-US">/</span>年、<span lang="EN-US">3</span>个地区<span 
                                            lang="EN-US">4000</span>元<span lang="EN-US">/</span>年</span></span></p>
                                    <p class="MsoNormal">
                                        <span style="font-size:10.0pt;font-family:宋体;
mso-bidi-font-family:&quot;Times New Roman&quot;;mso-font-kerning:1.0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA">服务内容:
                                        <span lang="EN-US" style="font-size:10.0pt;font-family:
宋体;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-font-kerning:1.0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA">1</span><span style="font-size:10.0pt;font-family:宋体;mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-font-kerning:1.0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;
mso-bidi-language:AR-SA">、从付费办理注册网员日起壹年内享有指定地区工程项目信息频道的项目信息查询服务。</span></span></p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 22">
                                <td colspan="8" 
                                    style="width: 438.55pt; border: none; border-bottom: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    width="585">
                                    <p align="left" class="MsoNormal">
                                        &nbsp;</p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 23; height: 14.2pt">
                                <td colspan="8" 
                                    style="width: 438.55pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .25pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 14.2pt" 
                                    width="585">
                                    <p class="MsoNormal">
                                        <b>
                                        <span style="font-size: 11.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        付款方式：</span></b><p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 24">
                                <td colspan="4" 
                                    style="width: 223.0pt; border-top: none; border-left: solid windowtext 1.0pt; border-bottom: dashed windowtext 1.0pt; border-right: dashed windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-top-alt: solid .25pt; mso-border-left-alt: solid .5pt; mso-border-bottom-alt: dashed .5pt; mso-border-right-alt: dashed .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    valign="top" width="297">
                                    <p class="MsoNormal">
                                        <span style="font-size: 11.0pt; font-family: 黑体; mso-hansi-font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        □<span lang="EN-US" style="mso-bidi-font-weight: bold">1</span><span 
                                            style="mso-bidi-font-weight: bold">、银行划帐：★首选★</span></span><span 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt">
                                        <span lang="EN-US">
                                        <p>
                                        </p>
                                        </span></span>
                                        <p>
                                        </p>
                                        <p class="MsoNormal">
                                            <span style="font-size: 11.0pt; font-family: 黑体; mso-hansi-font-family: 宋体; color: black; mso-font-kerning: 0pt; mso-bidi-font-weight: bold">
                                            开户名：<span style="letter-spacing: -.3pt">上海标锭建设工程服务有限公司</span></span><span 
                                                style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt">
                                            <span lang="EN-US">
                                            <p>
                                            </p>
                                            </span></span>
                                            <p>
                                            </p>
                                            <p class="MsoNormal">
                                                <span style="font-size: 11.0pt; font-family: 黑体; mso-hansi-font-family: 宋体; color: black; mso-font-kerning: 0pt; mso-bidi-font-weight: bold">
                                                开户行：上海农商银行龙华支行</span><span 
                                                    style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt">
                                                <span lang="EN-US">
                                                <p>
                                                </p>
                                                </span></span>
                                                <p>
                                                </p>
                                                <p class="MsoNormal">
                                                    <span style="font-size: 11.0pt; font-family: 黑体; mso-hansi-font-family: 宋体; color: black; mso-font-kerning: 0pt; mso-bidi-font-weight: bold">
                                                    帐<span lang="EN-US"><span style="mso-spacerun: yes">&nbsp; </span></span>号：<span 
                                                        lang="EN-US" style="letter-spacing: 1.3pt">324617-08010121165</span><b><span 
                                                        lang="EN-US">
                                                    <p>
                                                    </p>
                                                    </span></b></span>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                    <p>
                                                    </p>
                                                </p>
                                            </p>
                                        </p>
                                    </p>
                                </td>
                                <td colspan="4" 
                                    style="width: 215.55pt; border-top: none; border-left: none; border-bottom: dashed windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: dashed windowtext .5pt; mso-border-top-alt: solid .25pt; mso-border-left-alt: dashed .5pt; mso-border-bottom-alt: dashed .5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    valign="top" width="287">
                                    <p class="MsoNormal">
                                        <span style="font-size: 11.0pt; font-family: 黑体; mso-hansi-font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        □<span lang="EN-US" style="mso-bidi-font-weight: bold">2</span><span 
                                            style="mso-bidi-font-weight: bold">、来我部付款：</span></span><span 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt">
                                        <span lang="EN-US">
                                        <p>
                                        </p>
                                        </span></span>
                                        <p>
                                        </p>
                                        <p class="MsoNormal">
                                            <span style="font-size: 11.0pt; font-family: 黑体; mso-hansi-font-family: 宋体; color: black; mso-font-kerning: 0pt; mso-bidi-font-weight: bold">
                                            上海标锭建设工程服务有限公司</span><span 
                                                style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt">
                                            <span lang="EN-US">
                                            <p>
                                            </p>
                                            </span></span>
                                            <p>
                                            </p>
                                            <p class="MsoNormal">
                                                <span style="font-size: 11.0pt; font-family: 黑体; mso-hansi-font-family: 宋体; color: black; mso-font-kerning: 0pt; mso-bidi-font-weight: bold">
                                                建定建材管理办公室</span><span 
                                                    style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt">
                                                <span lang="EN-US">
                                                <p>
                                                </p>
                                                </span></span>
                                                <p>
                                                </p>
                                                <p class="MsoNormal">
                                                    <span style="font-size: 11.0pt; font-family: 黑体; mso-hansi-font-family: 宋体; color: black; mso-font-kerning: 0pt; mso-bidi-font-weight: bold">
                                                    地址：上海市漕溪路<span lang="EN-US">165</span>号<span lang="EN-US">(</span>华谊党校<span 
                                                        lang="EN-US">)1110</span>室</span><span 
                                                        style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt">
                                                    <span lang="EN-US">
                                                    <p>
                                                    </p>
                                                    </span></span>
                                                    <p>
                                                    </p>
                                                    <p class="MsoNormal">
                                                        <span style="font-size: 11.0pt; font-family: 黑体; mso-hansi-font-family: 宋体; color: black; mso-font-kerning: 0pt; mso-bidi-font-weight: bold">
                                                        （近田东路）</span><span lang="EN-US" 
                                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                                        </p>
                                                        </span>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                        <p>
                                                        </p>
                                                    </p>
                                                </p>
                                            </p>
                                        </p>
                                    </p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 25; height: 24.2pt">
                                <td colspan="8" 
                                    style="width: 438.55pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: dashed windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: dashed windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.2pt" 
                                    width="585">
                                    <p class="MsoNormal">
                                        <span style="font-size: 10.0pt; font-family: 宋体; color: black; letter-spacing: -.2pt; mso-font-kerning: 0pt; mso-bidi-font-weight: bold">
                                        <b>注：银行付款者请详细填写以下登记表连同付款费用的贷记凭证传真至</b></span><b><span lang="EN-US" 
                                            style="font-size: 12.0pt; font-family: 宋体; color: black; letter-spacing: -.2pt; mso-font-kerning: 0pt">021-54596008</span><span 
                                            style="font-size: 10.0pt; font-family: 宋体; color: black; letter-spacing: -.2pt; mso-font-kerning: 0pt">。</span></b><span 
                                            lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 26">
                                <td colspan="8" 
                                    style="width: 438.55pt; border: none; border-bottom: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    width="585">
                                    <div>
                                        <p class="MsoNormal">
                                            <span style="mso-bidi-font-size: 10.5pt; font-family: 宋体; mso-bidi-font-weight: bold">
                                            联系客户部<span lang="EN-US">:</span><personname productid="徐" w:st="on">
                                                叶</personname>
                                            小姐（转<span lang="EN-US">800</span>9）联系电话：<span lang="EN-US" 
                                                style="letter-spacing: -.2pt">54591008</span><span 
                                                style="letter-spacing: -.2pt">、<span lang="EN-US">64281662</span></span><span 
                                                lang="EN-US"><p>
                                            </p>
                                            </span></span>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                            <p>
                                            </p>
                                        </p>
                                    </div>
                                    <p align="center" class="MsoNormal" style="text-align: center">
                                        <b>
                                        <span style="font-size: 12.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        “上海建定建设工程信息网”网员登记表（回执） <span lang="EN-US">
                                        <p>
                                        </p>
                                        </span></span></b>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 27">
                                <td style="width: 78.15pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-top-alt: .5pt; mso-border-left-alt: .5pt; mso-border-bottom-alt: .25pt; mso-border-right-alt: .25pt; mso-border-color-alt: windowtext; mso-border-style-alt: solid; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="104">
                                    <p class="MsoNormal">
                                        <span style="font-size: 11.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        单位名称</span><span lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                                <td colspan="7" 
                                    style="width: 360.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .25pt; mso-border-top-alt: .5pt; mso-border-left-alt: .25pt; mso-border-bottom-alt: .25pt; mso-border-right-alt: .5pt; mso-border-color-alt: windowtext; mso-border-style-alt: solid; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="481">
                                    <p class="MsoNormal">
                                        <span lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt">&nbsp;<p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 28">
                                <td style="width: 78.15pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .5pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="104">
                                    <p class="MsoNormal">
                                        <span style="font-size: 11.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        单位地址</span><span lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                                <td colspan="4" 
                                    style="width: 210.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="281">
                                </td>
                                <td style="width: 47.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="64">
                                    <p class="MsoNormal">
                                        <span style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        邮<span lang="EN-US"><span style="mso-spacerun: yes">&nbsp;&nbsp; </span></span>编</span><span 
                                            lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                                <td colspan="2" 
                                    style="width: 101.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; mso-border-right-alt: solid windowtext .5pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="136">
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 29">
                                <td style="width: 78.15pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .5pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="104">
                                    <p class="MsoNormal">
                                        <span style="font-size: 11.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        联 系 人</span><span lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                                <td style="width: 60.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="80">
                                    <p class="MsoNormal">
                                        <span lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt">&nbsp;<p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                                <td style="width: 47.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="64">
                                    <p class="MsoNormal">
                                        <span style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        电<span lang="EN-US"><span style="mso-spacerun: yes">&nbsp;&nbsp; </span></span>话</span><span 
                                            lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                                <td colspan="2" 
                                    style="width: 102.75pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="137">
                                </td>
                                <td style="width: 47.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="64">
                                    <p class="MsoNormal">
                                        <span style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        手<span lang="EN-US"><span style="mso-spacerun: yes">&nbsp;&nbsp; </span></span>机</span><span 
                                            lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                                <td colspan="2" 
                                    style="width: 101.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; mso-border-right-alt: solid windowtext .5pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="136">
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 31">
                                <td style="width: 78.15pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .5pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="104">
                                    <p class="MsoNormal">
                                        <span style="font-size: 11.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        网络<span lang="EN-US">QQ</span>号</span><span lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                                <td colspan="4" 
                                    style="width: 210.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="281">
                                </td>
                                <td style="width: 47.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="64">
                                    <p class="MsoNormal">
                                        <span style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        传<span lang="EN-US"><span style="mso-spacerun: yes">&nbsp;&nbsp; </span></span>真</span><span 
                                            lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                                <td colspan="2" 
                                    style="width: 101.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; mso-border-right-alt: solid windowtext .5pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="136">
                                </td>
                            </tr>
                            <tr style="mso-yfti-irow: 32; mso-yfti-lastrow: yes">
                                <td style="width: 78.15pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .5pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="104">
                                    <p class="MsoNormal">
                                        <span style="font-size: 11.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        网员选项</span><span lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                                <td colspan="4" 
                                    style="width: 210.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; mso-border-right-alt: solid windowtext .5pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="281">
                                    <p class="MsoNormal">
                                        <span style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        参加<span lang="EN-US">____</span>年网员<span lang="EN-US"><span 
                                            style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp; </span></span>开始日期<span lang="EN-US">____</span>年<span 
                                            lang="EN-US">____</span>月</span><span lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                                <td style="width: 47.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; mso-border-right-alt: solid windowtext .5pt; padding: 2.85pt 2.85pt 2.85pt 2.85pt" 
                                    width="64">
                                    <p class="MsoNormal">
                                        <span style="font-size: 10.0pt; font-family: 宋体; color: black; mso-font-kerning: 0pt">
                                        填表日期</span><span lang="EN-US" 
                                            style="mso-bidi-font-size: 10.5pt; color: black; mso-font-kerning: 0pt"><p>
                                        </p>
                                        </span>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                        <p>
                                        </p>
                                    </p>
                                </td>
                                <td colspan="2" 
                                    style="width: 101.7pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .25pt; mso-border-left-alt: solid windowtext .25pt; mso-border-alt: solid windowtext .25pt; padding: 0cm 5.4pt 0cm 5.4pt" 
                                    width="136">
                                </td>
                            </tr>
                            <![if !supportMisalignedColumns]>
                            <tr height="0">
                                <td style="border: none" width="104">
                                </td>
                                <td style="border: none" width="80">
                                </td>
                                <td style="border: none" width="64">
                                </td>
                                <td style="border: none" width="49">
                                </td>
                                <td style="border: none" width="88">
                                </td>
                                <td style="border: none" width="64">
                                </td>
                                <td style="border: none" width="5">
                                </td>
                                <td style="border: none" width="131">
                                </td>
                            </tr>
                            <![endif]>
                        </table>
                    </div>
                    <p class="MsoNormal">
                        <span lang="EN-US"></span>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="style23">
                        <br />
                        </span>
                        <p>
                            <span class="style23">
                            <asp:Button ID="btnOk0" runat="server" Font-Bold="True" Font-Size="Large" 
                                ForeColor="Red" Height="60px" onclick="btnOk_Click" style="text-align: center" 
                                Text="填写注册信息" Width="130px" />
                            </span>
                        </p>
                        <p>
                            <strong><span class="style23"><a href="uploads/djb.doc" target="_blank">
                            &lt;下载网员登记表&gt;</a></span></strong></p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                    </p>
                </p>
                                        </td>
                                    <td align="center" style=" height:50px;">
                                        &nbsp;</td>
                                    </tr>
                                </table>
     </asp:Panel>
     <asp:Panel ID="PanReg" runat="server" Visible=false>
     <table style="width: 624px; line-height:22px;">
        <tr>
            <td style=" height:50px;" colspan="4" align=center><strong style=" font-size:14px;">
                “上海建定建设工程信息网”网员入网基本信息注册(以下带<span style=" color:Red;">*</span>的内容为必填项)<br />
                <br />
                请尽量填写真实信息，注册成功后客服人员会与您取得联系确认信息并激活您注册的试用账号</strong></td>
        </tr>
        <tr>
            <td align=center class="style13">个人/公司名称<span style=" color:Red;">*</span></td>
            <td class="style8"><asp:TextBox ID="txtCp" runat="server" Width="170px" 
                    ValidationGroup="1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtCp" ErrorMessage="&lt;br /&gt;个人/单位名称不能为空" 
                    ValidationGroup="1" Display="Dynamic"></asp:RequiredFieldValidator>

            </td>
            <td align=center class="style5">法人代表(D类选填)</td>
            <td style=" width:212px;">
                <asp:TextBox ID="txtFr" runat="server" Width="170px" 
                    ValidationGroup="1"></asp:TextBox>
                    </td>
        </tr>
         <tr>
             <td align="center" class="style13">快递/邮寄地址</td>
             <td class="style8"><asp:TextBox ID="txtKw" runat="server" Width="170px" 
                     ValidationGroup="1"></asp:TextBox>
             </td>
             <td align="center" class="style5">邮政编码</td>
             <td style=" width:212px;"><asp:TextBox ID="txtPost" runat="server" Width="170px" 
                     ValidationGroup="1"></asp:TextBox>
             </td>
         </tr>
         <tr>
             <td align="center" class="style13">试用账号<span style=" color:Red;">*</span></td>
             <td class="style8">
                 <asp:TextBox ID="txtsyzh" runat="server" ValidationGroup="1" Width="170px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                     ControlToValidate="txtLxr" Display="Dynamic" 
                     ErrorMessage="&lt;br /&gt;试用账号不能为空" ValidationGroup="1"></asp:RequiredFieldValidator>
             </td>
             <td align="center" class="style5">选择网员类别<span style=" color:Red;">*</span></td>
             <td style=" width:212px;">
             <asp:DropDownList ID="ddlType" runat="server" ValidationGroup="1"></asp:DropDownList>
             </td>
         </tr>
         <tr>
             <td align="center" class="style13">联系人姓名<span style=" color:Red;">*</span></td>
             <td class="style8"><asp:TextBox ID="txtLxr" runat="server" Width="170px" 
                     ValidationGroup="1"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                     ControlToValidate="txtLxr" ErrorMessage="<br />联系人姓名不能为空" 
                     Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
             </td>
             <td align="center" class="style5">职务</td>
             <td style=" width:212px;"><asp:TextBox ID="txtZw" runat="server" Width="170px"></asp:TextBox></td>
         </tr>
         <tr>
             <td align="center" class="style13">联系电话<span style=" color:Red;">*</span></td>
             <td class="style8"><asp:TextBox ID="txtPhone" runat="server" Width="170px" 
                     ValidationGroup="1"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                     ControlToValidate="txtPhone" ErrorMessage="&lt;br /&gt;联系电话不能为空" Display="Dynamic" 
                     ValidationGroup="1"></asp:RequiredFieldValidator>
             </td>
             <td align="center" class="style5">传真</td>
             <td style=" width:212px;"><asp:TextBox ID="txtFax" runat="server" Width="170px"></asp:TextBox></td>
         </tr>
         <tr>
             <td align="center" class="style13">手机</td>
             <td class="style8"><asp:TextBox ID="txtMobile" runat="server" Width="170px"></asp:TextBox></td>
             <td align="center" class="style5">电子邮箱</td>
             <td style=" width:212px;"><asp:TextBox ID="txtEmail" runat="server" Width="170px"></asp:TextBox></td>
         </tr>
         <tr>
             <td align="center" class="style13">
                 公司网址</td>
             <td class="style8"><asp:TextBox ID="txtWebSite" runat="server" Width="171px"></asp:TextBox></td>
               <td align="center" class="style5">公司注册地址</td> 
              <td style=" width:212px;"> <asp:TextBox ID="txtAddress" runat="server" ValidationGroup="1" Width="170px"></asp:TextBox>
             </td>
         </tr>
         <tr>
             <td align="center" class="style14">公司简介(D类选填)</td>
             <td colspan="3">
                 <asp:TextBox ID="txtJj" runat="server" Width="480px" Height="100px" 
                     TextMode="MultiLine" ValidationGroup="1"></asp:TextBox>
             </td>
         </tr>
         <tr>
             <td align="center" class="style14">产品简介(D类选填)</td>
             <td colspan="3">
                 <asp:TextBox ID="txtPro" runat="server" Width="480px" 
                     Height="100px" TextMode="MultiLine" ValidationGroup="1"></asp:TextBox>
             </td>
         </tr>
                  <tr>
             <td align="center" class="style14">需求信息(D类选填)</td>
             <td colspan="3">
                 <asp:TextBox ID="txtXq" runat="server" Width="480px" Height="100px" 
                     TextMode="MultiLine" ValidationGroup="1" style="margin-left: 0px"></asp:TextBox>
                      </td>
         </tr>
        <tr>
            <td style=" height:50px;" colspan="4" align=center>
                <asp:Button ID="btnSubmit" runat="server" Text="提交" Height="30px" Width="80px" 
                    onclick="btnSubmit_Click" ValidationGroup="1" />
                <asp:Button ID="btnClear" runat="server" Text="清除" Height="30px" Width="80px" 
                    onclick="btnClear_Click" />
            </td>
        </tr>
         <tr>
             <td align="center" colspan="4" style=" height:50px;">
                 <span class="style23">
                 <br />
                 </span><strong><span class="style23"><a href="uploads/djb.doc" target="_blank">&lt;下载网员登记表&gt;</a></span></strong><br />
                 <br />
&nbsp;<span style=" color:Red;">*</span> 网员登记表下载填写后，如是D类网员须加盖企业公章并传真至本公司 Fax：<strong>021-54596008</strong></td>
         </tr>
     </table>
     </asp:Panel>
     <asp:Panel ID="PanHasReg" runat="server" Visible=false>
      <table style="width: 624px; line-height:22px;">
            <tr>
                <td style=" height:100px;"  align=center><strong style=" font-size:14px;"><img alt="" src="style/images/regtop.jpg" /></td>
            </tr>
          <tr>
              <td align="center" style=" height:50px; height:500px; background:url(style/images/back.jpg);">
                  <img alt="" src="style/images/regend.gif" />
              </td>
          </tr>
      </table>
     </asp:Panel>
 </div>
</div>
<uc1:SubGG id="SubGG" runat="server"></uc1:SubGG>
</asp:Content>
