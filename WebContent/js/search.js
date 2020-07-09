function btnPopWin(num, code){
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	var realIndex = location.href.substring(hostIndex,location.href.indexOf('/',hostIndex+1));
	if(num==1){
	window.open(realIndex+"/search/btnPop1.jsp?num="+num+"&code="+code, "", "width=620, height=570");
	}else{
		window.open(realIndex+"/search/btnPop2.jsp?num="+num+"&code="+code, "", "width=620, height=570");
	}
	
}