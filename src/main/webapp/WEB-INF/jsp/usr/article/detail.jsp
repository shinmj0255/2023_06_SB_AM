<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Detail" />
<%@ include file="../common/head.jsp" %>

	<section class="mt-8">
		<div class="container mx-auto">
			<div class="table-box-type-1">
				<table>
					<colgroup>
						<col width="200" />
					</colgroup>
					<tbody>
						<tr >
							<th>번호</th>
							<td><span class="badge badge-warning">${article.id }</span></td>
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
							<th>조회수</th>
							<td><span id="articleDetail_increaseVCnt">${article.VCnt }</span></td>
						</tr>
						<tr>
							<th>추천</th>
							<td>
								<c:if test="${rq.getLoginedMemberId() == 0}">
									<span>${article.sumReactionPoint }</span>
								</c:if>
								<c:if test="${rq.getLoginedMemberId() != 0}">
									<a href="#">좋아요👍</a>
									<span>${article.goodReactionPoint }</span>
									&nbsp;&nbsp;&nbsp;
									<a href="#">싫어요👎</a>
									<span>${article.badReactionPoint }</span>
								</c:if>
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${article.writerName }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>${article.title }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>${article.body }</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<button class="mt-2 btn btn-outline btn-warning btn-sm" onclick="history.back();">뒤로가기</button>
				
				<c:if test="${article.memberId == loginedMemberId }">
					<a class="mt-2 btn btn-outline btn-warning btn-sm" href="modify?id=${article.id}">수정</a>
					<a class="mt-2 btn btn-outline btn-warning btn-sm" href="doDelete?id=${article.id}" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a>
				</c:if>
			</div>
		</div>
	</section>
	
<%@ include file="../common/foot.jsp" %>