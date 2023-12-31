<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Modify" />
<%@ include file="../common/head.jsp"%>
<%@ include file="../common/toastUI.jsp"%>

<section class="mt-8">
	<div class="container mx-auto">
		<form action="doModify" method="post" onsubmit="submitForm(this); return false;">
			<input type="hidden" name="id" value="${article.id }"/>
			<input type="hidden" name="body"/>
			<div class="table-box-type-1">
				<table>
					<colgroup>
						<col width="200" />
					</colgroup>
					<tbody>
						<tr>
							<th>번호</th>
							<td>${article.id }</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>${article.regDate }</td>
						</tr>
						<tr>
							<th>수정일</th>
							<td>${article.updateDate }</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${article.writerName }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input name="title" type="text" value="${article.title }" class="input input-bordered input-warning w-full"/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<div class="toast-ui-editor">
      								<script type="text/x-template">${article.body}</script>
    							</div>
							</td>
						</tr>
						<tr>
							<td colspan="2"><button class="btn btn-warning btn-sm">수정</button></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<button class="mt-2 btn btn-outline btn-warning btn-sm" onclick="history.back();">뒤로가기</button>
			</div>
		</form>
	</div>
</section>

<%@ include file="../common/foot.jsp"%>