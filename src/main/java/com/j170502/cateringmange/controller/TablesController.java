package com.j170502.cateringmange.controller;

import com.j170502.cateringmange.entity.Place;
import com.j170502.cateringmange.entity.State;
import com.j170502.cateringmange.entity.Tables;
import com.j170502.cateringmange.service.PlaceService;
import com.j170502.cateringmange.service.StateService;
import com.j170502.cateringmange.service.TablesService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class TablesController {
    @Resource
    private TablesService tablesService;
    @Resource
    private PlaceService placeService;
    @Resource
    private StateService stateService;
    @RequestMapping("/first")
    public String showtables(Model model,String optionMsg){
       List<Tables> listTables=tablesService.findAll();
       List<Place> listPlace=placeService.findAll();
       List<State> listState=stateService.findAll();
       model.addAttribute("listTables",listTables);
       model.addAttribute("listPlace",listPlace);
       model.addAttribute("listState",listState);
       model.addAttribute("optionMsg",optionMsg);
       return "home";
    }
    @RequestMapping("/findTables")
    @ResponseBody
    public List<Tables> findTables(int place,int state){
        return tablesService.findTables(place,state);
    }
    @RequestMapping("/tables/all/list")
    public String list(Model model){
        List<Tables> listTables=tablesService.findAll();
        model.addAttribute("listTables",listTables);
        return "setting/tables/all/list";
    }
    @RequestMapping("/tables/all/preAdd")
    public String preAdd(Model model){
        Tables tables=new Tables();
        model.addAttribute("tables",tables);
        List<Place> listPlace=placeService.findAll();
        List<State> listState=stateService.findAll();
        model.addAttribute("listPlace",listPlace);
        model.addAttribute("listState",listState);
        return "setting/tables/all/add";
    }
    @RequestMapping("/tables/all/add")
    public String add(Tables tables){
        tablesService.save(tables);
        return "redirect:/tables/all/list";
    }
    @RequestMapping("/tables/all/preUpdate/{tableId}")
    public String preUpdate(@PathVariable("tableId") Integer tableId,Model model){
        Tables tables=tablesService.findById(tableId);
        List<Place> listPlace=placeService.findAll();
        List<State> listState=stateService.findAll();
        model.addAttribute("tables",tables);
        model.addAttribute("listPlace",listPlace);
        model.addAttribute("listState",listState);
        return "setting/tables/all/update";
    }
    @RequestMapping("/tables/all/update")
    public String update(Tables tables){
        tablesService.update(tables);
        return "redirect:/tables/all/list";
    }
    @RequestMapping("/tables/all/delete/{tableId}")
    public String delete(@PathVariable("tableId") Integer tableId){
        tablesService.delete(tableId);
        return "redirect:/tables/all/list";
    }
    @RequestMapping("/tables/box/delete/{tableId}")
    public String deleteBox(@PathVariable("tableId") Integer tableId){
        tablesService.delete(tableId);
        return "redirect:/tables/box/list";
    }
    @RequestMapping("/tables/hall/delete/{tableId}")
    public String deleteHall(@PathVariable("tableId") Integer tableId){
        tablesService.delete(tableId);
        return "redirect:/tables/hall/list";
    }
    @RequestMapping("/tables/box/list")
    public String listBox(Model model){
        List<Tables> listBox=tablesService.findAllBox();
        model.addAttribute("listBox",listBox);
        return "setting/tables/box/list";
    }
    @RequestMapping("/tables/hall/list")
    public String listHall(Model model){
        List<Tables> listHall=tablesService.findAllHall();
        model.addAttribute("listHall",listHall);
        return "setting/tables/hall/list";
    }

    @RequestMapping("/tables/box/preAdd")
    public String preAddBox(Model model){
        Tables tables=new Tables();
        model.addAttribute("tables",tables);
        List<Place> listPlace=placeService.findAll();
        List<State> listState=stateService.findAll();
        model.addAttribute("listPlace",listPlace);
        model.addAttribute("listState",listState);
        return "setting/tables/box/add";
    }

    @RequestMapping("/tables/hall/preAdd")
    public String preAddHall(Model model){
        Tables tables=new Tables();
        model.addAttribute("tables",tables);
        List<Place> listPlace=placeService.findAll();
        List<State> listState=stateService.findAll();
        model.addAttribute("listPlace",listPlace);
        model.addAttribute("listState",listState);
        return "setting/tables/hall/add";
    }
    @RequestMapping("/tables/hall/add")
    public String addHall(Tables tables){
        tablesService.save(tables);
        return "redirect:/tables/hall/list";
    }
    @RequestMapping("/tables/box/add")
    public String addBox(Tables tables){
        tablesService.save(tables);
        return "redirect:/tables/box/list";
    }
    @RequestMapping("/tables/box/preUpdate/{tableId}")
    public String preUpdateBox(@PathVariable("tableId") Integer tableId,Model model){
        Tables tables=tablesService.findById(tableId);
        List<Place> listPlace=placeService.findAll();
        List<State> listState=stateService.findAll();
        model.addAttribute("tables",tables);
        model.addAttribute("listPlace",listPlace);
        model.addAttribute("listState",listState);
        return "setting/tables/box/update";
    }
    @RequestMapping("/tables/box/update")
    public String updateBox(Tables tables){
        tablesService.update(tables);
        return "redirect:/tables/box/list";
    }
    @RequestMapping("/tables/hall/preUpdate/{tableId}")
    public String preUpdateHall(@PathVariable("tableId") Integer tableId, Model model){
        Tables tables=tablesService.findById(tableId);
        List<Place> listPlace=placeService.findAll();
        List<State> listState=stateService.findAll();
        model.addAttribute("tables",tables);
        model.addAttribute("listPlace",listPlace);
        model.addAttribute("listState",listState);
        return "setting/tables/hall/update";
    }
    @RequestMapping("/tables/hall/update")
    public String updateHall(Tables tables){
        tablesService.update(tables);
        return "redirect:/tables/hall/list";
    }

}
