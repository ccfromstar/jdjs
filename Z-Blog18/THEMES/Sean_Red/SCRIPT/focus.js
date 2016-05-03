//焦点图
var n=0;
function Mea(value){
	n=value;
	setBg(value);
	plays(value);
	conaus(n);
	}
function setBg(value){
	for(var i=0;i<5;i++)
	document.getElementById("t"+i+"").className="bbg0";
	document.getElementById("t"+value+"").className="bbg1";
	} 
function plays(value){
	try
	{
		with (au){
			filters[0].Apply();
			for(i=0;i<5;i++)i==value?children[i].style.display="block":children[i].style.display="none"; 
			filters[0].play(); 		
			}
	}
	catch(e)
	{
		var d = document.getElementById("au").getElementsByTagName("div");
		for(i=0;i<5;i++)i==value?d[i].style.display="block":d[i].style.display="none"; 
	}
}
function conaus(value){
	try
	{
		with (conau){

				for(i=0;i<5;i++)i==value?children[i].style.display="block":children[i].style.display="none"; 
				
				}
	}
	catch(e)
	{
		var d = document.getElementById("conau").getElementsByTagName("div");
		for(i=0;i<5;i++)i==value?d[i].style.display="block":d[i].style.display="none"; 
	}

}
function clearAuto(){clearInterval(autoStart)}
function setAuto(){autoStart=setInterval("auto(n)", 5000)}
function auto(){
	n++;
	if(n>4)n=0;
	Mea(n);
	conaus(n);
} 
setAuto(); 