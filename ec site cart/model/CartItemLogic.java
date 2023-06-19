package model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartItemLogic {

	public List<Integer> cartItemList(HttpServletRequest request, HttpServletResponse response, List<Integer> price) throws Exception {
		HttpSession session = request.getSession();//セッションスコープ開始
		List<String> send_cart_itemid_list = (ArrayList<String>)session.getAttribute("send_cart_itemid_list");

		ItemDAO iDao = new ItemDAO();
		iDao.findCartListItem(price, send_cart_itemid_list);
		session.setAttribute("price", price);

		return price;
	}

	public void cartItemAllDelete(List<String> send_cart_itemid_list) {
		send_cart_itemid_list.clear();
	}
}
