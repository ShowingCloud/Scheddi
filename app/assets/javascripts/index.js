var page = 1;  
var i = 5; 
function next(content, content_list){
	var content = $(content);   
    var content_list = $(content_list); 
	 var v_width = content.width();  
	 var len = content.find("dl").length;  
	 var page_count = Math.ceil(len / i) ;   
	 if( !content_list.is(":animated") ){    
		  if( page == page_count ){  
			content_list.animate({ left : '0px'}, "slow"); 
			page = 1;  
		  }else{  
			content_list.animate({ left : '-='+(v_width) }, "slow");
			page++;  
		 }  
	 }  
}
		
function prev(content, content_list){
	var content = $(content);   
    var content_list = $(content_list); 
	var v_width = content.width();  
	 var len = content.find("dl").length;  
	 var page_count = Math.ceil(len / i) ; 
	 if(!content_list.is(":animated") ){    
		 if(page == 1 ){ 
			content_list.animate({ left : '-='+v_width*(page_count-1) }, "slow");  
			page = page_count;  
		}else{  
			content_list.animate({ left : '+='+(v_width) }, "slow");  
			page--;  
		}  
	} 
}

$(document).ready(function(){
	$("#login").click(function(){
		$("#disableDiv").css("display","block");
		$("#loginDiv").css("display","block");
	});
	$("#closeLoginBtn").click(function(){
		$("#disableDiv").css("display","none");
		$("#loginDiv").css("display","none");
	});
	$("#navigatList li:first-child").mouseover(function(){
		$("#myFavourite").show();
	});
	
	$("#navigatList li:first-child").mouseout(function(){
		$("#myFavourite").hide();
	});

	$("#myFavourite").mouseover(function(){
		$("#myFavourite").show();
	});

	$('#myFavourite').mouseout(function(){
		$(this).hide();
	}
	);
	$('.prev').hover(
		function(){
			$(this).css("background-image","url(/assets/pageLeftOn.png)");
		},
		function(){
			$(this).css("background-image","url(/assets/pageLeft.png)");
		}
	);
	$('.next').hover(
		function(){
			$(this).css("background-image","url(/assets/pageRightOn.png)");
		},
		function(){
			$(this).css("background-image","url(/assets/pageRight.png)");
		}
	);
	//$("#menu").menu();
	var choice = null;
	function getCheckId(){
		choice = $("input[name='radioChoice'][type='radio']:checked").val();
	}
	$('#seachBtn').click(function(e){
		getCheckId();
		var value = $('#seachTxt').val();
		
		if ('1' === choice){
			var link= "http://www.baidu.com/s?cl=3&wd=" + value;
			window.open(link);
			//$(this).prop('href', link);
		}else if ('2' === choice){
			var link= "http://www.google.com.hk/search?hl=zh-CN&source=hp&q=" + value;
			window.open(link);
			//$(this).prop('href', link);
		}else if ('3' === choice){
			var link= "http://www.sogou.com/web?query="+value;
			window.open(link);
			//$(this).prop('href', link);
		}else if ('4' === choice){
			var link= "http://cn.bing.com/search?q="+value;
			window.open(link);
			//$(this).prop('href', link);
		}else if ('5' === choice){
			var link= "http://www.yahoo.cn/s?q="+value;
			window.open(link);
			//$(this).prop('href', link);
		}
	
	});
	
	$('#next1').click(function(){
		next("#content1", "#content_list1");
	});
	$('#prev1').click(function(){
		prev('#content1', "#content_list1");
	});
	$('#next2').click(function(){
		next('#content2', "#content_list2");
	});
	$('#prev2').click(function(){
		prev('#content2', "#content_list2");
	});
	$('#next3').click(function(){
		next('#content3', "#content_list3");
	});
	$('#prev3').click(function(){
		prev('#content3', "#content_list3");
	});
});











