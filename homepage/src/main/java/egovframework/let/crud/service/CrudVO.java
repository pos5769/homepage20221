package egovframework.let.crud.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;


public class CrudVO extends ComDefaultVO implements Serializable {

	private String crudId; //CRUD ID
	private String crudSj; //제목
	private String crudCn; //내용
	private String userNm; //작성자
	private java.util.Date frstRegistPnttm; //작성일
	
	public String getCrudId() {
		return crudId;
	}
	
	public void setCrudId(String crudId) {
		this.crudId = crudId;
	}
	
	public String getCrudSj() {
		return crudSj;
	}
	
	public void setCrudSj(String crudSj) {
		this.crudSj = crudSj;
	}
	
	public String getCrudCn() {
		return crudCn;
	}
	
	public void setCrudCn(String crudCn) {
		this.crudCn = crudCn;
	}
	
	public String getUserNm() {
		return userNm;
	}
	
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	
	public java.util.Date getFrstRegistPnttm() {
		return frstRegistPnttm;
	}
	
	public void setFrstRegistPnttm(java.util.Date frstRegistPnttm) {
		this.frstRegistPnttm = frstRegistPnttm;
	}

}