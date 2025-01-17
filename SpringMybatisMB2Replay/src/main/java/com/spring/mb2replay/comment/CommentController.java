package com.spring.mb2replay.comment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController 
public class CommentController {
//rest controller 사용하게 되면 전달하는 값은 뷰가 아닌 데이터가 된다.
// 뷰로 데이터를 전달하고자 할 때 사용한다. 그럼 responseBody랑 뭔 차이야.
	
	@Autowired
	CommentService mCommentService;
	
	@RequestMapping(value="/comment_list.bo",
					produces = "application/json; charset=UTF-8") // 댓글 리스트
	private List<CommentVO> mCommentServiceList(@RequestParam int bno) throws Exception{
		List<CommentVO> comment_list = mCommentService.commentList(bno);
		return comment_list;
	}
	
	@RequestMapping(value="/comment_insert.bo",
			produces = "application/json; charset=UTF-8") // 댓글 삽입
	private int mCommentServiceInsert(CommentVO comment, HttpSession session) throws Exception{
		
		System.out.println("in mCommentServiceInsert");
		
		comment.setWriter((String)session.getAttribute("id"));
		return mCommentService.commentInsert(comment);
	}
	
	@RequestMapping(value="/comment_update.bo",
			produces = "application/json; charset=UTF-8") // 댓글 수정
	private int mCommentServiceInsert(@RequestParam int cno, @RequestParam String content) throws Exception{
	
		CommentVO comment = new CommentVO();
		comment.setCno(cno);
		comment.setContent(content);
		
		return mCommentService.commentUpdate(comment);
	}
	
	@RequestMapping(value="/comment_delete.bo",
			produces = "application/json; charset=UTF-8") // 댓글 삭제
	private int mCommentServiceDelete(@RequestParam(value="cno") int cno) throws Exception{
	
		return mCommentService.commentDelete(cno);
	}
	
}
