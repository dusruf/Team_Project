package com.dostrike.perfectten.DAO;

import java.util.ArrayList;

import com.dostrike.perfectten.VO.Resume.Ability;
import com.dostrike.perfectten.VO.Resume.Activity;
import com.dostrike.perfectten.VO.Resume.BasicInfo;
import com.dostrike.perfectten.VO.Resume.Career;
import com.dostrike.perfectten.VO.Resume.Certificate;
import com.dostrike.perfectten.VO.Resume.LanguageScore;
import com.dostrike.perfectten.VO.Resume.TotalResume;

public interface resumeMapper {

	int insertBasicInfo(BasicInfo basicInfo);

	int insertAbility(Ability ability);

	void insertResumeMain(BasicInfo basicInfo);

	int insertActivity(Activity activity);

	int insertCertificate(Certificate certificate);

	int insertLanguageScore(LanguageScore languageScore);

	int insertCareer(Career career);

}
