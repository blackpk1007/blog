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
							<label>Form</label>
							<input class="form-control" name='guestid' value='<c:out value="${test.userid}"/>' readonly="readonly">
						</div>
						<div class="form-group">
							<label>Guest</label>
							<input class="form-control" name='guestwriter' value=''>
						</div>
						<div class="form-group">
							<label>content</label>
							<input class="form-control" name='guestcontent' value=''>
						</div>
<!--					<div class="form-group">
							<label>guest date</label>
							<input class="form-control" name='guestsysdate' value=''>
						</div>
					</div> -->
					<div class="modal-footer">
						<button id='modalModifyBtn' type="button" class="btn btn-warning">Modify</button>
						<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
						<button id='modalRegisterBtn' type="button" class="btn btn-default">Register</button>
						<button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss='modal'>Close</button>
					</div>
				</div>
			</div>
		</div>
<%@ include file="../includes/footer.jsp" %>
<script type="text/javascript" src="/resources/js/reply.js"></script> 

<script type="text/javascript">
$(document).ready(function(){
	var modal = $(".modal");
	var modifyBtn = $("#modalModifyBtn");
	var removeBtn = $("#modalRemoveBtn");
	var registerBtn = $("#modalRegisterBtn");
	
	var modalguestid = modal.find("input[name='guestid']");
	var modalguestwriter = modal.find("input[name='guestwriter']");
	var modalguestcontent = modal.find("input[name='guestcontent']");
	var modalguestsysdate = modal.find("input[name='gueststysdate']");
	
	$("#regiBtn").on("click", function(e){

		modal.modal('show');
	});
	
	registerBtn.on("click", function(e){
		
		var guestreply = {
				guestid : modalguestid.val(),
				guestwriter : modalguestwriter.val(),
				guestcontent : modalguestcontent.val(),
				
		};
		userService.add(guestreply, function(result){
		});
		
		modal.modal('hide');
		location.reload();
		modal.find("input").val("");
	});
	
	$(".entry-title").on("click", function(e){
		
		
	});
});

</script>
</html>