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
			<div id="primary" class="content-area column full">
					<c:forEach items="${about}" var="blog">
					<form action="/<c:out value="${blog.userid}"/>/modify" method="post" id="commentform" class="comment-form" novalidate="">
							<p class="comment-form-author">
								<label for="author">Name</label>
								<input id="author" name="userid" type="text" value='<c:out value="${blog.userid}"/>'  
								size="30" aria-required="true" required="required" readonly="readonly">
							</p>
							<p class="comment-form-author">
								<label for="title">Information</label>
								<input id="title" name="userinformation" type="text" value='<c:out value="${blog.userinformation}"/>' 
								size="30" aria-required="true" required="required">
							</p>
							<p class="comment-form-comment">
								<label for="comment">Hobby</label>
								<textarea id="comment" name="boardcontent" cols="45" rows="8" 
								aria-required="true" required="required" ><c:out value="${blog.userhobby}"/></textarea>
							</p>
							<p class="form-submit">
								<button data-oper="modify" class="btn btn-default">Modify</button>
								<button data-oper="about" class="btn btn-info">About</button>
							</p>
					</form>
					</c:forEach>
				<!-- #main -->
			</div>
			<!-- #primary -->
		</div>
		<!-- #content -->
<%@ include file="../includes/footer.jsp" %>

</html>