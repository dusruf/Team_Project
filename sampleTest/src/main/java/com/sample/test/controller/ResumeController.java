package com.sample.test.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sample.test.VO.resume.Ability;
import com.sample.test.VO.resume.Activity;
import com.sample.test.VO.resume.BasicInfo;
import com.sample.test.VO.resume.Career;
import com.sample.test.VO.resume.Certificate;
import com.sample.test.VO.resume.LanguageScore;
import com.sample.test.VO.resume.TotalResume;
import com.sample.test.dao.ResumeDAO;

@Controller
public class ResumeController {

	@Autowired
	ResumeDAO dao;

//	TotalResume totalResume = new TotalResume();
	
	@RequestMapping(value="/insertResume", method=RequestMethod.POST)
	public String insertResume(TotalResume totalResume, HttpSession session, int updateFlag) {

		if (updateFlag==1) {
			System.out.println("까꿍 : "+updateFlag);
		}
		
		System.out.println("이력서 입력 시작");
		System.out.println("최초 실행 : "+totalResume);		
		
		int resumeSeq=totalResume.getResumeSeq();

		System.out.println(resumeSeq);
		
		//(필바꿈)
		//아직 세션에 로그인 값이 없어서 아이디를 설정함
	
		BasicInfo basicInfo=new BasicInfo();
		
		String personId=(String)session.getAttribute("personId");
		String personName=(String)session.getAttribute("personName");
		String personEmail=(String)session.getAttribute("personEmail");
		
		
		totalResume.setPersonId(personId);
		totalResume.setPersonName(personName);
		totalResume.setPersonEmail(personEmail);
		
		basicInfo.setPersonId(personId);
		basicInfo.setPersonName(personName);
		basicInfo.setPersonEmail(personEmail);
		basicInfo.setBirthDate(totalResume.getBirthDate());
		basicInfo.setGender(totalResume.getGender());
		basicInfo.setPersonPhone(totalResume.getPersonPhone());
		basicInfo.setPersonAddr(totalResume.getPersonAddr());
		
		System.out.println("넘어온 totalResume");
		System.out.println(totalResume);

		resumeSeq=dao.insertBasicInfo(basicInfo);		
	
		//ability (기술)
		List<String> abilityNum=totalResume.getAbilityTitle();
					
		if (abilityNum!=null) {

			ArrayList<Ability> abList=new ArrayList<Ability>();
			totalResume.setAbilityList(abList);
			
			System.out.println("for문 이전 totalResume : "+totalResume);
			
			for(int i=0;i<abilityNum.size();i++) {
				
				String title=totalResume.getAbilityTitle().get(i);
				String status=totalResume.getAbilityStatus().get(i);
				String detail=totalResume.getAbilityDetails().get(i);
				
				Ability ability=new Ability();
				
				ability.setResumeSeq(resumeSeq);
				ability.setAbilityTitle(title);
				ability.setAbilityStatus(status);
				ability.setAbilityDetails(detail);
				totalResume.getAbilityList().add(ability);
				
				System.out.println("ability : "+ability);
				
			}// ability setting for
			
			System.out.println("for 문 이후 totalResume : "+totalResume);
			
			ArrayList<Ability> abilityList = new ArrayList<Ability>();
			
			abilityList=totalResume.getAbilityList();
			
			System.out.println("insertAbilityList : "+abilityList);
			
			boolean flag = false;
			
			for (int i = 0; i < abilityList.size(); i++) {
				int abilityResult=dao.insertAbility(abilityList.get(i));
				
				if(abilityResult==1) flag=true;
				else flag=false;
				
			}
			
			System.out.println("최종 결과 : "+flag);
			
                                                                                                                                        			
		} else {
			
			System.out.println("ability 속성 없음");
			
		}//abilityNum if else
		
		
		//ACTIVITY
		
		List<String> activityNum=totalResume.getActivityTitle();
		
		if (activityNum!=null) {

			ArrayList<Activity> acList=new ArrayList<Activity>();
			totalResume.setActivityList(acList);
			
			System.out.println("for문 이전 totalResume : "+totalResume);
			
			for(int i=0;i<activityNum.size();i++) {
				
				String title=totalResume.getActivityTitle().get(i);
				String org=totalResume.getActivityOrg().get(i);
				String detail=totalResume.getActivityDetails().get(i);
				
				Activity activity=new Activity();
				
				activity.setResumeSeq(resumeSeq);
				activity.setActivityTitle(title);
				activity.setActivityOrg(org);
				activity.setActivityDetails(detail);
				totalResume.getActivityList().add(activity);
				
				System.out.println("activity : "+activity);
				
			}// activity setting for
			
			System.out.println("for 문 이후 totalResume : "+totalResume);
			
			ArrayList<Activity> activityList = new ArrayList<Activity>();
			
			activityList=totalResume.getActivityList();
			
			System.out.println("insertAbilityList : "+activityList);
			
			boolean flag = false;
			
			for (int i = 0; i < activityList.size(); i++) {
				int activityResult=dao.insertActivity(activityList.get(i));
				
				if(activityResult==1) flag=true;
				else flag=false;
				
			}
			
			System.out.println("최종 결과 : "+flag);
			
                                                                                                                                        			
		} else {
			
			System.out.println("activity 속성 없음");
			
		}//activityNum if else
		
		
		//Certificate
		
		List<String> certiNum=totalResume.getCertiTitle();
		
		if (certiNum!=null) {

			ArrayList<Certificate> ctList=new ArrayList<Certificate>();
			totalResume.setCertificateList(ctList);
			
			System.out.println("for문 이전 totalResume : "+totalResume);
			
			for(int i=0;i<certiNum.size();i++) {
				
				String title=totalResume.getCertiTitle().get(i);
				String org=totalResume.getCertiOrg().get(i);
				String date=totalResume.getCertiDate().get(i);
				
				Certificate certificate=new Certificate();
				
				certificate.setResumeSeq(resumeSeq);
				certificate.setCertiTitle(title);
				certificate.setCertiOrg(org);
				certificate.setCertiDate(date);
				totalResume.getCertificateList().add(certificate);
				
				System.out.println("certificate : "+certificate);
				
			}// activity setting for
			
			System.out.println("for 문 이후 totalResume : "+totalResume);
			
			ArrayList<Certificate> certificateList = new ArrayList<Certificate>();
			
			certificateList=totalResume.getCertificateList();

			System.out.println("insertCertificateList : "+certificateList);
			
			boolean flag = false;
			
			for (int i = 0; i < certificateList.size(); i++) {
				int certiResult=dao.insertCertificate(certificateList.get(i));
				
				System.out.println(certiResult);
				if(certiResult==1) flag=true;
				else flag=false;
				
			}
			
			System.out.println("최종 결과 : "+flag);
			
                                                                                                                                        			
		} else {
			
			System.out.println("certificate 속성 없음");
			
		}//certificateNum if else
		
		//Career
		
		List<String> careerNum=totalResume.getCompanyName();
		
		if (careerNum!=null) {

			ArrayList<Career> cList=new ArrayList<Career>();
			totalResume.setCareerList(cList);
			
			System.out.println("for문 이전 totalResume : "+totalResume);
			
			for(int i=0;i<careerNum.size();i++) {
				 
				String companyName=totalResume.getCompanyName().get(i);				
				String careerCategory=totalResume.getCareerCategory().get(i);
				String careerStartDate=totalResume.getCareerStartDate().get(i);
				String careerEndDate=totalResume.getCareerEndDate().get(i);
				String careerDepartment=totalResume.getCareerDepartment().get(i);
				String careerPosition=totalResume.getCareerPosition().get(i);				
				String careerRegion=totalResume.getCareerRegion().get(i);
				String careerSalary=totalResume.getCareerSalary().get(i);
				String careerTask=totalResume.getCareerTask().get(i);
				String careerDetails=totalResume.getCareerDetails().get(i);

				Career career=new Career();
				
				career.setResumeSeq(resumeSeq);
				career.setCompanyName(companyName);
				career.setCareerCategory(careerCategory);
				career.setCareerStartDate(careerStartDate);
				career.setCareerEndDate(careerEndDate);
				career.setCareerDepartment(careerDepartment);
				career.setCareerPosition(careerPosition);
				career.setCareerRegion(careerRegion);
				career.setCareerSalary(careerSalary);
				career.setCareerTask(careerTask);
				career.setCareerDetails(careerDetails);			
				
				totalResume.getCareerList().add(career);
				
				System.out.println("career : "+career);
				
			}// activity setting for
			
			System.out.println("for 문 이후 totalResume : "+totalResume);
			
			ArrayList<Career> careerList = new ArrayList<Career>();
			
			careerList=totalResume.getCareerList();

			System.out.println("insertCareerList : "+careerList);
			
			boolean flag = false;
			
			for (int i = 0; i < careerList.size(); i++) {
				int careerResult=dao.insertCareer(careerList.get(i));
				
				System.out.println(careerResult);
				if(careerResult==1) flag=true;
				else flag=false;
				
			}
			
			System.out.println("최종 결과 : "+flag);
			
                                                                                                                                        			
		} else {
			
			System.out.println("career 속성 없음");
			
		}//certificateNum if else
		
		//LanguageScore

		List<String> languageNum=totalResume.getLanguageTitle();
		
		if (languageNum!=null) {

			ArrayList<LanguageScore> langList=new ArrayList<LanguageScore>();
			totalResume.setLanguageScoreList(langList);
			
			System.out.println("for문 이전 totalResume : "+totalResume);
			
			for(int i=0;i<languageNum.size();i++) {
				 
				String languageType=totalResume.getLanguageType().get(i);				
				String languageTitle=totalResume.getLanguageTitle().get(i);
				String languageScore=totalResume.getLanguageScore().get(i);
				String languageOrg=totalResume.getLanguageOrg().get(i);
				String languageDate=totalResume.getLanguageDate().get(i);
				
				LanguageScore language=new LanguageScore();
				
				language.setResumeSeq(resumeSeq);
				language.setLanguageType(languageType);
				language.setLanguageTitle(languageTitle);
				language.setLanguageScore(languageScore);
				language.setLanguageOrg(languageOrg);
				language.setLanguageDate(languageDate);
				
				totalResume.getLanguageScoreList().add(language);
				
				System.out.println("language : "+language);
				
			}// activity setting for
			
			System.out.println("for 문 이후 totalResume : "+totalResume);
			
			ArrayList<LanguageScore> languageScoreList=new ArrayList<LanguageScore>();
			
			languageScoreList=totalResume.getLanguageScoreList();

			System.out.println("insertlanguageScoreList : "+languageScoreList);
			
			boolean flag = false;
			
			for (int i = 0; i < languageScoreList.size(); i++) {
				int languageResult=dao.insertLanguageScore(languageScoreList.get(i));
				
				System.out.println(languageResult);
				if(languageResult==1) flag=true;
				else flag=false;
				
			}
			
			System.out.println("최종 결과 : "+flag);
			
                                                                                                                                        			
		} else {
			
			System.out.println("language 속성 없음");
			
		}//certificateNum if else
		
		
		System.out.println("totalResume 최종  final 확인");
		System.out.println(totalResume);	
		
		return "person/personMain";
		
	}//insertResume
		
