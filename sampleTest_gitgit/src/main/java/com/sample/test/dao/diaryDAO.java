package com.sample.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sample.test.VO.DiaryInfo;

@Repository
public class diaryDAO {
	
	@Autowired
	SqlSession session;
	
	public int insertDiary(DiaryInfo diaryInfo) {
		//System.out.println(diaryInfo);
		int result = 0;
		diaryMapper mapper = session.getMapper(diaryMapper.class);
		
		try {
			result = mapper.insertDiary(diaryInfo);
		}catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		
		return result;
	}
	
	public ArrayList<DiaryInfo> selectAll(String userid) {
		ArrayList<DiaryInfo> result = null;
		diaryMapper mapper = session.getMapper(diaryMapper.class);
		
		try {
			result = mapper.selectAll(userid);			
		}catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		
		return result;
	}
	
	public int deleteDiary(String diaryseq) {
		int result = 0;
		diaryMapper mapper = session.getMapper(diaryMapper.class);
		
		try {
			result = mapper.deleteDiary(diaryseq);
		}catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		
		return result;
	}
	
	public int updateDiary(DiaryInfo diaryInfo) {
		int result = 0;
		diaryMapper mapper = session.getMapper(diaryMapper.class);
		
		try {
			result = mapper.updateDiary(diaryInfo);
		}catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		
		return result;
	}
	
}
