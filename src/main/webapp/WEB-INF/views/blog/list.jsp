<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
     <div class="panel-heading">Board List Page
     <sec:authentication property="principal" var="pinfo"/>		
		<sec:authorize access="isAuthenticated()">
		<c:if test="${pinfo.username eq blog.boardwriter}">
            	<button id='regBtn' type="button" class="btn btn-xs pull-right" onclick="register_link()">Register New Blog</button>
        </c:if>
		</sec:authorize>
     </div>   <!-- /.panel-heading -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column two-thirds">
				<main id="main" class="site-main" role="main">
				<div class="grid bloggrid">
					<article>
					<input type="hidden" name='boardwriter' value='<c:out value="${test.userid}"/>'>
					<c:forEach items="${list}" var="blog">
					<header class="entry-header">
					<input type='hidden' name="boardbno" value='<c:out value="${blog.boardbno }"/>'>
					<h1 class="entry-title"><a href='/<c:out value="${blog.boardwriter}"/>/get/<c:out value="${blog.boardbno}"/>/1'
					rel="bookmark"><c:out value="${blog.boardtitle}"/></a></h1>
					<div class="entry-meta">
						<span class="posted-on"><time class="entry-date published">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${blog.boardsysdate}"/></time></span>
					</div>
					</header>
					</c:forEach>
					</article>
				</div>
			<div class="page">
				<ul class="page-numbers">
					<c:if test="${pageMaker.prev }">
						<li class="page-numbers prev"><a href="${pageMaker.startPage - 2}">Previous</a></li>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="page-numbers" ${pageMaker.cri.pageNum == num ? "active":""}><a href="${num }">${num }</a></li>
					</c:forEach>
					
					<c:if test="${pageMaker.next }">
						<li class="page-numbers next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
					</c:if>
				</ul>
			</div>
				</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
		</div>
		<!-- #content -->
		<!--  <form id='actionForm' action="/blog/list" method="get">
			<input type="hidden" name='pageNum' value="${pageMaker.cri.pageNum }">
			<input type="hidden" name='amount' value="${pageMaker.cri.amount }">
		</form> -->
<%@ include file="../includes/footer.jsp" %>
<script>
function register_link(){
	
	location.href = "/<c:out value="${test.userid}"/>/register";
}
</script>
<script type="text/javascript">
$(document).ready(function(){
	
	
//	var actionForm = $("#actionForm")
	
//$	(".page-numbers a").on("click", function(e){
		
//		e.preventDefault();
		
//		console.log('click');
		
//		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
//		actionForm.submit();
//	});
	
});
</script>

</html>