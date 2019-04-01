package com.dostrike.perfectten.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dostrike.perfectten.VO.HeadHunter;
import com.dostrike.perfectten.VO.Login;
import com.dostrike.perfectten.VO.Person;

@Repository
public class UserDAO {

	@Autowired
	SqlSession session;
	
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
			System.out.println("dao");
			System.out.println(result);
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
