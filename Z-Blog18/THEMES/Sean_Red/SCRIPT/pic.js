var f_Live_Data= new Object();
f_Live_Data.sendRequest = function()
{
       var obj=$('liveDataID');
              if(obj) obj.parentNode.removeChild(obj);
              var newscript=document.createElement("script");
                     newscript.type="text/javascript";
                     newscript.src="http://msg.2008.163.com/live.js";
                     newscript.id="liveDataID";         
              document.getElementsByTagName("HEAD")[0].appendChild(newscript);
}
f_Live_Data.DoRequest=function ()
{
                     this.sendRequest();
                     setTimeout("f_Live_Data.DoRequest()",60000);
}
f_Live_Data.DoRequest();
function f_onLiveDataRequestComplete(data)
{
       var goldListTemp = data.goldList;
       if(goldListTemp!=null && goldListTemp.length>0)
       {
              for(var i=0,t=0; i<goldListTemp.length; i++)
              {
                     if(i!=0 && goldListTemp[i].name=="й") {continue;}
                     $("0005000A0BeC"+t).innerHTML = goldListTemp[i].name;
                     $("0005000A0BeCKingType1"+t).innerHTML = goldListTemp[i].au;
                     $("0005000A0BeCKingType2"+t).innerHTML = goldListTemp[i].ag;
                     $("0005000A0BeCKingType3"+t).innerHTML = goldListTemp[i].cu;
                     t++;
                     
              }
       }
}
function $(str) 
{
       if (typeof str == 'string' && document.getElementById(str) != null ) {
              return document.getElementById(str);
       }
       return false;
}

var speed              = 5;
var rows              = 65;
var stim              = 400; 
var stop              = 0; 
$("aoyuMedalTable2").innerHTML       =  $("aoyuMedalTable1").innerHTML;
function Marquee(){
if( $("aoyuMedalTable").scrollTop%rows==0 && stop<=stim ){
  stop++;
  return;
}
stop = 0;
if( $("aoyuMedalTable2").offsetTop- $("aoyuMedalTable").scrollTop<=20)
   $("aoyuMedalTable").scrollTop-= $("aoyuMedalTable1").offsetHeight;
else{
   $("aoyuMedalTable").scrollTop++;
}
}
var MyMar          = setInterval(Marquee,speed);
$("aoyuMedalTable").onmouseover = function() {clearInterval(MyMar);}
$("aoyuMedalTable").onmouseout  = function() {MyMar=setInterval(Marquee,speed);}       