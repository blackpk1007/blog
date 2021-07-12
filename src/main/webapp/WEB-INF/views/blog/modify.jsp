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
						<form action="/<c:out value="${blog.boardwriter }"/>/modify" method="get" id="modifyform">
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
								<button data-oper="list" class="btn btn-info" onclick="modifylist_link()">List</button>
							</p>
						</form>
					</div>
					<!-- #respond -->
				</div>
				<!-- #comments -->
<%@ include file="../includes/footer.jsp" %>
<script>
function modifylist_link(){
	
	location.href = "/<c:out value="${test.userid}"/>/list/1";
}
</script>
<script type="text/javascript">
$(document).ready(function(){
	var modifyform = $('#modifyform');
	
	$('button').on("click", function(e){
	
	e.preventDefault();
	
	var operation = $(this).data("oper");
	console.log(operation);
	
	if(operation === 'modify'){
		modifyform.attr("action", "/<c:out value="${blog.boardwriter }"/>/modify")
		modifyform.attr("method", "post");
		modifyform.submit();
	}
	
	else if(operation === 'remove'){
		modifyform.attr("action", "/<c:out value="${blog.boardwriter }"/>/remove")
		modifyform.attr("method", "post");
		modifyform.submit();
	}
	
	else if(operation === 'list'){
		modifyform.attr("action", "/<c:out value="${blog.boardwriter }"/>/list/1");
	}
	});
});
</script>
</html>