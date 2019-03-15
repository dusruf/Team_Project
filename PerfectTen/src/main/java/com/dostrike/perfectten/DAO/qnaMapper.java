package com.dostrike.perfectten.DAO;

import java.util.List;

import com.dostrike.perfectten.VO.QnaBoard;

public interface qnaMapper {

	int inputQna(QnaBoard qna);

	List<QnaBoard> qList();

}
