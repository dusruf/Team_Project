package com.sample.test.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.test.VO.QnaBoard;
import com.sample.test.VO.QnaComment;
import com.sample.test.dao.QnaDAO;
import com.sample.test.util.PageNavigator;


@Controller
public class QnaController {

	@Autowired
	QnaDAO dao;
	
	private static final int boardPerPage=10;
	private static final int pagePerGroup=5;
	
	@RequestMapping(value = "/personQList", method = RequestMethod.GET)
	public @ResponseBody List<QnaBoard> personQList(HttpSession session) { //글을 불러오는 메서드

		int loginFlag=(Integer)session.getAttribute("loginFlag");
		List<QnaBoard> qList=null;		
		
		
		if (loginFlag==2) {
			
			String personId=(String)session.getAttribute("personId");
//			System.out.println("QnaController personId : "+personId);
			qList=dao.personQList(personId);
//			System.out.println("QnaController qList : "+qList);
			
			
			
		}
		
		return qList;
	}

	@RequestMapping(value = "/hhQList", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> hhQList(HttpSession session, @RequestParam(defaultValue="1") int currentPage) { //글을 불러오는 메서드

		int loginFlag=(Integer)session.getAttribute("loginFlag");
		List<QnaBoard> qList=null;		
		
		HashMap<String, Object> qMap=new HashMap<String, Object>();
		
		if (loginFlag==2) {
			
			String personId=(String)session.getAttribute("personId");
		//	System.out.println("QnaController personId : "+personId);
			qList=dao.personQList(personId);
		//	System.out.println("QnaController qList : "+qList);
			
		} else if(loginFlag==1) {

			int totalBoard=dao.countAllBoard();
			System.out.println("totalBoard : "+totalBoard);

			PageNavigator pn=new PageNavigator(boardPerPage, pagePerGroup, currentPage, totalBoard);
			System.out.println("PageNavigator : "+pn);
	
			qList=dao.qList(pn);
			
			qMap.put("qList", qList);
			qMap.put("pn",pn);	
			
		//	System.out.println(qList);
		}
		
		return qMap;
	}
	
	
	@RequestMapping(value = "/writeQna", method = RequestMethod.GET)
	public String goWriteQna(){
		
		return "QNA/writeQna";
		
	}
	
	@RequestMapping(value = "/rePersonMain", method = RequestMethod.GET)
	public String rePersonMain(){
		
		System.out.println("코코마데");
		
		return "person/personMain";
	}
	
	
	@RequestMapping(value = "/inputQna", method = RequestMethod.POST)
	public String writeQna(QnaBoard qnaBoard, HttpSession session){
		
		int result=0;
		
		String personId=(String)session.getAttribute("personId");
		qnaBoard.setPersonId(personId);
		
	//	System.out.println(qnaBoard);
		
		result=dao.inputQna(qnaBoard);
		
		System.out.println("게시판 등록 성공 유무 : "+result);
		
		return "redirect:/rePersonMain";
		
	}
	
	@RequestMapping(value = "/readBoard", method = RequestMethod.GET)
	public @ResponseBody ArrayList<HashMap<String, Object>> readBoard(int qBoardSeq) { //게시글과 댓글을 같이 불러오는 ajax
			
		ArrayList<HashMap<String, Object>> qna=dao.selectQna(qBoardSeq);
	//	System.out.println(qna);
			
		return qna;
			
	}		
	
	@RequestMapping(value="/iwannagetBoard", method=RequestMethod.GET)
	public @ResponseBody QnaBoard iwannagetBoard(int qBoardSeq) { 
		
		System.out.println("코코마데");
		
		QnaBoard qnaBoard=null;

		qnaBoard=dao.selectQnaBoard(qBoardSeq);
		System.out.println("아 피곤해 : "+qnaBoard);

		
		return qnaBoard;

	}
	
	@RequestMapping(value="/inputUpdate", method=RequestMethod.POST)
	public @ResponseBody int inputUpdate(QnaBoard qnaBoard) { 
	
		System.out.println("수정된 글 : "+qnaBoard);
		int result=0;
		
		result=dao.inputUpdate(qnaBoard);
		
		return result;
		
	}

	@RequestMapping(value="/deleteBoard", method=RequestMethod.POST)
	public @ResponseBody int deleteBoard(int qBoardSeq) { 

		int result=0;
		
		result=dao.deleteBoard(qBoardSeq);
		
		return result;

	}
	
	@RequestMapping(value = "/insertComment", method = RequestMethod.POST)
	public @ResponseBody int insertComment(QnaComment comment, HttpSession session) { //댓글 등록  ajax
	
		String hhId=(String)session.getAttribute("hhId");
		String hhName=(String)session.getAttribute("hhName");
				
		comment.setHhId(hhId);
		comment.setHhName(hhName);
		
		int result=0;
		result=dao.insertComment(comment);
		
		return result;
	}
	
	@RequestMapping(value = "/updateComment", method = RequestMethod.POST)
	public @ResponseBody int updateComment(QnaComment comment, HttpSession session) { //댓글 등록  ajax
	
		int result=0;
	//	int qBoardSeq=comment.getqBoardSeq();
		
		System.out.println("updateComment : "+comment);
		
		result=dao.updateComment(comment);
		
		return result;
	}
	
	@RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
	public @ResponseBody int deleteComment(int commentSeq, int qBoardSeq) { //댓글 등록  ajax
		
		int result=0;
	
		result=dao.deleteComment(commentSeq);
		result=dao.deleteCommentNum(qBoardSeq);
		
		return result;
	}

	
}//class
