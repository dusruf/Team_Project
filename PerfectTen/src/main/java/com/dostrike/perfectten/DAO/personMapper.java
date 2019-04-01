package com.dostrike.perfectten.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import com.dostrike.perfectten.VO.ContactMessage;

public interface personMapper {

	ArrayList<ContactMessage> showMessage(String loginId);

	ContactMessage cmDetail(int cmSeq);

	int goSecondStatus(HashMap<String, Object> changeStatus);

	int updateCmStatus(int cmSeq);

}
