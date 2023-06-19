<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.MemberBean" %>
<%
	MemberBean memberbean = (MemberBean)session.getAttribute("memberbean");
	List<String> send_cart_itemid_list = (ArrayList<String>)session.getAttribute("send_cart_itemid_list");
	List<Integer> price = (ArrayList<Integer>)session.getAttribute("price");
	String error_msg = (String)request.getAttribute("error_msg");
	int pricetotal = 0;
	int tax = 0;
	int priceintax = 0;
	if(send_cart_itemid_list != null) {
		if(send_cart_itemid_list.size() > 0) {
			pricetotal = (int)request.getAttribute("pricetotal");
			tax = (int)request.getAttribute("tax");
			priceintax = (int)request.getAttribute("priceintax");
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>カート｜éclat ONLINE STORE</title>
	<link rel="stylesheet" href="/eclat/css/cartstyle.css">
	<link rel="stylesheet" type="text/css" href="/eclat/css/common.css">

</head>
<body>

<!-- ここからヘッダー -->
<header class="header">
	<a href="index.html"><img src="/eclat/images/eclat_logo.png"></a>

	<div class="index">
		<form action="/eclat/Cart" method="post" name="form1">
		<input type="hidden" name="cart_session" value="view">
		<a href="javascript:form1.submit()"><img src="/eclat/images/cart.png"></a>
		</form>
		<a href="/eclat/LoginServlet"><img src="/eclat/images/account.png"></a>
	</div>

	<hr>
</header>
<!-- ここまでヘッダー -->


	<% if(send_cart_itemid_list == null || send_cart_itemid_list.size() == 0) { %>
		<p class="imgtitle1">カート内ページ</p>
		<hr><br><br><main>
		<h2>ショッピングカートに商品がありません</h2></main>
		<% } else { %>
		<% if(memberbean != null) { %>
		<p class="imgtitle4">ショッピングカート</p>
		<hr><br><br><main>
			<% if(error_msg == "none") { %>
				<h2>削除する商品が選択されていません</h2>
			<% } %>

			<div id="column"><h2>商品詳細</h2></div>
			<form action="/eclat/Cart" method="post">
				<input type="hidden" name="cart_session" value="delete">
				<table class="table">
				<% for(int i = 0; i < price.size(); i++) { %>
					<tr>
						<td rowspan="3" align="center" valign="middle"><img src="/eclat/images/<%= send_cart_itemid_list.get(i) %>.jpg" width="100" height="100" style="display:block:margin-left:auto:margin-right:0"></td>
						<td>・<%= send_cart_itemid_list.get(i) %></td>
					</tr>

					<tr>
						<td valign="top">
							￥<%= price.get(i) %> <small>税抜</small></td>
						<td valign="top">
						<div class="pos">
							<input type="radio" name="iiddelete" value="<%= i %>" >
							<input type="submit" value="削除する"></div>
						</td>
					</tr>

					<tr><td></td></tr>

				<% } %>
				</table>

			</form>
			<div id="column"><h2>お支払い金額</h2></div>
			<table class="table"><main>
				<tr>
					<td>小計(税抜)</td> <td class="pos">￥<%= pricetotal %> </td>
				</tr>
				<tr>
					<td>消費税(10%)</td> <td class="pos">￥<%= tax %> </td>
				</tr>
				<tr>
					<td>合計金額</td> <td class="pos">￥<%= priceintax %> </td>
				</tr>
			</table>

			<form action="/eclat/Cart" method="post">
			<div id="column"><h2>ラッピング</h2></div>
			<table class="table">
				<tr>
					<td><input type="checkbox" id="lapping" name="lapping" value="yes">
					<label for="lapping">ラッピングを希望する</label></td>
				</tr>
			</table>

			<div id="column"><h2>支払方法</h2></div>
			<table class="table">
				<tr><td>
				<input type="radio" id="pay" name="paytype" value="1" checked>
				<label for="pay">バーコード支払い</label></td></tr>
				<tr><td>
				<input type="radio" id="pay" name="paytype" value="2">
				<label for="pay">コンビニ支払い</label></td></tr>
				<tr><td>
				<input type="radio" id="pay" name="paytype" value="3">
				<label for="pay">代引き</label></td></tr>
				<tr><td>
				<input type="radio" id="pay" name="paytype" value="4">
				<label for="pay">クレジット決済</label></td></tr>
				<tr><td>
				<input type="radio" id="pay" name="paytype" value="5">
				<label for="pay">銀行振込</label></td></tr>
			</table>

			<table class="btn" align="center" width="100%">
			<input type="hidden" name="priceintax" value="<%= priceintax %>"><br>
			<input type="hidden" name="cart_session" value="confirm"><br>
			<td><input id="submit" type="submit" name="command" value="確認画面へ進む"></td>
			</table>
			</form></main>
		<% } else { %>


		<p class="imgtitle4">ショッピングカート</p>
		<hr><br><br><main>
		<div id="column"><h2>商品詳細</h2></div>
			<% if(error_msg == "none") { %>
				<h2>削除する商品が選択されていません</h2>
			<% } %>
			<form action="/eclat/Cart" method="post">
				<input type="hidden" name="cart_session" value="delete">
				<table class="table">
				<% for(int i = 0; i < price.size(); i++) { %>
					<tr>
						<td rowspan="3" align="center" valign="middle"><img src="/eclat/images/<%= send_cart_itemid_list.get(i) %>.jpg" width="100" height="100" style="display:block:margin-left:auto:margin-right:0"></td>
						<td>・<%= send_cart_itemid_list.get(i) %></td>
					</tr>

					<tr>
						<td valign="top">
							￥<%= price.get(i) %> <small>税抜</small></td>
						<td valign="top">
						<div class="pos">
							<input type="radio" name="iiddelete" value="<%= i %>" >
							<input type="submit" value="削除する"></div>
						</td>
					</tr>

					<tr><td></td></tr>

				<% } %>
				</table></main>
			</form>
		<% } %>
	<% } %>
<br><main>
	<form action="/eclat/" method="get">
	<table class="btn" align="center" width="100%">
	<td><input id="submit" type="submit" name="command" value="ショッピングを続ける"></td>
	</table>
	</form>

	<% if (memberbean == null) { %>
<br><form action="/eclat/LoginServlet" method="get">
	<table class="btn" align="center" width="100%">
	<td><input id="submit" type="submit" name="command" value="ログインして購入"></td>
	</table>
	</form>

<br><form action="/eclat/MemberRegistServlet" method="get">
	<table class="btn" align="center" width="100%">
	<td><input id="submit" type="submit" name="command" value="新規登録して購入"></td>
	</table>
	</form>

	<% } %>

<br><br>
</main>
<!-- ここからフッター -->

<hr>
<footer>
	<nav class="nav">
		<p>category</p>
			<ul>
				<!-- CategoryShowAllのcategory_check=○に移行 -->
				<!-- URL?変数 -->
				<form action="/eclat/CategoryShowAll" method="post" name="form2">
				<input type="hidden" name="category_check" value="1">
				<li><a href="javascript:form2.submit()">necklace</a></li>
				</form>
				<form action="/eclat/CategoryShowAll" method="post" name="form3">
				<input type="hidden" name="category_check" value="2">
				<li><a href="javascript:form3.submit()">bracelet</a></li>
				</form>
				<form action="/eclat/CategoryShowAll" method="post" name="form4">
				<input type="hidden" name="category_check" value="3">
				<li><a href="javascript:form4.submit()">piarce</a></li>
				</form>
			</ul>

		<p>information</p>
			<ul>
				<li><a href="wrapping.html">ラッピングについて</a></li>
				<li><a href="delivery.html">配送について</a></li>
				<li><a href="exchangereturn.html">返品、交換について</a></li>
				<li><a href="/eclat/SousinServlet">お問い合わせ</a></li>
			</ul>
	</nav>
<br>
	<hr>
	<h4>Copyright&copy; 2023 éclat Corporation. All rights reserved.</h4>
</footer>
<!-- ここまでフッター -->


</body>
</html>