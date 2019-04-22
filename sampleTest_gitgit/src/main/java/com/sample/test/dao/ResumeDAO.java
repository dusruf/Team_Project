package com.sample.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sample.test.dao.resumeMapper;
import com.sample.test.VO.resume.Ability;
import com.sample.test.VO.resume.Activity;
import com.sample.test.VO.resume.BasicInfo;
import com.sample.test.VO.resume.Career;
import com.sample.test.VO.resume.Certificate;
import com.sample.test.VO.resume.Education;
import com.sample.test.VO.resume.LanguageScore;
import com.sample.test.VO.resume.TotalResume;

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

	public int selectResumeSeq(String personId) {
		resumeMapper mapper=session.getMapper(resumeMapper.class);
		int resumeSeq=0;

		try {
			
			resumeSeq=mapper.selectResumeSeq(personId);
			
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
			ArrayList<Education> educationList=new ArrayList<Education>();
			
			basicInfo=mapper.selectBasicInfo(resumeSeq);
			
			educationList=mapper.selectEducation(resumeSeq);
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
			
			totalResume.setEducationList(educationList);
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

	public int deleteResume(int resumeSeq) {
		resumeMapper mapper=session.getMapper(resumeMapper.class);	
		int result=0;
		
		try {

			result=mapper.deleteResumeMain(resumeSeq);
			System.out.println("삭제 dao resumeMain : "+result);
			
			result=mapper.deleteBasicInfo(resumeSeq);
			System.out.println("삭제 dao basicInfo : "+result);
			
			result=mapper.deleteAbility(resumeSeq);
			System.out.println("삭제 dao ability : "+result);
			
			result=mapper.deleteActivity(resumeSeq);
			System.out.println("삭제 dao activity : "+result);

			result=mapper.deleteCareer(resumeSeq);
			System.out.println("삭제 dao career : "+result);

			result=mapper.deleteCerti(resumeSeq);
			System.out.println("삭제 dao certi : "+result);

			result=mapper.deleteEducation(resumeSeq);
			System.out.println("삭제 dao education : "+result);

			result=mapper.deleteLanguageScore(resumeSeq);
			System.out.println("삭제 dao languageScore : "+result);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	
	}

	public int insertEducation(Education education) {
		resumeMapper mapper=session.getMapper(resumeMapper.class);
		int result=0;
		
		try {
			result=mapper.insertEducation(education);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}//class
