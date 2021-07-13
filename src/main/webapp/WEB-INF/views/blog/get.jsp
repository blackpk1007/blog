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
		<div id="comments" class="comments-area">
					<div id="respond" class="comment-respond">
						<h3 id="reply-title" class="comment-reply-title">Leave a Reply <small><a rel="nofollow" id="cancel-comment-reply-link" href="/demo-moschino/embed-audio/#respond" style="display:none;">Cancel reply</a></small></h3>
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
								aria-required="true" required="required" readonly="readonly"><c:out value="${blog.boardcontent }"/></textarea>
							</p>
							<p class="form-submit">
							
								<sec:authentication property="principal" var="pinfo"/>		
								<sec:authorize access="isAuthenticated()">
								<c:if test="${pinfo.username eq blog.boardwriter}">
									<button data-oper="modify" class="btn btn-default" onclick="modify_link()">Modify</button> 
								</c:if>
		
								</sec:authorize>
								<button data-oper="list" class="btn btn-info" onclick="list_link()">List</button>
							</p>
					</div>
					<!-- #respond -->
				</div>
				<!-- #comments -->
				
		<div id="content" class="site-content">
			<div id="primary" class="content-area column two-thirds">
				<main id="main" class="site-main" role="main">
				<div class="grid bloggrid">
					<article>
					<c:forEach items="${list}" var="list">
					<header class="entry-header">
					<input type='hidden' name="boardbno" value='<c:out value="${list.boardbno }"/>'>
					<h1 class="entry-title"><a href='/<c:out value="${list.boardwriter}"/>/get/<c:out value="${list.boardbno}"/>/1'
					rel="bookmark"><c:out value="${list.boardtitle}"/></a></h1>
					<div class="entry-meta">
						<span class="posted-on"><time class="entry-date published">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${list.boardsysdate}"/></time></span>
					</div>
					</header>
					</c:forEach>
					</article>
				</div>
			<div class="page">
				<ul class="page-numbers">
					<c:if test="${pageMaker.prev }">
						<li class="page-numbers prev"><a href="${pageMaker.startPage - 1}">Previous</a></li>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="page-numbers" ${pageMaker.cri.pageNum == num ? "active":""}>
						<a href="${num }">${num }</a></li>
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
		
<%@ include file="../includes/footer.jsp" %>
<script>
function modify_link(){
	location.href = "/<c:out value="${blog.boardwriter }"/>/modify/<c:out value="${blog.boardbno }"/>";
}

function list_link(){
	location.href = "/<c:out value="${blog.boardwriter }"/>/list/1";
}
</script>
<script type="text/javascript">
$(document).ready(function(){
//	var commentform = $("#commentform");

//	$('button').on("click", function(e){
		
//		e.preventDefault();
		
//		var operation = $(this).data("oper");
//		console.log(operation);
		
//		if(operation === 'modfiy'){
//			
			//commentform.attr("action", "/<c:out value="${blog.boardwriter }"/>/modify/<c:out value="${blog.boardbno }"/>");
//		}
		
//		else if(operation === 'list'){
			//commentform.attr("action", "/<c:out value="${blog.boardwriter }"/>/list/1");
			//commenform.empty();
//		}
		
//		commentform.submit();
//	});
	
});

</script>
</html>