<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>
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
								<button type="button" data-oper="modify" class="btn btn-default" 
								onclick="location.href='/<c:out value="${blog.boardwriter }"/>/modify/<c:out value="${blog.boardbno }"/>">Modify</button>
								<button type="button" data-oper="list" class="btn btn-info"
								onclick="location.href='/<c:out value="${blog.boardwriter }"/>/list/1">List</button>
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
					<c:forEach items="${list}" var="bl og">
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
<script type="text/javascript">
$(document).ready(function(){
	
	var commentform = $("#commentform");
	
	var boardwriter = $('<c:out value="${blog.boardwriter }"/>');
	var boardbno = $('<c:out value="${blog.boardbno }"/>');
	
	$("button[data-oper='modify']").on("click", function(e){
		
		commentform.method = "get";
		commentform.action = "/"+boardwriter+"/modify/"+boardbno;
		console.log("modify button");
		commentform.submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){ 
		
		commentform.method = "get";
		commentform.action = "/"+boardwriter+"/list/1";
		console.log("list button");
		commentform.submit();
		
//	});
	
});

</script>
</html>