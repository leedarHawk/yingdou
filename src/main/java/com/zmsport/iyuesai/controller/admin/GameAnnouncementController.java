package com.zmsport.iyuesai.controller.admin;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zmsport.iyuesai.mapper.GameAnnouncement;
import com.zmsport.iyuesai.service.GameAnnouncementService;
import com.zmsport.iyuesai.service.GameService;

/**
 * 赛事公告controller
 * @author bilei
 *
 */
@Controller
@RequestMapping("/admin/gameAnnouncement")
public class GameAnnouncementController {
	
	@Autowired
	private GameAnnouncementService service;
	
	@Autowired
	private GameService gService;
	
	/**
	 * 获取某赛事的公告列表
	 * @param page
	 * @param gameId
	 * @param size
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(@RequestParam(value="page",defaultValue="1") int page,
			   @RequestParam long gameId,
	           @RequestParam(value="size",defaultValue="10") int size,Model model) {
		int totalNum = service.getTotalNum(gameId);
		int totalPage = totalNum < size ? 1 : (int)Math.ceil(1.0 * totalNum / size);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("list", service.findAnnouncementByGameId(gameId, page, size));
		model.addAttribute("game", gService.getGamesById(gameId));
		return "/admin/pages/gameAnnouncementList";
	}
	
	/**
	 * 添加
	 * @param gameAnnouncement
	 * @return
	 */
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(GameAnnouncement gameAnnouncement) {
		gameAnnouncement.setTime(new Timestamp(System.currentTimeMillis()));
		service.insert(gameAnnouncement);
		return "redirect:/admin/gameAnnouncement/list?gameId=" + gameAnnouncement.getGameId();
	}

	/**
	 * 修改
	 * @param gameAnnouncement
	 * @return
	 */
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(GameAnnouncement gameAnnouncement) {
		service.update(gameAnnouncement);
		return "redirect:/admin/gameAnnouncement/list?gameId=" + gameAnnouncement.getGameId();
	}
	
	/**
	 * 修改
	 * @param gameAnnouncement
	 * @return
	 */
	@RequestMapping(value="/view/{id}", method=RequestMethod.GET)
	public String view(@PathVariable long id,Model model) {
		model.addAttribute("gameAnnouncement", service.findAnnouncementById(id));
		return "/admin/pages/gameAnnouncementView";
	}


	/**
	 * 跳转到编辑页�?
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/edit/{type}/{id}/{gameId}", method=RequestMethod.GET)
    public String edit(@PathVariable String type,@PathVariable long id,@PathVariable long gameId,Model model) {
		model.addAttribute("editType", type);
		if(type.equals("update")) {
			model.addAttribute("gameAnnouncement", service.findAnnouncementById(id));
		}
		model.addAttribute("gameId", gameId);
		return "/admin/pages/gameAnnouncementEdit";
	}
	
	/**
	 * 删除
	 * @param ids
	 * @param gameId
	 * @return
	 */
	@RequestMapping(value="/delete/{ids}/{gameId}", method=RequestMethod.GET)
	public String delete(@PathVariable String ids,@PathVariable long gameId) {
		service.delete(ids);
		return "redirect:/admin/gameAnnouncement/list?gameId=" + gameId;
	}
}
