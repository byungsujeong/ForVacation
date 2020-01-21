package bean;

import java.sql.Timestamp;

public class WorkerBoardDTO {

	int wrid;
	String resnum;
	int wnum;
	String mid;
	double rating;
	String wrcontent;
	Timestamp wrdate;
	double avg;
	
	public int getWrid() {
		return wrid;
	}
	public void setWrid(int wrid) {
		this.wrid = wrid;
	}
	public String getResnum() {
		return resnum;
	}
	public void setResnum(String resnum) {
		this.resnum = resnum;
	}
	public int getWnum() {
		return wnum;
	}
	public void setWnum(int wnum) {
		this.wnum = wnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getWrcontent() {
		return wrcontent;
	}
	public void setWrcontent(String wrcontent) {
		this.wrcontent = wrcontent;
	}
	public Timestamp getWrdate() {
		return wrdate;
	}
	public void setWrdate(Timestamp wrdate) {
		this.wrdate = wrdate;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	
}
