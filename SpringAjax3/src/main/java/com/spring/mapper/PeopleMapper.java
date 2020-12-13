package com.spring.mapper;

import java.util.List;

import com.spring.springajax3.PeopleVO;

public interface PeopleMapper {
	List<PeopleVO> getPeopleList();
	int insertPeople(PeopleVO vo);
	void deletePeople(String id);
}
