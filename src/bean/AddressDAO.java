package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AddressDAO {

	public ArrayList<AddressDTO> selectAll(AddressDTO dto) throws Exception {
	
		ArrayList<AddressDTO> list = new ArrayList();
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "select distinct address1 from address";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			dto = new AddressDTO();
					
			dto.setAddress1(rs.getString(1));
						
			list.add(dto);
			
		}

		rs.close();
		ps.close();
		con.close();

		return list;
		
	}
	
	public ArrayList<AddressDTO> selectAll2(AddressDTO dto) throws Exception {
		
		ArrayList<AddressDTO> list = new ArrayList();
		
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "select distinct address2 from address where address1=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getAddress1());
		
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			dto = new AddressDTO();
					
			dto.setAddress2(rs.getString(1));
			
			list.add(dto);
			
		}

		rs.close();
		ps.close();
		con.close();

		return list;
		
	}
	
}
