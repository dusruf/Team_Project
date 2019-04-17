package com.sample.test.dao;

import java.util.List;

import com.sample.test.VO.QnaBoard;

public interface qnaMapper {

	List<QnaBoard> personQList(String personId);

	List<QnaBoard> qList();

}
