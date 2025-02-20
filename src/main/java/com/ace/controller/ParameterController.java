package com.ace.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import org.eclipse.milo.opcua.stack.core.UaException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.util.OpcDataMap;

@Controller
public class ParameterController {

    @RequestMapping(value = "/parameter/fastcoolingPop", method = RequestMethod.GET)
    public String fastCoolingPop(Model model) {
        return "/parameter/fastcoolingPop.jsp";
    }

    @RequestMapping(value = "/parameter/limitSwitchesPop", method = RequestMethod.GET)
    public String limitSwitchesPop(Model model) {
        return "/parameter/limitSwitchesPop.jsp";
    }
    
	
	

    @RequestMapping(value = "/parameter/timerPop", method = RequestMethod.GET)
    public String timerPop(Model model) {
        return "/parameter/timerPop.jsp";
    }
}
