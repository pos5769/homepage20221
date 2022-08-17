package egovframework.let.login.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.let.uat.uia.service.EgovLoginService;


@Controller
public class LoginController {
	
	@Resource(name = "loginService")
	private EgovLoginService loginService;
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	//로그인
	@RequestMapping(value = "/login/actionLogin.do")
	public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO,
			HttpServletRequest request, ModelMap model) throws Exception {
		
		LoginVO resultVO = loginService.actionLogin(loginVO);
		if(resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {
			request.getSession().setAttribute("LoginVO", resultVO);
//			return "forward:/index.do";
			return "redirect:" + request.getHeader("Referer");

		} else {
			model.addAttribute("loginMessage", egovMessageSource.getMessage("fail.common.login"));
//			return "forward:/index.do";
			return "redirect:" + request.getHeader("Referer");
		}
	}
	
	//로그아웃
	@RequestMapping(value = "/login/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {
		
		//RequestContextHolder.getRequestAttributes().removeAttribute("LoginVO", RequestAttributes.SCOPE_SESSION); //로그아웃 할때 로그인의 정보만 사라지게 하는거
		request.getSession().invalidate(); //로그아웃 할때 모든 세션이 다 사라지게 하는거
//		return "forward:/index.do";
		return "redirect:" + request.getHeader("Referer");
	}
	
}