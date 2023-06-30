<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Wrtie" />
<%@ include file="../common/head.jsp"%>

<section class="mt-8">
	<div class="container mx-auto">
		<form action="doWrite" method="post">
			<input type="hidden" name="id" value="${article.id }"/>
			<div class="table-box-type-1">
				<table>
					<colgroup>
						<col width="200" />
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td><input name="title" type="text" placeholder="제목을 입력해주세요" class="input input-bordered input-warning w-full max-w-xs"/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="textarea textarea-warning" name="body" placeholder="내용을 입력해주세요"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><button class="btn btn-warning">글쓰기</button></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<button class="btn btn-outline btn-warning" onclick="history.back();">뒤로가기</button>
			</div>
		</form>
	</div>
</section>

<%@ include file="../common/foot.jsp"%>