/* 
 * 获得时间差
 */
var DayUtil = {
		getDay : function(elements) {
			var _this = this;
			elements.each(function(){
				var start = $(this).text().split(".")[0];
				var day = _this.getDateDiff(start,_this.getNow(),'day');
				if(day == 0) {
					$(this).text('今天');

				}else {
					$(this).text(day + '天前');
				}
			});
		},
		
		getDateDiff : function(startTime, endTime, diffType) {
			// 将xxxx-xx-xx的时间格式，转换为 xxxx/xx/xx的格式
			startTime = startTime.replace(/\-/g, "/");
			endTime = endTime.replace(/\-/g, "/");

			// 将计算间隔类性字符转换为小写
			diffType = diffType.toLowerCase();
			var sTime = new Date(startTime); // 开始时间
			var eTime = new Date(endTime); // 结束时间
			// 作为除数的数字
			var divNum = 1;
			switch (diffType) {
			case "second":
				divNum = 1000;
				break;
			case "minute":
				divNum = 1000 * 60;
				break;
			case "hour":
				divNum = 1000 * 3600;
				break;
			case "day":
				divNum = 1000 * 3600 * 24;
				break;
			default:
				break;
			}
			return parseInt((eTime.getTime() - sTime.getTime()) / parseInt(divNum));
		},
		
		getNow : function() {
			var d = new Date();
			var ret = d.getFullYear() + "-"
			ret += ("00" + (d.getMonth() + 1)).slice(-2) + "-"
			ret += ("00" + d.getDate()).slice(-2) + " "
			ret += ("00" + d.getHours()).slice(-2) + ":"
			ret += ("00" + d.getMinutes()).slice(-2) + ":"
			ret += ("00" + d.getSeconds()).slice(-2)
			return ret;
		}
};
