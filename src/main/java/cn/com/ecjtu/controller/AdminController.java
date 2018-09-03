package cn.com.ecjtu.controller;

import cn.com.ecjtu.pojo.Admin;
import cn.com.ecjtu.service.AdminService;
import cn.com.ecjtu.utils.Msg;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
    @Resource
    private AdminService adminService;

    @RequestMapping("/login")
    public String toLogin(){
        return "/admin/login";
    }

    @RequestMapping("/adminLogin")
    @ResponseBody
    public Msg checkAdminInfo(Admin admin, HttpServletRequest httpServletRequest){
        if(adminService.checkInfo(admin)){
            httpServletRequest.getSession().setAttribute("loginUser",admin);
            return Msg.success();
        }
        return Msg.fail();
    }
    @RequestMapping("/index07")
    public String toIndex(){
        return "/admin/index07";
    }

}
