package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ReplyDao;
import com.example.demo.vo.Reply;

@Service
public class ReplyService {
	
	private ReplyDao replyDao;
	
	@Autowired
	ReplyService(ReplyDao replyDao){
		this.replyDao = replyDao;
	}

	public void writeReply(int loginedMemberId, String relTypeCode, int relId, String body) {
		replyDao.writeReply(loginedMemberId, relTypeCode, relId, body);
	}

	public List<Reply> getReplies(String relTypeCode, int relId) {
		return replyDao.getReplies(relTypeCode, relId);
	}

	public Reply getForPrintReplyId(int id) {
		return replyDao.getForPrintReplyId(id);
	}

	public void modifyReply(int loginedMemberId, String relTypeCode, int relId, String body) {
		replyDao.modifyReply(loginedMemberId, relTypeCode, relId, body);
	}

	public void deleteReply(int loginedMemberId, String relTypeCode, int relId, int id) {
		replyDao.deleteReply(loginedMemberId, relTypeCode, relId, id);
	}

	
}