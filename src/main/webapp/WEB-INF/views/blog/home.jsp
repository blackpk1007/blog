<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>
		<!-- #masthead -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column two-thirds">
				<main id="main" class="site-main" role="main">
				<div class="grid bloggrid">
					<article>
					<c:forEach items="${list}" var="blog">
					<header class="entry-header">
					<input type="hidden" name='boardwriter' value='<c:out value="${blog.boardwriter}"/>'>
					<input type="hidden" name='boardbno' value='<c:out value="${blog.boardbno}"/>'>
					<h1 class="entry-title">
					<a href="/<c:out value="${blog.boardwriter}"/>/get/<c:out value="${blog.boardbno}"/>/1" rel="bookmark">
					<c:out value="${blog.boardtitle}"/></a></h1>
					<div class="entry-meta">
						<span class="posted-on"><time class="entry-date published">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${blog.boardsysdate}"/></time></span>
					</div>
					</header>
					<div class="entry-summary">
						<p><c:out value="${blog.boardcontent}"/></p>
					</div>
					</c:forEach>
					</article>
				</div>
				<div class="clearfix">
				</div>
				<nav class="pagination"></nav>
				</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
			<div id="secondary" class="column third">
				<div id="sidebar-1" class="widget-area" role="complementary">
					<c:forEach items="${user}" var="user">
					<aside id="text-5" class="widget widget_text">
					<h4 class="widget-title"><c:out value="${user.userid}"/>의 블로그입니다.</h4>
					<div class="textwidget">
						<p><c:out value="${user.userinformation}"/></p>
					</div>
					</aside>
					</c:forEach>
				</div>
				<!-- .widget-area -->
			</div>
			<!-- #secondary -->
		</div>
		<!-- #content -->
<%@ include file="../includes/footer.jsp" %>


</html>