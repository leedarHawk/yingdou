package com.zmsport.iyuesai.controller.site;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zmsport.iyuesai.mapper.Team;
import com.zmsport.iyuesai.mapper.User;
import com.zmsport.iyuesai.mapper.UserTeam;
import com.zmsport.iyuesai.mapper.UserTeamLike;
import com.zmsport.iyuesai.service.ChallengeService;
import com.zmsport.iyuesai.service.TeamAlbumService;
import com.zmsport.iyuesai.service.TeamService;
import com.zmsport.iyuesai.service.UserService;
import com.zmsport.iyuesai.service.UserTeamLikeService;
import com.zmsport.iyuesai.service.UserTeamService;
import com.zmsport.iyuesai.util.FileUtil;

/**
 * 球队controller
 * @author bilei
 *
 */
@Controller
@RequestMapping("/site/team")
public class SiteTeamController {

	@Autowired
	private TeamService service;
	
	@Autowired
	private UserTeamService utService;
	
	@Autowired
	private TeamAlbumService taService;
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private UserTeamLikeService utlService;
	
	@Autowired
	private ChallengeService cService;
	
	/**
	 * 创建球队
	 * @param session
	 * @param team
	 * @return
	 */
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String createTeam(@RequestParam MultipartFile file,HttpSession session, Team team) {
		User user = (User)session.getAttribute("user");
		team.setCreatorId(user.getId());
		team.setCreateTime(new Timestamp(System.currentTimeMillis()));
		if(file.getOriginalFilename().length() > 0) {
			team.setPic(FileUtil.uploadTeamLogo(file, session.getServletContext().getRealPath("/"),String.valueOf(System.currentTimeMillis()),team.getCreatorId()));
		}
		service.insert(team);
		//创建者自动加入球队
		UserTeam ut = new UserTeam();
		ut.setTid(team.getId());
		ut.setUid(user.getId());
		ut.setStatus(UserTeam.STATUS_CONFIRMED);
		ut.setTime(new Timestamp(System.currentTimeMillis()));
		utService.insert(ut);
		return "redirect:/site/team/list";
	}
	
	/**
	 * 修改球队
	 * @param session
	 * @param team
	 * @return
	 */
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateTeam(Team team) {
		service.update(team);
		return "";
	}
	
	/**
	 * 跳转到创建球队页面
	 * @return
	 */
	@RequestMapping(value="/toCreate",method=RequestMethod.GET)
	public String toCreate() {
		return "/site/pages/editTeam";
	}
	
	/**
	 * 跳转到修改球队页面
	 * @return
	 */
	@RequestMapping(value="/toUpdate/{teamId}",method=RequestMethod.GET)
	public String toUpdate(@PathVariable int teamId, Model model) {
		model.addAttribute("team", service.findTeamById(teamId));
		return "/site/pages/updateTeam";
	}
	
