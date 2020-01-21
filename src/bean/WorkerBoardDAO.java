package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class WorkerBoardDAO {

	public void insert(WorkerBoardDTO dto) throws Exception {

		// 2. DB처리
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		// 3) SQL문 객체화
		String sql = "insert into workerboard (resnum, wnum, mid, rating, wrcontent, wrdate) values(?,?,?,?,?,now())";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getResnum());
		ps.setInt(2, dto.getWnum());
		ps.setString(3, dto.getMid());
		ps.setDouble(4, dto.getRating());
		ps.setString(5, dto.getWrcontent());

		// 4) SQL문 실행 요청
		ps.execute();

		ps.close();
		con.close();

	}
	
	public ArrayList<WorkerBoardDTO> selectAll(WorkerBoardDTO dto) throws Exception {

		ArrayList<WorkerBoardDTO> list = new ArrayList();
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "select wrid, mid, rating, wrcontent from workerboard where wnum=? order by wrdate desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getWnum());
		
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			dto = new WorkerBoardDTO();
			
			dto.setWrid(rs.getInt(1));
			dto.setMid(rs.getString(2));
			dto.setRating(rs.getDouble(3));
			dto.setWrcontent(rs.getString(4));
			
			list.add(dto);
		}

		rs.close();
		ps.close();
		con.close();

		return list;
		
	}
	
	public WorkerBoardDTO selectRating(WorkerBoardDTO dto) throws Exception {

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "select avg(rating) from workerboard where wnum=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getWnum());
		
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			
			dto.setAvg(rs.getDouble(1));
			
		}

		rs.close();
		ps.close();
		con.close();

		return dto;
		
	}
	
	public WorkerBoardDTO key(WorkerBoardDTO dto) throws Exception {

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "select wrid from workerboard order by wrid desc limit 1";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			
			dto.setWrid(rs.getInt(1));
			
		}

		rs.close();
		ps.close();
		con.close();

		return dto;
		
	}
	
	public void delete(WorkerBoardDTO dto) throws Exception {

		// 2. DB처리
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		// 3) SQL문 객체화
		String sql = "delete from workerboard where wrid=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getWrid());

		// 4) SQL문 실행 요청
		ps.execute();

		ps.close();
		con.close();

	}	
	
	public WorkerBoardDTO select(WorkerBoardDTO dto) throws Exception {

		ArrayList<WorkerBoardDTO> list = new ArrayList();
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "select mid from workerboard where wrid=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getWrid());
		
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			
			dto.setMid(rs.getString(1));
			
		}

		rs.close();
		ps.close();
		con.close();

		return dto;
		
	}
	
}
