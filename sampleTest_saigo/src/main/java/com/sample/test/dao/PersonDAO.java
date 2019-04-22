package com.sample.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sample.test.VO.Chat;
import com.sample.test.VO.ContactMessage;

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

	public ArrayList<ContactMessage> showMessage(String personId) {

		personMapper mapper=session.getMapper(personMapper.class);
		ArrayList<ContactMessage> cmList=new ArrayList<ContactMessage>();
		
		try {
			
			cmList=mapper.showMessage(personId);
			
		} catch (Exception e) {
			
			e.printStackTrace();

		}
		
		return cmList;
		
	}

	public ContactMessage cmDetail(int cmSeq) {
		personMapper mapper=session.getMapper(personMapper.class);
		ContactMessage result=new ContactMessage();
		
		try {
			
			result=mapper.cmDetail(cmSeq);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public int goSecondStatus(HashMap<String, Object> changeStatus) {
		personMapper mapper=session.getMapper(personMapper.class);
		int result=0;
			
		try {
			
			result=mapper.goSecondStatus(changeStatus);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int changeCmAnswer(HashMap<String, Object> changeCmAnswer) {
		personMapper mapper=session.getMapper(personMapper.class);
		int result=0;
			
		try {
			
			result=mapper.changeCmAnswer(changeCmAnswer);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	

	public int updateCmStatus(int cmSeq) {
		personMapper mapper=session.getMapper(personMapper.class);
		int result=0;
	
		try {
			
			result=mapper.updateCmStatus(cmSeq);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		return result;
		
	}

	public int cmDelete(int cmSeq) {
		personMapper mapper=session.getMapper(personMapper.class);
		int result=0;
		
		try {
			
			result=mapper.cmDelete(cmSeq);
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
		
		return result;
	}


}//class
