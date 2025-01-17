package com.spring.mb2replay.board;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.BoardMapper;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	BoardMapper boardMapper = null;
	   
   @Autowired
    public BoardServiceImpl(SqlSession sqlSession) {
        this.boardMapper = sqlSession.getMapper(BoardMapper.class);
   }   
	
	@Override
	public int getListCount() {
		int res = boardMapper.getListCount();
		return res;
	}

	@Override
	public List<BoardVO> getBoardList(int page, int limit) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow=(page-1)*10+1; //읽기 시작할 row 번호.
		int endrow=startrow+limit-1; //읽을 마지막 row 번호.		
		
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		
		List<BoardVO> boardlist = boardMapper.getBoardList(map);
		return boardlist;
	}

	@Override
	public BoardVO getDetail(int num) {
		
		boardMapper.setReadCountUpdate(num);
		
		BoardVO board = boardMapper.getDetail(num);
		return board;
	}

	@Override
	public int boardInsert(BoardVO board) {
		int res = boardMapper.boardInsert(board);
		return res;
	}

	@Override
	public int boardReply(BoardVO board) {
		int res = boardMapper.boardReply(board);
		return res;
	}
	
	@Override
	public BoardVO boardModifyForm(int num) {
		
		BoardVO board = boardMapper.getDetail(num);
		System.out.println(board.toString());
		
		boardMapper.boardReplyUpdate(board);
		
		board.setRe_seq(board.getRe_seq() + 1);
		board.setRe_lev(board.getRe_lev());
	
				// 저두 여기는 놓쳤어요 ㅠㅠ 
		return board;
	}
	
	@Override
	public boolean boardModify(BoardVO modifyboard) {
		
		String id = modifyboard.getId();
		BoardVO vo =  boardMapper.getDetail(modifyboard.getNum());
		
		System.out.println("modifyboard ====> " + modifyboard.toString());
		System.out.println("vo =============> " + modifyboard.toString());
		// 로그인 id와 글쓴이 id 일치 여부
		if (modifyboard.getId().equals(vo.getId())) {
			
			int res =  boardMapper.boardModify(modifyboard);
			
			if(res == 1) {
				return true;
			}
			else {
				return false;
			}
		}
		return true;
	}

	@Override
	public int boardDelete(HashMap<String, String> hashmap) {
		
		int res = 0;
		int num = Integer.parseInt(hashmap.get("num"));
		String id =  isBoardWriter(num);
		
		if (hashmap.get("id").equals(id)) {
			res =  boardMapper.boardDelete(hashmap);
		}
		return res;
	}

	/*
	 	public boolean boardDelete(HashMap<String, String> hashmap) {
		int res =  boardMapper.isBoardWriter(hashmap);
		int num = Integer.parseInt(hashmap.get("num");
		
		if (res == 1) {
			res =  boardMapper.boardDelete(num);
		}
		return res;
	}
	 
	 * */
	
	
	@Override
	public String isBoardWriter(int num) {
		
		BoardVO vo = boardMapper.getDetail(num);
		
		return vo.getId();
	}
	
}
