<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MODIFY MEMBER" />
<%@ include file="../common/head.jspf" %>
	<script>
	function passwordChangeCancel(){
		var passwordChangeContent = "";	
		passwordChangeContent += '<div id="passwordChangeForm">';
		passwordChangeContent += '<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="passwordChange()">변경</button>';
		passwordChangeContent += '</div>';
		$('#passwordChangeForm').replaceWith(passwordChangeContent);
	}		
	</script>

	<script>
	function passwordChange(){
		var passwordChangeContent = "";
		passwordChangeContent += '<div id="passwordChangeForm">';
		passwordChangeContent += '새 비밀번호 : <input type="text" class="input input-bordered input-lg" name="loginPw"/>';
		passwordChangeContent += '&nbsp&nbsp&nbsp';
		passwordChangeContent += '새 비밀번호 확인 : <input type="text" class="input input-bordered input-lg" name="loginPwConfirm"/>';
		passwordChangeContent += '<button type="button" class="btn btn-active btn-ghost" onclick="passwordChangeCancel()">취소<button/>';
		passwordChangeContent += '</div>';
		$('#passwordChangeForm').replaceWith(passwordChangeContent);
	}		
	</script>	
	
	<script>
	var NickName__DuplicateCheck = false;		
	
	let MemberModify__submitDone = false;
	function MemberModify__submitForm(form){
		if(MemberModify__submitDone){
			alert('이미 처리중 입니다.');
			return;
		}
		form.nickname.value = form.nickname.value.trim();
		if(form.nickname.value.length==0){
			alert('닉네임을 작성해주세요.');
			form.nickname.focus();
			return;
		}
		
		form.cellphoneNum.value = form.cellphoneNum.value.trim();		
		if(form.cellphoneNum.value.length==0){
			alert('전화번호를 작성 해주세요.');
			form.cellphoneNum.focus();
			return;
		}
		
		form.email.value = form.email.value.trim();		
		if(form.email.value.length==0){
			alert('이메일을 작성 해주세요.');
			form.email.focus();
			return;
		}
		
		form.loginPw.value = form.loginPw.value.trim();		
		if(form.loginPw.value.length==0){
			alert('비밀번호를 작성 해주세요.');
			form.loginPw.focus();
			return;
		}
		
		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();		
		if(form.loginPwConfirm.value.length==0){
			alert('비밀번호 확인을 작성 해주세요.');
			form.loginPwConfirm.focus();
			return;
		}
		
		if(form.loginPw.value != form.loginPwConfirm.value){
			alert('비밀번호가 일치하지 않습니다.');
			form.loginPw.focus();
			return;
		}		
		
		MemberModify__submitDone = true;
		form.submit();		
	}	
	
	function NicknameDup() {							
		$.get('../member/nicknameDuplicateCheck', {
			id :  $('input[name=ninckname]').val(),
			ajaxMode : 'Y'
		}, function(data) {
			
		}, 'json');			
	}
	</script>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form method="get" action="doModify" onsubmit="MemberModify__submitForm(this); return false;">	
				<input type="hidden" name="replaceUri" value="${param.replaceUri}" />
				<div class="table-box-type-1">
					<table>
						<colgroup>
							<col width="200" />
						</colgroup>
						<tbody>
							<tr>
								<th>가입일</th>
								<td>${rq.loginedMember.regDate }</td>
							</tr>
							<tr>
								<th>아이디</th>
								<td>${rq.loginedMember.loginId }</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>${rq.loginedMember.name }</td>
							</tr>
							<tr>
								<th>비밀번호 변경</th>
								<td>
									<div id="passwordChangeForm">
										<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="passwordChange()">변경</button>									
									</div>								
								</td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td>
								<input type="text" class="input input-bordered input-lg" name="nickname" value="${rq.loginedMember.nickname }"/>
								<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="NicknameDup()">중복 체크</button>
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" class="input input-bordered input-lg" name="cellphoneNum" value="${rq.loginedMember.cellphoneNum }"/></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="text" class="input input-bordered input-lg" name="email" value="${rq.loginedMember.email}"/></td>
							</tr>
							<tr>
								<th></th>
								<td>						
									<button class="btn-text-link btn btn-active btn-ghost" type="submit">수정</button>
									<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</section>
<%@ include file="../common/foot.jspf" %>
