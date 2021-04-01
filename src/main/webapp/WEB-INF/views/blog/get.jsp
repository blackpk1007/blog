<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>
		<div id="comments" class="comments-area">
					<div id="respond" class="comment-respond">
						<h3 id="reply-title" class="comment-reply-title">Leave a Reply <small><a rel="nofollow" id="cancel-comment-reply-link" href="/demo-moschino/embed-audio/#respond" style="display:none;">Cancel reply</a></small></h3>
						<form action="/blog/register" method="post" id="commentform" class="comment-form" novalidate="">
							<p class="comment-form-author">
								<label for="author">Writer <span class="required">*</span></label>
								<input id="author" name="boardwriter" type="text" value="" size="30" aria-required="true" required="required">
							</p>
							<p class="comment-form-author">
								<label for="title">Title <span class="required">*</span></label>
								<input id="title" name="boardtitle" type="text" value="" size="30" aria-required="true" required="required">
							</p>
							<p class="comment-form-comment">
								<label for="comment">Content</label>
								<textarea id="comment" name="boardcontent" cols="45" rows="8" aria-required="true" required="required"></textarea>
							</p>
							<p class="form-submit">
								<input name="submit" type="submit" id="submit" class="submit" value="submit">
								<input name="reset" type="reset" id="reset" class="reset" value="reset">
							</p>
						</form>
					</div>
					<!-- #respond -->
				</div>
				<!-- #comments -->
<%@ include file="../includes/footer.jsp" %>

</html>