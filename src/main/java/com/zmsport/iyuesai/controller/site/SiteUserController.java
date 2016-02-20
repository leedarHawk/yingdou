package com.zmsport.iyuesai.controller.site;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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

import com.zmsport.iyuesai.mapper.Challenge;
import com.zmsport.iyuesai.mapper.Team;
import com.zmsport.iyuesai.mapper.User;
import com.zmsport.iyuesai.mapper.UserTeam;
import com.zmsport.iyuesai.service.ChallengeService;
import com.zmsport.iyuesai.service.GameApplyService;
import com.zmsport.iyuesai.service.RoundApplyService;
import com.zmsport.iyuesai.service.RoundService;
import com.zmsport.iyuesai.service.TeamService;
import com.zmsport.iyuesai.service.UserService;
import com.zmsport.iyuesai.service.UserTeamService;

/**
 * 用户controller
 * @author bilei
 *
 */
@Controller
@RequestMapping("/site/user")
public class SiteUserController {
	
	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private UserService service;
	
	@Autowired
	private TeamService tService;
	
	@Autowired
	private UserTeamService utService;
	
	@Autowired
	private GameApplyService gayService;
	
	@Autowired
	private RoundService rService;
	
	@Autowired
	private RoundApplyService raService;
	
	@Autowired
	private ChallengeService cService;
	
	/**
	 * 跳转到注册页面
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(HttpSession session,User user) {
		service.update(user);
		session.setAttribute("user", user);
		return "redirect:/site/user/path/me";
	}
	
	/**
	 * 设置用户信息
	 * @param uid
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/settings", method=RequestMethod.GET)
	public String settings() {
		return "/site/pages/settings";
	}
	
	/**
	 * 页面跳转
	 * @param uid
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/path/{path}", method=RequestMethod.GET)
	public String path(@PathVariable String path, HttpSession session,Model model) {
		User currentUser = (User)session.getAttribute("user");
		//我的球队
		List<Team> list = tService.getTeamsByIds(utService.findTidsByUidAndStatus(currentUser.getId(), UserTeam.STATUS_CONFIRMED));
		model.addAttribute("num", this.getApplyMemberNum(currentUser.getId()));
		model.addAttribute("list", list);
		//我参加的赛事
		model.addAttribute("gameList", gayService.getMyGames(currentUser.getId()));
		//我的球局
		model.addAttribute("myRoundApplys", raService.getRoundApplyByUid(currentUser.getId()));
		model.addAttribute("myRoundApplyNum", raService.getMyRoundApplyNum(currentUser.getId()));
		//我的约战
		List<Challenge> cList = new ArrayList<Challenge>();
		for(Team team : list) {
			cList.addAll(cService.findAllChallengesByTeamId(team.getId()));
		}
		sortCList(cList) ;
		model.addAttribute("myChallenges", cList);
		model.addAttribute("myChallengesNum", cService.getMyTeamChallengeNum(currentUser.getId()));
		return "/site/pages/" + path;
	}
	
	/**
	 * 查看用户信息
	 * @param uid
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/info/{id}", method=RequestMethod.GET)
	public String info(@PathVariable long id, HttpSession session,Model model) {
		User currentUser = (User)session.getAttribute("user");
		User user = service.findUserById(id);
		if(currentUser.getId() == user.getId()) {
			//我的球队
			List<Team> list = tService.getTeamsByIds(utService.findTidsByUidAndStatus(currentUser.getId(), UserTeam.STATUS_CONFIRMED));
			model.addAttribute("list", list);
			model.addAttribute("num", this.getApplyMemberNum(currentUser.getId()));
			//我参加的赛事
			model.addAttribute("gameList", gayService.getMyGames(currentUser.getId()));
			//我的球局
			model.addAttribute("myRoundApplys", raService.getRoundApplyByUid(currentUser.getId()));
			//我的约战
			List<Challenge> cList = new ArrayList<Challenge>();
			for(Team team : list) {
				cList.addAll(cService.findAllChallengesByTeamId(team.getId()));
			}
			sortCList(cList) ;
			model.addAttribute("myChallenges", cList);
			return "/site/pages/me";
		}else {
			model.addAttribute("user", user);
			//他的球队
			List<Team> list = tService.getTeamsByIds(utService.findTidsByUidAndStatus(user.getId(), UserTeam.STATUS_CONFIRMED));
			model.addAttribute("list", list);
			//他参加的赛事
			model.addAttribute("gameList", gayService.getMyGames(user.getId()));
			//他的球局
			model.addAttribute("myRoundApplys", raService.getRoundApplyByUid(user.getId()));
			//他的约战
			List<Challenge> cList = new ArrayList<Challenge>();
			for(Team team : list) {
				cList.addAll(cService.findAllChallengesByTeamId(team.getId()));
			}
			model.addAttribute("myChallenges", cList);
			return "/site/pages/him";
		}
	}
	
	/**
	 * 获取用户创建的球队新申请的球员数量
	 * @param uid
	 * @return
	 */
	private int getApplyMemberNum(long uid) {
		int num = -1;
		List<Team> list = tService.findTeamByCreatorId(uid);
		for(Team team : list) {
			num += tService.findUsersByTeamId(team.getId(),UserTeam.STATUS_NOT_CONFIRM).size();
		}
		return num > -1 ? ++num : num;
	}

	private void sortCList(List<Challenge> clist){
		Collections.sort(clist, new Comparator() {
			@Override
			public int compare(Object o1, Object o2) {
				return ((Challenge)o2).getTime().compareTo(((Challenge)o1).getTime()) ;
				//return new Double((String) o1).compareTo(new Double((String) o2));
			}
		});
	}
}
