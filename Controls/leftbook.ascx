<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="leftbook.ascx.cs" Inherits="JDJS.Web.Controls.leftbook" %>

<div class="leftbooktit">
  <script>

      // 需要你写的数据
      var data = [
	{ src: 'uploads/fm-01.jpg', href: 'Qkjj.aspx' }
      //{ src: 'uploads/fm-02.jpg', href: 'Wykd.aspx' },
      //{ src: 'uploads/fm-03.jpg', href: 'uploads/jdjx.htm' },
    
];

      $(document).ready(function () {
          $('#pic1').d_imagechange({
              data: data,
              bg: false,
              title: false,
              desc: false,
              btn: false,
              btnText: false,
              width: 118,
              height: 120,
              bgHeight: 24,
              playTime: 5000,
              animateStyle: 'o'//默认值'o',可以不写	
          });
      });
    

</script>

    <div class="leftbook"><div id="pic1" style="width:118px; height:120px;"></div></div>
    <div class="leftbooktl">
        <ul>
            <li>- <a href="Qkjj.aspx">期刊简介</a></li>
            <li>- <a href="OnLine.aspx">下载试读</a></li>
            <li>- <a href="Registration.aspx">免费获取</a></li>
            <li>- <a href="Wykd.aspx">我要刊登</a></li>
            <li>- <a href="Contact.aspx">联系我们</a></li>
        </ul>
        
    </div>
</div>
