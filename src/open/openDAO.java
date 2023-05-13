package open;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import cctv.cctvBean;
import open.openBean;

public class openDAO {
	private Connection conn;
	private ResultSet rs;

	public openDAO() {
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

	// OpenHistory 데이터 삽입
	public void insertOpenHistory(openBean openHistory) throws SQLException {
		PreparedStatement pstmt = null;

		try {
			String sql = "INSERT INTO open_history (id, trash_can_id) VALUES (?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, openHistory.getId());
			pstmt.setString(2, openHistory.getTrashCanId());

			pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}

	// OpenHistory 목록 조회
	public List<openBean> selectOpenHistoryList() throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<openBean> openHistoryList = new ArrayList<>();

		try {
			String sql = "SELECT * FROM open_history";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				openBean openHistory = new openBean();
				openHistory.setIdx(rs.getInt("idx"));
				openHistory.setId(rs.getString("id"));
				openHistory.setTrashCanId(rs.getString("trash_can_id"));
				openHistory.setOpenTime(rs.getTimestamp("open_time"));
				openHistoryList.add(openHistory);
			}
		} finally {
			if (rs != null) {
				rs.close();
			}

			if (pstmt != null) {
				pstmt.close();
			}
		}

		return openHistoryList;
	}

	public int getNext() {
		String SQL = "SELECT idx FROM open_history ORDER BY idx DESC";
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

	public ArrayList<openBean> getList(int pageNumber) {
		String SQL = "SELECT * FROM open_history WHERE idx < ? ORDER BY idx DESC LIMIT 10";
		ArrayList<openBean> list = new ArrayList<openBean>();
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				openBean ccb = new openBean();	
				ccb.setIdx(rs.getInt(1));
				ccb.setId(rs.getString(2));
				ccb.setTrashCanId(rs.getString(3));
				ccb.setOpenTime(rs.getTimestamp(4));
				list.add(ccb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getCount() {
		String SQL = "SELECT COUNT(*) FROM open_history";
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

}
