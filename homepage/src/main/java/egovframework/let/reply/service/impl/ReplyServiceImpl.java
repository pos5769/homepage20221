package egovframework.let.reply.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.reply.service.ReplyService;
import egovframework.let.reply.service.ReplyVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Resource(name="replyMapper")
	private ReplyMapper replyMapper;
	
	@Resource(name="egovReplyIdGnrService")
    private EgovIdGnrService idgenService;
	
	
	@Override
	public int insertReply(ReplyVO vo) throws Exception {
//		 id = idgenService.getNextStringId();
//		vo.setRepNo(id);		
		
		return replyMapper.insertReply(vo);
	}

	@Override
	public List<ReplyVO> selectReplyList(String repBbsNo) throws Exception {
		return replyMapper.selectReplyList(repBbsNo);
	}

	@Override
	public int deleteReply(ReplyVO vo) {
		return replyMapper.deleteReply(vo);
	}
}
