<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>
			<div id="secondary" class="column third">
				<div id="sidebar-1" class="widget-area" role="complementary">
					<div class="grid bloggrid">
						<article>
						<c:forEach items="${guest}" var="guest">
						<header class="entry-header">
							<input type='hidden' name="guest" value='<c:out value="${blog.boardbno }"/>'>
							<input type="hidden" name='boardwriter' value='<c:out value="${blog.boardwriter}"/>'>
							<h1 class="entry-title"><a href='/blog/get?boardbno=<c:out value="${blog.boardbno}"/>'
							rel="bookmark"><c:out value="${blog.boardtitle}"/></a></h1>
							<div class="entry-meta">
								<span class="posted-on"><time class="entry-date published">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${blog.boardsysdate}"/></time></span>
							</div>
						</header>
						</c:forEach>
						</article>
					</div>
				</div>
				<!-- .widget-area -->
			</div>
			<!-- #secondary -->

<%@ include file="../includes/footer.jsp" %>


</html>