package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Reply;

import lombok.Delegate;

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

	@Select("""
			SELECT R.*, M.nickname AS writerName 
				FROM reply AS R
				INNER JOIN `member` AS M
				ON R.memberId = M.id
				WHERE R.relTypeCode = #{relTypeCode}
				AND R.relId = #{relId}
			""")
	List<Reply> getReplies(String relTypeCode, int relId);

	@Select("""
			SELECT R.*, M.nickname AS writerName
				FROM reply AS R
				INNER JOIN `member` AS M
				ON R.memberId = M.id
				WHERE R.memberId = #{memberId}
				AND R.relTypeCode = #{relTypeCode}
				AND R.relId = #{relId}	
			""")
	Reply getForPrintReplyId(int id);

	@Update("""
			UPDATE reply
				SET `body` = #{body}
				WHERE id = #{id} 
				AND memberId = #{memberId}
				AND relTypeCode = #{relTypeCode}
				AND relId = #{relId}
			""")
	void modifyReply(int loginedMemberId, String relTypeCode, int relId, String body);

	@Delete("""
			DELETE FROM reply
				WHERE id = #{id}
				AND memberId = #{memberId}
				AND relTypeCode = #{relTypeCode}
				AND relId = #{relId}
			""")
	void deleteReply(int loginedMemberId, String relTypeCode, int relId, int id);
	
}