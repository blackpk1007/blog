<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="./includes/header.jsp" %>
		<!-- #masthead -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column two-thirds">
				<main id="main" class="site-main" role="main">
				<div class="grid bloggrid">
					<article>
					<header class="entry-header">
					<h1 class="entry-title"><a href="blog-single.html" rel="bookmark"></a></h1>
					<div class="entry-meta">
						<span class="posted-on"><time class="entry-date published">April 12, 2016</time></span>
					</div>
					<div class="entry-thumbnail">						
						<img src="http://s3.amazonaws.com/caymandemo/wp-content/uploads/sites/10/2015/09/30160348/sep4.jpg" alt="">
					</div>
					</header>
					<div class="entry-summary">
						<p>
							When Mary Lennox was sent to Manor to live with her uncle everybody said she was the most disagreeablelooking child ever seen. It was true, too. She had a little thin face and a little thin body, thin light hair and a sour expression. Her hair was yellow, and her face was yellow because she <a class="more-link" href="blog-single.html">Read more</a>
						</p>
					</div>
					
					</article>
				</div>
				<div class="clearfix">
				</div>
				<nav class="pagination"></nav>
				</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
				<div>
					<c:forEach items="${list}" var="blog">
				<tr>
					<td><c:out value="${blog.boardtitle}"/></td>
					<td><c:out value="${blog.boardcontent}"/></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${blog.boardsysdate}"/></td>
				</tr>
					</c:forEach>
				</div>
			<div id="secondary" class="column third">
				<div id="sidebar-1" class="widget-area" role="complementary">
				
					<aside id="text-5" class="widget widget_text">
					<h4 class="widget-title">About Me</h4>
					<div class="textwidget">
						<p>
							<img src="http://www.themepush.com/demo-hypnosa/wp-content/uploads/sites/9/2015/09/avatar5.png" class="alignleft" style="width:80px;border-radius:50%;margin-bottom:0;"> I'm a professional photographer for 10 years. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.
						</p>
					</div>
					</aside>
				</div>
				<!-- .widget-area -->
			</div>
			<!-- #secondary -->
		</div>
		<!-- #content -->
<%@ include file="./includes/footer.jsp" %>