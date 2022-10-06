<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE_LIST" />
<%@ include file="../common/head.jspf" %>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<div class="table-box-type-1">
				<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>날짜</th>
								<th>제목</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="article" items="${articles}">
								<tr>
									<td>${article.id } </td>
									<td>${article.regDate.substring(0,10)}</td>
									<td><a href="../article/detail?id=${article.id}">${article.title}</a></td>
								</tr>
							</c:forEach>
						</tbody>
				</table>
			</div>
			<div class= "btns">
				<button type="button" onclick="history.back()">뒤로가기</button>
			</div>
		</div>
		
	</section>
<%@ include file="../common/foot.jspf" %>