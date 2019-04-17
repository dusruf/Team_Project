package com.sample.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.sample.test.VO.ContactMessage;
import com.sample.test.VO.Options;
import com.sample.test.VO.PersonList;
import com.sample.test.VO.Request;

public interface hhMapper {

	void insertRequest(Request request);

	int insertOptions(Options options);

	ArrayList<PersonList> pickList(String hhId);

	int insertContactMessage(ContactMessage contactMessage);

	int updateContactFlag(HashMap<String, String> contactFlagMap);

	ArrayList<HashMap<String, Object>> selectOList(String loginId);

	int deletePersonList(HashMap<String, Object> deleteMap);

	ArrayList<PersonList> selectContactedPerson(String hhId);

	int deleteOption(int resumeSeq);

	int deletePersonList(int requestSeq);

	int deleteRequest(int requestSeq);

}
