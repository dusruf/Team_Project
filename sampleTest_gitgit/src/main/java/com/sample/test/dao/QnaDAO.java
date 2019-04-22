package com.sample.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sample.test.VO.QnaBoard;

@Repository
public class QnaDAO {

	@Autowired
	SqlSession session;
	
	public List<QnaBoard> personQList(String personId) {
		qnaMapper mapper=session.getMapper(qnaMapper.class);
		List<QnaBoard> result = null;
		
		try {
			
			result=mapper.personQList(personId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public List<QnaBoard> qList() {
		qnaMapper mapper=session.getMapper(qnaMapper.class);
		List<QnaBoard> result = null;
		
		try {
			
			result=mapper.qList();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}





}//class
