package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Reply;

@Mapper
public interface ReplyDao {
	@Insert("""
			INSERT INTO reply
				SET regDate = NOW()
					, updateDate = NOW()
					, memberId = #{loginedMemberId}
					, relTypeCode = #{relTypeCode}
					, relId = #{relId}
					, `body` = #{body}
			""")
	void writeReply(int loginedMemberId, String relTypeCode, int relId, String body);

	@Delete("""
			DELETE FROM reply
				WHERE memberId = #{loginedMemberId}
				AND relTypeCode = #{relTypeCode}
				AND relId = #{relId}
			""")
	void doDeleteReply(int loginedMemberId, String relTypeCode, int relId);

	@Select("""
			SELECT R.*, M.nickName AS writerName
				FROM reply AS R
				INNER JOIN `member` AS M
				ON 
			""")
	List<Reply> getReplies(String relTypeCode, int relId);
}