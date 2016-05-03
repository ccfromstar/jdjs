<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="bbsAndFreePro.ascx.cs" Inherits="JDJS.Web.Controls.bbsAndFreePro" %>
<div>
   <div class="bbs">
    <div class="bbslist-tl"><a href="bbs/showforum-2.aspx">更多定额问答>></a></div>
    <!--<div class="freepro-tl">今日免费工程信息</div>-->
    <div class="bbs-left" >
       <div id="demo" class="listbbs">
    
            <ul>
                <asp:Repeater ID="RepentBBS" runat="server">
                <ItemTemplate>
                    <li><a href="bbs/showtopic-<%#Eval("tid") %>.aspx" title="<%#Eval("title") %>"><%#LTP.Common.StringPlus.StrCut(Eval("title").ToString(),60,"...") %></a></li>
                </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        
    </div>
     
  
   </div>
   <div class="freepro">
     <div class="freepro-tl"> <a href="ProjectInforBase.aspx?Part=3">更多工程信息>></a> </div>
         <div class="listfreepro">
              <ul>
                <asp:Repeater ID="RepeaterFREEpro" runat="server">
                <ItemTemplate>
                     <li><span><%#Eval("prostate")%> | </span><a href="ProjectInforDetail.aspx?Part=3&Id=<%#Eval("id") %>" title="<%#Eval("proname") %>"><%#LTP.Common.StringPlus.StrCut(Eval("proname").ToString(), 60, "...")%></a></li>
                </ItemTemplate>
                </asp:Repeater>
              </ul>
          </div>
      
   </div>
</div>

