package bean;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	public void insert(UserDTO dto) throws Exception {

		// 2. DB처리
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		
		// 3) SQL문 객체화
		String sql = "insert into user (regnum, mid, storename, postcode, roadaddress, detailaddress, type, ssize, sinfo, simgsrc) values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getRegNum());
		ps.setString(2, dto.getMid());
		ps.setString(3, dto.getStorename());
		ps.setString(4, dto.getPostcode());
		ps.setString(5, dto.getRoadAddress());
		ps.setString(6, dto.getDetailAddress());
		ps.setString(7, dto.getType());
		ps.setString(8, dto.getsSize());
		ps.setString(9, dto.getsInfo());
		ps.setString(10, dto.getsImgsrc());
		
		// 4) SQL문 실행 요청
		ps.execute();

		ps.close();
		con.close();

	}
		
	public UserDTO check(UserDTO dto) throws Exception {
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "select * from user where mid=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getMid());

		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			
			dto.setRegNum(rs.getString(1));
			dto.setMid(rs.getString(2));
			dto.setStorename(rs.getString(3));
			dto.setPostcode(rs.getString(4));
			dto.setRoadAddress(rs.getString(5));
			dto.setDetailAddress(rs.getString(6));
			dto.setType(rs.getString(7));
			dto.setsSize(rs.getString(8));
			dto.setsInfo(rs.getString(9));
			dto.setsImgsrc(rs.getString(10));
			
				
		}

		rs.close();
		ps.close();
		con.close();

		return dto;
		
	}
	
	public void delete(UserDTO dto) throws Exception {
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "delete from user where regNum=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getRegNum());

		ps.execute();

		ps.close();
		con.close();

	}
	
	public void update(UserDTO dto) throws Exception {
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "update user set regNum=?, storename=?, postcode=?, roadaddress=?, detailaddress=?, type=?, ssize=?, sinfo=?, simgsrc=? where regNum = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getRegNum());
		ps.setString(2, dto.getStorename());
		ps.setString(3, dto.getPostcode());
		ps.setString(4, dto.getRoadAddress());
		ps.setString(5, dto.getDetailAddress());
		ps.setString(6, dto.getType());
		ps.setString(7, dto.getsSize());
		ps.setString(8, dto.getsInfo());
		ps.setString(9, dto.getsImgsrc());
		ps.setString(10, dto.getRegNum());
		
		ps.execute();

		ps.close();
		con.close();

	}
	
}
