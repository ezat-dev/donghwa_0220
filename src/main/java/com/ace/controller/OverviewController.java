package com.ace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class OverviewController {
	
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String limitSwitchesPop(Model model) {
        return "/furnace/overview.jsp";
       
    }
    @RequestMapping(value = "/include/test", method = RequestMethod.GET)
    public String test(Model model) {
        return "/include/test.jsp";
       
    }
}
