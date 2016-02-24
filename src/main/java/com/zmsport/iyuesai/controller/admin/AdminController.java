package com.zmsport.iyuesai.controller.admin;

import com.zmsport.iyuesai.mapper.City;
import com.zmsport.iyuesai.service.CityService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zmsport.iyuesai.mapper.Admin;
import com.zmsport.iyuesai.service.AdminService;
import com.zmsport.iyuesai.util.ConstantUtil;
import com.zmsport.iyuesai.util.EncryptUtil;

import java.util.List;

/**
 * 后台登录
 * @author bilei
 *
 */
@Controller
@RequestMapping("/admin/admin")
public class AdminController {
	/**
	 * logger
	 */
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private AdminService service;

	@Autowired
	private CityService cityService;
	
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
		model.addAttribute("list", service.getAdmins(totalPage, size));
		return "/admin/pages/adminList";
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
			model.addAttribute("admin", service.findAdminById(id));
		}
		//get the city list
		model.addAttribute("cityList", cityService.getEffectiveCitys());
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
		return String.valueOf(service.findAdminByName(username) == null);
	}
	
	/**
	 * 添加管理员
	 * @param admin
	 * @return
	 */
	@RequestMapping(value="/addAdmin", method=RequestMethod.POST)
	public String addAdmin(Admin admin) {
		admin.setCreateTime(new java.sql.Timestamp(System.currentTimeMillis()));
		admin.setPassword(EncryptUtil.encryptMD5(admin.getPassword()));
		//admin.set
		if(admin.getCityId() == 0){
			admin.setType(Admin.SYSTEM_ADMINISTRATOR);
		}else{
			admin.setType(Admin.ZONE_ADMINISTRATOR);
		}
		admin.setStatus(Admin.USEABLE);
		service.insert(admin);
		return "redirect:/admin/admin/list";
	}
	
	/**
	 * 验证旧密码正确
	 * @param id
	 * @param password
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/checkPwd")
	public String checkAdmin(@RequestParam String password, @RequestParam long id) {
		password = EncryptUtil.encryptMD5(password);
		return String.valueOf(service.findAdminById(id).getPassword().equals(password));
	}
	
	/**
	 * 修改管理员
	 * @param admin
	 * @return
	 */
	@RequestMapping(value="/updateAdmin", method=RequestMethod.POST)
	public String updateAdmin(Admin admin) {
		admin.setUpdateTime(new java.sql.Timestamp(System.currentTimeMillis()));
		admin.setPassword(EncryptUtil.encryptMD5(admin.getPassword()));
		if(admin.getCityId() == 0){
			admin.setType(Admin.SYSTEM_ADMINISTRATOR);
		}else{
			admin.setType(Admin.ZONE_ADMINISTRATOR);
		}
		service.update(admin);
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
		return "redirect:/admin/admin/list";
	}


	/**
	 * 更改管理员状态
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="/changeStatus")
	public String changeStatus(@RequestParam String ids) {
		Admin admin = service.findAdminById(Long.valueOf(ids)) ;
		if(admin.getStatus() == Admin.USEABLE){
			admin.setStatus(Admin.UN_USEABLE);
		}else{
			admin.setStatus(Admin.USEABLE);
		}
		service.changeStatus(admin);
		return "redirect:/admin/admin/list";
	}
}
