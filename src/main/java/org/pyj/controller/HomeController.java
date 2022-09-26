package org.pyj.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "index";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String boardWrite() {
		return "board/write";
	}
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	@RequestMapping(value="/member", method = RequestMethod.GET)
	public String createAccount() {
		return "member/member";
	}
}
