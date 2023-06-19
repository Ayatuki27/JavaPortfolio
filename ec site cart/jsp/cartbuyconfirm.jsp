<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %>
<%
	List<String> send_cart_itemid_list = (ArrayList<String>)session.getAttribute("send_cart_itemid_list");
	List<Integer> price = (ArrayList<Integer>)session.getAttribute("price");
	int pricetotal = (int)request.getAttribute("pricetotal");
	int tax = (int)request.getAttribute("tax");
	int priceintax = (int)request.getAttribute("priceintax");
	String lapping = (String)request.getAttribute("lapping");
	String paytype = (String)request.getAttribute("paytype");
	LocalDate day = LocalDate.now();
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

	<p class="imgtitle2">ご注文内容の確認</p><hr>
<main>

<br><br>
	<div id="column"><h2>商品詳細</h2></div>
	<form action="/eclat/Cart" method="post">
		<input type="hidden" name="cart_session" value="buyend">
		<table class="table">
				<% for(int i = 0; i < price.size(); i++) { %>
					<tr>
						<td rowspan="3" align="center" valign="middle"><img src="/eclat/images/<%= send_cart_itemid_list.get(i) %>.jpg" width="100" height="100" style="display:block:margin-left:auto:margin-right:0"></td>
						<td>・<%= send_cart_itemid_list.get(i) %></td>
					</tr>

					<tr>
						<td valign="top">
							￥<%= price.get(i) %> <small>税抜</small></td>

					</tr>

					<tr><td></td></tr>

				<% } %>
				</table>
		<div id="column"><h2>お支払金額</h2></div>
		<table class="table">
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
		<div id="column"><h2>ラッピング</h2></div>
		<div class="table">

			<% if(lapping != null){ %>
				ラッピング有り
			<% } else { %>
				ラッピング無し
			<%} %>
		</div>
		<div id="column"><h2>お支払方法</h2></div>
		<div class="table">
		<% if(paytype.equals("1")) { %>
				バーコード支払い
		<% } else if(paytype.equals("2")) { %>
				コンビニ支払い
		<% } else if(paytype.equals("3")) { %>
				代引き
		<% } else if(paytype.equals("4")) { %>
				クレジット決済
		<% } else if(paytype.equals("5")) { %>
				銀行振込
		<% } %>
		</div>

		<div id="column"><h2>お届け日</h2></div>
		<div class="table">
		お届け予定日：
		<%= day.plusDays(4) %></div>
		<br>
		<div class="table2">※購入日より4日後着</div>

		<% for(int i = 0; i < send_cart_itemid_list.size(); i++) { %>
			<input type="hidden" name="id" value="<%= send_cart_itemid_list.get(i) %>">
		<% } %>
		<% if(lapping != null) { %>
			<input type="hidden" name="lapping" value="yes">
		<% } %>
		<input type="hidden" name="paytype" value="<%= paytype %>">
		<p>
		<table class="btn" align="center" width="100%"><br>
		<td><input id="submit" type="submit" name="command" value="購入する"></td>
		</table>
		</form>

		<br>
		<button type="button" onclick="window.history.back();" id="form">カートへ戻る</button>
		<br>

<br>
	<form action="/eclat/" method="get">
	<table class="btn" align="center" width="100%">
	<td><input id="submit" type="submit" name="command" value="ショッピングを続ける"></td>
	</table>
	</form>

</main>
<br><br>
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