package com.sample.test.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sample.test.VO.QnaBoard;
import com.sample.test.VO.QnaComment;
import com.sample.test.util.PageNavigator;

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

	public List<QnaBoard> qList(PageNavigator pn) {
		qnaMapper mapper=session.getMapper(qnaMapper.class);
		List<QnaBoard> result = null;
		
		RowBounds rb=new RowBounds(pn.getStartBoardCurrentPage(),pn.getBoardPerPage());
		
		try {
			
			result=mapper.qList(rb);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


	public int inputQna(QnaBoard qnaBoard) {
		qnaMapper mapper=session.getMapper(qnaMapper.class);
		int result=0;
		
		try {
			
			result=mapper.inputQna(qnaBoard);
			
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

	public QnaBoard selectQnaBoard(int qBoardSeq) {
		qnaMapper mapper=session.getMapper(qnaMapper.class);
		QnaBoard result= new QnaBoard();
		
		try {
			
			result=mapper.selectQnaBoard(qBoardSeq);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int inputUpdate(QnaBoard qnaBoard) {
		qnaMapper mapper=session.getMapper(qnaMapper.class);
		int result=0;

		HashMap<String, Object> udtMap = new HashMap<String, Object>();
		
		udtMap.put("qBoardSeq", qnaBoard.getqBoardSeq());
		udtMap.put("title", qnaBoard.getTitle());
		udtMap.put("contents", qnaBoard.getContents());
		
		System.out.println(udtMap);
		
		try {
			result=mapper.inputUpdate(udtMap);		
			System.out.println("dao result : "+result);
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	public int deleteBoard(int qBoardSeq) {
		qnaMapper mapper=session.getMapper(qnaMapper.class);
		int result=0;
		
		try {
			
			result=mapper.deleteBoard(qBoardSeq);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int insertComment(QnaComment comment) {
		
		qnaMapper mapper=session.getMapper(qnaMapper.class);
		int result=0;
		int finalResult=0;
		
		try {
			
			result=mapper.insertComment(comment);
			if(result==1) {				
				finalResult=mapper.updateCommentNum(comment.getqBoardSeq());
				finalResult=mapper.updateeCommentNumInComments(comment.getqBoardSeq());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return finalResult;
	}

	public int updateComment(QnaComment comment) {
	
		qnaMapper mapper=session.getMapper(qnaMapper.class);
		int result=0;
				
		try {	
			result=mapper.updateComment(comment);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	public int deleteComment(int commentSeq) {
		
		qnaMapper mapper=session.getMapper(qnaMapper.class);
		int result=0;
		
		try {
			result=mapper.deleteComment(commentSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return result;
		
	}

	public int deleteCommentNum(int qBoardSeq) {
		qnaMapper mapper=session.getMapper(qnaMapper.class);
		int result=0;
		
		try {
			result=mapper.deleteCommentNum(qBoardSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	public int countAllBoard() {
		
		qnaMapper mapper=session.getMapper(qnaMapper.class);	
		int totalBoard=0;
		
		try {
			totalBoard=mapper.countAllBoard();
			return totalBoard;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}





}//class
