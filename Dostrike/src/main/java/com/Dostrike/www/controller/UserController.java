package com.Dostrike.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Dostrike.www.dao.UserDAO;
import com.Dostrike.www.vo.Login;

@Controller	
public class UserController {

	
	@Autowired
	UserDAO dao;
	
	@RequestMapping (value="/goReg", method=RequestMethod.GET)
	public String register() {
	
		return "register";
		
	}
	
	@RequestMapping (value="/login", method=RequestMethod.POST)
	public String login(Login login, Model model) {
		
		if (dao.loginPerson(login)!=null) {
			
			return "person/personMain";
			
		} else {

			if (dao.loginHH(login)!=null) {
				
				return "hh/hhMain";
				
			} else {

				if (dao.loginAdmin(login)!=null) {
				
					return "admin/adminMain";
					
				} else {

					int loginFlag=1;
					model.addAttribute("loginFlag",loginFlag);
					return "forward:/";
					
				}					
			}			
		}
	}//login method
	
	
	
	
}//class
