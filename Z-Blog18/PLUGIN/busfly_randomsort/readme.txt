
<id>			busfly_randomsort
<�������>		�������в��
<ժҪ˵��>		Щ���ֻ���� z-blog 1.8 ��ʹ��, �����������Ժ�,������ÿ���ؽ�������,�Զ��ؽ���������,����ֻҪ��ģ������ʹ�ò���������Ȳ����Ŀһ����ʹ��
<version>		V0.1 beta for z-blog 1.8 
<������Ϣ>
<����>		��ʿ����
<��վ>		http://www.busfly.cn/
<email>		janrn@163.com
���κ������뵽��̳�����ҵĲ���������˵��

ʹ�÷���:
	1:����,��ѹ,�ϴ���pluginĿ¼��
	2:�����̨,���������,����������
	3:��Ҫ��ʾ�ļ����е�ģ��,������Ҫ��ʾ�ĵط����ϴ���,��ϸ����������˵��
	4:�ؽ�����
	5:����,ʹ�ú�,���ܿ����������ĺۼ���?��ϵͳ�Ĳ������ȫû�����,�ٺ�.
	
	��3����ϸ˵��:
		���Ǻ͵���ʹ�ò������ȫһ��,�뿴ʾ��:
			<div class="function" id="divGuestComments"> <!-- �������-->
			<h3><#ZC_MSG274#></h3>
			<ul>
			<#CACHE_INCLUDE_GUESTCOMMENTS#>
			</ul>
			</div>
			������һ����ģ����ϵͳ�Դ��Ĳ����:"�������"�Ĵ���
			
			������һ�������������"��������"
			<div class="function" id="divGuestComments"> <!-- ��������-->   <!--��һ���е�id="...",��д���Ǻ�����һ��,����Ϊ��ʹ��"�������"����ʽ,�����ʹ������ID,�ٵ���ʹ�õ���ʽ�ļ���������DIV����ʽ����,����,��Ϊ�˼��,��ʹ��"�������"����ʽ-->
			<h3>��������</h3>
			<ul>
			<#CACHE_INCLUDE_RANDOMSORTTOPHOT#>		<!--��������������,�ؼ�����.V0.1������11�����͵�����,�뵽�����˵�����ҹ���-->
			</ul>
			</div>
			
		
	11�����еĴ�������:			
		'<!--��������1,randomsortnew1--> 			<#CACHE_INCLUDE_RANDOMSORTNEW1#>
		'<!--��������2,randomsortnew2-->			<#CACHE_INCLUDE_RANDOMSORTNEW2#>
		'<!--�������1,randomsortrand1-->			<#CACHE_INCLUDE_RANDOMSORTRAND1#>
		'<!--�������2,randomsortrand2-->			<#CACHE_INCLUDE_RANDOMSORTRAND2#>
		'<!--��ȫ�������1,randomsortallrand1-->	<#CACHE_INCLUDE_RANDOMSORTALLRAND1#>
		'<!--��ȫ�������2,randomsortallrand2-->	<#CACHE_INCLUDE_RANDOMSORTALLRAND2#>
		'<!--������������,randomsortcommonth-->		<#CACHE_INCLUDE_RANDOMSORTCOMMONTH#>
		'<!--������������,randomsortcomyear-->		<#CACHE_INCLUDE_RANDOMSORTCOMYEAR#>
		'<!--��������,randomsorttopmonth-->			<#CACHE_INCLUDE_RANDOMSORTTOPMONTH#>
		'<!--��������,randomsorttopyear-->			<#CACHE_INCLUDE_RANDOMSORTTOPYEAR#>
		'<!--�û��Ƽ�--> ����֧��,��Ϊ��һ��Ĳ��Ͷ���,���ûЧ��
		'<!--��������,randomsorttophot-->			<#CACHE_INCLUDE_RANDOMSORTTOPHOT#>
			
			
����˵��:
	�ڲ��Ŀ¼�µ�include.asp�ļ���,�����²�����������,���԰����Լ���Ҫ������޸�
	intCutLen=12 	'ÿ����¼�ı�������
    num_strnew=10		'�������� -������ʾ��������¼
    num_strtemp=10		'������� -������ʾ��������¼
    num_busfly_strtemp=10	'��ȫ������� -������ʾ��������¼
    num_strcommonth=10	'������������ -������ʾ��������¼
    num_strcomyear=10	'������������ -������ʾ��������¼
    num_strtopmonth=10	'�������� -������ʾ��������¼
    num_strtopyear=10	'�������� -������ʾ��������¼
    num_busfly_tophot=20'�������� -������ʾ��������¼

			
			
			
			
			
