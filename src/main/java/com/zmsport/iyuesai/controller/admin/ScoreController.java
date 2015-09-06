package com.zmsport.iyuesai.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zmsport.iyuesai.mapper.Score;
import com.zmsport.iyuesai.service.ScoreService;

/**
 * 球队排行controller
 * @author bilei
 *
 */
@Controller
@RequestMapping("/admin/score")
public class ScoreController {

	@Autowired
	private ScoreService service;
	
	/**
	 * 编辑球队排行页面
	 * @param gameId
	 * @param gameName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/edit/{gameId}/{gameName}",method=RequestMethod.GET)
	public String getEditList(@PathVariable long gameId,@PathVariable String gameName,Model model) {
		model.addAttribute("gameName", gameName);
		model.addAttribute("list", service.getTeamsByGameId(gameId));
		return "/admin/pages/scoreList";
	}
	
	/**
	 * 更新
	 * @param score
	 * @return
	 */
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public String update(@RequestParam int round,@RequestParam int win,@RequestParam int lose,@RequestParam long id) {
		Score score = new Score();
		score.setId(id);
		score.setWin(win);
		score.setLose(lose);
		score.setRound(round);
		service.update(score);
		return "ok";
	}
}
