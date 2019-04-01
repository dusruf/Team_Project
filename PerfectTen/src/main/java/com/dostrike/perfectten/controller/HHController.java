package com.dostrike.perfectten.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dostrike.perfectten.DAO.HHDAO;
import com.dostrike.perfectten.VO.ContactMessage;
import com.dostrike.perfectten.VO.Options;
import com.dostrike.perfectten.VO.Person;
import com.dostrike.perfectten.VO.PersonList;
import com.dostrike.perfectten.VO.Request;

@Controller
public class HHController {

	@Autowired
	HHDAO dao;
	
	@RequestMapping(value = "/offerList", method = RequestMethod.GET)
	public String offerList(Model model, HttpSession session) {
		
		String loginId=(String)session.getAttribute("loginId");
		
		model.addAttribute("loginId",loginId);
		return "hh/offer/offerList";
	}

	@RequestMapping(value = "/searchPerson", method = RequestMethod.GET)
	public String searchPerson() {
		return "hh/searchPerson";
	}

	@RequestMapping(value = "/statusCheck", method = RequestMethod.GET)
	public String statusCheck() {
		return "hh/statusCheck";
	}

	@RequestMapping(value = "/goPersonList", method = RequestMethod.GET)
	public String goPersonList() {
		
		return "hh/personList";
	}

	@RequestMapping(value = "/regOffer", method = RequestMethod.GET)
	public String regOffer() {
		return "hh/offer/regOffer";
	}
	
	@RequestMapping(value = "/inputOffer", method = RequestMethod.POST)
	public String inputOffer(HttpSession session, String comName,String comAddr,String jobTitle, String firstOption, String secondOption, String thirdOption, String fourthOption, String fifthOption, String explanation) {

		String loginId=(String)session.getAttribute("loginId");
	
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
		request.setHhId(loginId);
		
		System.out.println("3순위 : "+thirdOption);
		System.out.println("4순위 : "+fourthOption);
		System.out.println("5순위 : "+fifthOption);	
		
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
		
		if (oList.size()>0) {
			
			int opReult = dao.insertOptions(oList);			
		}
		
		return "redirect:/offerList";
	}

	@RequestMapping(value = "/reHHMain", method = RequestMethod.GET)
	public String reHHMain() {
		return "hh/hhMain";
	}

	@RequestMapping(value = "/oList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<HashMap<String, Object>> oList(HttpSession session) {

		
		String loginId=(String) session.getAttribute("loginId");
			
		ArrayList<HashMap<String, Object>> oList=dao.selectOList(loginId);	
//		System.out.println("oList Controller");
//		System.out.println(oList);
		
		return oList;
	
	}

	@RequestMapping(value = "/personList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Person> personList() { //임시로 만든 것임 수정 필수
	
		ArrayList<Person> pList=dao.selectPList();
//		System.out.println(pList);
		
		return pList;
	}
	
	@RequestMapping(value = "/pickPerson", method = RequestMethod.POST)
	public @ResponseBody int pickPerson(PersonList personList, HttpSession session) { //관심 인재 등록
	
		int result=0;		
		
		String loginId=(String)session.getAttribute("loginId");
		personList.setHhId(loginId);
		
		System.out.println(personList);
		
		result=dao.pickPerson(personList);			
		
		return result;  
		
	} 
	
	@RequestMapping(value = "/pickList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<PersonList> pickList(String hhId) { //관심 인재 불러오기
	
		ArrayList<PersonList> pickList=dao.pickList(hhId);
//		System.out.println("pickList 컨트롤러 : "+pickList);
		return pickList;
	}

	@RequestMapping(value = "/sendMessage", method = RequestMethod.POST)
	public @ResponseBody int sendMessage(ContactMessage contactMessage) { //임시로 메세지 보내는 창
		
		System.out.println(contactMessage);
		
		int result=dao.insertContactMessage(contactMessage);
		
		return result;
	}

	
}// class