	/**
	 * 修改球队
	 * @return
	 */
	@RequestMapping(value="/update/{teamId}/{slogan}/{description}",method=RequestMethod.GET)
	public String update(@PathVariable int teamId, @PathVariable String slogan, @PathVariable String description, Model model) {
		Team team = service.findTeamById(teamId);
		try {
			team.setSlogan(new String(slogan.getBytes(),"UTF-8"));
			team.setDescription(new String(description.getBytes(),"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		service.update(team);
		return "redirect:/site/team/detail/" + teamId;
	}
	
	/**
	 * 获取球队列表
	 * @param uid
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list", service.getAllTeams());
		return "/site/pages/teamList";
	}
	
	/**
	 * 查看球队主页
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/detail/{id}", method=RequestMethod.GET)
	public String detail(@PathVariable int id, Model model, HttpSession session) {
		Team team = service.findTeamById(id);
		User user = (User)session.getAttribute("user");
		List<User> list = service.findUsersByTeamId(id,UserTeam.STATUS_CONFIRMED);
		model.addAttribute("team", team);
		model.addAttribute("list", list);
		model.addAttribute("status", utService.getCurrentUserTeamStatus(user.getId(), team.getId()));
		model.addAttribute("albumList", taService.findTeamAlbumByTeamId(team.getId()));
		model.addAttribute("memberNum", utService.getMemberNum(team.getId()));
		model.addAttribute("ids", service.findMembersIds(id));
		//约战记录
		model.addAttribute("challengeList", cService.findChallengesByTeamId(id));
		return "/site/pages/team";
	}
	
	/**
	 * 加入球队
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/join/{id}", method=RequestMethod.GET)
	public String join(@PathVariable int id, Model model) {
		Team team = service.findTeamById(id);
		model.addAttribute("team", team);
		return "/site/pages/joinTeam";
	}
	
	/**
	 * 申请加入球队
	 * @param session
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/candidate", method=RequestMethod.POST)
	public String candidate(HttpSession session,HttpServletRequest request) {
		UserTeam ut = new UserTeam();
		User currentUser = (User)session.getAttribute("user");
		//新增加入球队申请
		ut.setMsg(request.getParameter("msg").toString());
		ut.setUid(currentUser.getId());
		ut.setTid(Integer.parseInt(request.getParameter("teamId").toString()));
		Team team = service.findTeamById(ut.getTid());
		if(team.getNeedConfirm() == 1) {
			//如果加入球队要求审核
			ut.setStatus(UserTeam.STATUS_NOT_CONFIRM);
		}else {
			ut.setStatus(UserTeam.STATUS_CONFIRMED);
		}
		ut.setTime(new Timestamp(System.currentTimeMillis()));
		utService.insert(ut);
		//更新用户资料
		if(request.getParameter("height").toString().length() > 0) {
			currentUser.setHeight(request.getParameter("height").toString());
		}
		if(request.getParameter("weight").toString().length() > 0) {
			currentUser.setWeight(request.getParameter("weight").toString());
		}
		if(request.getParameter("qq").toString().length() > 0) {
			currentUser.setQq(request.getParameter("qq").toString());
		}
		if(request.getParameter("mobile").toString().length() > 0) {
			currentUser.setMobile(request.getParameter("mobile").toString());
		}
		uService.update(currentUser);
		return "redirect:/site/team/detail/" + ut.getTid();
	}
	
	/**
	 * 查看所有球员
	 * @param teamId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/allMembers", method=RequestMethod.GET)
	public String allMemebers(@RequestParam int teamId,Model model) {
		model.addAttribute("newList", utService.findUserByStatusAndTeamId(teamId, UserTeam.STATUS_NOT_CONFIRM));
		model.addAttribute("oldList", utService.findUserByStatusAndTeamId(teamId, UserTeam.STATUS_CONFIRMED));
		model.addAttribute("teamId",teamId);
		return "/site/pages/members";
	}
	
	/**
	 * 查看球员资料
	 * @param teamId
	 * @param uid
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/profile/{teamId}/{uid}", method=RequestMethod.GET)
	public String profile(@PathVariable int teamId, @PathVariable long uid, Model model) {
		User user = uService.findUserById(uid);
		UserTeam ut = utService.findByUidAndTid(uid, teamId);
		Team team = service.findTeamById(teamId);
		model.addAttribute("member", user);
		model.addAttribute("userTeam", ut);
		model.addAttribute("team", team);
		return "/site/pages/profile";
	}
	
	/**
	 * 查看已加入球队球员资料
	 * @param teamId
	 * @param uid
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/memberProfile/{teamId}/{uid}", method=RequestMethod.GET)
	public String memberProfile(@PathVariable int teamId, @PathVariable long uid, Model model) {
		User user = uService.findUserById(uid);
		UserTeam ut = utService.findByUidAndTid(uid, teamId);
		Team team = service.findTeamById(teamId);
		model.addAttribute("member", user);
		model.addAttribute("userTeam", ut);
		model.addAttribute("team", team);
		return "/site/pages/memberProfile";
	}
	
	/**
	 * 批准加入
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/confirm/{id}/{teamId}", method=RequestMethod.GET)
	public String confirm(@PathVariable long id, @PathVariable int teamId) {
		UserTeam ut = new UserTeam();
		ut.setId(id);
		ut.setStatus(UserTeam.STATUS_CONFIRMED);
		ut.setTime(new Timestamp(System.currentTimeMillis()));
		utService.updateStatus(ut);
		return "redirect:/site/team/allMembers?teamId=" + teamId;
	}
	
	/**
	 * 删除申请
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete/{id}/{teamId}", method=RequestMethod.GET)
	public String delete(@PathVariable long id, @PathVariable int teamId) {
		utService.delete(id);
		return "redirect:/site/team/allMembers?teamId=" + teamId;
	}
	
	/**
	 * 球队点赞
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/like/{id}", method=RequestMethod.POST)
	@ResponseBody
	public Object like(@PathVariable int id, HttpSession session) {
		User currentUser = (User)session.getAttribute("user");
		int num = utlService.alreadyLiked(currentUser.getId(), id);
		if(num == 0) {
			//当前用户对此只球队尚未点过赞
			service.like(id);
			//记录点赞
			UserTeamLike utl = new UserTeamLike();
			utl.setTid(id);
			utl.setUid(currentUser.getId());
			utl.setTime(new Timestamp(System.currentTimeMillis()));
			utlService.insert(utl);
		}else {
			service.unlike(id);
			utlService.deleteLike(id, currentUser.getId());
		}
		return String.valueOf(service.findTeamById(id).getLikes());
	}
}
