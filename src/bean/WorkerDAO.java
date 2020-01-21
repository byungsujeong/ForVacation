package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class WorkerDAO {

	public void insert(WorkerDTO dto) throws Exception {

		// 2. DB처리
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		// 3) SQL문 객체화
		String sql = "insert into worker (mid, type1, period1, type2, period2, type3, period3, address1, address2, wcontent,image) values(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getMid());
		ps.setString(2, dto.getType1());
		ps.setInt(3, dto.getPeriod1());
		ps.setString(4, dto.getType2());
		ps.setInt(5, dto.getPeriod2());
		ps.setString(6, dto.getType3());
		ps.setInt(7, dto.getPeriod3());
		ps.setString(8, dto.getAddress1());
		ps.setString(9, dto.getAddress2());
		ps.setString(10, dto.getWcontent());
		ps.setString(11, dto.getImage());

		// 4) SQL문 실행 요청
		ps.execute();

		ps.close();
		con.close();

	}
	
	public WorkerDTO select(WorkerDTO dto) throws Exception {
	
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "select * from worker where wnum=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getWnum());

		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			
			dto.setWnum(rs.getInt(1));
			dto.setMid(rs.getString(2));
			dto.setType1(rs.getString(3));
			dto.setPeriod1(rs.getInt(4));
			dto.setType2(rs.getString(5));
			dto.setPeriod2(rs.getInt(6));
			dto.setType3(rs.getString(7));
			dto.setPeriod3(rs.getInt(8));
			dto.setAddress1(rs.getString(9));
			dto.setAddress2(rs.getString(10));
			dto.setWcontent(rs.getString(11));
			dto.setImage(rs.getString(12));
				
		}

		rs.close();
		ps.close();
		con.close();

		return dto;
		
	}
	
	public WorkerDTO check(WorkerDTO dto) throws Exception {
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "select * from worker where mid=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getMid());

		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			
			dto.setWnum(rs.getInt(1));
			dto.setMid(rs.getString(2));
			dto.setType1(rs.getString(3));
			dto.setPeriod1(rs.getInt(4));
			dto.setType2(rs.getString(5));
			dto.setPeriod2(rs.getInt(6));
			dto.setType3(rs.getString(7));
			dto.setPeriod3(rs.getInt(8));
			dto.setAddress1(rs.getString(9));
			dto.setAddress2(rs.getString(10));
			dto.setWcontent(rs.getString(11));
			dto.setImage(rs.getString(12));
				
		}

		rs.close();
		ps.close();
		con.close();

		return dto;
		
	}
	
	public void delete(WorkerDTO dto) throws Exception {
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "delete from worker where wnum=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getWnum());

		ps.execute();

		ps.close();
		con.close();

	}
	
	public void update(WorkerDTO dto) throws Exception {
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		
		String sql = "update worker set type1=?, period1=?, type2=?, period2=?, type3=?, period3=?, address1=?, address2=?, wcontent=?, image=? where wnum= ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getType1());
		ps.setInt(2, dto.getPeriod1());
		ps.setString(3, dto.getType2());
		ps.setInt(4, dto.getPeriod2());
		ps.setString(5, dto.getType3());
		ps.setInt(6, dto.getPeriod3());
		ps.setString(7, dto.getAddress1());
		ps.setString(8, dto.getAddress2());
		ps.setString(9, dto.getWcontent());
		ps.setString(10, dto.getImage());
		ps.setInt(11, dto.getWnum());
		
		ps.execute();

		ps.close();
		con.close();

	}
	
}
