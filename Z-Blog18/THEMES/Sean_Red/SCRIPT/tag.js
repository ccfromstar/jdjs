// tab
function doClick1(o){
	 o.className="title1a";
	 var j;
	 var id;
	 var b;
	 for(var i=1;i<=3;i++){
	   id ="bb"+i;
	   j = document.getElementById(id);
	   b = document.getElementById("b"+i);
	   if(id != o.id){
	   	 j.className="title1b";
	   	 b.style.visibility = "hidden";
	   }else{
			b.style.visibility = "visible";
	   }
	 }
}

function doClick2(o){
	 o.className="title1c";
	 var k;
	 var id;
	 var e;
	 for(var i=1;i<=4;i++){
	   id ="ee"+i;
	   k = document.getElementById(id);
	   e = document.getElementById("e"+i);
	   if(id != o.id){
	   	 k.className="title3d";
	   	 e.style.visibility = "hidden";
	   }else{
			e.style.visibility = "visible";
	   }
	 }
}

function doClick3(o){
	 o.className="title1f";
	 var k;
	 var id;
	 var w;
	 for(var i=1;i<=6;i++){
	   id ="ww"+i;
	   k = document.getElementById(id);
	   w = document.getElementById("w"+i);
	   if(id != o.id){
	   	 k.className="title3g";
	   	 w.style.visibility = "hidden";
	   }else{
			w.style.visibility = "visible";
	   }
	 }
}

function resizepic(thispic)
{
if(thispic.width>650) thispic.width=650;
}
//无级缩放图片大小
function bbimg(o)
{
  var zoom=parseInt(o.style.zoom, 10)||100;
  zoom+=event.wheelDelta/12;
  if (zoom>0) o.style.zoom=zoom+'%';
  return false;
}