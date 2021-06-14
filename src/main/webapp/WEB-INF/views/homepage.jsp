<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JRag Portfolio</title>
<link rel='stylesheet' href='/resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='/resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='/resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='/resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='/resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='/resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous"> -->
<style type='text/css'>
ul.page-numbers{
	list-style-type:none;
	
}
li.page-numbers{
	display:inline-block;
}
.line{
	board-bottom:1px;
}
</style>
</head>
<body class="blog">
<div id="page">
	<div class="container">
		<header id="masthead" class="site-header">
		<div class="site-branding">
			<h1 class="site-title"><a href="/" rel="home">JRag</a></h1>
			<h2 class="site-description">Minimalist Portfolio HTML Template</h2>
		</div>
		</header>
		<form id='searchForm' action="/home" method='get'>
        	<select name='type'>
            	<option value="" <c:out value="{pageMaker.cri.type == null?'selected':''}"/>>--</option>
                <option value="T" <c:out value="{pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
                <option value="W" <c:out value="{pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
            </select>
            <input type="text" name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' placeholder="검색어 입력" />
            <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
            <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
            <button class='btn btn-default'>Search</button>
    	</form>
			<c:forEach items="${blist}" var="blog">
			<div>
				<div class="userid">
					<p class="p-userid"><a href="<c:out value="${blog.boardwriter}"/>"><c:out value="${blog.boardwriter}"/></a></p>
				</div>
				<table >
					<tr>
						<td width="664" height="49" style="border-bottom:none;">
						<a href='/<c:out value="${blog.boardwriter}"/>/get/<c:out value="${blog.boardbno}"/>/1' rel="bookmark">
						<c:out value="${blog.boardtitle}"/></a></td>
						<td><span class="posted-on"><time class="entry-date published">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${blog.boardsysdate}"/></time></span>
						</td>
					</tr>
					<tr>
						<td class="line"><c:out value="${blog.boardcontent}"/></td>
					</tr>
				</table>
			</div>
			</c:forEach>
		</div>
		
		<form id='actionForm' action="" method='get'>
		<div class="page">
				<ul class="page-numbers">
					<c:if test="${pageMaker.prev }">
						<li class="page-numbers prev"><a href="${pageMaker.startPage - 2}">Previous</a></li>
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
               	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
               	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
               	<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
               	<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
            </form>
	<!-- .container -->
	<footer id="colophon" class="site-footer">
	<div class="container">
		<div class="site-info">
			<h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">Jrag</h1>
			<a target="blank" href="https://www.wowthemes.net/">&copy; Moschino - Free HTML Template by WowThemes.net</a>
		</div>
	</div>
	</footer>
	<a href="#top" class="smoothup" title="Back to top"><span class="genericon genericon-collapse"></span></a>
</div>
<!-- #page -->
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='/resources/js/plugins.js'></script>
<script src='/resources/js/scripts.js'></script>
<script src='/resources/js/masonry.pkgd.min.js'></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

<script type="text/javascript">
//$(document).ready(function(){
	
//	var boardwriter = $(".boardwriter");
	
	
//	$(".userid").on("click", function(e){
		
		//boardwriter.find("input[value='<c:out value="${user.userid}"/>']");
		
		//e.preventDefault();
		//console.log('click');
		//location.href=boardwriter;
	//});
	
//});
</script>

</html>