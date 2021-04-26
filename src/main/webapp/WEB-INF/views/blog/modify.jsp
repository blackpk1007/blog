<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>
		<div id="comments" class="comments-area">
					<div id="respond" class="comment-respond">
						<h3 id="reply-title" class="comment-reply-title">Leave a Reply <small><a rel="nofollow" id="cancel-comment-reply-link" href="/demo-moschino/embed-audio/#respond" style="display:none;">Cancel reply</a></small></h3>
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
								<button data-oper="list" class="btn btn-info" onclick="list_link()">List</button>
							</p>
					</div>
					<!-- #respond -->
				</div>
				<!-- #comments -->
<%@ include file="../includes/footer.jsp" %>
<script>
function list_link(){
	location.href = "/<c:out value="${blog.boardwriter }"/>/list/1";
}
</script>
<script type="text/javascript">
$(document).ready(function(){

});
</script>
</html>