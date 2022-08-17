package egovframework.let.crud2.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.let.crud2.service.Crud2Service;
import egovframework.let.crud2.service.Crud2VO;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Crud2Controller {
	
	@Resource(name = "crud2Service")
    private Crud2Service crud2Service;
	
	//CRUD 가져오기
	@RequestMapping(value = "/crud2/select.do")
	public String select(@ModelAttribute("searchVO") Crud2VO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
		Crud2VO result = crud2Service.selectCrud(searchVO);
		model.addAttribute("result", result);
		return "crud2/CrudSelect";
	}
	
	//CRUD 목록 가져오기
	@RequestMapping(value = "/crud2/selectList.do")
	public String selectList(@ModelAttribute("searchVO") Crud2VO searchVO,  
			HttpServletRequest request, ModelMap model) throws Exception{
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit()); // 한 페이지당 게시되는 게시물 건 수
		paginationInfo.setPageSize(searchVO.getPageSize()); // 페이지 리스트에 게시되는 페이지 건수
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = crud2Service.selectCrudListCnt(searchVO);
		
		paginationInfo.setTotalRecordCount(totCnt); // 전체 게시물 건 수
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<EgovMap> resultList = crud2Service.selectCrudList(searchVO);
		model.addAttribute("resultList", resultList);
		
		return "crud2/CrudSelectList";
	}
	
	//CRUD 등록/수정
	@RequestMapping(value = "/crud2/crudRegist.do")
	public String crudRegist(@ModelAttribute("searchVO") Crud2VO crud2VO,
		HttpServletRequest request, ModelMap model) throws Exception{
		
		Crud2VO result = new Crud2VO();
		if(!EgovStringUtil.isEmpty(crud2VO.getCrudId())) {
			result = crud2Service.selectCrud(crud2VO);
		}
		model.addAttribute("result", result);
		
		return "crud2/CrudRegist";		
	}
	
	//CRUD 등록하기
	@RequestMapping(value = "/crud2/insert.do")
	public String insert(@ModelAttribute("searchVO") Crud2VO searchVO,
			HttpServletRequest request, ModelMap model) throws Exception{
		
		crud2Service.insertCrud(searchVO);
		return "forward:/crud2/selectList.do";
	}
	
	//CRUD 수정하기
	@RequestMapping(value = "/crud2/update.do")
	public String update(@ModelAttribute("searchVO") Crud2VO searchVO,
			HttpServletRequest request, ModelMap model) throws Exception{
		
		crud2Service.updateCrud(searchVO);
		return "forward:/crud2/selectList.do";
	}
	
	//CRUD 삭제하기
	@RequestMapping(value = "/crud2/delete.do")
	public String delete(@ModelAttribute("searchVO") Crud2VO searchVO,
			HttpServletRequest request, ModelMap model) throws Exception{
		
		crud2Service.deleteCrud(searchVO);
		return "forward:/crud2/selectList.do";
	}
}
