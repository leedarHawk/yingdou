package com.zmsport.iyuesai.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.zmsport.iyuesai.service.OrderService;

/**
 * 赛事支付订单controller
 * @author bilei
 *
 */
@Controller
@RequestMapping("/admin/order")
public class OrderController {

	@Autowired
	private OrderService service;
	
	/**
	 * 订单列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list", service.listOrders());
		return "/admin/pages/orderList";
	}
	
}
