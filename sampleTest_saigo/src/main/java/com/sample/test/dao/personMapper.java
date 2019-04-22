package com.sample.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.sample.test.VO.Chat;
import com.sample.test.VO.ContactMessage;

public interface personMapper {
	public int insertChat(Chat chat);

	public ArrayList<Chat> selectChat(HashMap<String, Object> parameter);

	public int selectChatSeq();

	public ArrayList<ContactMessage> showMessage(String personId);

	public ContactMessage cmDetail(int cmSeq);

	public int goSecondStatus(HashMap<String, Object> changeStatus);

	public int changeCmAnswer(HashMap<String, Object> changeCmAnswer);

	public int updateCmStatus(int cmSeq);

	public int cmDelete(int cmSeq);
}
