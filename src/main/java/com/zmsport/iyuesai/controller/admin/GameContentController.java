package com.zmsport.iyuesai.controller.admin;

import com.zmsport.iyuesai.mapper.Admin;
import com.zmsport.iyuesai.mapper.GameContent;
import com.zmsport.iyuesai.service.GameContentService;
import com.zmsport.iyuesai.service.GameService;
import com.zmsport.iyuesai.util.ConstantUtil;
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

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

/**
 * 赛事内容管理
 */

@Controller
@RequestMapping("/admin/gameContent")
public class GameContentController {
    /**
     * logger
     */
    private Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private GameContentService service;

    @Autowired
    private GameService gameService;

    /**
     * 获取赛事内容列表
     * @return
     */
    @RequestMapping(value="/list", method= RequestMethod.GET)
    public String list(@RequestParam(value="status",defaultValue="1") int status,
                       @RequestParam(value="page",defaultValue="1") int page,
                       @RequestParam(value="size",defaultValue="10") int size,Model model, HttpSession session) {
        size = ConstantUtil.PAGE_SIZE;

        int totalPage = 0 ;
        Admin admin = (Admin)session.getAttribute("admin");
        if(admin.getType() == Admin.SYSTEM_ADMINISTRATOR){
            int totalNum = service.getTotalNumBySystemAdministrator(status);
            totalPage = totalNum < size ? 1 : (int)Math.ceil(1.0 * totalNum / size);
            model.addAttribute("list", service.getGameContentBySystemAdministrator(status,page,size));
        }else{
            int totalNum = service.getTotalNumByZoneAdministrator(status, admin.getId());
            totalPage = totalNum < size ? 1 : (int)Math.ceil(1.0 * totalNum / size);
            model.addAttribute("list", service.getGameContentByZoneAdministrator(status,page,size, admin.getId()));
        }

        model.addAttribute("totalPage", totalPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("status", status);

        return "/admin/pages/gameContent/gameContentList";
    }

    /**
     * 跳转到编辑页面
     * @param type
     * @param model
     * @return
     */
    @RequestMapping(value="/edit/{type}/{id}", method=RequestMethod.GET)
    public String edit(@PathVariable String type, @PathVariable long id, Model model) {
        model.addAttribute("editType", type);
        if(type.equals("update")) {
            model.addAttribute("gameContent", service.getGameContentById(id));
        }
        model.addAttribute("gameList", gameService.getNewGames());
        return "/admin/pages/gameContent/gameContentEdit";
    }

    /*
     * 添加赛事内容
     */
    @RequestMapping(value="/addGameContent", method=RequestMethod.POST)
    public String addGameContent(HttpSession session, GameContent gameContent) {
        Admin admin = (Admin)session.getAttribute("admin");
        gameContent.setCreatId(admin.getId());
        gameContent.setCreateTime(new Timestamp(System.currentTimeMillis()));
        gameContent.setStatus(GameContent.GAME_CONTENT_USEABLE);
        gameContent.setCityId(admin.getCityId());
        service.insert(gameContent);
        return "redirect:/admin/gameContent/list";
    }

    /**
     * 修改赛事内容
     * @param gameContent
     * @return
     */
    @RequestMapping(value="/updateGameContent", method=RequestMethod.POST)
    public String updateGameContent(HttpSession session,GameContent gameContent) {
        GameContent instance = service.getGameContentById(gameContent.getGameId()) ;
        instance.setGameId(gameContent.getGameId());
        instance.setTitle(gameContent.getTitle());
        instance.setContent(gameContent.getContent());
        instance.setUpdateTime(new Timestamp(System.currentTimeMillis()));
        service.updateGameContent(instance);
        return "redirect:/admin/gameContent/list";
    }

    /**
     * 删除赛事内容
     * @param ids
     * @return
     */
    @RequestMapping("/deleteGameContent")
    public String delete(@RequestParam String ids,HttpSession session) {
        List<GameContent> list = service.getGameContentsByIds(ids);
        service.delete(ids);
        return "redirect:/admin/gameContent/list";
    }

    /**
     * 更改赛事内容状态
     * @param ids
     * @return
     */
    @RequestMapping("/changeStatus")
    public String changeStatus(@RequestParam String ids,HttpSession session) {
        GameContent gameContent = service.getGameContentById(Long.valueOf(ids).longValue());
       if(gameContent.getStatus() == GameContent.GAME_CONTENT_UNUSEABLE){
           gameContent.setStatus(GameContent.GAME_CONTENT_USEABLE);
       }else{
           gameContent.setStatus(GameContent.GAME_CONTENT_UNUSEABLE);
       }
        service.updateGameContent(gameContent);
        return "redirect:/admin/gameContent/list";
    }

    /**
     * 查看赛事内容内容
     * @param ids
     * @return
     */
    @RequestMapping("/view")
    public String view(@RequestParam String ids,HttpSession session, Model model) {
        GameContent gameContent = service.getGameContentById(Long.valueOf(ids).longValue());
        model.addAttribute("gameContent", gameContent);
        model.addAttribute("game", gameService.getGamesById(gameContent.getGameId()));
        return "/admin/pages/gameContent/gameContentView";
    }
}
