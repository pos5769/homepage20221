package egovframework.let.reply.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.reply.service.ReplyService;
import egovframework.let.reply.service.ReplyVO;

@Controller
public class ReplyController {
	
	@Resource(name="replyService")
	private ReplyService replyService;
	
	@RequestMapping(path = "/reply/list.do", method = RequestMethod.GET)
	@ResponseBody
	public List<ReplyVO> list(String repBbsNo) throws Exception {
		List<ReplyVO> list = replyService.selectReplyList(repBbsNo);
		return list;
	}

	@RequestMapping(path = "/reply/add.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> add(ReplyVO vo, HttpSession session) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setRepWriter(user.getId());
		
		int num = replyService.insertReply(vo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", num);
		
		return map;
	}
	
	@RequestMapping(path = "/reply/del.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> del(ReplyVO vo, HttpSession session) {		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setRepWriter(user.getId());
		
		int num = replyService.deleteReply(vo);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", num);
		
		return map;
	}
}
