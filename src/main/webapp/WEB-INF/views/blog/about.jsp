<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>
		<nav id="site-navigation" class="main-navigation">
		<button class="menu-toggle">Menu</button>
		<a class="skip-link screen-reader-text" href="#content">Skip to content</a>
			<div class="menu-menu-1-container">
					<ul id="menu-menu-1" class="menu">
						<li><a href='/<c:out value="${test.userid}"/>' id="home">Home</a></li>
						<li><a href='/<c:out value="${test.userid}"/>/about' id="about">About</a></li>
						<li><a href='/<c:out value="${test.userid}"/>/list/1' id="blog">Blog</a></li>
						<li><a href='/<c:out value="${test.userid}"/>/guest/1' id="guest">Guest Book</a></li>
					</ul>
			</div>
		</nav>
		</header>
<!-- #masthead -->
		<div id="content" class="site-content">
		<div class="panel-heading">
			<button data-oper="aboutmodify" class="btn btn-default" onclick="aboutmodify_link()">Modify</button>
     	</div>   <!-- /.panel-heading -->
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main">
				
				<article class="hentry">
				<header class="entry-header">
				<h1 class="entry-title">About</h1>	
				</header>
				<!-- .entry-header -->
				<c:forEach items="${user}" var="user">
				<div class="entry-content">
				<p><c:out value="${user.userid}"/></p>
				<p><c:out value="${user.userinformation}"/></p>
				<p><c:out value="${user.userhobby}"/></p>
				<div class="entry-meta">
					<p>가입일 :
					<span class="posted-on"><time class="entry-date published">
					<fmt:formatDate pattern="yyyy-MM-dd" value="${user.usersysdate}"/></time></span> </p>
				</div>
				<h2 style="font-family: 'Herr Von Muellerhoff';color:#ccc;font-weight:300;">Yours, Von Muellerhoff</h2>
				</div><!-- .entry-content -->
				</c:forEach>
				</article>
				
				</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
		</div>
		<!-- #content -->
<%@ include file="../includes/footer.jsp" %>
<script>
function aboutmodify_link(){
	location.href = "/<c:out value="${test.userid}"/>/about/modify";
}
</script>
</html>