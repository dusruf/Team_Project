package com.sample.test.dao;

import java.util.ArrayList;

import com.sample.test.VO.resume.Ability;
import com.sample.test.VO.resume.Activity;
import com.sample.test.VO.resume.BasicInfo;
import com.sample.test.VO.resume.Career;
import com.sample.test.VO.resume.Certificate;
import com.sample.test.VO.resume.LanguageScore;

public interface resumeMapper {

	void insertBasicInfo(BasicInfo basicInfo);

	void insertResumeMain(BasicInfo basicInfo);

	int insertAbility(Ability ability);

	int insertActivity(Activity activity);

	int insertCertificate(Certificate certificate);

	int insertCareer(Career career);

	int insertLanguageScore(LanguageScore languageScore);

	int selectResumeSeq(String personId);

	BasicInfo selectBasicInfo(int resumeSeq);

	ArrayList<Ability> selectAbility(int resumeSeq);

	ArrayList<Activity> selectActivity(int resumeSeq);

	ArrayList<Certificate> selectCerti(int resumeSeq);

	ArrayList<LanguageScore> selectLanguage(int resumeSeq);

	ArrayList<Career> selectCareer(int resumeSeq);

	int deleteAbility(int resumeSeq);

	int deleteBasicInfo(int resumeSeq);

	int deleteActivity(int resumeSeq);

	int deleteCareer(int resumeSeq);

	int deleteCerti(int resumeSeq);

	int deleteEducation(int resumeSeq);

	int deleteLanguageScore(int resumeSeq);

	int deleteResumeMain(int resumeSeq);

}
