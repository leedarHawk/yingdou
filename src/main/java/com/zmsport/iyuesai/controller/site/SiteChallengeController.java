package com.zmsport.iyuesai.controller.site;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zmsport.iyuesai.mapper.AcceptInfo;
import com.zmsport.iyuesai.mapper.Challenge;
import com.zmsport.iyuesai.mapper.Round;
import com.zmsport.iyuesai.mapper.RoundApply;
import com.zmsport.iyuesai.mapper.Team;
import com.zmsport.iyuesai.mapper.User;
import com.zmsport.iyuesai.service.AcceptInfoService;
import com.zmsport.iyuesai.service.ChallengeService;
import com.zmsport.iyuesai.service.RoundApplyService;
import com.zmsport.iyuesai.service.RoundService;
import com.zmsport.iyuesai.service.TeamService;


/**
 * 约战controller
 * @author bilei
 *
 */
@Controller
@RequestMapping("/site/challenge")
public class SiteChallengeController {

	@Autowired
	private ChallengeService service;
	
	@Autowired
	private TeamService tService;
	
	@Autowired
	private AcceptInfoService aiService;
	
	@Autowired
	private RoundService rService;
	
	@Autowired
	private RoundApplyService raService;
	
	/**
	 * 获取约战列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model, HttpSession session) {
		User currentUser = (User)session.getAttribute("user");
		model.addAttribute("list", service.getAllChallenges(currentUser.getId()));
		model.addAttribute("roundList", rService.getAllRoundsNew(currentUser.getId()));
		return "/site/pages/challenge";
	}
	
	/**
	 * 获取约战地图模式
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/map", method=RequestMethod.GET)
	public String map(Model model, HttpSession session) {
		User currentUser = (User)session.getAttribute("user");
		model.addAttribute("list", service.getAllChallenges(currentUser.getId()));
		model.addAttribute("roundList", rService.getAllRoundsNew(currentUser.getId()));
		return "/site/pages/challengeMap";
	}
	
	/**
	 * 跳转到发布约战和球局页面
	 * @return
	 */
	@RequestMapping(value="/publish", method=RequestMethod.GET)
	public String publish(HttpSession session, Model model) {
		User currentUser = (User)session.getAttribute("user");
		//比赛
		List<Team> myTeams = tService.findTeamByCreatorId(currentUser.getId());
		model.addAttribute("list", myTeams);
		return "/site/pages/challengeAndRoundPublish";
	}
	
	/**
	 * 发布约战
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/publishMatch", method=RequestMethod.POST)
	public String publish(HttpSession session, Challenge challenge) {
		User currentUser = (User)session.getAttribute("user");
		challenge.setCreatorId(currentUser.getId());
		service.insert(challenge);
		return "redirect:/site/challenge/list";
	}
	
	/**
	 * 是否已应战
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/isAccept", method=RequestMethod.POST)
	@ResponseBody
	public String accept(@RequestParam long cid, @RequestParam int tid) {
		return String.valueOf(aiService.isAccept(cid, tid));
	}
	
	/**
	 * 跳转到应战
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/toAccept", method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public Object toAccept(@RequestParam long id, HttpSession session) {
		User currentUser = (User)session.getAttribute("user");
		Challenge challenge = service.getChallenge(id);
		JSONObject json = new JSONObject();
		List<Team> teamList = tService.findTeamByCreatorId(currentUser.getId());
		json.put("myTeams", teamList);
		json.put("contact", challenge.getContact());
		json.put("ps", challenge.getPs());
		return json;
	}
	
	/**
	 * 应战
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/accept", method=RequestMethod.POST)
	@ResponseBody
	public String accept(AcceptInfo ai) {
		if(aiService.isAccept(ai.getChallengeId(), ai.getTid())) {
			return "exist";
		}else {
			ai.setTime(new Date(System.currentTimeMillis()));
			aiService.insert(ai);
			return "ok";
		}
	}
	
	/**
	 * 获取应战列表
	 * @param cid
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/acceptInfoList/{cid}", method=RequestMethod.GET)
	public String acceptInfoList(@PathVariable long cid, Model model) {
		List<AcceptInfo> list = aiService.findAcceptInfoByChallengeId(cid);
		List<HashMap> resultList = new ArrayList<HashMap>();
		HashMap map;
		for(AcceptInfo ai : list) {
			map = new HashMap();
			map.put("team", tService.findTeamById(ai.getTid()));
			map.put("ai", ai);
			resultList.add(map);
		}
		model.addAttribute("list", resultList);
		return "/site/pages/acceptInfoList";
	}
	
	/**
	 * 接受应战
	 * @param guestId
	 * @param challengeId
	 * @return
	 */
	@RequestMapping(value="/acceptChallenge/{guestId}/{challengeId}", method=RequestMethod.GET)
	public String acceptChallenge(@PathVariable int guestId, @PathVariable long challengeId) {
		service.updateGuestTeamId(guestId, challengeId);
		service.updateStatus(Challenge.STATUS_STARTED, challengeId);
		return "redirect:/site/challenge/list";
	}
	
	/**
	 * 发布球局
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/publishRound", method=RequestMethod.POST)
	public String publishRound(HttpSession session, Round round) {
		User currentUser = (User)session.getAttribute("user");
		round.setCreatorId(currentUser.getId());
		round.setTime(new Date(System.currentTimeMillis()));
		if(round.getMembers() == 0) {
			//包含创始人，所以最少为1
			round.setMembers(1);
		}
		rService.insert(round);
		return "redirect:/site/challenge/list";
	}
	
	/**
	 * 申请加入球局
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/applyRound", method=RequestMethod.POST)
	@ResponseBody
	public String applyRound(HttpSession session, RoundApply roundApply) {
		User user = (User)session.getAttribute("user");
		if(raService.isApply(user.getId(), roundApply.getRid())) {
			return "exist";
		}else {
			roundApply.setStatus(RoundApply.STATUS_NOT_OK);
			roundApply.setTime(new Date(System.currentTimeMillis()));
			raService.insert(roundApply);
			return "ok";
		}
	}
	
	/**
	 * 球局申请列表
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/roundApplyList/{rid}/{creatorId}", method=RequestMethod.GET)
	public String roundApplyList(@PathVariable long rid, @PathVariable long creatorId,Model model) {
		model.addAttribute("list", raService.getAllRoundApplys(rid));
		model.addAttribute("creatorId", creatorId);
		return "/site/pages/roundApplyList";
	}
	
	/**
	 * 确定加入球局
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/confirmRound", method=RequestMethod.POST)
	@ResponseBody
	public String confirmRound(@RequestParam long roundApplyId, @RequestParam long roundId) {
		raService.updateStatus(RoundApply.STATUS_OK, roundApplyId);
		rService.updateMembers(roundId);
		return "ok";
	}
	
	/**
	 * 查看球局报名信息
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/showRoundApply", method=RequestMethod.GET)
	@ResponseBody
	public Object showRoundApply(@RequestParam long roundApplyId) {
		return raService.getRoundApplyById(roundApplyId);
	}
}
