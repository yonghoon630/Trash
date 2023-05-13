package cctv;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import bbs.Bbs;

public class cctvDAO {
	private Connection conn;
	private ResultSet rs;

	public cctvDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/micom";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void saveCctvData(cctvBean cctvData) throws SQLException {
		String SQL = "INSERT INTO cctv_data (cctv_file) VALUES (?)";
		try {
			PreparedStatement stmt = conn.prepareStatement(SQL);
			stmt.setString(1, cctvData.getCctvFile());
			stmt.executeUpdate();
			ResultSet rs = stmt.getGeneratedKeys();
			if (rs.next()) {
				cctvData.setId(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public cctvBean getCctvDataById(int id) throws SQLException {
		String sql = "SELECT * FROM cctv_data WHERE id=?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				Timestamp cctvData = rs.getTimestamp("cctv_data");
				String cctvFile = rs.getString("cctv_file");
				return new cctvBean(id, cctvData, cctvFile);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<cctvBean> getAllCctvData() throws SQLException {
		List<cctvBean> cctvDataList = new ArrayList<>();
		String sql = "SELECT * FROM cctv_data";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int id = rs.getInt("id");
				Timestamp cctvData = rs.getTimestamp("cctv_data");
				String cctvFile = rs.getString("cctv_file");
				cctvDataList.add(new cctvBean(id, cctvData, cctvFile));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cctvDataList;
	}

	public int getNext() {
		String SQL = "SELECT id FROM cctv_data ORDER BY id DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 1;
	}

	public ArrayList<cctvBean> getList(int pageNumber) {
		String SQL = "SELECT * FROM cctv_data WHERE id < ? ORDER BY id DESC LIMIT 10";
		ArrayList<cctvBean> list = new ArrayList<cctvBean>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cctvBean ccb = new cctvBean();
				ccb.setId(rs.getInt(1));
				ccb.setCctvData(rs.getDate(2));
				ccb.setCctvFile(rs.getString(3));
				list.add(ccb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<cctvBean> searchList(int pageNumber, String search) {
		String SQL = "SELECT * FROM cctv_data WHERE id < ? AND (DATE(cctv_data) LIKE ?) ORDER BY id DESC LIMIT 10";
		ArrayList<cctvBean> cctvDataList1 = new ArrayList<cctvBean>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			pstmt.setString(2, "%" + search + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cctvBean cctv = new cctvBean();
				cctv.setId(rs.getInt(1));
				cctv.setCctvData(rs.getDate(2));
				cctv.setCctvFile(rs.getString(3));
				cctvDataList1.add(cctv);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cctvDataList1;
	}

	public int getCount() {
		String SQL = "SELECT COUNT(*) FROM cctv_data";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int getCount(String search) {
		String SQL = "SELECT COUNT(*) FROM cctv_data WHERE DATE(cctv_data) LIKE ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public void deleteCctvData(int id) throws SQLException {
		String sql = "DELETE FROM cctv_data WHERE id=?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
