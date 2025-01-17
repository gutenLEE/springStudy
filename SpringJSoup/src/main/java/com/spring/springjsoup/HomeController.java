package com.spring.springjsoup;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {

	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home( ) {
		return "home";
	}
	@RequestMapping(value = "/crawl.do", method = RequestMethod.GET)
	public ModelAndView crawl(ModelAndView model ) {
		
		String url = "https://sports.news.naver.com/wfootball/index.nhn";
		Document doc = null;
		
		try
		{
			doc = Jsoup.connect(url).get();
		}
		catch(IOException e) 
		{
			e.printStackTrace();
		}
		
		Elements element = doc.select("div.home_news");
		
		System.out.println("################## div.home_news ##################");
		System.out.println(element);
		
		String title = element.select("h2").text().substring(0, 4);
		
		System.out.println("=====================================================================");
		System.out.println(title);
		System.out.println("=====================================================================");
		
		ArrayList<String> list_text = new ArrayList<String>();
		ArrayList<String> list_link = new ArrayList<String>();
		
		for(Element el : element.select("li")) {
			
			String text = el.text().toString();
			String link = "https://sports.news.naver.com" + el.select("a").attr("href");
			System.out.println(text);
			System.out.println(link);
			
			System.out.println("------------------------------------------------------------------");
			
			list_text.add(text);
			list_link.add(link);
		}
		
		model.addObject("title" + title);
		model.addObject("list_text" + list_text);
		model.addObject("list_link" + list_link);
		model.setViewName("crawl");
		
		return model;
	}
	
	@RequestMapping(value = "/crawl2.do", method = RequestMethod.GET)
	public ModelAndView crawl2(ModelAndView model ) {
		
		String url = "https://movie.naver.com/movie/sdb/rank/rmovie.nhn";
		Document doc = null;
		
		try
		{
			doc = Jsoup.connect(url).get();
		}
		catch(IOException e) 
		{
			e.printStackTrace();
		}
		
//		<div class="tit3"> 
//	      <a href="/movie/bi/mi/basic.nhn?code=164143" title="�̿�����">�̿�����</a> 
//	      </div> </td> 
		
		Elements tableElement = doc.select("table.list_ranking");
		Elements tr = tableElement.select("tr");
		
		System.out.println("################## div.list_ranking ##################");
		System.out.println(tableElement);
		
		ArrayList<String> list_title = new ArrayList<String>();
		
		for(Element el : tr.select("div.tit3")) {
			
			String text = el.text().toString();
			System.out.println(text);
			
			System.out.println("------------------------------------------------------------------");

		}
		
		return model;
	}
}
