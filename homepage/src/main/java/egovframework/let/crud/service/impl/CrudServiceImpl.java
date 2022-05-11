package egovframework.let.crud.service.impl;

import egovframework.let.crud.service.CrudService;
import egovframework.let.crud.service.CrudVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("crudService")
public class CrudServiceImpl extends EgovAbstractServiceImpl implements CrudService {

    @Resource(name="crudMapper")
	private CrudMapper crudMapper;
    
    @Resource(name="egovCrudIdGnrService")
    private EgovIdGnrService idgenService;
    
    //CRUD 가져오기
	@Override
	public CrudVO selectCrud(CrudVO vo) throws Exception {
		/*CrudVO result = crudMapper.selectCrud(vo);
		return result;*/
		//아래랑 같은 의미
		return crudMapper.selectCrud(vo);
	}
	
	//CRUD 목록 가져오기
	public List<EgovMap> selectCrudList(CrudVO vo) throws Exception {
		return crudMapper.selectCrudList(vo);
	}
	
	//CRUD 등록하기
	public String insertCrud(CrudVO vo) throws Exception {
		String id = idgenService.getNextStringId();
		vo.setCrudId(id);
		crudMapper.insertCrud(vo);
		return id;
	}
	
	//CRUD 수정하기
	public void updateCrud(CrudVO vo) throws Exception {
		crudMapper.updateCrud(vo);
	}
	
	//CRUD 삭제하기
	public void deleteCrud(CrudVO vo) throws Exception {
		crudMapper.deleteCrud(vo);
	}
	
	//CRUD 목록 수
	public int selectCrudListCnt(CrudVO vo) throws Exception {
		return crudMapper.selectCrudListCnt(vo);
	}
	
}
