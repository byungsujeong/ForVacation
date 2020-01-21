package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ReservationDAO {

	public void insert(ReservationDTO dto) throws Exception {

		// 2. DB처리
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		// 3) SQL문 객체화
		String sql = "insert into reservation values(?,?,?,?,?,?,?,now(),?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getResnum());
		ps.setString(2, dto.getRegnum());
		ps.setInt(3, dto.getWnum());
		ps.setString(4, dto.getResdate());
		ps.setString(5, dto.getType());
		ps.setString(6, dto.getEtc());
		ps.setString(7, dto.getState());
		ps.setInt(8, dto.getResgroup());

		// 4) SQL문 실행 요청
		ps.execute();

		ps.close();
		con.close();

	}
		
	public ReservationDTO firstRow(ReservationDTO dto) throws Exception {

		// 2. DB처리
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		// 3) SQL문 객체화
		String sql = "select resgroup from reservation order by kdate desc limit 1";
		PreparedStatement ps = con.prepareStatement(sql);
		
		// 4) SQL문 실행 요청
		ResultSet rs =  ps.executeQuery();

		if(rs.next()) {
			
			dto.setResgroup(rs.getInt(1));;
			
		}
		
		rs.close();
		ps.close();
		con.close();

		return dto;
		
	}
	
}
