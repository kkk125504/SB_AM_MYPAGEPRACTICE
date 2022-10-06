<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE_LIST" />
<%@ include file="../common/head.jspf" %>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<div class="table-box-type-1">
				<table>
					<colgroup>
						<col width="200" />
					</colgroup>	
					<tbody>		
						<tr>
							<td>번호</td><td>${article.id }</td>						
						</tr>
						<tr>
							<td>작성날짜</td><td>${article.regDate }</td>						
						</tr>
						<tr>
							<td>수정날짜</td><td>${article.updateDate }</td>						
						</tr>
						<tr>
							<td>제목</td><td>${article.title }</td>						
						</tr>
						<tr>
							<td>내용</td><td>${article.body }</td>						
						</tr>
						<tr>
							<td>작성자</td><td>${article.memberId }</td>						
						</tr>
					</tbody>								
				</table>
				<div class= "btns">
					<button type="button" onclick="history.back()">뒤로가기</button>
				</div>
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jspf" %>