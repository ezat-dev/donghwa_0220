package com.ace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FurnaceSaveController {



    // 세션에 데이터 저장
    @RequestMapping(value = "/furnace/saveSessionData", method = RequestMethod.POST)
    @ResponseBody
    public String saveSessionData(@RequestBody Map<String, Object> requestData, HttpSession session) {
        List<Map<String, Object>> data = (List<Map<String, Object>>) requestData.get("data");
        List<Map<String, Object>> dataString = (List<Map<String, Object>>) requestData.get("dataString");
        List<Map<String, Object>> dataNumber = (List<Map<String, Object>>) requestData.get("dataNumber");

        // 세션에 데이터 저장
        session.setAttribute("plcData", data);
        session.setAttribute("plcDataString", dataString);
        session.setAttribute("plcDataNumber", dataNumber);
        return "Session data saved";
    }

    // 세션 데이터 가져오기
    @RequestMapping("/furnace/getSessionData")
    @ResponseBody
    public Map<String, Object> getSessionData(HttpSession session) {
        Map<String, Object> sessionData = new HashMap<>();

        // 세션에서 데이터 가져오기
        List<Map<String, Object>> data = (List<Map<String, Object>>) session.getAttribute("plcData");
        List<Map<String, Object>> dataString = (List<Map<String, Object>>) session.getAttribute("plcDataString");
        List<Map<String, Object>> dataNumber = (List<Map<String, Object>>) session.getAttribute("plcDataNumber");
        // 세션 데이터가 존재하면 추가
        if (data != null) {
            sessionData.put("data", data);
        }
        if (dataString != null) {
            sessionData.put("dataString", dataString);
        }
        if (dataNumber != null) {
            sessionData.put("dataNumber", dataNumber);
        }

        return sessionData;
    }

    // 세션 데이터 가져와서 페이지로 이동
    @RequestMapping(value = "/furnace/saveToRecipe", method = RequestMethod.GET)
    public String saveToRecipePage(Map<String, Object> model, HttpSession session) {
        model.put("plcData", session.getAttribute("plcData"));
        model.put("plcDataString", session.getAttribute("plcDataString"));
        model.put("plcDataNumber", session.getAttribute("plcDataNumber"));

        return "/furnace/saveToRecipe.jsp";
    }
}
