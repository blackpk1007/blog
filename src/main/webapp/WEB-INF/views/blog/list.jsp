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
					<h1 class="entry-title"><a href="blog-single.html" rel="bookmark"><c:out value="${blog.boardtitle}"/></a></h1>
					<div class="entry-meta">
						<span class="posted-on"><time class="entry-date published"><fmt:formatDate pattern="yyyy-MM-dd" value="${blog.boardsysdate}"/></time></span>
					</div>
					<div class="entry-thumbnail">						
						<img src="http://s3.amazonaws.com/caymandemo/wp-content/uploads/sites/10/2015/09/30160348/sep4.jpg" alt="">
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
		</div>
		<!-- #content -->
<%@ include file="../includes/footer.jsp" %>