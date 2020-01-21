//BbsDAO.java

package bean;

import java.sql.*;
import java.util.ArrayList;

public class CalendarListDAO {

	public void insert(CalendarListDTO dto) throws Exception {

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "insert into calendarlist values(null,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getCheckdate());
		ps.setString(3, dto.getContent());

		// 4) SQL문 실행 요청
		ps.execute();
		System.out.println("cdao 4. sql문 실행 요청 ok..");
		System.out.println("예약일정 추가완료");

		ps.close();
		con.close();
	}//휴무입력
	
	public void reservinsert(String id, String checkdate) throws Exception {
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		System.out.println("cdao DB연결 완료..");
		
		String sql = "insert into calendarlist values(null,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, checkdate);
		ps.setString(3, "예약");
		System.out.println("cdao 3. sql문 객체화 ok..");
		
		// 4) SQL문 실행 요청
		ps.execute();
		System.out.println("cdao 4. sql문 실행 요청 ok..");
		
		ps.close();
		con.close();
	}//예약확정입력
	

	public ArrayList<CalendarListDTO> select(CalendarListDTO dto) throws Exception {

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		System.out.println("DB연결 완료..");

		String sql = "select * from calendarlist where mid=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		System.out.println("3. sql문 객체화 ok..");

		// 4) SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		System.out.println("4. sql문 실행 요청 ok.. select");
		CalendarListDTO dto2 = null;
		ArrayList<CalendarListDTO> list = new ArrayList<CalendarListDTO>();
		while (rs.next()) {
			dto2 = new CalendarListDTO();
			dto2.setId(rs.getString(2));
			dto2.setCheckdate(rs.getString(3));
			dto2.setContent(rs.getString(4));
			list.add(dto2);
		}
		System.out.println("5. list 삽입 완료");
		return list;
	}
	
	public boolean selectBefore(CalendarListDTO dto) throws Exception {
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		//System.out.println("DB연결 완료..");
		
		String sql = "select * from calendarlist where mid=? and checkdate=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getCheckdate());
		//System.out.println("3. sql문 객체화 ok..");
		
		// 4) SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		//System.out.println("값 확인");
		if (rs.next()) { 
			//System.out.println("일정 채워져있음");
			return false;	//해당 날짜 값 있으면 진행정지
		} else {
			//System.out.println("일정 비어있음");
			return true;	//해당 날짜 값 없으면 진행 null
		}
	}
	
	

	/*
	 * public ArrayList<CalendarListDTO> selectAll() throws Exception {
	 * 
	 * DBConnectionMgr mgr = DBConnectionMgr.getInstance(); Connection con =
	 * mgr.getConnection(); System.out.println("DB연결 완료..");
	 * 
	 * String sql = "select * from calendarlist"; PreparedStatement ps =
	 * con.prepareStatement(sql); System.out.println("3. sql문 객체화 ok..");
	 * 
	 * // 4) SQL문 실행 요청 ResultSet rs = ps.executeQuery();
	 * System.out.println("4. sql문 실행 요청 ok.."); CalendarListDTO dto2 = null;
	 * ArrayList<CalendarListDTO> list = new ArrayList<CalendarListDTO>(); while
	 * (rs.next()) { dto2 = new CalendarListDTO(); dto2.setId(rs.getString(1));
	 * dto2.setCheckdate(rs.getString(2)); dto2.setContent(rs.getString(3));
	 * list.add(dto2); } return list; }
	 */
}
