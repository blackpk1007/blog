<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
ul.page-numbers{
	list-style-type:none;
	
}
li.page-numbers{
	display:inline-block;
}
</style>
<%@ include file="../includes/header.jsp" %>
		<!-- #masthead -->
     <div class="panel-heading">Board List Page
            	<button id='regBtn' type="button" class="btn btn-xs pull-right">Register New Blog</button>
     </div>   <!-- /.panel-heading -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column two-thirds">
				<main id="main" class="site-main" role="main">
				<div class="grid bloggrid">
					<article>
					<c:forEach items="${list}" var="blog">
					<header class="entry-header">
					<input type='hidden' name="boardbno" value='<c:out value="${blog.boardbno }"/>'>
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
			<div class="page">
				<ul class="page-numbers">
					<c:if test="${pageMaker.prev }">
						<li class="page-numbers prev"><a href="${pageMaker.startPage - 1}">Previous</a></li>
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

<script type="text/javascript">
$(document).ready(function(){
	
	$("#regBtn").on("click", function(){
		
		self.location = "/blog/register";
	});
	
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