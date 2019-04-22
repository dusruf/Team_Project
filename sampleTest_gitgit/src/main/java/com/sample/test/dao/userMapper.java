package com.sample.test.dao;

import com.sample.test.VO.HeadHunter;
import com.sample.test.VO.Login;
import com.sample.test.VO.Person;

public interface userMapper {

	Person selectPerson(String idCheck);

	int hhReg(HeadHunter hh);

	HeadHunter selectHeadHunter(String idCheck);

	int personReg(Person person);

	HeadHunter loginHH(Login login);

	Person loginPerson(Login login);

}
