<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>
<!-- #masthead -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main">
				
				<article class="hentry">
				<header class="entry-header">
				<h1 class="entry-title">About</h1>	
				</header>
				<!-- .entry-header -->
				
				<c:forEach items="${about}" var="blog">
				<div class="entry-content">
				<p><c:out value="${blog.userid}"/></p>
				<p><c:out value="${blog.userinformation}"/></p>
				<p><c:out value="${blog.userhobby}"/></p>
				<p>가입일 : <span class="posted-on"><time class="entry-date published">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${blog.usersysdate}"/></time></span></p>
				<h2 style="font-family: 'Herr Von Muellerhoff';color:#ccc;font-weight:300;">Yours, Von Muellerhoff</h2>
				</div><!-- .entry-content -->
				</c:forEach>
				</article>
					<form action="/<c:out value="${blog.userid}"/>/modify" method="post" id="commentform" class="comment-form" novalidate="">
						<input type="hidden" name="boardbno" value='<c:out value="${blog.boardbno }"/>'>
							<p class="comment-form-author">
								<label for="author">Writer</label>
								<input id="author" name="boardwriter" type="text" value='<c:out value="${blog.boardwriter }"/>'  
								size="30" aria-required="true" required="required" readonly="readonly">
							</p>
							<p class="comment-form-author">
								<label for="title">Title</label>
								<input id="title" name="boardtitle" type="text" value='<c:out value="${blog.boardtitle }"/>' 
								size="30" aria-required="true" required="required" readonly="readonly">
							</p>
							<p class="comment-form-comment">
								<label for="comment">Content</label>
								<textarea id="comment" name="boardcontent" cols="45" rows="8" 
								aria-required="true" required="required" ><c:out value="${blog.boardcontent }"/></textarea>
							</p>
							<p class="form-submit">
								<button data-oper="modify" class="btn btn-default">Modify</button>
								<button data-oper="remove" class="btn btn-default">Remove</button>
								<button data-oper="list" class="btn btn-info">List</button>
							</p>
					</form>
				</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
		</div>
		<!-- #content -->
<%@ include file="../includes/footer.jsp" %>

</html>