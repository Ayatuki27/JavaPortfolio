package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * CartSendServlet
 */
@WebServlet("/CartSendServlet")
public class CartSendServlet extends HttpServlet {

	//リスト作成
		private List<String> send_cart_itemid_list = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("calls doGet()");

		request.setCharacterEncoding("UTF-8");

		String forward = "/WEB-INF/view/categoryview.jsp";

		String senditemid = request.getParameter("senditemid");
		System.out.println("senditemid :" + senditemid);

		//アイテム新規追加
		send_cart_itemid_list.add(senditemid);

		//セッションスコープを使う準備
		HttpSession session = request.getSession();
		session.setAttribute("send_cart_itemid_list", send_cart_itemid_list);

		RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
		dispatcher.forward(request, response);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("calls CartSendServlet");

	}

}