	@RequestMapping(value = "/showResume", method = RequestMethod.GET)
	public String resumeUpdate(Model model, HttpSession session) {
	
		//(필바꿈)
		//로그인 구현하고 세션값으로 바꾸기
		//String personId=(String)session.~~~;
		String personId="22";
		
		int resumeSeq=dao.selectResumeSeq(personId);
		System.out.println(resumeSeq);

		TotalResume totalResume = new TotalResume();
		BasicInfo bi = new BasicInfo();
		
		totalResume=dao.selectTotalResume(resumeSeq);
		
		System.out.println("dao에서 가져온 totalResume : "+totalResume);
		
		bi.setResumeSeq(resumeSeq);
		bi.setPersonId(totalResume.getPersonId());
		
		bi.setBasicSeq(totalResume.getBasicSeq());
		bi.setPersonName(totalResume.getPersonName());
		bi.setBirthDate(totalResume.getBirthDate());
		bi.setGender(totalResume.getGender());
		bi.setPersonEmail(totalResume.getPersonEmail());
		bi.setPersonPhone(totalResume.getPersonPhone());
		bi.setPersonAddr(totalResume.getPersonAddr());
		
		System.out.println("ResumeController bi : "+bi);
		
		model.addAttribute("bi",bi);
		
		ArrayList<Career> careerList=totalResume.getCareerList();		
		System.out.println("컨트롤러 careerList 확인 : "+careerList);
		
		model.addAttribute("careerList", careerList);
		
		ArrayList<Certificate> certiList=totalResume.getCertificateList();
		System.out.println("컨드롤러 certiList 확인 : "+certiList);

		model.addAttribute("certiList",certiList);
		
		ArrayList<LanguageScore> languageScoreList=totalResume.getLanguageScoreList();
		System.out.println("컨드롤러 languageScoreList 확인 : "+languageScoreList);
	
		model.addAttribute("languageScoreList",languageScoreList);
	
		ArrayList<Ability> abilityList=totalResume.getAbilityList();
		System.out.println("컨드롤러 AbilityList 확인 : "+abilityList);

		model.addAttribute("abilityList",abilityList);

		ArrayList<Activity> activityList=totalResume.getActivityList();
		System.out.println("컨드롤러 activityList 확인 : "+activityList);

		model.addAttribute("activityList",activityList);

		System.out.println("최종 : "+totalResume);

		
		return "person/showResume";
	
	}
	
