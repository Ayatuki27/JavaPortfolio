package model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * カートの中身を選択削除
 */
@WebServlet("/CartDelete")
public class CartDeleteLogic {

	public void cartDelete(HttpServletRequest request, HttpServletResponse response, int delete_cart_item) {
		HttpSession session = request.getSession();
		List<String> send_cart_itemid_list = (ArrayList<String>)session.getAttribute("send_cart_itemid_list");
		List<Integer> price = (ArrayList)session.getAttribute("price");

		send_cart_itemid_list.remove(delete_cart_item);
		price.remove(delete_cart_item);

		session.setAttribute("send_cart_itemid_list", send_cart_itemid_list);
		session.setAttribute("price", price);
	}

	public void cartDeleteNL(HttpServletRequest request, HttpServletResponse response, int delete_cart_item) { //未ログイン時の処理
		HttpSession session = request.getSession();
		List<String> send_cart_itemid_list = (ArrayList<String>)session.getAttribute("send_cart_itemid_list");

		send_cart_itemid_list.remove(delete_cart_item);

		session.setAttribute("send_cart_itemid_list", send_cart_itemid_list);
	}
}
