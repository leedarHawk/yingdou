package com.zmsport.iyuesai.controller.admin;

import com.zmsport.iyuesai.mapper.City;
import com.zmsport.iyuesai.service.CityService;
import com.zmsport.iyuesai.util.ConstantUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * 城市管理
 * @author ken
 *
 */
@Controller
@RequestMapping("/admin/city")
public class CityController {
	/**
	 * logger
	 */
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private CityService service;
	
	/**
	 * 获取赛事列表
	 * @return
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(@RequestParam(value="page",defaultValue="1") int page,
			           @RequestParam(value="size",defaultValue="10") int size,Model model) {
		size = ConstantUtil.PAGE_SIZE;
		int totalNum = service.getTotalNum();
		int totalPage = totalNum < size ? 1 : (int)Math.ceil(1.0 * totalNum / size);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("list", service.getCitys(totalPage, size));
		return "/admin/pages/city/cityList";
	}
	
	/**
	 * 跳转到编辑页面
	 * @param editType
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/edit/{editType}/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable String editType, @PathVariable long id, Model model) {
		model.addAttribute("editType", editType);
		if(editType.equals("update")) {
			model.addAttribute("admin", service.findCityById(id));
		}
		return "/admin/pages/adminEdit";
	}
	
	/**
	 * 验证用户名存在
	 * @param username
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/checkAdmin")
	public String checkAdmin(@RequestParam String username) {
		return String.valueOf(service.findCityByName(username) == null);
	}
	
	/**
	 * 添加管理员
	 * @param city
	 * @return
	 */
	@RequestMapping(value="/addAdmin", method=RequestMethod.POST)
	public String addAdmin(City city) {
		city.setCreateTime(new java.sql.Timestamp(System.currentTimeMillis()));
		service.insert(city);
		return "redirect:/admin/admin/list";
	}
	

	/**
	 * 修改管理员
	 * @param city
	 * @return
	 */
	@RequestMapping(value="/updateAdmin", method=RequestMethod.POST)
	public String updateAdmin(City city) {
		city.setUpdateTime(new java.sql.Timestamp(System.currentTimeMillis()));
		service.update(city);
		return "redirect:/admin/admin/list";
	}
	
	/**
	 * 删除管理员
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="/deleteAdmin")
	public String delete(@RequestParam String ids) {
		service.delete(ids);
		return "redirect:/admin/city/list";
	}
	
}
