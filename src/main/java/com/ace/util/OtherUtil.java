package com.ace.util;

import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public class OtherUtil {

	public static HashMap<String, String> getJQGridParameter(HttpServletRequest req){
		HashMap<String, String> parameter = new HashMap<String, String>();
		Enumeration<String> parameterNames = req.getParameterNames();
		
		while(parameterNames.hasMoreElements()) {
			String key = (String)parameterNames.nextElement();
			String value = req.getParameter(key);
			parameter.put(key, value);
		}
		
		return parameter;
	}
	
}
