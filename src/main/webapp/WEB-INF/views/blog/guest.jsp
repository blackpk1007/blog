<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>
	<div class="panel-heading">
	   	<button id='regiBtn' type="button" class="btn btn-xs pull-right">Register</button>
    </div>   <!-- /.panel-heading -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column two-thirds">
				<main id="main" class="site-main" role="main">
				<div class="grid bloggrid">
					<article>
					<c:forEach items="${guest}" var="guest">
					<header class="entry-header">
						<h1 class="entry-title"><c:out value="${guest.guestwriter}"/></h1>
							<div class="entry-meta">
								<span class="posted-on"><time class="entry-date published">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${guest.guestsysdate}"/></time></span>
							</div>
					</header>
					<div class="entry-summary">
						<p><c:out value="${guest.guestcontent}"/></p>
					</div>
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
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">Guest Book Modal</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Guest</label>
							<input class="form-control" name='guestwriter' value=''>
						</div>
						<div class="form-group">
							<label>content</label>
							<input class="form-control" name='guestcontent' value=''>
						</div>
						<div class="form-group">
							<label>guest date</label>
							<input class="form-control" name='guestsysdate' value=''>
						</div>
					</div>
					<div class="modal-footer">
						<button id='modalModifyBtn' type="button" class="btn btn-warning">Modify</button>
						<button id='modalRemoveBtn' type="button" class="btn btn-warning">Remove</button>
						<button id='modalRegisterBtn' type="button" class="btn btn-warning">Register</button>
						<button id='modalCloseBtn' type="button" class="btn btn-warning">Close</button>
					</div>
				</div>
			</div>
		</div>
<%@ include file="../includes/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	
})

</script>
</html>