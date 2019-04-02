package com.dostrike.perfectten.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dostrike.perfectten.VO.ContactMessage;

@Repository
public class PersonDAO {

	@Autowired
	SqlSession session;

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
	
	
	
	
	
}//class
