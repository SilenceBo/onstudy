$(document).ready(function() {
	
	readys();
	// logo切换

});
function readys(){
	$(".logoLeft span a").each(function() {
		$this = $(this);
		if ($this[0].href == String(window.location)) {
			$this.addClass("onLogo");
		}

	});
	// 问答页面切换
	$(".que_top ul li a").each(function() {
		$this = $(this);
		if ($this[0].href == String(window.location)) {
			$this.addClass("onActive");
			$(".logoLeft span a:last").addClass("onLogo");
		}
	});

	$.each($(".midclass"),function (){
		$("#all_ma1").removeClass("courseOn");
		//var index=String(window.location).substring(String(window.location).indexOf("=")+1,String(window.location).indexOf("=")+2);
		var index = cutstr(String(window.location),'mid=','&');
		//alert(index);
		if(String(window.location).indexOf("mid")!=-1){
			if($(this).attr("mid")==index){
				$(this).addClass("courseOn");
				$(".logoLeft span a:first").addClass("onLogo");
			}
			
		}
	});			
	$.each($(".gradeclass"),function (){
		$("#all_ma2").removeClass("courseOn");
		var index=String(window.location).substring(String(window.location).indexOf("grade")+6,String(window.location).indexOf("grade")+10);
		//alert($(this).attr("grade"));
		if(String(window.location).indexOf("grade")!=-1){		
			if($(this).attr("grade")==index){		
				$(this).addClass("courseOn");
				$(".logoLeft span a:first").addClass("onLogo");
			}
			
		}
	});
	
	courseClass();
}
 

function cutstr(text,start,end){

	var s = text.indexOf(start)

	if(s>-1){

	var text2 = text.substr(s+start.length);

	var s2 = text2.indexOf(end);

	if(s2>-1){

	result = text2.substr(0,s2);

	}else result = '';

	}else result = '';

	return result;

}

function courseClass() {
	// 全部课程兴趣切换
	
	if(String(window.location).indexOf("iid")==-1){
		$("#all_ma").addClass("courseOn");
	}
	if(String(window.location).indexOf("mid")==-1){
		$("#all_ma1").addClass("courseOn");
	}
	if(String(window.location).indexOf("grade")==-1){
		$("#all_ma2").addClass("courseOn");
	}
	var cd = String(window.location).split("iid=")[String(window.location).split("iid=").length - 1];
			
	$("#" + cd).addClass("courseOn");

	$("#grade_ul li a").each(function(index){
		 $(".logoLeft span a:first").addClass("onLogo");
		 var $this = $(this);
		 if($this[0].href==String(window.location)){
			 $this.addClass("courseOn");
		 }
		 
		 if(index > 1){
			 $(".classification .classiUl li a").each(
					function(index1) {
						$(".logoLeft span a:first").addClass("onLogo");
						var $this1 = $(this);
						if ($this1[0].href == String(window.location)) {
							$this1.addClass("courseOn");
						}
							
						if (index1 > 1) {
							$(".classIntere .classiUl li a").each(
								function(index2) {
									$(".logoLeft span a:first").addClass("onLogo");	
									var $this2 = $(this);
									if ($this2[0].href == String(window.location)) {
										$this2.addClass("courseOn");	
									}						
							});
						}

			 });
		 }
	});	
}
