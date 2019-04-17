package com.sample.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PersonDAO {

	@Autowired
	SqlSession session;
	
}//class
