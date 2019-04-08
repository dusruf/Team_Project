package com.dostrike.perfectten.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dostrike.perfectten.VO.Resume.Ability;
import com.dostrike.perfectten.VO.Resume.Activity;
import com.dostrike.perfectten.VO.Resume.BasicInfo;
import com.dostrike.perfectten.VO.Resume.Career;
import com.dostrike.perfectten.VO.Resume.Certificate;
import com.dostrike.perfectten.VO.Resume.LanguageScore;
import com.dostrike.perfectten.VO.Resume.TotalResume;

@Repository
public class ResumeDAO {

	@Autowired
	SqlSession session;

	public int insertBasicInfo(BasicInfo basicInfo) {
		
		resumeMapper mapper=session.getMapper(resumeMapper.class);
		int resumeSeq=0;
	
		try {
					
			mapper.insertBasicInfo(basicInfo);
			resumeSeq=basicInfo.getResumeSeq();
						
			mapper.insertResumeMain(basicInfo);
			
			return resumeSeq;
			
		} catch (Exception e) {
		
			e.printStackTrace();
			return 0;
			
		}
		
	}

	public int insertAbility(Ability ability) {

		resumeMapper mapper=session.getMapper(resumeMapper.class);
		int result=0;
		
		try {
			result=mapper.insertAbility(ability);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;

	}

	public int insertActivity(Activity activity) {
		resumeMapper mapper=session.getMapper(resumeMapper.class);
		int result=0;
		
		try {
			result=mapper.insertActivity(activity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int insertCertificate(Certificate certificate) {
		resumeMapper mapper=session.getMapper(resumeMapper.class);
		int result=0;
	
		try {
			result=mapper.insertCertificate(certificate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int insertLanguageScore(LanguageScore languageScore) {
		resumeMapper mapper=session.getMapper(resumeMapper.class);
		int result=0;

		try {
			result=mapper.insertLanguageScore(languageScore);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	
	}

	public int insertCareer(Career career) {
		resumeMapper mapper=session.getMapper(resumeMapper.class);
		int result=0;

		try {
			result=mapper.insertCareer(career);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	
	}

	public int selectResumeSeq(String loginId) {
		resumeMapper mapper=session.getMapper(resumeMapper.class);
		int resumeSeq=0;

		try {
			
			resumeSeq=mapper.selectResumeSeq(loginId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resumeSeq;
	}

	public TotalResume selectTotalResume(int resumeSeq) {
		resumeMapper mapper=session.getMapper(resumeMapper.class);

		TotalResume totalResume = new TotalResume();
		
		try {
			
			BasicInfo basicInfo = new BasicInfo();
			ArrayList<Ability> abilityList =new ArrayList<Ability>();
			ArrayList<Activity> activityList =new ArrayList<Activity>();
			ArrayList<Certificate> certiList =new ArrayList<Certificate>();
			ArrayList<LanguageScore> languageList =new ArrayList<LanguageScore>();
			ArrayList<Career> careerList =new ArrayList<Career>();
			
			basicInfo=mapper.selectBasicInfo(resumeSeq);

			
			abilityList=mapper.selectAbility(resumeSeq);
			activityList=mapper.selectActivity(resumeSeq);
			certiList=mapper.selectCerti(resumeSeq);
			languageList=mapper.selectLanguage(resumeSeq);
			careerList=mapper.selectCareer(resumeSeq);
			
		
			totalResume.setResumeSeq(resumeSeq);
			totalResume.setPersonId(basicInfo.getPersonId());
			
			totalResume.setBasicSeq(basicInfo.getBasicSeq());
			totalResume.setPersonName(basicInfo.getPersonName());
			totalResume.setBirthDate(basicInfo.getBirthDate());
			totalResume.setGender(basicInfo.getGender());
			totalResume.setPersonEmail(basicInfo.getPersonEmail());
			totalResume.setPersonPhone(basicInfo.getPersonPhone());
			totalResume.setPersonAddr(basicInfo.getPersonAddr());
			
			totalResume.setAbilityList(abilityList);
			totalResume.setActivityList(activityList);
			totalResume.setCertificateList(certiList);
			totalResume.setLanguageScoreList(languageList);
			totalResume.setCareerList(careerList);		
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return totalResume;
	}
	
}//class
