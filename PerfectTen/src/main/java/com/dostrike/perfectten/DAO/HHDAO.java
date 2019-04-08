package com.dostrike.perfectten.DAO;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;

import javax.swing.plaf.synth.SynthSpinnerUI;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dostrike.perfectten.VO.ContactMessage;
import com.dostrike.perfectten.VO.Options;
import com.dostrike.perfectten.VO.Person;
import com.dostrike.perfectten.VO.PersonList;
import com.dostrike.perfectten.VO.Request;

@Repository
public class HHDAO {

	@Autowired
	SqlSession session;
	
	public int insertOptions(ArrayList<Options> oList) { //옵션 입력
		
		System.out.println(oList);
		hhMapper mapper=session.getMapper(hhMapper.class);
		int result=0;
		int check=0;
		
		try {
						
			for (int i = 0; i < oList.size(); i++) {
				result=mapper.insertOptions(oList.get(i));
				
				if (result==0) {
					check++;
				}
			}
			
			if (check>0) {
				return 0;
			} else {				
				return 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}

	public int insertRequest(Request request) {
		hhMapper mapper=session.getMapper(hhMapper.class);
		int requestSeq=0;
		
		try {
			mapper.insertRequest(request);
			requestSeq=request.getRequestSeq();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("DAO : "+requestSeq);
		return requestSeq;
	}

	public ArrayList<HashMap<String, Object>> selectOList(String loginId) {
		hhMapper mapper=session.getMapper(hhMapper.class);
		ArrayList<HashMap<String, Object>> result=new ArrayList<HashMap<String,Object>>();
		
		try {		
			result=mapper.selectOList(loginId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public ArrayList<Person> selectPList() {
		hhMapper mapper=session.getMapper(hhMapper.class);
		ArrayList<Person> pList = null;
		
		
		try {
			pList=mapper.selectPList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return pList;
	
	}

	public int pickPerson(PersonList personList) {

		hhMapper mapper=session.getMapper(hhMapper.class);
		int result=0;
		
		try {
		
			result=mapper.pickPerson(personList);
//			System.out.println("DAO pickPerson : "+result);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	public ArrayList<PersonList> pickList(String hhId) {
	
		hhMapper mapper=session.getMapper(hhMapper.class);
		ArrayList<PersonList> result=new ArrayList<PersonList>();
		
		try {
			
			result=mapper.pickList(hhId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	public int insertContactMessage(ContactMessage contactMessage) {

		hhMapper mapper=session.getMapper(hhMapper.class);
		int result=0;
		
		try {
			
			result=mapper.insertContactMessage(contactMessage);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	public int updateContactFlag(HashMap<String, String> contactFlagMap) {

		hhMapper mapper=session.getMapper(hhMapper.class);
		int finalResult=0;
		
		try {
			
			finalResult=mapper.updateContactFlag(contactFlagMap);
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
		return finalResult;		
	}

	public ArrayList<PersonList> selectContactedPerson(String hhId) {
		
		hhMapper mapper=session.getMapper(hhMapper.class);
		ArrayList<PersonList> cpList=new ArrayList<PersonList>();

		try {
			
			cpList=mapper.selectContactedPerson(hhId);
			System.out.println("DAO cpList : "+cpList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return cpList;
	}
	

}//class
