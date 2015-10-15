package com.zmsport.iyuesai.controller.site;

import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.BufferedImageHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.StaxDriver;
import com.zmsport.iyuesai.mapper.GameApply;
import com.zmsport.iyuesai.mapper.Order;
import com.zmsport.iyuesai.mapper.Score;
import com.zmsport.iyuesai.mapper.TeamAlbum;
import com.zmsport.iyuesai.mapper.User;
import com.zmsport.iyuesai.mapper.UserScore;
import com.zmsport.iyuesai.mapper.UserTeam;
import com.zmsport.iyuesai.service.GameApplyService;
import com.zmsport.iyuesai.service.GameService;
import com.zmsport.iyuesai.service.OrderService;
import com.zmsport.iyuesai.service.ScoreService;
import com.zmsport.iyuesai.service.TeamAlbumService;
import com.zmsport.iyuesai.service.UserScoreService;
import com.zmsport.iyuesai.service.UserService;
import com.zmsport.iyuesai.service.UserTeamService;
import com.zmsport.iyuesai.util.ConstantUtil;
import com.zmsport.iyuesai.util.FileUtil;
import com.zmsport.iyuesai.util.IpUtil;

/**
 * 微信js接口相关controller
 * @author bilei
 *
 */
@Controller
@RequestMapping("/site/wechat")
public class SiteWechatController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private TeamAlbumService service;
	
	@Autowired
	private ScoreService sService;
	
	@Autowired
	private GameApplyService gayService;
	
	@Autowired
	private UserTeamService utService;
	
	@Autowired
	private UserScoreService usService;
	
	@Autowired
	private OrderService oService;
	
	@Autowired
	private GameService gService;
	
	@Autowired
	private UserService uService;
	
	/**
	 * 从微信服务器下载球队图片
	 * @param medias
	 * @param creatorId
	 * @param dir
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/download", method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public Object download(@RequestParam String medias, @RequestParam long creatorId,
						   @RequestParam String dir,HttpSession session,
						   @RequestParam int teamId,HttpServletRequest request) {
		String[] media = medias.split(",");
		List<TeamAlbum> result = new ArrayList<TeamAlbum>(media.length);
		TeamAlbum album;
		String picUrl;
		List<HttpMessageConverter<?>> messageConverters = new ArrayList<HttpMessageConverter<?>>();
		messageConverters.add(new BufferedImageHttpMessageConverter());
		restTemplate.setMessageConverters(messageConverters);
		String path = session.getServletContext().getRealPath("/") + File.separator + FileUtil.UPLOAD_DIR + File.separator + FileUtil.TEAM_DIR + File.separator + dir;
		BufferedImage bi;
		for(int i = 0; i < media.length; i++) {
		    bi = restTemplate.getForObject(String.format(ConstantUtil.WECHAT_MEDIA_DOWNLOAD_URL, ConstantUtil.ACCESS_TOKEN, media[i]),BufferedImage.class);
		    picUrl = FileUtil.uploadTeamPics(path, dir, bi);
		    album = new TeamAlbum();
		    album.setPic(picUrl);
		    album.setTeamId(teamId);
		    album.setTime(new Timestamp(System.currentTimeMillis()));
		    service.insert(album);
		    result.add(album);
		}
		return result;
	}
	
	/**
	 * 调用jsapi签名
	 * @return
	 */
	@RequestMapping(value="/initJsApi", method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public Object initJsApi(HttpServletRequest request) {
		//公众号的唯一标识
		HashMap<String,String> config = new HashMap<String,String>();
		config.put("appId", ConstantUtil.APP_ID);
		//生成签名的时间戳
		config.put("timestamp", String.valueOf(System.currentTimeMillis()));
		//生成签名的随机串
		config.put("nonceStr", UUID.randomUUID().toString().substring(0, 30));
		//签名
		StringBuilder sb = new StringBuilder();
		sb.append("jsapi_ticket=").append(ConstantUtil.JSAPI_TICKET).append("&").append("noncestr=")
		  .append(config.get("nonceStr")).append("&").append("timestamp=").append(config.get("timestamp"))
		  .append("&url=").append(request.getParameter("url"));
		log.info("微信签名原始字符串:{}",sb.toString());
		config.put("signature", DigestUtils.sha1Hex(sb.toString()));
		return config;
	}
	
	/**
	 * 调用微信统一支付接口下预支付订单
	 * @return
	 */
	@RequestMapping(value="/preOrder", method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public Object preOrder(@RequestParam String gameName, @RequestParam long gameId,
			@RequestParam int fee, HttpSession session, HttpServletRequest request) {
		User currentUser = (User)session.getAttribute("user");
		UnifiedOrder order = new UnifiedOrder();
		//用户在商户 appid 下的唯一 标识
		order.setOpenid(currentUser.getUid());
		//微信分配的公众账号 ID
		order.setAppid(ConstantUtil.APP_ID);
		//微信支付分配的商户号
		order.setMch_id(ConstantUtil.MCH_ID);
		//随机字符串,不长于 32 位
		order.setNonce_str(UUID.randomUUID().toString().substring(0, 30));
		//商品描述
		order.setBody(gameName + "报名费");
		//商户系统内部的订单号,32 个字符内、可包含字母
		String orderNo = "T" + String.valueOf(System.currentTimeMillis()+ gameId);
		order.setOut_trade_no(orderNo);
		//订单总金额,单位为分,不能带小数点
		order.setTotal_fee(fee * 100);
		//订单生成的机器 IP
		order.setSpbill_create_ip(IpUtil.getRealIp());
		//接受微信支付成功通知
		//获取要访问的请求路径，作为微信登录的回调路径
		StringBuffer requestUrl = request.getRequestURL();
		log.debug("preOrder requestUrl is ---> " + requestUrl);
		String domain = requestUrl.delete(requestUrl.length() - request.getRequestURI().length(), requestUrl.length()) + request.getServletContext().getContextPath();
		log.debug("preOrder domain is ---> " + domain);
		StringBuilder orderUrl = new StringBuilder();
		log.debug("preOrder orderUrl is ---> " + orderUrl);
		log.debug("preOrder gameId is ---> " + gameId);
		log.debug("preOrder currentUser is ---> " + currentUser.getId());

		GameApply ga = (GameApply)gayService.getApplyByGameIdAndCreatorId(gameId, currentUser.getId());
		log.debug("preOrder GameApply teamid is ---> " + String.valueOf(ga.getTeamId()));
		orderUrl.append(domain).append("/site/wechat/createOrder/").append(gameId).append("/").append(ga.getTeamId())
			    .append("/").append(currentUser.getId()).append("/").append(fee).append("/").append(orderNo);
		log.info("微信支付成功后回调路径:{}",orderUrl);
		order.setNotify_url(orderUrl.toString());
		//交易类型
		order.setTrade_type("JSAPI");
		StringBuilder sb = new StringBuilder();
		sb.append("appid=").append(order.getAppid()).append("&body=").append(order.getBody())
		  .append("&mch_id=").append(order.getMch_id())
		  .append("&nonce_str=").append(order.getNonce_str()).append("&notify_url=").append(order.getNotify_url()).append("&openid=").append(order.getOpenid()).append("&out_trade_no=").append(order.getOut_trade_no())
		  .append("&spbill_create_ip=").append(order.getSpbill_create_ip()).append("&total_fee=").append(order.getTotal_fee()).append("&trade_type=").append(order.getTrade_type()).append("&key=").append(ConstantUtil.MCH_KEY);
		log.info("微信统一支付接口签名原始字符串:{}",sb);
		order.setSign(DigestUtils.md5Hex(sb.toString()).toUpperCase());
		XStream xStream = new XStream(new DomDriver());
		xStream.alias("xml", UnifiedOrder.class);
		String param = xStream.toXML(order);
		String result = restTemplate.postForObject(ConstantUtil.WECHAT_PAY_UNIFIED_ORDER_URL, param.replaceAll("__", "_"), String.class);
		log.info("微信统一支付接口返回字符串:{}",result);
		OrderResult or = null;
		xStream = new XStream(new StaxDriver());
		xStream.alias("xml", OrderResult.class);
		or = (OrderResult) xStream.fromXML(result);
		or.setTimeStamp(String.valueOf(System.currentTimeMillis() / 1000));
		or.set_package("prepay_id=" + or.getPrepay_id());
		or.setSignType("MD5");
		or.setNonceStr(UUID.randomUUID().toString().substring(0, 30));
		sb = new StringBuilder();
		sb.append("appId=").append(or.getAppid()).append("&nonceStr=").append(or.getNonceStr()).append("&package=").append(or.get_package())
		  .append("&signType=").append(or.getSignType()).append("&timeStamp=").append(or.getTimeStamp()).append("&key=").append(ConstantUtil.MCH_KEY);
		log.info("微信支付接口签名原始字符串:{}",sb);
		or.setPaySign(DigestUtils.md5Hex(sb.toString()).toUpperCase());
		HashMap orderMap  = new HashMap();
		orderMap.put("name", order.getBody());
		orderMap.put("price", fee);
		orderMap.put("gameId", gameId);
		orderMap.put("appid", or.getAppid());
		orderMap.put("timeStamp", or.getTimeStamp());
		orderMap.put("nonceStr", or.getNonceStr());
		orderMap.put("package", or.get_package());
		orderMap.put("paySign", or.getPaySign());
		orderMap.put("orderNo", orderNo);
		return orderMap;
	}
	
	/**
	 * 微信支付成功后生成订单
	 * @param gameId
	 * @param teamId
	 * @param creatorId
	 * @param fee
	 * @param orderNo
	 * @param orderName
	 */
	@RequestMapping(value="/createOrder/{gameId}/{teamId}/{creatorId}/{fee}/{orderNo}", method=RequestMethod.GET)
	@ResponseBody
	public Object createOrder(@PathVariable long gameId,@PathVariable int teamId, @PathVariable long creatorId,
							@PathVariable int fee, @PathVariable String orderNo, Model model) {
		if(oService.orderExist(orderNo) == 0) {
			Order order = new Order();
			order.setCreatorId(creatorId);
			order.setFee(fee);
			order.setOrderName(gService.getGamesById(gameId).getName() + "报名费");
			order.setGameId(gameId);
			order.setTeamId(teamId);
			order.setOrderNo(orderNo);
			order.setPayTime(new Timestamp(System.currentTimeMillis()));
			oService.insert(order);
			log.info("微信支付后台订单生成{}", order);
		}
		return "Wechat U Suck!!!";
	}
	
	/**
	 * 支付成功后跳转
	 * @param gameId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/paySuccess/{gameId}/{orderNo}", method=RequestMethod.GET)
	public String paySuccess(@PathVariable long gameId, @PathVariable String orderNo,Model model, HttpSession session) {
		model.addAttribute("gameId", gameId);
		User currentUser = (User)session.getAttribute("user");
		//修改报名状态
		gayService.updateStatusByCreatorIdAndGameId(GameApply.STATUS_APPLY_SUCCESS, currentUser.getId(), gameId);
		GameApply ga = gayService.getApplyByGameIdAndCreatorId(gameId, currentUser.getId());
		//初始化球队排名信息
		Score score = new Score();
		score.setGameId(ga.getGameId());
		score.setLose(0);
		score.setTid(ga.getTeamId());
		score.setWin(0);
		score.setRound(0);
		sService.insert(score);
		//初始化球员排名信息
		List<User> userList  =utService.findUserByStatusAndTeamId(ga.getTeamId(), UserTeam.STATUS_CONFIRMED);
		UserScore uScore;
		for(User user : userList) {
			uScore = new UserScore();
			uScore.setGameId(ga.getGameId());
			uScore.setTid(ga.getTeamId());
			uScore.setScore(0);
			uScore.setUid(user.getId());
			usService.insert(uScore);
		}
		//生成订单
		if(oService.orderExist(orderNo) == 0) {
			Order order = new Order();
			order.setCreatorId(currentUser.getId());
			order.setFee(gService.getGamesById(gameId).getFee());
			order.setOrderName(gService.getGamesById(gameId).getName() + "报名费");
			order.setGameId(gameId);
			order.setTeamId(ga.getTeamId());
			order.setOrderNo(orderNo);
			order.setPayTime(new Timestamp(System.currentTimeMillis()));
			oService.insert(order);
			log.info("微信支付后台订单生成{}", order);
		}
		return "/site/pages/paySuccess";
	}
}
 
 /**
  * 统一支付返回值
  * @author bilei
  *
  */
 class OrderResult {
	 
	 /**
	  * 返回状态码
	  * SUCCESS/FAIL 此字段是通信标识,非交易 标识,交易是否成功需要查 看 result_code 来判断
	  */
	 private String return_code;
	 
	 /**
	  * 返回信息,如非空,为错误 原因
	  *	签名失败 参数格式校验错误
	  */
	 private String return_msg;
	 
	 /**
	  * 微信分配的公众账号 ID
	  */
	 private String appid;
	 
	 /**
	  * 商户生成,从1970年1月1 日 00:00:00 至今的秒数
	  */
	 private String timeStamp;
	 
	 /**
	  * 随即字符串
	  */
	 private String nonceStr;
	 
	 /**
	  * 统一支付接口返回的 prepay_id 参数值,􏰃交格式 如:prepay_id=***
	  */
	 private String _package;
	 
	 /**
	  * 签名方式
	  */
	 private String signType = "MD5";
	 
	 /**
	  * 签名方式
	  */
	 private String paySign;
	 
	 /**
	  * 商户号
	  */
	 private String mch_id;
	 
	 /**
	  * 设备号
	  */
	 private String device_info;
	 
	 /**
	  * 随即字符串
	  */
	 private String nonce_str;
	 
	 /**
	  * 签名
	  */
	 private String sign;
	 
	 /**
	  * 业务结果
	  */
	 private String result_code;
	 
	 /**
	  * 错误代码
	  */
	 private String err_code;
	 
	 /**
	  * 错误代码描述
	  */
	 private String err_code_des;
	 
	 /**
	  * 交易类型
	  */
	 private String trade_type;
	 
	 /**
	  * 预支付 ID
	  */
	 private String prepay_id;
	 
	 /**
	  * 二维码链接
	  */
	 private String code_url;

	/**
	 * @return the return_code
	 */
	public String getReturn_code() {
		return return_code;
	}

	/**
	 * @param return_code the return_code to set
	 */
	public void setReturn_code(String return_code) {
		this.return_code = return_code;
	}

	/**
	 * @return the return_msg
	 */
	public String getReturn_msg() {
		return return_msg;
	}

	/**
	 * @param return_msg the return_msg to set
	 */
	public void setReturn_msg(String return_msg) {
		this.return_msg = return_msg;
	}

	/**
	 * @return the appid
	 */
	public String getAppid() {
		return appid;
	}

	/**
	 * @param appid the appid to set
	 */
	public void setAppid(String appid) {
		this.appid = appid;
	}

	/**
	 * @return the mch_id
	 */
	public String getMch_id() {
		return mch_id;
	}

	/**
	 * @param mch_id the mch_id to set
	 */
	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}

	/**
	 * @return the device_info
	 */
	public String getDevice_info() {
		return device_info;
	}

	/**
	 * @param device_info the device_info to set
	 */
	public void setDevice_info(String device_info) {
		this.device_info = device_info;
	}

	/**
	 * @return the nonce_str
	 */
	public String getNonce_str() {
		return nonce_str;
	}

	/**
	 * @param nonce_str the nonce_str to set
	 */
	public void setNonce_str(String nonce_str) {
		this.nonce_str = nonce_str;
	}

	/**
	 * @return the sign
	 */
	public String getSign() {
		return sign;
	}

	/**
	 * @param sign the sign to set
	 */
	public void setSign(String sign) {
		this.sign = sign;
	}

	/**
	 * @return the result_code
	 */
	public String getResult_code() {
		return result_code;
	}

	/**
	 * @param result_code the result_code to set
	 */
	public void setResult_code(String result_code) {
		this.result_code = result_code;
	}

	/**
	 * @return the err_code
	 */
	public String getErr_code() {
		return err_code;
	}

	/**
	 * @param err_code the err_code to set
	 */
	public void setErr_code(String err_code) {
		this.err_code = err_code;
	}

	/**
	 * @return the err_code_des
	 */
	public String getErr_code_des() {
		return err_code_des;
	}

	/**
	 * @param err_code_des the err_code_des to set
	 */
	public void setErr_code_des(String err_code_des) {
		this.err_code_des = err_code_des;
	}

	/**
	 * @return the trade_type
	 */
	public String getTrade_type() {
		return trade_type;
	}

	/**
	 * @param trade_type the trade_type to set
	 */
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}

	/**
	 * @return the prepay_id
	 */
	public String getPrepay_id() {
		return prepay_id;
	}

	/**
	 * @param prepay_id the prepay_id to set
	 */
	public void setPrepay_id(String prepay_id) {
		this.prepay_id = prepay_id;
	}

	/**
	 * @return the code_url
	 */
	public String getCode_url() {
		return code_url;
	}

	/**
	 * @param code_url the code_url to set
	 */
	public void setCode_url(String code_url) {
		this.code_url = code_url;
	}

	/**
	 * @return the timeStamp
	 */
	public String getTimeStamp() {
		return timeStamp;
	}

	/**
	 * @param timeStamp the timeStamp to set
	 */
	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}

	/**
	 * @return the nonceStr
	 */
	public String getNonceStr() {
		return nonceStr;
	}

	/**
	 * @param nonceStr the nonceStr to set
	 */
	public void setNonceStr(String nonceStr) {
		this.nonceStr = nonceStr;
	}

	/**
	 * @return the _package
	 */
	public String get_package() {
		return _package;
	}

	/**
	 * @param _package the _package to set
	 */
	public void set_package(String _package) {
		this._package = _package;
	}

	/**
	 * @return the signType
	 */
	public String getSignType() {
		return signType;
	}

	/**
	 * @param signType the signType to set
	 */
	public void setSignType(String signType) {
		this.signType = signType;
	}

	/**
	 * @return the paySign
	 */
	public String getPaySign() {
		return paySign;
	}

	/**
	 * @param paySign the paySign to set
	 */
	public void setPaySign(String paySign) {
		this.paySign = paySign;
	}
 }
