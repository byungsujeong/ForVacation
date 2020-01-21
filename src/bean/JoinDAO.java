package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.MemberDTO;

public class JoinDAO {
			
	public ArrayList<JoinDTO> search(JoinDTO dto) throws Exception {

		ArrayList<JoinDTO> list = new ArrayList();
		//2. DB 로 전송한다.
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		
		//3) sql문 객체화
		String sql;
		PreparedStatement ps;
		if(dto.getAddress2().equals("전체")) {
			sql = "select wnum, mid, image from worker where address1=? and (type1=? or type2=? or type3=?) and mid not in (select mid from calendarlist where checkdate between ? and ?)";			
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getAddress1());
			ps.setString(2, dto.getType1());
			ps.setString(3, dto.getType1());
			ps.setString(4, dto.getType1());
			ps.setString(5, dto.getStartdate());
			ps.setString(6, dto.getEnddate());
		}else{
			sql = "select wnum, mid, image from worker where address1=? and address2=? and (type1=? or type2=? or type3=?) and mid not in (select mid from calendarlist where checkdate between ? and ?)";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, dto.getAddress1());
			ps.setString(2, dto.getAddress2());			
			ps.setString(3, dto.getType1());
			ps.setString(4, dto.getType1());
			ps.setString(5, dto.getType1());
			ps.setString(6, dto.getStartdate());
			ps.setString(7, dto.getEnddate());
		}		
		
		//4) sql문 실행 요청
		ResultSet rs = ps.executeQuery();	
		
		while (rs.next()) {
			dto = new JoinDTO();
			System.out.println(rs.getInt(1));
			//ORM ( object : 자바 rdb : table항목 mapping)
			dto.setWnum(rs.getInt(1));
			dto.setMid(rs.getString(2));
			dto.setImage(rs.getString(3));
				
			list.add(dto);
		}
		
		rs.close();
		ps.close();
		con.close();
		return list;
		
	}
	
}
