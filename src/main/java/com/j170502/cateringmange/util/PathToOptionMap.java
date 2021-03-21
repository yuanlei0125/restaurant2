package com.j170502.cateringmange.util;

import java.util.HashMap;

public class PathToOptionMap {
   public  final  static HashMap<String,String> PATH_OPTION =new HashMap<String, String>();
    static{
        PATH_OPTION.put("/cateringmange/login","用户登录");
        PATH_OPTION.put("/cateringmange/first","查看首页");
        PATH_OPTION.put("/cateringmange/setting/settinghome","打开设置");
        PATH_OPTION.put("/cateringmange/exit","用户退出");
    }
}
