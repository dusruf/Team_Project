package com.dostrike.perfectten.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dostrike.perfectten.VO.QnaComment;
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

	public ArrayList<HashMap<String, Object>> selectQna(int qBoardSeq) {

		qnaMapper mapper=session.getMapper(qnaMapper.class);
		ArrayList<HashMap<String, Object>> result=new ArrayList<HashMap<String,Object>>();
		
		try {
			result=mapper.selectQna(qBoardSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public ArrayList<QnaComment> selectComments(int qBoardSeq) {
		
		qnaMapper mapper=session.getMapper(qnaMapper.class);
		ArrayList<QnaComment> result=null;
		
		try {
			result=mapper.selectComments(qBoardSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return result;
	
	}

	public int insertComment(QnaComment comment) {
	
		qnaMapper mapper=session.getMapper(qnaMapper.class);
		int result=0;
		
		try {
			
			result=mapper.insertComment(comment);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

}//class
