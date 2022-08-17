package egovframework.let.reply.service.impl;

import java.util.List;


import egovframework.let.reply.service.ReplyVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("replyMapper")
public interface ReplyMapper {
	
	int insertReply(ReplyVO vo) throws Exception;

	List<ReplyVO> selectReplyList(String repBbsNo) throws Exception;

	int deleteReply(ReplyVO vo);
}