	@RequestMapping(value="/updateResume", method=RequestMethod.GET)
	public String updateResume(int resumeSeq, Model model, HttpSession session){
		
		System.out.println("updateResume의 resumeSeq : "+resumeSeq);
		
		int result=0;
		
//		result=dao.deleteResume(resumeSeq);
		System.out.println(result);
		
		TotalResume totalResume=new TotalResume();
		
		totalResume=dao.selectTotalResume(resumeSeq);
		
		System.out.println("페이지 이동 : "+totalResume);	
		model.addAttribute("totalResume", totalResume);
		
		ArrayList<Career>careerList=totalResume.getCareerList();
		ArrayList<Certificate> certiList=totalResume.getCertificateList();
		ArrayList<LanguageScore> langList=totalResume.getLanguageScoreList();
		ArrayList<Ability> abilityList=totalResume.getAbilityList();
		ArrayList<Activity> activityList=totalResume.getActivityList();
		
		model.addAttribute("careerList",careerList);
		model.addAttribute("certiList",certiList);
		model.addAttribute("langList",langList);
		model.addAttribute("abilityList",abilityList);
		model.addAttribute("activityList",activityList);
		
//		session.setAttribute("totalResume", totalResume);
				
		return "person/updateResume";
	}
	
	
	
	/*
	@RequestMapping(value="/updateResume", method=RequestMethod.GET)
	public @ResponseBody TotalResume
	*/
	
	
	
}//class
