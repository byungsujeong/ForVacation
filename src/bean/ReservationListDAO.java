//BbsDAO.java

package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReservationListDAO {
	
	
	public void acceptupdate(ReservationDTO dto) throws Exception {
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		
		String sql = "update reservation set state=? where wnum=? and resnum=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getState());
		ps.setInt(2, dto.getWnum());
		ps.setString(3, dto.getResnum());
		
		// 4) SQL문 실행 요청
		ps.executeUpdate();
		System.out.println("상태변경완료");
		
		ps.close();
		con.close();
	}//예약수락
	
	public void refuseupdate(ReservationDTO dto) throws Exception {
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		System.out.println("rdao DB연결 완료..");
		
		String sql = "update reservation set state=? where wNum=? and resNum=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getState());
		ps.setInt(2, dto.getWnum());
		ps.setString(3, dto.getResnum());
		System.out.println("rdao 3. sql문 객체화 ok..");
		
		// 4) SQL문 실행 요청
		ps.execute();
		System.out.println("rdao 4. sql문 실행 요청 ok..");
		
		ps.close();
		con.close();
	}//예약거절

	/*public ArrayList<ReservationListDTO> select(ReservationListDTO dto) throws Exception {

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		System.out.println("DB연결 완료..");

		String sql = "select * from reservationlist where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		System.out.println("3. sql문 객체화 ok..");

		// 4) SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 실행 요청 ok.. select");
		ReservationListDTO dto2 = null;
		ArrayList<ReservationListDTO> list = new ArrayList<ReservationListDTO>();
		while (rs.next()) {
			dto2 = new ReservationListDTO();
			dto2.setId(rs.getString(2));
			dto2.setCheckdate(rs.getString(3));
			dto2.setContent(rs.getString(4));
			list.add(dto2);
		}
		System.out.println("5. list 삽입 완료");
		return list;
	} */
	
	  public ArrayList<ReservationDTO> selectAll(ReservationDTO dto) throws Exception {
	  
	  DBConnectionMgr mgr = DBConnectionMgr.getInstance(); 
	  Connection con = mgr.getConnection(); 
	  System.out.println("DB연결 완료..");
	  
	  String sql = "select * from reservation where wNum=?"; 
	  PreparedStatement ps = con.prepareStatement(sql); 
	  ps.setInt(1, dto.getWnum());
	  System.out.println("3. sql문 객체화 ok..");
	  
	  // 4) SQL문 실행 요청 
	  ResultSet rs = ps.executeQuery();
	  System.out.println("4. sql문 실행 요청 ok.."); 
	  ReservationDTO dto2 = null;
	  ArrayList<ReservationDTO> list = new ArrayList<ReservationDTO>(); 
	  while(rs.next()) { 
	  dto2 = new ReservationDTO(); 
	  dto2.setResnum(rs.getString(1));
	  dto2.setRegnum(rs.getString(2)); 
	  dto2.setWnum(rs.getInt(3));
	  dto2.setResdate(rs.getString(4));
	  dto2.setType(rs.getString(5));
	  dto2.setEtc(rs.getString(6));
	  dto2.setState(rs.getString(7));
	  dto2.setKdate(rs.getTimestamp(8));
	  dto2.setResgroup(rs.getInt(9));
	  list.add(dto2); 
	  } 
	  return list; 
	 }
	  
	  public ArrayList<ReservationDTO> selectAllU(ReservationDTO dto) throws Exception {
		  
		  DBConnectionMgr mgr = DBConnectionMgr.getInstance(); 
		  Connection con = mgr.getConnection(); 
		  
		  String sql = "select * from reservation where regnum=?"; 
		  PreparedStatement ps = con.prepareStatement(sql); 
		  ps.setString(1, dto.getRegnum());
		  
		  // 4) SQL문 실행 요청 
		  ResultSet rs = ps.executeQuery();
		  System.out.println("예약리스트 사용자 요청"); 
		  ReservationDTO dto2 = null;
		  ArrayList<ReservationDTO> list = new ArrayList<ReservationDTO>(); 
		  while(rs.next()) { 
			  dto2 = new ReservationDTO(); 
			  dto2.setResnum(rs.getString(1));
			  dto2.setRegnum(rs.getString(2)); 
			  dto2.setWnum(rs.getInt(3));
			  dto2.setResdate(rs.getString(4));
			  dto2.setType(rs.getString(5));
			  dto2.setEtc(rs.getString(6));
			  dto2.setState(rs.getString(7));
			  dto2.setKdate(rs.getTimestamp(8));
			  dto2.setResgroup(rs.getInt(9));
			  list.add(dto2); 
		  } 
		  return list; 
	  }
}
