package com.j170502.cateringmange.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SettingController {
    @RequestMapping("setting/settinghome")
    public String settinghome(){
        return "setting/settinghome";
    }

}
