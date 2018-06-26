var Utils = {
		
	getShortString : function(size, str){
		if(str.length > size){
			return str.substring(0, size-1) + '...';
		} else {
			return str;
		}
	},
		
	specialCharCheck : function(str) {
		var pattern = /[^(가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9_)]/gi;	// 언더바 가능
		
		if(pattern.test(str)){
			//str = str.replace(pattern,"");
			return true;
		}
		return false;
	},
	
	trimAll : function(str) {
		return str.replace(/ /gi, "");
	},
	
	AsOneWhiteSpace : function(str) {
		return str.replace(/\s\s+/g, ' ');
	},
	
	replaceAll : function(str, org, dest){
		if(!str || str==null || str==""){
			return str;
		}
		return str.split(org).join(dest);
	},
	
	nullToInt : function(str){
		return (str == ''  || str == ' ' || str == 'null' || str == null) ? 0 : str;
	},
	
	numberToSimpleStr : function(number){
		var n = Number(number);

		return n;
	},
	
	nullToString : function(obj){
		return obj == null ? 'null' : obj;
	},
	
	arrayShuffle: function(a) {
	    var j, x, i;
	    for (i = a.length - 1; i > 0; i--) {
	        j = Math.floor(Math.random() * (i + 1));
	        x = a[i];
	        a[i] = a[j];
	        a[j] = x;
	    }
	    return a;
	},
	
	timeFormat : function(num){
		num = num.toFixed(0);
		if(num / 3600 > 24){
			return '하루 이상';
		}
	    var hours   = Math.floor(num / 3600);
	    var minutes = Math.floor((num - (hours * 3600)) / 60);
	    var seconds = num - (hours * 3600) - (minutes * 60);

	    if (hours   < 10) {hours   = "0"+hours;}
	    if (minutes < 10) {minutes = "0"+minutes;}
	    if (seconds < 10) {seconds = "0"+seconds;}
	    return hours+':'+minutes+':'+seconds;
	},
	
	toZero : function(obj){
		return obj == null || !obj || obj=="" ? 0 : obj;
	},
	
	checkSpace : function (str) { 
		if(str.search(/\s/) != -1) {
			return true; 
		} else {
			return false; 
		} 
	}
	
};