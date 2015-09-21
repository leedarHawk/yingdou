package com.zmsport.iyuesai.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zmsport.iyuesai.mapper.Challenge;
import com.zmsport.iyuesai.service.ChallengeService;

/**
 * 约战管理
 * @author bilei
 *
 */
@Controller
@RequestMapping("/admin/challenge")
public class ChallengeController {

	@Autowired
	private ChallengeService cService;
	
	/**
	 * 约战列表
	 * @param page
	 * @param size
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(@RequestParam(value="page",defaultValue="1") int page,
	           		   @RequestParam(value="size",defaultValue="10") int size, Model model) {
		int totalNum = cService.getTotalNum();
		int totalPage = totalNum < size ? 1 : (int)Math.ceil(1.0 * totalNum / size);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("list", cService.getChallengesByPage(page, size));
		return "/admin/pages/challengeList";
	}
	
	/**
	 * 更新比分
	 * @param id
	 * @param score
	 * @return
	 */
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public String update(@RequestParam long id, @RequestParam String score) {
		cService.updateScore(score, id);
		cService.updateStatus(Challenge.STATUS_FINISHED, id);
		return "ok";
	}
}
