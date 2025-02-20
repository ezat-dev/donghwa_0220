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
public class ProcessController {

    @RequestMapping(value = "/process/heaterPop", method = RequestMethod.GET)
    public String heaterPop(Model model) {
        return "/process/heaterPop.jsp";
    }

    @RequestMapping(value = "/process/powerConsumptionPop", method = RequestMethod.GET)
    public String powerConsumptionPop(Model model) {
        return "/process/powerConsumptionPop.jsp";
    }

    @RequestMapping(value = "/process/pressPop", method = RequestMethod.GET)
    public String pressPop(Model model) {
        return "/process/pressPop.jsp";
    }

    @RequestMapping(value = "/process/pressurePop", method = RequestMethod.GET)
    public String pressurePop(Model model) {
        return "/process/pressurePop.jsp";
    }

    @RequestMapping(value = "/process/pressureSwitchesPop", method = RequestMethod.GET)
    public String pressureSwitchesPop(Model model) {
        return "/process/pressureSwitchesPop.jsp";
    }
    
    
  //pressureSwitchesPop
    @RequestMapping(value= "/process/pressureSwitchesPop/view", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> pressureSwitchesPopView() throws UaException, InterruptedException, ExecutionException {
    	Map<String, Object> returnMap = new HashMap<String, Object>();

    	OpcDataMap opcDataMap = new OpcDataMap();
    	
    	returnMap = opcDataMap.getOpcDataListMap("DONGHWA.PROCESS_VALUES.PRESSURE_SWITCHES");
    	
    	return returnMap;    	
    }
    
    //heaterPop
    @RequestMapping(value= "/process/heaterPop/view", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> heaterPopView() throws UaException, InterruptedException, ExecutionException {
    	Map<String, Object> returnMap = new HashMap<String, Object>();
    	
    	OpcDataMap opcDataMap = new OpcDataMap();
    	
    	returnMap = opcDataMap.getOpcDataListMap("DONGHWA.PROCESS_VALUES.HEATER");
    	
    	return returnMap;    	
    }
    
    
    
    

    @RequestMapping(value = "/process/temperaturePop", method = RequestMethod.GET)
    public String temperaturePop(Model model) {
        return "/process/temperaturePop.jsp";
    }
    
    //TemperaturePOP
    @RequestMapping(value= "/process/temperaturePop/view", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> automaticProgramPop2() throws UaException, InterruptedException, ExecutionException {
    	Map<String, Object> returnMap = new HashMap<String, Object>();

    	OpcDataMap opcDataMap = new OpcDataMap();
    	
    	returnMap = opcDataMap.getOpcDataListMap("DONGHWA.PROCESS_VALUES.TEMPERATURE");
    	
    	return returnMap;    	
    }	
	
}
