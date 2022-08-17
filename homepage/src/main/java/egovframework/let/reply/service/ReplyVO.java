package egovframework.let.reply.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplyVO {
	
	private int repNo;
	private String repContent;
	private String repWriter;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
	private Date repRegDate;
	private String repBbsNo;
	
	public int getRepNo() {
		return repNo;
	}
	public void setRepNo(int repNo) {
		this.repNo = repNo;
	}
	public String getRepContent() {
		return repContent;
	}
	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}
	public String getRepWriter() {
		return repWriter;
	}
	public void setRepWriter(String repWriter) {
		this.repWriter = repWriter;
	}
	public Date getRepRegDate() {
		return repRegDate;
	}
	public void setRepRegDate(Date repRegDate) {
		this.repRegDate = repRegDate;
	}
	public String getRepBbsNo() {
		return repBbsNo;
	}
	public void setRepBbsNo(String repBbsNo) {
		this.repBbsNo = repBbsNo;
	}
	
}
