package com.sample.test.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.test.VO.DiaryInfo;
import com.sample.test.dao.diaryDAO;



@Controller
public class diaryController {
	
	@Autowired
	diaryDAO dao;
	
	@RequestMapping(value = "/diaryPage", method = RequestMethod.GET)
	public String goDiaryPage() {
	
		return "diaryPage";
	}
	
	@RequestMapping(value="insertTestDB", method=RequestMethod.GET)
	public String insertTestDB(DiaryInfo diaryInfo, HttpSession session) {		
		int loginFlag = (Integer)session.getAttribute("loginFlag");
		
		if(loginFlag == 1) {
			diaryInfo.setUserid((String)session.getAttribute("hhId"));
		}else if(loginFlag == 2){
			diaryInfo.setUserid((String)session.getAttribute("personId"));
		}else {
			System.out.println("경고");
		}
				
		dao.insertDiary(diaryInfo);					
		return "diaryPage";
	}
	
	@RequestMapping(value="selectAll", method=RequestMethod.GET)
	public @ResponseBody ArrayList<DiaryInfo> selectAll(DiaryInfo diaryInfo, HttpSession session) {
		
		int loginFlag = (Integer)session.getAttribute("loginFlag");
		ArrayList<DiaryInfo> list = null;
		
		if(loginFlag == 1) {
			list = dao.selectAll((String)session.getAttribute("hhId"));
		}else if(loginFlag == 2){
			list = dao.selectAll((String)session.getAttribute("personId"));
		}else {
			System.out.println("경고");
		}
		return list;
	}
	
	@RequestMapping(value="deleteTestDB", method=RequestMethod.POST)
	public String deleteTestDB(String diaryseq) {		
		dao.deleteDiary(diaryseq);
		return "diaryPage";
	}
	
	@RequestMapping(value="updateTestDB", method=RequestMethod.POST)
	public String updateTestDB(DiaryInfo diaryInfo) {
		dao.updateDiary(diaryInfo);
		return "diaryPage";
	}
}
