package com.sample.test.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.sample.test.VO.QnaBoard;
import com.sample.test.VO.QnaComment;

public interface qnaMapper {

	List<QnaBoard> personQList(String personId);

	List<QnaBoard> qList(RowBounds rb);

	int inputQna(QnaBoard qnaBoard);

	ArrayList<HashMap<String, Object>> selectQna(int qBoardSeq);

	QnaBoard selectQnaBoard(int qBoardSeq);

	int inputUpdate(HashMap<String, Object> udtMap);

	int deleteBoard(int qBoardSeq);

	int insertComment(QnaComment comment);

	int updateCommentNum(int getqBoardSeq);

	int updateComment(QnaComment comment);

	int deleteComment(int qBoardSeq);

	int updateeCommentNumInComments(int getqBoardSeq);

	int deleteCommentNum(int qBoardSeq);

	int countAllBoard();


}
