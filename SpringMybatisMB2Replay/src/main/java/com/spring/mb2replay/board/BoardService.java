package com.spring.mb2replay.board;

import java.util.HashMap;
import java.util.List;

public interface BoardService {
	public int getListCount();
	public List<BoardVO> getBoardList(int page,int limit);
	public BoardVO getDetail(int num);
	public int boardInsert(BoardVO board);
	public int boardReply(BoardVO board);
	public BoardVO boardModifyForm(int num);
	public boolean boardModify(BoardVO modifyboard);
	public int boardDelete(HashMap<String, String> hashmap);
	String isBoardWriter(int num);
}
