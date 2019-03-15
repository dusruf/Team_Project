package com.dostrike.perfectten.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dostrike.perfectten.VO.QnaBoard;

@Repository
public class QnaDAO {

	@Autowired
	SqlSession session;
	
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

	public int inputQna(QnaBoard qna) {
		
		qnaMapper mapper=session.getMapper(qnaMapper.class);
		int result=0;
		
		try {
			
			result=mapper.inputQna(qna);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

}
