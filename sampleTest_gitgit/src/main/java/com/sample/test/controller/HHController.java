package com.sample.test.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.test.VO.PersonList;
import com.sample.test.VO.ContactMessage;
import com.sample.test.VO.Options;
import com.sample.test.VO.Person;
import com.sample.test.VO.Request;
import com.sample.test.dao.HHDAO;

@Controller
public class HHController {

	@Autowired
	HHDAO dao;
	
	@RequestMapping(value="/spRegist", method = RequestMethod.GET, produces="application/text;charset=utf-8")
	public @ResponseBody String spRegist(PersonList personList){
		int result = dao.insertPersonList(personList);
		String temp;
		
		if(result != 0) {
			temp = "성공";
		}else {
			temp = "실패";
		}
		return temp;
	}
	
	@RequestMapping(value="/selectRequest", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Request> selectComName(String hhId){
		ArrayList<Request> requestList = dao.selectRequest(hhId);
		
		return requestList;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Person> search(String category, String education, String level, String sector, String language, String license) {
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("category", category);
		hashMap.put("education", education);
		hashMap.put("level", level);
		hashMap.put("sector", sector);
		hashMap.put("language", language);
		hashMap.put("license", license);
		
		ArrayList<Person> result = dao.search(hashMap);
				
//		Iterator<String> mapIter = hashMap.keySet().iterator();
//		
//		while(mapIter.hasNext()) {
//			String key = mapIter.next();
//			String value = hashMap.get(key);
//			
//			System.out.println(key+":"+value);
//		}
		
		return result;
//		return "dd";
	}
	
	@RequestMapping(value = "/searchPerson", method = RequestMethod.GET)
	public String searchPerson() {
		return "hh/searchPerson";
	}
	
	@RequestMapping(value = "/inputOffer", method = RequestMethod.POST)
	public @ResponseBody int inputOffer(HttpSession session, String comName,String comAddr,String jobTitle, String firstOption, String secondOption, String thirdOption, String fourthOption, String fifthOption, String explanation) {

		String hhId=(String)session.getAttribute("hhId");
		
		Request request = new Request();
		Options firstOp = new Options();
		Options secondOp = new Options();
		Options thirdOp = new Options();
		Options fourthOp = new Options();
		Options fifthOp = new Options();
		
		ArrayList<Options> oList = new ArrayList<Options>();

		request.setComName(comName);
		request.setComAddr(comAddr);
		request.setJobTitle(jobTitle);
		request.setExplanation(explanation);
		request.setHhId(hhId);
		
		System.out.println("3순위 : "+thirdOption);
		System.out.println("4순위 : "+fourthOption);
		System.out.println("5순위 : "+fifthOption);	
		
		System.out.println("컨트롤러");
		System.out.println(request);
		
		int requestSeq = dao.insertRequest(request);
				
		if (firstOption!="") {
		
			firstOp.setRequestSeq(requestSeq);
			firstOp.setRanking(1);
			firstOp.setComOption(firstOption);
			oList.add(firstOp);
			
		}
		
		if (secondOption!="") {
			
			secondOp.setRequestSeq(requestSeq);
			secondOp.setRanking(2);
			secondOp.setComOption(secondOption);
			oList.add(secondOp);
		}
		
		if(thirdOption!="") {
			
			thirdOp.setRequestSeq(requestSeq);
			thirdOp.setRanking(3);
			thirdOp.setComOption(thirdOption);
			oList.add(thirdOp);
			
		}
		
		if(fourthOption!="") {
			
			fourthOp.setRequestSeq(requestSeq);
			fourthOp.setRanking(4);
			fourthOp.setComOption(fourthOption);
			oList.add(fourthOp);
			
		}
	
		if(fifthOption!="") {
			
			fifthOp.setRequestSeq(requestSeq);
			fifthOp.setRanking(5);
			fifthOp.setComOption(fifthOption);
			oList.add(fifthOp);
			
		}
		
		System.out.println(oList);
		
		int opResult=0;
		int finalResult=0;
		
		if (oList.size()>0) {
			
			opResult = dao.insertOptions(oList);			
		}
		
		if(requestSeq>0&&opResult==1) {			
			finalResult=1;			
		}
		
		System.out.println(finalResult);
		
		return finalResult;
	}

	@RequestMapping(value = "/oList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<HashMap<String, Object>> oList(String hhId) {

		
//		String loginId=(String) session.getAttribute("loginId");
			
		ArrayList<HashMap<String, Object>> oList=dao.selectOList(hhId);	
		System.out.println("oList Controller"+oList);
		
		return oList;
	
	}
	
	@RequestMapping(value = "/deleteOption", method = RequestMethod.POST)
	public @ResponseBody int deleteOption(int requestSeq) {

		int result=0;
		
		result=dao.deleteOption(requestSeq);
		
		System.out.println("컨트롤러 : "+result);
		
		return result;
	
	}
	
		
	
	@RequestMapping(value = "/pickList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<PersonList> pickList(String hhId) { //관심 인재 불러오기
	
		System.out.println(hhId);
		
		ArrayList<PersonList> pickList=dao.pickList(hhId);
		System.out.println("pickList 컨트롤러 : "+pickList);
		return pickList;
	}

	@RequestMapping(value = "/sendMessage", method = RequestMethod.POST)
	public @ResponseBody int sendMessage(ContactMessage contactMessage, HttpSession session) { //임시로 메세지 보내는 창
		
		int result=0;
		System.out.println("최초 실행 contactMessage"+contactMessage);

		
		//기능 구현을 우선으로 하기 위해 임시로 넣은 값
		//필질문

		String contactHH=(String)session.getAttribute("hhId");
		String contactPerson=contactMessage.getPersonId();
		
		System.out.println("0415 값 잘 왔나 : "+contactMessage);
		
		//여기도 필바꿈
		contactMessage.setHhName(contactHH);
		contactMessage.setHhId(contactHH);
	
		System.out.println(contactMessage);
		
		HashMap<String, String> contactFlagMap=new HashMap<String, String>();

		contactFlagMap.put("contactHH", contactHH);
		contactFlagMap.put("contactPerson", contactPerson);

		System.out.println("contactFlagMap : "+contactFlagMap);
		
		result=dao.insertContactMessage(contactMessage);
		System.out.println("contactMessage result : "+result);
		
		int finalResult=0;
		
		if (result==1) {
			
			finalResult = dao.updateContactFlag(contactFlagMap);		
			System.out.println("finalResult : "+finalResult);

		}
		
		return finalResult;
	}
	
	
	
	@RequestMapping(value = "/deletePersonList", method = RequestMethod.POST)
	public @ResponseBody int deletePersonList(String hhId, int listSeq) {
		
		int result=0;
		
		HashMap<String, Object> deleteMap=new HashMap<String, Object>();
		
		deleteMap.put("hhId", hhId);
		deleteMap.put("listSeq", listSeq);

		System.out.println();
		
		result=dao.deletePersonList(deleteMap);
		
		return result;
	
	}
	
	@RequestMapping(value = "/selectContactedPerson", method = RequestMethod.GET)
	public @ResponseBody ArrayList<PersonList> selectContactedPerson(HttpSession session) { //임시로 만든 것임 수정 필수
	
		ArrayList<PersonList> cpList=new ArrayList<PersonList>();
		String hhId=(String)session.getAttribute("hhId");
		
		cpList=dao.selectContactedPerson(hhId);
		System.out.println("컨트롤러 cpList : "+cpList); 
		
		return cpList;
		
	}

	
}//class
