package com.madmax.stool.project.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.project.model.service.SelectedProjectUpdateService;


@Controller
public class SelectedProjectUpdateController {

	@Autowired
	private Logger logger;
	
	@Autowired
	private SelectedProjectUpdateService service;
	
	@RequestMapping("/selectedProject/deleteFavorite.do")
	@ResponseBody
	public int deleteFavorite(@RequestParam Map<String, String> map) {		
		//값 받기
		int flag = Integer.parseInt(map.get("flag"));
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String loginId = map.get("loginId");
		
		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("pjNo",pjNo);
		pjInfo.put("loginId",loginId);
		
		int result = 0;
		if(flag > 0) {
			result = service.deleteFavorite(pjInfo);
		}
		
		return result;
	}
	
	@RequestMapping("/selectedProject/insertFavorite.do")
	@ResponseBody
	public int insertFavorite(@RequestParam Map<String, String> map) {		
		//값 받기
		int flag = Integer.parseInt(map.get("flag"));
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String loginId = map.get("loginId");
		
		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("pjNo",pjNo);
		pjInfo.put("loginId",loginId);
		
		int result = 0;
		if(flag == 0) {
			result = service.insertFavorite(pjInfo);
		}
		
		return result;
	}
	
	@RequestMapping("/selectedProject/updateProjectColor.do")
	@ResponseBody
	public int updateProjectColor(@RequestParam Map<String, String> map) {		
		//값 받기
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String color = map.get("color");
		
		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("pjNo",pjNo);
		pjInfo.put("color",color);
		
		int result = 0;
		result = service.updateProjectColor(pjInfo);
		
		return result;
	}
}
