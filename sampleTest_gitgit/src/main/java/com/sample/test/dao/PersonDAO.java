package com.sample.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sample.test.VO.Chat;

@Repository
public class PersonDAO {

	@Autowired
	SqlSession session;
	
	public int selectChatSeq() {
		int chatSeq = 0;
		personMapper mapper = session.getMapper(personMapper.class);
		
		try {
			chatSeq = mapper.selectChatSeq();
		}catch(Exception e) {
			e.printStackTrace();
			return chatSeq;
		}
		
		return chatSeq;
	}
	
	public ArrayList<Chat> selectChat(HashMap<String, Object> parameter) {
		ArrayList<Chat> chatList = null;
		personMapper mapper = session.getMapper(personMapper.class);
		chatList = mapper.selectChat(parameter);
		return chatList;
	}
	
	public int insertChat(Chat chat) {		
		int result = 0;
		personMapper mapper = session.getMapper(personMapper.class);
		
		try {
			result = mapper.insertChat(chat);
			
		}catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
}//class
