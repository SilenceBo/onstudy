var lessThenIE = function () {
        var UA = navigator.userAgent,
            isIE = UA.indexOf('MSIE') > -1,
            v = isIE ? /\d+/.exec(UA.split(';')[1]) : 'no ie';
        return v < 12;
    }();

	if(lessThenIE){
		alert("你的IE浏览器版本过低，可能导致部分页面出错，请使用IE10以上的或者其他浏览器（火狐、谷歌）打开，360浏览器请使用极速模式打开…");
		window.close();
	}