package com.ace.controller;

import com.ace.domain.Login;
import com.ace.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "/include/login.jsp"; 
    }

    @RequestMapping(value = "/login/check", method = RequestMethod.POST)
    @ResponseBody
    public String login(@RequestBody Login login) {
        // 넘어오는 login 객체 출력
        System.out.println("Received login request: " + login);
        System.out.println("Username: " + login.getUsername());  // 예시로 username 출력
        System.out.println("Password: " + login.getPassword());  // 예시로 password 출력
        
        Login result = loginService.loginCheck(login);
        
        if (result != null) {
            return "{\"message\": \"로그인 성공\"}"; 
        } else {
            return "{\"message\": \"아이디 또는 비밀번호가 잘못되었습니다.\"}";
        }
    }
}
