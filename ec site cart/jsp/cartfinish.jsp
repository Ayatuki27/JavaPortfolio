<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<p class="imgtitle3">注文完了</p>
<hr>
<main>
<br><br>
	<h2>ご注文ありがとうございました。</h2>
	<br>

	<form action="/eclat/" method="get">
	<table align="center" width="100%">
	<td><input id="submit" type="submit" name="command" value="トップページへ戻る"></td>
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