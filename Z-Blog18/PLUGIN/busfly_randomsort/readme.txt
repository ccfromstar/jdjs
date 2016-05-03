
<id>			busfly_randomsort
<插件名称>		文章排行插件
<摘要说明>		些插件只能在 z-blog 1.8 上使用, 启用这个插件以后,将会在每次重建索引后,自动重建文章排行,而你只要在模板里像使用侧边栏日历等侧边栏目一样来使用
<version>		V0.1 beta for z-blog 1.8 
<作者信息>
<名称>		巴士飞扬
<网站>		http://www.busfly.cn/
<email>		janrn@163.com
有任何总是请到论坛或者我的博客上留言说明

使用方法:
	1:下载,解压,上传到plugin目录下
	2:进入后台,插件管理中,激活这个插件
	3:打开要显示文件排行的模板,在你想要显示的地方加上代码,详细方法见下面说明
	4:重建索引
	5:好了,使用后,你能看出这个插件的痕迹吗?和系统的侧边栏完全没差别了,嘿嘿.
	
	第3步详细说明:
		就是和调整使用侧边栏完全一样,请看示例:
			<div class="function" id="divGuestComments"> <!-- 最近留言-->
			<h3><#ZC_MSG274#></h3>
			<ul>
			<#CACHE_INCLUDE_GUESTCOMMENTS#>
			</ul>
			</div>
			上面这一段是模板里系统自带的侧边栏:"最近留言"的代码
			
			下面这一段是这个插件里的"热文排行"
			<div class="function" id="divGuestComments"> <!-- 热文排行-->   <!--这一行中的id="...",我写的是和上面一样,就是为了使用"最近留言"的样式,你可以使用其它ID,再到你使用的样式文件里添加这个DIV的样式代码,不过,我为了简便,就使用"最近留言"的样式-->
			<h3>热文排行</h3>
			<ul>
			<#CACHE_INCLUDE_RANDOMSORTTOPHOT#>		<!--这里是最大的区别,关键所在.V0.1版里有11个类型的排行,请到下面的说明里找过来-->
			</ul>
			</div>
			
		
	11种排行的代码如下:			
		'<!--最新文章1,randomsortnew1--> 			<#CACHE_INCLUDE_RANDOMSORTNEW1#>
		'<!--最新文章2,randomsortnew2-->			<#CACHE_INCLUDE_RANDOMSORTNEW2#>
		'<!--随机文章1,randomsortrand1-->			<#CACHE_INCLUDE_RANDOMSORTRAND1#>
		'<!--随机文章2,randomsortrand2-->			<#CACHE_INCLUDE_RANDOMSORTRAND2#>
		'<!--完全随机文章1,randomsortallrand1-->	<#CACHE_INCLUDE_RANDOMSORTALLRAND1#>
		'<!--完全随机文章2,randomsortallrand2-->	<#CACHE_INCLUDE_RANDOMSORTALLRAND2#>
		'<!--本月评论排行,randomsortcommonth-->		<#CACHE_INCLUDE_RANDOMSORTCOMMONTH#>
		'<!--本年评论排行,randomsortcomyear-->		<#CACHE_INCLUDE_RANDOMSORTCOMYEAR#>
		'<!--本月排行,randomsorttopmonth-->			<#CACHE_INCLUDE_RANDOMSORTTOPMONTH#>
		'<!--本年排行,randomsorttopyear-->			<#CACHE_INCLUDE_RANDOMSORTTOPYEAR#>
		'<!--用户推荐--> 不再支持,因为对一般的博客而言,真的没效果
		'<!--热文排行,randomsorttophot-->			<#CACHE_INCLUDE_RANDOMSORTTOPHOT#>
			
			
其它说明:
	在插件目录下的include.asp文件里,有以下参数可以配制,可以按照自己的要求进行修改
	intCutLen=12 	'每条记录的标题字数
    num_strnew=10		'最新文章 -设置显示多少条记录
    num_strtemp=10		'随机文章 -设置显示多少条记录
    num_busfly_strtemp=10	'完全随机文章 -设置显示多少条记录
    num_strcommonth=10	'本月评论排行 -设置显示多少条记录
    num_strcomyear=10	'本年评论排行 -设置显示多少条记录
    num_strtopmonth=10	'本月排行 -设置显示多少条记录
    num_strtopyear=10	'本年排行 -设置显示多少条记录
    num_busfly_tophot=20'热文排行 -设置显示多少条记录

			
			
			
			
			
