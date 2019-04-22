package com.sample.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sample.test.dao.userMapper;
import com.sample.test.VO.HeadHunter;
import com.sample.test.VO.Login;
import com.sample.test.VO.Person;

@Repository
public class UserDAO {

	@Autowired
	SqlSession session;
	
	public Person selectPerson(String idCheck) {
		Person result = null;
		userMapper mapper = session.getMapper(userMapper.class);
		
		try{
			result = mapper.selectPerson(idCheck);
		}catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		
		return result;
	}

	public HeadHunter selectHeadHunter(String idCheck) {
		HeadHunter result = null;
		userMapper mapper = session.getMapper(userMapper.class);
		
		try {
			result = mapper.selectHeadHunter(idCheck);
		}catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		
		return result;
	}

	public int hhReg(HeadHunter hh) {

		userMapper mapper=session.getMapper(userMapper.class);
		int result=0;
		
		try {
			result=mapper.hhReg(hh);
			return result;
		} catch (Exception e) {
			
			e.printStackTrace();
			return 0;
		}
	}

	public int personReg(Person person) {
		userMapper mapper=session.getMapper(userMapper.class);
		int result=0;
		
		try {
			result=mapper.personReg(person);
			return result;
		} catch (Exception e) {
			
			e.printStackTrace();
			return 0;
		}
	}

	public HeadHunter loginHH(Login login) {
		userMapper mapper=session.getMapper(userMapper.class);
		HeadHunter result;

		try {
			
			result=mapper.loginHH(login);
			return result;
		
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Person loginPerson(Login login) {
		userMapper mapper=session.getMapper(userMapper.class);
		Person result;

		try {
			
			result=mapper.loginPerson(login);
			return result;
		
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}//class
