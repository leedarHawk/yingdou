// JavaScript Document
var init = 0;
$(document).ready(function(e) {
	$(".telmenu").click(function(){
		var now = $("#nav").css("display");
		if(now=="none"){
			$("#nav").slideDown(function(){
				init = 0;
			});
		}else{
			$("#nav").slideUp(function(){
				init=0;
			});
		}
		init=1;
	});
	
	var nav = document.getElementById('nav');
	var telmenu = document.getElementsByClassName("telmenu");
	document.body.onclick = function(e){
		var wid=document.body.clientWidth;
		if(wid < 1024){
		
		setTimeout(function(){
			if(init==0){
				  e = e || window.event;
				  var target = e.target || e.srcElement;
				  if(target != nav){
					  $("#nav").slideUp();
				  }
			}
		},100);
	}
	}
});