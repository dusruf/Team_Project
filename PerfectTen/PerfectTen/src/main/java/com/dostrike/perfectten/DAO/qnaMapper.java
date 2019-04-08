package com.dostrike.perfectten.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.dostrike.perfectten.VO.QnaComment;
import com.dostrike.perfectten.VO.QnaBoard;

public interface qnaMapper {

	int inputQna(QnaBoard qna);

	List<QnaBoard> qList();

	ArrayList<HashMap<String, Object>> selectQna(int qBoardSeq);

	ArrayList<QnaComment> selectComments(int qBoardSeq);

	int insertComment(QnaComment comment);

}
