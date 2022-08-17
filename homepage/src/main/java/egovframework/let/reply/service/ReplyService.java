package egovframework.let.reply.service;

import java.util.List;

public interface ReplyService {

	int insertReply(ReplyVO vo) throws Exception;

	List<ReplyVO> selectReplyList(String repBbsNo) throws Exception;

	int deleteReply(ReplyVO vo);

}
