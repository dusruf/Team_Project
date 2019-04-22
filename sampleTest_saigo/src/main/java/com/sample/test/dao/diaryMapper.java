package com.sample.test.dao;

import java.util.ArrayList;

import com.sample.test.VO.DiaryInfo;


public interface diaryMapper {
	public int insertDiary(DiaryInfo diaryInfo)throws Exception;
	public ArrayList<DiaryInfo> selectAll(String userid)throws Exception;
	public int deleteDiary(String diaryseq) throws Exception;
	public int updateDiary(DiaryInfo diaryInfo) throws Exception;
}
