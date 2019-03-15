package com.dostrike.perfectten.DAO;

import com.dostrike.perfectten.VO.HeadHunter;
import com.dostrike.perfectten.VO.Login;
import com.dostrike.perfectten.VO.Person;

public interface userMapper {

	int hhReg(HeadHunter hh);

	int personReg(Person person);

	HeadHunter loginHH(Login login);

	Person loginPerson(Login login);

}
