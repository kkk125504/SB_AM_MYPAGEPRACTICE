<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="${board.name}" />
<%@ include file="../common/head.jspf" %>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<div>총 게시물 수 : ${articlesCount} 개</div>
			<div class="table-box-type-1">
				<table>
				<colgroup>
				<col width ="80" />
				<col width ="200"/>
				<col />
				<col width ="100"/>

				</colgroup>
						<thead class="bg-gray-200">
							<tr>
								<th>번호</th>
								<th>날짜</th>
								<th>제목</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="article" items="${articles}">
								<tr>
									<td>${article.id } </td>
									<td>${article.regDate.substring(0,16)}</td>
									<td><a class="hover:underline" href="../article/detail?id=${article.id}">${article.title}</a></td>
									<td>${article.extra__writer}</td>
								</tr>
							</c:forEach>
						</tbody>
				</table>
			</div>
			<div class="page-menu mt-3 flex justify-center">
				<c:set var="pageMenuLen" value="5"/>
				<c:set var="startPage" value="${page - pageMenuLen >= 1 ? page - pageMenuLen : 1}"/>
				<c:set var="endPage" value="${page + pageMenuLen <= pagesCount ? page + pageMenuLen : pagesCount}"/>
				<div class="btn-group">
					<c:if test="${startPage>1 }">
						<a class="btn btn-md" href="?boardId=${board.id}&page=1">1</a>
					</c:if>
					<c:if test="${startPage > 2 }">
						<a class="btn btn-md btn-disabled" href="#">...</a>
					</c:if>
					<c:forEach begin="${startPage }" end="${endPage}" var="i">
						<a class="btn btn-md ${page == i ? 'btn-active' : '' }" href="?boardId=${board.id}&page=${i }">${i }</a>
					</c:forEach>
					<c:if test="${endPage < pagesCount-1 }">
						<a class="btn btn-md btn-disabled" href="#">...</a>
					</c:if>
					<c:if test="${endPage < pagesCount }">
						<a class="btn btn-md" href="?boardId=${board.id}&page=${pagesCount }">${pagesCount }</a>
					</c:if>
				</div>				
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jspf" %>