package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartDeleteLogic;
import model.CartItemLogic;
import model.ClacLogic;

@WebServlet("/Cart")
public class Cart extends HttpServlet {
	private String forward; //フィールド値は必要ないが、initメソッドの学習の為

	public void init() throws ServletException { //インスタンス化時に実行。学習の為に実装しただけ
		forward = "/index.html";
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		List<String> send_cart_itemid_list = (ArrayList<String>)session.getAttribute("send_cart_itemid_list");
		List<Integer> price = new ArrayList<>();
		String cart_session = (String)request.getParameter("cart_session");
		String iiddelete = (String)request.getParameter("iiddelete");

		CartItemLogic cartitem = new CartItemLogic();
		ClacLogic clacLogic = new ClacLogic();

		if(send_cart_itemid_list == null || send_cart_itemid_list.size() == 0) {
			forward = "/WEB-INF/view/cart.jsp";
		}
		else if(cart_session.equals("view")) {
			try {
				cartitem.cartItemList(request, response, price);
				clacLogic.priceClac(price);

				int pricetotal = clacLogic.getPriceTotal();
				int tax = clacLogic.getTax();
				int priceintax = clacLogic.getPriceInTax();

				request.setAttribute("pricetotal", pricetotal);
				request.setAttribute("tax", tax);
				request.setAttribute("priceintax", priceintax);

				forward = "/WEB-INF/view/cart.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(cart_session.equals("delete")) {
			if(iiddelete != null) {
				Integer i = Integer.valueOf(iiddelete);
				int delete_cart_item = i;
				CartDeleteLogic cdl = new CartDeleteLogic();
				cdl.cartDelete(request, response, delete_cart_item);
			}
			else {
				request.setAttribute("error_msg", "none");
			}
			forward = "/Cart?cart_session=view";
		}
		else if(cart_session.equals("confirm")) {
			try {
				cartitem.cartItemList(request, response, price);

				clacLogic.priceClac(price);

				int pricetotal = clacLogic.getPriceTotal();
				int tax = clacLogic.getTax();
				int priceintax = clacLogic.getPriceInTax();

				request.setAttribute("pricetotal", pricetotal);
				request.setAttribute("tax", tax);
				request.setAttribute("priceintax", priceintax);

				request.setAttribute("lapping", request.getParameter("lapping"));
				request.setAttribute("paytype", request.getParameter("paytype"));
				forward = "/WEB-INF/view/cartbuyconfirm.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(cart_session.equals("buyend")) {
			cartitem.cartItemAllDelete(send_cart_itemid_list);
			forward = "/WEB-INF/view/cartfinish.jsp";
		}

		request.getRequestDispatcher(forward).forward(request, response);

/* 旧コード */
/*		request.setCharacterEncoding("UTF-8");
		MemberBean memberbean = new MemberBean();

		HttpSession session = request.getSession();//セッションスコープ開始
		memberbean = (MemberBean)session.getAttribute("memberbean");
		List<String> send_cart_itemid_list = (ArrayList<String>)session.getAttribute("send_cart_itemid_list");
		String cart_session = (String)request.getParameter("cart_session");//URLクエリ
		CartItemLogic cartitem = new CartItemLogic();
		String iiddelete = (String)request.getParameter("iiddelete");

		//未ログイン時の処理
		if(memberbean == null) {
			if(iiddelete != null) {
				Integer i = Integer.valueOf(iiddelete);
				int delete_cart_item = i;
				CartDeleteLogic cdl = new CartDeleteLogic();
				cdl.cartDeleteNL(request, response, delete_cart_item);
			}
			else if(cart_session.equals("delete")) {
				request.setAttribute("msg", "none");
			}
			forward = "/WEB-INF/view/cartview.jsp";
		}
		//ログイン中の処理
		else {
			if(send_cart_itemid_list == null || send_cart_itemid_list.size() == 0) { //カートにitemの配列自体がない
				forward = "/WEB-INF/view/cartview.jsp";
			}
			else if(cart_session.equals("view")) { //通常処理
				ClacLogic clacLogic = new ClacLogic();

				try {
					List<Integer> price = new ArrayList<>();
					cartitem.cartItemList(request, response, price);
					clacLogic.priceClac(price);

					int pricetotal = clacLogic.getPriceTotal();
					int tax = clacLogic.getTax();
					int priceintax = clacLogic.getPriceInTax();

					request.setAttribute("pricetotal", pricetotal);
					request.setAttribute("tax", tax);
					request.setAttribute("priceintax", priceintax);

					forward = "/WEB-INF/view/cart.jsp";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(cart_session.equals("delete")) { //削除
				if(iiddelete != null) {
					Integer i = Integer.valueOf(iiddelete);
					int delete_cart_item = i;
					CartDeleteLogic cdl = new CartDeleteLogic();
					cdl.cartDelete(request, response, delete_cart_item);
				}
				else {
					request.setAttribute("msg", "none");
				}
				forward = "/Cart?cart_session=view";
			}
			else if(cart_session.equals("confirm")) { //最終確認
				request.setAttribute("priceintax", request.getParameter("priceintax"));
				request.setAttribute("lapping", request.getParameter("lapping"));
				request.setAttribute("paytype", request.getParameter("paytype"));
				forward = "/WEB-INF/view/cartbuyconfirm.jsp";
			}
			else if(cart_session.equals("buyend")) {
				cartitem.cartItemAllDelete(send_cart_itemid_list);
				forward = "/WEB-INF/view/cartfinish.jsp";
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
		dispatcher.forward(request, response);
*/
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
