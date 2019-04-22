package com.sample.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.sample.test.VO.Chat;

public interface personMapper {
	public int insertChat(Chat chat);
	public ArrayList<Chat> selectChat(HashMap<String, Object> parameter);
	public int selectChatSeq();
}
