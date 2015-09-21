/**
 * 通用方法
 * @author bilei
 */
var CommonUtil = new Object;

/**
 * 验证是否为空
 */
CommonUtil.isBlank = function(param) {
	return $.trim(param).length == 0;
}
/**
 * 验证手机
 */
CommonUtil.isMobile = function(param) {
	var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
	return reg.test(param);
}

/**
 * 验证数字
 */
CommonUtil.isNumber = function(param) {
	var reg = /^\+?[1-9][0-9]*$/;
	return reg.test(param);
}
