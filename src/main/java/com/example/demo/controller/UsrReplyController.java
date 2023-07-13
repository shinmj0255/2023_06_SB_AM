package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ReplyService;
import com.example.demo.util.Util;
import com.example.demo.vo.Reply;
import com.example.demo.vo.Rq;

@Controller
public class UsrReplyController {

	private ReplyService replyService;
	private Rq rq;
	
	@Autowired
	public UsrReplyController(ReplyService replyService, Rq rq) {
		this.replyService = replyService;
		this.rq = rq;
	}
	
	@RequestMapping("usr/reply/doWrite")
	@ResponseBody
	public String doWrite(String relTypeCode, int relId, String body) {
		
		replyService.writeReply(rq.getLoginedMemberId(), relTypeCode, relId, body);
		
		return Util.jsReplace("댓글 작성 완료", Util.f("../article/detail?id=%d", relId));
	}
	
	@RequestMapping("usr/reply/doModify")
	@ResponseBody
	public String doModify(String relTypeCode, int relId, String body, int id) {
		
		Reply reply = replyService.getForPrintReplyId(id);
		
		if (rq.getLoginedMemberId() != reply.getMemberId()) {
			return Util.jsHistoryBack("해당 게시글에 대한 권한이 없습니다");
		}
		
		replyService.modifyReply(rq.getLoginedMemberId(), relTypeCode, relId, body);
		
		return Util.jsReplace("댓글 수정 완료", Util.f("../article/detail?id=%d", relId));
	}

	@RequestMapping("usr/reply/doDelete")
	@ResponseBody
	public String doDelete(String relTypeCode, int relId, int id) {
		
		Reply reply = replyService.getForPrintReplyId(id);
		
		if (reply == null) {
			return Util.jsHistoryBack(Util.f("%d번 게시글은 존재하지 않습니다", id));
		}
		
		if (rq.getLoginedMemberId() != reply.getMemberId()) {
			return Util.jsHistoryBack("해당 게시글에 대한 권한이 없습니다");
		}
		
		replyService.deleteReply(rq.getLoginedMemberId(), relTypeCode, relId, id);
		
		return Util.jsReplace("댓글이 삭제되었습니다", Util.f("../article/detail?id=%d", relId));
	}
	
}