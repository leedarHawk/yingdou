package com.zmsport.iyuesai.controller.admin;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.zmsport.iyuesai.mapper.Game;
import com.zmsport.iyuesai.mapper.Team;
import com.zmsport.iyuesai.mapper.User;
import com.zmsport.iyuesai.service.TeamService;
import com.zmsport.iyuesai.util.ConstantUtil;
import com.zmsport.iyuesai.util.FileUtil;

/**
 * 后台球队管理controller
 * @author bilei
 *
 */
@Controller
@RequestMapping("/admin/team")
public class TeamController {

	@Autowired
	private TeamService service;
	
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
	 * 获取球队列表
	 * @param
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(@RequestParam(value="page",defaultValue="1") int page,
			           @RequestParam(value="size",defaultValue="10") int size,Model model) {
		size = ConstantUtil.PAGE_SIZE;
		int totalNum = service.getTotalNum();
		int totalPage = totalNum < size ? 1 : (int)Math.ceil(1.0 * totalNum / size);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("list", service.findAllTeamsByPage(page,size));
		return "/admin/pages/teamList";
	}
	
	/**
	 * 删除球队 
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam String ids,
						 @RequestParam(value="page",defaultValue="1") int page,
						 HttpSession session) {
		List<Team> list = service.getTeamsByIds(ids);
		String path = File.separator + FileUtil.UPLOAD_DIR + File.separator
				+ FileUtil.TEAM_DIR + File.separator;
		for(Team team : list) {
			FileUtil.deleteAll(session.getServletContext().getRealPath("/") + path + team.getName() + "_" + team.getCreatorId());
		}
		service.delete(ids);
		return "redirect:/admin/team/list?page="+page;
	}
	
	/**
	 * 查看所有球员
	 * @param teamId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/allMembers", method=RequestMethod.GET)
	public String allMemebers(@RequestParam int teamId,Model model) {
		model.addAttribute("oldList", service.findOldUsers(teamId, ConstantUtil.TEAM_USERS_TIME_LINE));
		model.addAttribute("newList", service.findNewUsers(teamId, ConstantUtil.TEAM_USERS_TIME_LINE));
		return "/site/pages/teamList";
	}
}