/**
 * 统一支付接口
 * @author bilei
 *
 */
 class UnifiedOrder {
	
	/**
	 * 微信分配的公众账号 ID
	 */
	private String appid;
	
	/**
	 * 商户号
	 */
	private String mch_id;
	
	/**
	 * 微信支付分配的终端设备号
	 */
	private String device_info;
	
	/**
	 * 随机字符串,不长于 32 位
	 */
	private String nonce_str;
	
	/**
	 * 签名
	 */
	private String sign;
	
	/**
	 * 商品􏰁描述
	 */
	private String body;
	
	/**
	 * 附加数据,原样返回
	 */
	private String attach;
	
	/**
	 * 商户系统内部的订单号,32 个字符内、可包含字母
	 */
	private String out_trade_no;
	
	/**
	 * 订单总金额,单位为分,不 能带小数点
	 */
	private int total_fee;
	
	/**
	 * 订单生成的机器 IP
	 */
	private String spbill_create_ip;
	
	/**
	 * 交易起始时间
	 */
	private String time_start;
	
	/**
	 * 交易结束时间
	 */
	private String time_expire;
	
	/**
	 * 商品标记
	 */
	private String goods_tag;
	
	/**
	 * 接收微信支付成功通知
	 */
	private String notify_url;
	
	/**
	 * 交易类型JSAPI、NATIVE、APP
	 */
	private String trade_type;
	
	/**
	 * 用户标识
	 */
	private String openid;
	
	/**
	 * 商品id
	 */
	private String product_id;

	/**
	 * @return the appid
	 */
	public String getAppid() {
		return appid;
	}

	/**
	 * @param appid the appid to set
	 */
	public void setAppid(String appid) {
		this.appid = appid;
	}

	/**
	 * @return the mch_id
	 */
	public String getMch_id() {
		return mch_id;
	}

	/**
	 * @param mch_id the mch_id to set
	 */
	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}

	/**
	 * @return the device_info
	 */
	public String getDevice_info() {
		return device_info;
	}

	/**
	 * @param device_info the device_info to set
	 */
	public void setDevice_info(String device_info) {
		this.device_info = device_info;
	}

	/**
	 * @return the nonce_str
	 */
	public String getNonce_str() {
		return nonce_str;
	}

	/**
	 * @param nonce_str the nonce_str to set
	 */
	public void setNonce_str(String nonce_str) {
		this.nonce_str = nonce_str;
	}

	/**
	 * @return the sign
	 */
	public String getSign() {
		return sign;
	}

	/**
	 * @param sign the sign to set
	 */
	public void setSign(String sign) {
		this.sign = sign;
	}

	/**
	 * @return the body
	 */
	public String getBody() {
		return body;
	}

	/**
	 * @param body the body to set
	 */
	public void setBody(String body) {
		this.body = body;
	}

	/**
	 * @return the attach
	 */
	public String getAttach() {
		return attach;
	}

	/**
	 * @param attach the attach to set
	 */
	public void setAttach(String attach) {
		this.attach = attach;
	}

	/**
	 * @return the out_trade_no
	 */
	public String getOut_trade_no() {
		return out_trade_no;
	}

	/**
	 * @param out_trade_no the out_trade_no to set
	 */
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}

	/**
	 * @return the total_fee
	 */
	public int getTotal_fee() {
		return total_fee;
	}

	/**
	 * @param total_fee the total_fee to set
	 */
	public void setTotal_fee(int total_fee) {
		this.total_fee = total_fee;
	}

	/**
	 * @return the spbill_create_ip
	 */
	public String getSpbill_create_ip() {
		return spbill_create_ip;
	}

	/**
	 * @param spbill_create_ip the spbill_create_ip to set
	 */
	public void setSpbill_create_ip(String spbill_create_ip) {
		this.spbill_create_ip = spbill_create_ip;
	}

	/**
	 * @return the time_start
	 */
	public String getTime_start() {
		return time_start;
	}

	/**
	 * @param time_start the time_start to set
	 */
	public void setTime_start(String time_start) {
		this.time_start = time_start;
	}

	/**
	 * @return the time_expire
	 */
	public String getTime_expire() {
		return time_expire;
	}

	/**
	 * @param time_expire the time_expire to set
	 */
	public void setTime_expire(String time_expire) {
		this.time_expire = time_expire;
	}

	/**
	 * @return the goods_tag
	 */
	public String getGoods_tag() {
		return goods_tag;
	}

	/**
	 * @param goods_tag the goods_tag to set
	 */
	public void setGoods_tag(String goods_tag) {
		this.goods_tag = goods_tag;
	}

	/**
	 * @return the notify_url
	 */
	public String getNotify_url() {
		return notify_url;
	}

	/**
	 * @param notify_url the notify_url to set
	 */
	public void setNotify_url(String notify_url) {
		this.notify_url = notify_url;
	}

	/**
	 * @return the trade_type
	 */
	public String getTrade_type() {
		return trade_type;
	}

	/**
	 * @param trade_type the trade_type to set
	 */
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}

	/**
	 * @return the openid
	 */
	public String getOpenid() {
		return openid;
	}

	/**
	 * @param openid the openid to set
	 */
	public void setOpenid(String openid) {
		this.openid = openid;
	}

	/**
	 * @return the product_id
	 */
	public String getProduct_id() {
		return product_id;
	}

	/**
	 * @param product_id the product_id to set
	 */
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
}
