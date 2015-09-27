package com.zmsport.iyuesai.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zmsport.iyuesai.mapper.GameApply;
import com.zmsport.iyuesai.mapper.Score;
import com.zmsport.iyuesai.mapper.User;
import com.zmsport.iyuesai.mapper.UserScore;
import com.zmsport.iyuesai.mapper.UserTeam;
import com.zmsport.iyuesai.service.GameApplyService;
import com.zmsport.iyuesai.service.GameService;
import com.zmsport.iyuesai.service.ScoreService;
import com.zmsport.iyuesai.service.UserScoreService;
import com.zmsport.iyuesai.service.UserTeamService;

/**
 * 赛事报名controller
 * @author bilei
 *
 */
@Controller
@RequestMapping("/admin/gameApply")
public class GameApplyController {
	
	@Autowired
	private GameApplyService gayService;
	
	@Autowired
	private GameService gService;
	
	@Autowired
	private ScoreService sService;
	
	@Autowired
	private UserTeamService utService;
	
	@Autowired
	private UserScoreService usService;
	
	
	/**
	 * 获取赛事报名列表
	 * @param gameId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list/{gameId}", method=RequestMethod.GET)
	public String list(@PathVariable long gameId, Model model) {
		List<GameApply> list = gayService.getApplyByGameId(gameId);
		model.addAttribute("list", list);
		model.addAttribute("game", gService.getGamesById(gameId));
		return "/admin/pages/gameApplyList";
	}
	
	/**
	 * 报名处理
	 * @param id
	 * @param status
	 */
	@RequestMapping(value="/check")
	@ResponseBody 
	public String check(@RequestParam long id, @RequestParam int status) {
		if(status == 1) {
			//审核通过
			gayService.updateStatus(GameApply.STATUS_CONFIRMED, id);
		}else if(status == 2){
			//报名成功
			gayService.updateStatus(GameApply.STATUS_APPLY_SUCCESS, id);
		}else {
			//拒绝
			gayService.updateStatus(GameApply.STATUS_NOT_CONFIRMED, id);
		}
		return String.valueOf(status);
	}

}
