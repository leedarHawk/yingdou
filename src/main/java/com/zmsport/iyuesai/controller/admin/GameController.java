package com.zmsport.iyuesai.controller.admin;

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
import org.springframework.web.multipart.MultipartFile;

import com.zmsport.iyuesai.mapper.Admin;
import com.zmsport.iyuesai.mapper.Game;
import com.zmsport.iyuesai.service.GameService;
import com.zmsport.iyuesai.util.FileUtil;

/**
 * 后台赛事管理
 * @author bilei
 *
 */
@Controller
@RequestMapping("/admin/game")
public class GameController {
	/**
	 * logger
	 */
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private GameService service;
	
	/**
	 * 获取赛事列表
	 * @return
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(@RequestParam(value="status",defaultValue="0") int status,
					   @RequestParam(value="page",defaultValue="1") int page,
			           @RequestParam(value="size",defaultValue="10") int size,Model model) {
		int totalNum = service.getTotalNum();
		int totalPage = totalNum < size ? 1 : (int)Math.ceil(1.0 * totalNum / size);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("list", service.getGames(status,page,size));
		return "/admin/pages/gameList";
	}
	
	/**
	 * 跳转到编辑页面
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/edit/{type}/{id}", method=RequestMethod.GET)
    public String edit(@PathVariable String type,@PathVariable long id,Model model) {
		model.addAttribute("editType", type);
		if(type.equals("update")) {
			model.addAttribute("game", service.getGamesById(id));
		}
		return "/admin/pages/gameEdit";
	}
	
	/*
	 * 添加赛事
	 */
	@RequestMapping("/addGame")
	public String add(@RequestParam MultipartFile file,HttpSession session,Game game) {
		Admin admin = (Admin)session.getAttribute("admin");
		game.setCreator(admin.getId());
		game.setCreateType(Game.CREATE_TYPE_ADMIN);
		game.setCreateTime(new Timestamp(System.currentTimeMillis()));
		if(file.getOriginalFilename().length() > 0) {
			game.setPic(FileUtil.uploadGamePic(file, session.getServletContext().getRealPath("/")));
		}
		service.publishGame(game);
		return "redirect:/admin/game/list";
	}
	
	/**
	 * 修改赛事
	 * @param game
	 * @return
	 */
	@RequestMapping("/updateGame")
	public String update(@RequestParam MultipartFile file,HttpSession session,Game game) {
		if(file.getOriginalFilename().length() > 0) {
			FileUtil.delFile(session.getServletContext().getRealPath("/") + java.io.File.separator + game.getPic());
			game.setPic(FileUtil.uploadGamePic(file, session.getServletContext().getRealPath("/")));
		}
		service.updateGame(game);
		return "redirect:/admin/game/list";
	}
	
	/**
	 * 删除赛事 
	 * @param ids
	 * @return
	 */
	@RequestMapping("/deleteGame")
	public String delete(@RequestParam String ids,HttpSession session) {
		List<Game> list = service.getGamesByIds(ids);
		for(Game game : list) {
			FileUtil.delFile(session.getServletContext().getRealPath("/") + java.io.File.separator + game.getPic());
		}
		service.delete(ids);
		return "redirect:/admin/game/list";
	}
}
