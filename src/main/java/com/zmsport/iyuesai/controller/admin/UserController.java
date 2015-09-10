package com.zmsport.iyuesai.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.zmsport.iyuesai.mapper.Team;
import com.zmsport.iyuesai.mapper.User;
import com.zmsport.iyuesai.mapper.UserTeam;
import com.zmsport.iyuesai.service.ChallengeService;
import com.zmsport.iyuesai.service.GameApplyService;
import com.zmsport.iyuesai.service.OrderService;
import com.zmsport.iyuesai.service.TeamAlbumService;
import com.zmsport.iyuesai.service.TeamService;
import com.zmsport.iyuesai.service.UserScoreService;
import com.zmsport.iyuesai.service.UserService;
import com.zmsport.iyuesai.service.UserTeamLikeService;
import com.zmsport.iyuesai.service.UserTeamService;
import com.zmsport.iyuesai.util.FileUtil;

/**
 * 用户管理controller
 * @author bilei
 *
 */
@Controller
@RequestMapping("/admin/user")
public class UserController {

	@Autowired
	private UserService service;
	
	@Autowired
	private TeamService tService;
	
	@Autowired
	private UserTeamService utService;
	
	@Autowired
	private TeamAlbumService taService;
	
	@Autowired
	private ChallengeService cService;
	
	@Autowired
	private GameApplyService gayService;
	
	@Autowired
	private OrderService oService;
	
	@Autowired
	private UserScoreService usService;
	
	@Autowired
	private UserTeamLikeService utlService;
	
	/**
	 * 获取用户列表
	 * @param page
	 * @param size
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(@RequestParam(value="page",defaultValue="1") int page,
			           @RequestParam(value="size",defaultValue="10") int size,Model model) {
		int totalNum = service.getTotalCount();
		int totalPage = totalNum < size ? 1 : (int)Math.ceil(1.0 * totalNum / size);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", page);
		//统计用户创建的球队和加入的球队
		List<HashMap<String,Object>> uList = new ArrayList<HashMap<String,Object>>();
		HashMap<String,Object> userMap;
		List<Team> tList;
		String[] teams;
		List<User> list = service.findAllUsers((page - 1) * size, size);
		for(User user : list) {
			userMap = new HashMap<String,Object>();
			userMap.put("user", user);
			//创建的球队
			tList = tService.findTeamByCreatorId(user.getId());
			if(tList.size() > 0) {
				teams = new String[tList.size()];
				for(int i = 0; i < tList.size(); i++) {
					teams[i] = tList.get(i).getName();
				}
				userMap.put("createdTeams", StringUtils.join(teams, ","));
			}else {
				userMap.put("createdTeams", "");
			}
			//加入的球队
			tList = tService.getTeamsByIds(utService.findTidsByUidAndStatus(user.getId(), UserTeam.STATUS_CONFIRMED));
			if(tList.size() > 0) {
				teams = new String[tList.size()];
				for(int i = 0; i < tList.size(); i++) {
					teams[i] = tList.get(i).getName();
				}
				userMap.put("joinedTeams", StringUtils.join(teams, ","));
			}else {
				userMap.put("joinedTeams", "");
			}
			uList.add(userMap);
		}
		model.addAttribute("list", uList);
		return "/admin/pages/userList";
	}
	
	/**
	 * 删除用户
	 * @param uid
	 * @return
	 */
	@RequestMapping(value="/delete/{uid}", method=RequestMethod.GET)
	public String delete(@PathVariable long uid, HttpSession session) {
		//如果是球队创建者，则删除其创建的球队及其相关数据
		List<Team> tList = tService.findTeamByCreatorId(uid);
		if(tList.size() > 0) {
			for(Team team : tList) {
				//删除球队相册
				taService.deleteAlbumByTeamId(team.getId());
			}
		}
		//删除其创建的球队的相册及logo
		FileUtil.deleteTeamAlbum(uid, session.getServletContext().getRealPath("/"));
		//删除用户约战信息
		cService.delete(uid);
		//删除赛事报名信息
		gayService.deleteByCreatorId(uid);
		//删除订单信息
		oService.deleteByCreatorId(uid);
		//删除用户排名评分信息
		usService.deleteByUid(uid);
		//删除用户创建的球队
		tService.deleteByUid(uid);
		//删除用户球队关联数据
		utService.deleteByUid(uid);
		//删除用户对球队点赞信息
		utlService.deleteByUid(uid);
		//删除用户基本信息
		service.delete(uid);
		return "redirect:/admin/user/list";
	}
}
