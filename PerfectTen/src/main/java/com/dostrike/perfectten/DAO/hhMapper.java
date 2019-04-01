package com.dostrike.perfectten.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.dostrike.perfectten.VO.ContactMessage;
import com.dostrike.perfectten.VO.Options;
import com.dostrike.perfectten.VO.Person;
import com.dostrike.perfectten.VO.PersonList;
import com.dostrike.perfectten.VO.QnaBoard;
import com.dostrike.perfectten.VO.Request;

public interface hhMapper {

	int insertRequest(Request request);

	int insertOptions(Options options);

	ArrayList<HashMap<String, Object>> selectOList(String loginId);

	ArrayList<Person> selectPList();

	int pickPerson(PersonList personList);

	ArrayList<PersonList> pickList(String hhId);

	int insertContactMessage(ContactMessage contactMessage);



}
