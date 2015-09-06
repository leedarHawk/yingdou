package com.zmsport.iyuesai.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zmsport.iyuesai.mapper.UserScore;
import com.zmsport.iyuesai.service.TeamService;
import com.zmsport.iyuesai.service.UserScoreService;

/**
 * 球队排行controller
 * @author bilei
 *
 */
@Controller
@RequestMapping("/admin/userScore")
public class UserScoreController {

	@Autowired
	private UserScoreService service;
	
	@Autowired
	private TeamService tService;
	
	/**
	 * 编辑球队排行页面
	 * @param gameId
	 * @param gameName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/edit/{gameId}/{teamId}",method=RequestMethod.GET)
	public String getEditList(@PathVariable long gameId,@PathVariable int teamId,Model model) {
		model.addAttribute("list", service.rankUserByGameId(gameId));
		model.addAttribute("gameId", gameId);
		model.addAttribute("team", tService.findTeamById(teamId));
		return "/admin/pages/userScoreList";
	}
	
	/**
	 * 更新
	 * @param score
	 * @return
	 */
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public String update(@RequestParam int score,@RequestParam long id) {
		service.updateScore(score, id);
		return "ok";
	}
}
