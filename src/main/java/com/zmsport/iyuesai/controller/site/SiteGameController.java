package com.zmsport.iyuesai.controller.site;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zmsport.iyuesai.mapper.Game;
import com.zmsport.iyuesai.mapper.GameApply;
import com.zmsport.iyuesai.mapper.Team;
import com.zmsport.iyuesai.mapper.User;
import com.zmsport.iyuesai.mapper.UserScore;
import com.zmsport.iyuesai.service.GameAnnouncementService;
import com.zmsport.iyuesai.service.GameApplyService;
import com.zmsport.iyuesai.service.GameService;
import com.zmsport.iyuesai.service.ScoreService;
import com.zmsport.iyuesai.service.TeamService;
import com.zmsport.iyuesai.service.UserScoreService;

/**
 * 赛事
 * @author bilei
 *
 */
@Controller
@RequestMapping("/site/game")
public class SiteGameController {
	/**
	 * logger
	 */
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private GameService service;
	
	@Autowired
	private TeamService tService;
	
	@Autowired
	private GameAnnouncementService gaService;
	
	@Autowired
	private GameApplyService gayService;
	
	@Autowired
	private ScoreService sService;
	
	@Autowired
	private UserScoreService usService;
	
	/**
	 * 获取赛事列表
	 * @return
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(@RequestParam(value="status",defaultValue="0") int status, Model model) {
		model.addAttribute("list", service.getNewGames());
		return "/site/pages/gameList";
	}
	
	/**
	 * 赛事信息
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/gameInfo/{id}", method=RequestMethod.GET)
    public String gameInfo(@PathVariable long id,Model model,HttpSession session) {
		model.addAttribute("game", service.getGamesById(id));
		//获取公告
		model.addAttribute("gameAnnouncementList",gaService.findAllAnnouncementByGameId(id));
		//判断当前用户是否是球队创建者，只有球队创建者才可以报名参加
		User currentUser = (User)session.getAttribute("user");
		List<Team> list = tService.findTeamByCreatorId(currentUser.getId());
		boolean isCreator = list.size() > 0 ? true : false;
		model.addAttribute("isCreator", isCreator);
		//球队创建者申请比赛的状态
		if(isCreator) {
			int status = gayService.getStatusByGameIdAndCreatorId(id, currentUser.getId());
			model.addAttribute("status", status);
		}
		//获取已经报名的球队
		List<Team> teamList = tService.getTeamsByIds(gayService.getJoinedTeamIdsByGameId(id));
		model.addAttribute("teamList", teamList);
		//球队排行信息
		model.addAttribute("teamScoreList", sService.findTeamsByGameId(id));
		//球员排行榜
		List<UserScore> userScoreList = usService.rankUserByGameId(id);
		for(UserScore us : userScoreList) {
			us.setTeamName(tService.findTeamById(us.getTid()).getName());
		}
		model.addAttribute("userScoreList", userScoreList);
		return "/site/pages/gameInfo";
	}
	/*
	 * 我要报名
	 */
	@RequestMapping("/candidate/{id}")
	public String add(@PathVariable long id, Model model,HttpSession session) {
		User user = (User)session.getAttribute("user");
		List<Team> myTeams = tService.findTeamByCreatorId(user.getId());
		Game game = service.getGamesById(id);
		model.addAttribute("game", game);
		model.addAttribute("myTeams", myTeams);
		return "/site/pages/candidate";
	}
	
	/**
	 * 报名
	 * @param session
	 * @param gameApply
	 * @return
	 */
	@RequestMapping("/apply")
	public String apply(HttpSession session, GameApply gameApply, Model model) {
		User currentUser = (User)session.getAttribute("user");
		gameApply.setCreatorId(currentUser.getId());
		gameApply.setTime(new Timestamp(System.currentTimeMillis()));
		gayService.add(gameApply);
		model.addAttribute("gameApply", gameApply);
		model.addAttribute("team", tService.findTeamById(gameApply.getTeamId()));
		return "/site/pages/applyInfo";
	}
	
	/**
	 * 删除报名信息
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteGameApply/{id}/{gameId}")
	public String deleteGameApply(@PathVariable long id,@PathVariable long gameId) {
		gayService.delete(id);
		return "redirect:/site/game/gameInfo/" + gameId;
	}
}
