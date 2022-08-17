package egovframework.let.crud2.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface Crud2Service {
	
	public Crud2VO selectCrud(Crud2VO vo) throws Exception;
	
	public List<EgovMap> selectCrudList(Crud2VO vo) throws Exception;
	
	public String insertCrud(Crud2VO vo) throws Exception;
	
	public void updateCrud(Crud2VO vo) throws Exception;
	
	public void deleteCrud(Crud2VO vo) throws Exception;
	
	public int selectCrudListCnt(Crud2VO vo) throws Exception;
}
