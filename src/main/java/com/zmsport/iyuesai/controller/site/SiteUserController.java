package com.zmsport.iyuesai.controller.site;

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

import com.zmsport.iyuesai.mapper.Team;
import com.zmsport.iyuesai.mapper.User;
import com.zmsport.iyuesai.mapper.UserTeam;
import com.zmsport.iyuesai.service.GameApplyService;
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
	
	/**
	 * 跳转到注册页面
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(HttpSession session,User user) {
		service.update(user);
		session.setAttribute("user", user);
		return "redirect:/site/user/settings";
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
		model.addAttribute("list", list);
		//我参加的赛事
		model.addAttribute("gameList", gayService.getMyGames(currentUser.getId()));
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
		List<Team> list = tService.getTeamsByIds(utService.findTidsByUidAndStatus(currentUser.getId(), UserTeam.STATUS_CONFIRMED));
		model.addAttribute("list", list);
		if(currentUser.getId() == user.getId()) {
			//我参加的赛事
			model.addAttribute("gameList", gayService.getMyGames(currentUser.getId()));
			model.addAttribute("num", this.getApplyMemberNum(currentUser.getId()));
			return "/site/pages/me";
		}else {
			model.addAttribute("user", user);
			//他参加的赛事
			model.addAttribute("gameList", gayService.getMyGames(user.getId()));
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
		return num;
	}
}
