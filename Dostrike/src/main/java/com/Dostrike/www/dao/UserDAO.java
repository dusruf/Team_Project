package com.Dostrike.www.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Dostrike.www.vo.Login;

@Repository
public class UserDAO {

	@Autowired
	SqlSession session;
	
	public Login loginPerson(Login login) {
		
		Login result=null;
		userMapper mapper=session.getMapper(userMapper.class);
		
		return result;
	}

	public Login loginHH(Login login) {

		Login result=null;
		userMapper mapper=session.getMapper(userMapper.class);
		
		
		return result;
	}

	public Login loginAdmin(Login login) {
		
		Login result=null;
		userMapper mapper=session.getMapper(userMapper.class);
		
		
		return result;
	}
	

}//class
