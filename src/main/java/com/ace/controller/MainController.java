package com.ace.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import org.eclipse.milo.opcua.sdk.client.OpcUaClient;
import org.eclipse.milo.opcua.stack.core.UaException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.util.OpcDataMap;

@Controller
public class MainController {
	
	public static OpcUaClient client = null;


    //OPC서버 연결시작
    public static void opcStart() throws UaException, InterruptedException, ExecutionException {
		client = OpcUaClient.create("opc.tcp://127.0.0.1:5660");
			
		client.connect().get();
    }
    
    //OPC서버 연결종료
    public static void opcEnd() throws InterruptedException, ExecutionException {
		client.disconnect().get();
    }	
    
    
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/home.jsp";
	}
	
	
	//Manual Operation
    @RequestMapping(value= "/common/valueDigitalSet", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> valueDigitalSet(
    		@RequestParam String sendTagDir,
    		@RequestParam String sendTagName,
    		@RequestParam boolean sendTagValue
    		) throws UaException, InterruptedException, ExecutionException {
    	Map<String, Object> returnMap = new HashMap<String, Object>();

    	//사용자 권한체크
    	
    	
    	OpcDataMap opcDataMap = new OpcDataMap();
    	
    	
    	opcDataMap.setOpcData(sendTagDir+"."+sendTagName, sendTagValue);
    	
    	return returnMap;    	
    }		
    
    //Manual Operation
    @RequestMapping(value= "/common/valueAnalogSet", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> valueAnalogSet(
    		@RequestParam String sendTagDir,
    		@RequestParam String sendTagName,
    		@RequestParam short sendTagValue
    		) throws UaException, InterruptedException, ExecutionException {
    	Map<String, Object> returnMap = new HashMap<String, Object>();
    	
    	OpcDataMap opcDataMap = new OpcDataMap();
    	//확인
    	System.out.println("sendTagDir : "+sendTagDir+"// sendTagName : "+sendTagName+"// sendTagValue : "+sendTagValue);
    	opcDataMap.setOpcData(sendTagDir+"."+sendTagName, sendTagValue);
    	
    	return returnMap;    	
    }		
	
    
    
	
	
}
