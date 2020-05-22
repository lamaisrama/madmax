package com.madmax.stool.project.controller;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.madmax.stool.project.model.service.SelectedProjectUpdateService;


@Controller
public class SelectedProjectUpdateController {

	@Autowired
	private Logger logger;
	
	@Autowired
	private SelectedProjectUpdateService service;
	
	
	
}
