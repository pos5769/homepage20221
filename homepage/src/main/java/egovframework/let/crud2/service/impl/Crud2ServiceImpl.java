package egovframework.let.crud2.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.crud2.service.Crud2Service;
import egovframework.let.crud2.service.Crud2VO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("crud2Service")
public class Crud2ServiceImpl extends EgovAbstractServiceImpl implements Crud2Service {
	
	@Resource(name="crud2Mapper")
	private Crud2Mapper crud2Mapper;
    
    @Resource(name="egovCrudIdGnrService")
    private EgovIdGnrService idgenService;
    
	@Override
	public Crud2VO selectCrud(Crud2VO vo) throws Exception {

		return crud2Mapper.selectCrud(vo);
	}
	
	public List<EgovMap> selectCrudList(Crud2VO vo) throws Exception {
		return crud2Mapper.selectCrudList(vo);
	}
	
	public String insertCrud(Crud2VO vo) throws Exception {
		String id = idgenService.getNextStringId();
		vo.setCrudId(id);
		crud2Mapper.insertCrud(vo);
		return id;
	}
	
	public void updateCrud(Crud2VO vo) throws Exception {
		crud2Mapper.updateCrud(vo);
	}
	
	public void deleteCrud(Crud2VO vo) throws Exception {
		crud2Mapper.deleteCrud(vo);
	}
	
	public int selectCrudListCnt(Crud2VO vo) throws Exception {
		return crud2Mapper.selectCrudListCnt(vo);
	}
}
