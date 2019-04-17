package com.sample.test.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String insertTestDB(DiaryInfo diaryInfo, Model model) {
		
		int result = dao.insertDiary(diaryInfo);
		ArrayList<DiaryInfo> list = dao.selectAll();
		model.addAttribute("list", list);			
		return "diaryPage";
	}
	
	@RequestMapping(value="selectAll", method=RequestMethod.GET)
	public @ResponseBody ArrayList<DiaryInfo> selectAll(DiaryInfo diaryInfo) {
		ArrayList<DiaryInfo> list = dao.selectAll();
		return list;
	}
	
	@RequestMapping(value="deleteTestDB", method=RequestMethod.POST)
	public String deleteTestDB(String diaryseq) {
		dao.deleteDiary(diaryseq);
		return "diaryPage";
	}
	
	@RequestMapping(value="updateTestDB", method=RequestMethod.POST)
	public String updateTestDB(DiaryInfo diaryInfo) {
		int result = dao.updateDiary(diaryInfo);
		return "diaryPage";
	}
}
