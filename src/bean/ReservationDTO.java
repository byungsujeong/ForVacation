package bean;

import java.sql.Timestamp;

public class ReservationDTO {
	
	String resnum;
	String regnum;
	int wnum;
	String resdate;
	String type;
	String etc;
	String state;
	Timestamp kdate;
	int resgroup;
	
	public String getResnum() {
		return resnum;
	}
	public void setResnum(String resnum) {
		this.resnum = resnum;
	}
	public String getRegnum() {
		return regnum;
	}
	public void setRegnum(String regnum) {
		this.regnum = regnum;
	}
	public int getWnum() {
		return wnum;
	}
	public void setWnum(int wnum) {
		this.wnum = wnum;
	}
	public String getResdate() {
		return resdate;
	}
	public void setResdate(String resdate) {
		this.resdate = resdate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Timestamp getKdate() {
		return kdate;
	}
	public void setKdate(Timestamp kdate) {
		this.kdate = kdate;
	}
	public int getResgroup() {
		return resgroup;
	}
	public void setResgroup(int resgroup) {
		this.resgroup = resgroup;
	}
	
}
