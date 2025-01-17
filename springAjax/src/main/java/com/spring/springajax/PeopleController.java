package com.spring.springajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class PeopleController {
	
	@Autowired
	private PeopleService peopleService;
	
	@RequestMapping(value="/home.do", method=RequestMethod.GET)
	public String home() {
		System.out.println("home.do");
		return "home";
	}
	
	
	@RequestMapping(value="/getPeopleJSON.do", 
					method=RequestMethod.POST,
					produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<PeopleVO> getPeopleJSONGET(){
		
		System.out.println("getPeopleJSON");
		List<PeopleVO> list = peopleService.getPeoplejson();
		
		return list;
	}
	
	
	@RequestMapping(value="/insertPeople.do", 
			method=RequestMethod.POST,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> insertPeople(PeopleVO vo){
		
		System.out.println("insertPeople");
		System.out.println("web => " + vo.toString());
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			System.out.println("in in in");
			
			int res = peopleService.insertPeople(vo);
			
			System.out.println("res = " + res);
			System.out.println(vo.toString());
			
			retVal.put("res", "OK");
		}
		catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	
	@RequestMapping(value="/deletePeople.do", 
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> deletePeople(@RequestParam(value="id") String id){
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			peopleService.deletePeople(id);
			
			retVal.put("res", "OK");
		}
		catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	
	@RequestMapping(value="/updatePeople.do", 
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> updatePeople(PeopleVO vo){
		
		System.out.println("vo => " + vo.toString());
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			peopleService.updatePeople(vo);
			
			retVal.put("res", "OK");
		}
		catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
}
