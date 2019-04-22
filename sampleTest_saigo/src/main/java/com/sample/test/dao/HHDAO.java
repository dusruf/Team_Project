package com.sample.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sample.test.dao.hhMapper;
import com.sample.test.VO.ContactMessage;
import com.sample.test.VO.Options;
import com.sample.test.VO.Person;
import com.sample.test.VO.PersonList;
import com.sample.test.VO.Request;

@Repository
public class HHDAO {

	@Autowired
	SqlSession session;
	
//	public Request selectRequest(String selPerson) {
//		Request result = null;
//		hhMapper mapper = session.getMapper(hhMapper.class);
//		
//		try {
//			result = mapper.selectRequest(selPerson);
//		}catch(Exception e) {
//			e.printStackTrace();
//			return result;
//		}
//		
//		return result;
//	}
	
	public int insertPersonList(PersonList personList) {
		int result = 0;
		hhMapper mapper = session.getMapper(hhMapper.class);
		
		try {
			System.out.println(personList);
			result = mapper.insertPersonList(personList);
		}catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		
		return result;
	}
	
	public ArrayList<Request> selectRequest(String hhId){
		ArrayList<Request> comList = null;
		hhMapper mapper = session.getMapper(hhMapper.class);
		
		try {
			
			comList = mapper.selectRequest(hhId);
		}catch(Exception e) {
			e.printStackTrace();
			return comList;
		}
		
		return comList;
	}
	
	public ArrayList<Person> search(HashMap<String, String> hashMap) {
		ArrayList<Person> result = null;
		hhMapper mapper=session.getMapper(hhMapper.class);
		
		try {
			result = mapper.search(hashMap);
		}catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		
		return result;
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
			System.out.println("DAO : "+contactFlagMap);
			
			finalResult=mapper.updateContactFlag(contactFlagMap);
			System.out.println("왜 업데이트 않되 : "+finalResult);
			//왜 안되냐면 아직 라디오에서 값을 못 불러와서 연결을 못했거든;
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		return finalResult;
	}

	public ArrayList<HashMap<String, Object>> selectOList(String loginId) {
		hhMapper mapper=session.getMapper(hhMapper.class);
		ArrayList<HashMap<String, Object>> result=null;
		
		try {		
			result=mapper.selectOList(loginId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int deletePersonList(HashMap<String, Object> deleteMap) {
		hhMapper mapper=session.getMapper(hhMapper.class);
		int result=0;
		
		try {
			
			result=mapper.deletePersonList(deleteMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public ArrayList<PersonList> selectContactedPerson(String hhId) {
		hhMapper mapper=session.getMapper(hhMapper.class);
		ArrayList<PersonList> cpList=null;
		
		try {
			
			cpList=mapper.selectContactedPerson(hhId);
			System.out.println("DAO cpList : "+cpList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cpList;
	}

	public int deleteOption(int requestSeq) {
		
		hhMapper mapper=session.getMapper(hhMapper.class);
		int result=0;
		int finalResult=0;

		try {
			
			result=mapper.deleteRequest(requestSeq);
			
			if (result==1) {

				finalResult=mapper.deleteOption(requestSeq);
				
			} else {
				finalResult=0;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("dao result : "+result);
		
		return finalResult;
		
	}

	public int updateMatchingStatus(HashMap<String, Object> umsMap) {
		hhMapper mapper=session.getMapper(hhMapper.class);
		int result=0;
		
		try {
			result=mapper.updateMatchingStatus(umsMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	public int delCP(HashMap<String, Object> delCpMap) {
		hhMapper mapper=session.getMapper(hhMapper.class);
		int result=0;

		try {
			result=mapper.delCP(delCpMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}



}//class
