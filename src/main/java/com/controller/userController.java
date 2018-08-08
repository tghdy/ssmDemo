package com.controller;

import com.model.user;
import com.service.IUserService;
import com.service.impl.UserServiceImpl;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("userController")
public class userController {

    @Resource
    private IUserService userService;

    @RequestMapping("select")
    public void selectUser(HttpServletRequest request, HttpServletResponse response)throws IOException{
        System.out.println("aaa");
        int id=Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        user u = userService.selectUser(id);
        System.out.println(u.toString());
    }

    @RequestMapping("userLogin")
    @ResponseBody
    public int userLogin(HttpServletRequest request, HttpServletResponse response)throws IOException{
        String name = request.getParameter("name");
        String psw = request.getParameter("psw");
        user u = new user();
        u.setName(name);
        u.setPassword(psw);
        int i = userService.userLogin(u);
        if(i==1){
            HttpSession session=request.getSession();
//            session.setAttribute("id",id);
            session.setAttribute("name",name);
//            String sessionId = session.getId();
//            System.out.println(sessionId);
//            System.out.println(session);
//            System.out.println(session.getAttribute("name"));
        }
        return i;
    }

    @RequestMapping("home")
    public String home(){
        return "home";
    }

    @RequestMapping("quit")
    public String quit(HttpServletRequest request, HttpServletResponse response)throws IOException{
        System.out.println("is hear");
        request.getSession().invalidate();
        return "home";
//        ActionContext ac = ActionContext.getContext();
//        session.removeAttribute("name");
//        ServletActionContext.getRequest().getSession().invalidate();
//        session.invalidate()
    }
}
