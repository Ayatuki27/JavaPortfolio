package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ItemDAO {
	private final String RDB = "com.mysql.cj.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/eclat_db?serverTimezone=JST";
	private final String JDBC_ID = "root";
	private final String JDBC_PASS = "root";

	public void findAll(List<String> itemid, List<Integer> itemprice){
		try {
			Class.forName(RDB);
			Connection conn;
			conn = DriverManager.getConnection(JDBC_URL, JDBC_ID, JDBC_PASS);

			String sql = "SELECT ITEMID_C, PRICE_C FROM item_t";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				itemid.add(rs.getString("ITEMID_C"));
				itemprice.add(rs.getInt("PRICE_C"));
			}

			conn.close();

		}
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void findCategoryAll(List<String> itemid, List<Integer> itemprice, String categoryid){
		try {
			Class.forName(RDB);
			Connection conn;
			conn = DriverManager.getConnection(JDBC_URL, JDBC_ID, JDBC_PASS);

			String sql = "SELECT ITEMID_C, PRICE_C FROM item_t WHERE CATEGORYID_C=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, categoryid);

			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				itemid.add(rs.getString("ITEMID_C"));
				itemprice.add(rs.getInt("PRICE_C"));
			}

			conn.close();

		}
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void findCartListItem(List<Integer> price, List<String> send_cart_itemid_list) throws Exception {
		Class.forName(RDB);
		Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_ID, JDBC_PASS);

		for(int i = 0; i < send_cart_itemid_list.size(); i++) {
			String sql = "SELECT * FROM item_t WHERE itemid_c=?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, send_cart_itemid_list.get(i));
			ResultSet rs = pStmt.executeQuery();

			while(rs.next()) {
				int a = rs.getInt(2);
				price.add(a);
			}
		}
	}
}
