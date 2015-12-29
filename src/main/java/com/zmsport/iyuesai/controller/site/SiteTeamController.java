package com.zmsport.iyuesai.controller.site;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	private Logger log = LoggerFactory.getLogger(getClass());

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
		}else {
			team.setPic("/site/images/tx_mr.jpg");
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
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(@RequestParam int teamId,  @RequestParam String name,@RequestParam String slogan, @RequestParam String description,
			@RequestParam MultipartFile file, HttpSession session, Model model) {
		Team team = service.findTeamById(teamId);
		team.setName(name);
		team.setSlogan(slogan);
		team.setDescription(description);
		String originPic = team.getPic();
		if(file.getOriginalFilename().length() > 0) {
			if(originPic.endsWith("site/images/tx_mr.jpg")) {
				team.setPic(FileUtil.uploadTeamLogo(file, session.getServletContext().getRealPath("/"),String.valueOf(System.currentTimeMillis()),team.getCreatorId()));
			}else {
				String segment = originPic.split("_")[0];
				segment = segment.split("/")[segment.split("/").length - 1];
				team.setPic(FileUtil.uploadTeamLogo(file, session.getServletContext().getRealPath("/"),segment,team.getCreatorId()));
			}
		}
		service.update(team);
		return "redirect:/site/team/detail/" + teamId;
	}
	
	/**
	 * 删除球队 
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam String ids,HttpSession session) {
		List<Team> list = service.getTeamsByIds(ids);
		String path = File.separator + FileUtil.UPLOAD_DIR + File.separator
				+ FileUtil.TEAM_DIR + File.separator;
		for(Team team : list) {
			FileUtil.deleteAll(session.getServletContext().getRealPath("/") + path + team.getName() + "_" + team.getCreatorId());
		}
		service.delete(ids);
		return "redirect:/site/team/list";
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
	 * 获取球队地图
	 * @param uid
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/map", method=RequestMethod.GET)
	public String map(Model model) {
		List<Team> teamList = service.getAllTeams();
		for (Team team : teamList){
			team.setDescription(team.getDescription().replace("\n", ""));
			team.setDescription(team.getDescription().replace("\r", ""));
		}
		model.addAttribute("list", teamList);
		return "/site/pages/teamMap";
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
	public String join(@PathVariable int id, Model model, HttpSession session) {
		Team team = service.findTeamById(id);
		User user = (User)session.getAttribute("user");
		model.addAttribute("team", team);
		model.addAttribute("user", user);
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
	
	/**
	 * 搜索球队
	 * @param name
	 * @return
	 */
	@RequestMapping(value="/search", method=RequestMethod.GET, produces={MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public Object search(@RequestParam String name) {
		return service.getAllTeamsByName(name);
	}

	/**
	 * 删除球队图片
	 * @param id
	 * @param pic
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/delPic", method=RequestMethod.GET)
	@ResponseBody
	public String delPic(@RequestParam long id, @RequestParam String pic, HttpSession session) {
		taService.deletePicById(String.valueOf(id));
		FileUtil.delFile(session.getServletContext().getRealPath("/") + pic);
		return "ok";
	}
}
