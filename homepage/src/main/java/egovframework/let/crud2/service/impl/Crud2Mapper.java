package egovframework.let.crud2.service.impl;

import java.util.List;

import egovframework.let.crud2.service.Crud2VO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("crud2Mapper")
public interface Crud2Mapper {
	
	Crud2VO selectCrud(Crud2VO vo) throws Exception;
	
	List<EgovMap> selectCrudList(Crud2VO vo) throws Exception;
	
	void insertCrud(Crud2VO vo) throws Exception;
	
	void updateCrud(Crud2VO vo) throws Exception;
	
	void deleteCrud(Crud2VO vo) throws Exception;
	
	int selectCrudListCnt(Crud2VO vo) throws Exception;	
}
