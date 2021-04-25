<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>
<!-- #masthead -->
		<div id="content" class="site-content">
		<div class="panel-heading">
            	<button id='regBtn' type="button" class="btn btn-xs pull-right">modify</button>
     	</div>   <!-- /.panel-heading -->
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
						<fmt:formatDate pattern="yyyy-MM-dd" value="<c:out value='${blog.usersysdate}'/>"/></time></span></p>
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

</html>