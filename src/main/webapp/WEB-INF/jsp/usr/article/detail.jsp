<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Detail" />
<%@ include file="../common/head.jsp"%>

<script>
	function getReactionPoint(){
		
		$.get('../reactionPoint/getReactionPoint', {
			relTypeCode : 'article',
			relId : ${article.id }
		}, function(data){
			if (data.data1.sumReactionPoint > 0) {
				let goodBtn = $('#goodBtn');
				goodBtn.removeClass('btn-outline');
				goodBtn.attr('href', '../reactionPoint/doDeleteReactionPoint?relTypeCode=article&relId=${article.id }&point=1')
			} else if (data.data1.sumReactionPoint < 0) {
				let badBtn = $('#badBtn');
				badBtn.removeClass('btn-outline');
				badBtn.prop('href', '../reactionPoint/doDeleteReactionPoint?relTypeCode=article&relId=${article.id }&point=-1')
			}
			
		}, 'json')
		
	}
	
	getReactionPoint();
</script>

<section class="mt-8">
	<div class="container mx-auto">
		<div class="table-box-type-1">
			<table>
				<colgroup>
					<col width="200" />
				</colgroup>
				<tbody>
					<tr>
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
						<td><c:if test="${rq.getLoginedMemberId() == 0}">
								<span>${article.sumReactionPoint }</span>
							</c:if> <c:if test="${rq.getLoginedMemberId() != 0}">
								<a id="goodBtn" class="btn btn-accent btn-outline btn-xs"
									href="../reactionPoint/doInsertReactionPoint?relTypeCode=article&relId=${article.id }&point=1">좋아요👍</a>
								<span>: ${article.goodReactionPoint }</span>
									&nbsp;&nbsp;&nbsp;
									<a id="badBtn" class="btn btn-accent btn-outline btn-xs"
									href="../reactionPoint/doInsertReactionPoint?relTypeCode=article&relId=${article.id }&point=-1">싫어요👎</a>
								<span>: ${article.badReactionPoint }</span>
							</c:if></td>
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
						<td>${article.getForPrintBody }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<button class="mt-2 btn btn-outline btn-warning btn-sm"
				onclick="history.back();">뒤로가기</button>

			<c:if test="${article.memberId == loginedMemberId }">
				<a class="mt-2 btn btn-outline btn-warning btn-sm"
					href="modify?id=${article.id}">수정</a>
				<a class="mt-2 btn btn-outline btn-warning btn-sm"
					href="doDelete?id=${article.id}"
					onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a>
			</c:if>
		</div>
	</div>
</section>

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<h2>댓글</h2>
		<c:forEach var="reply" items="${replies }">
		<div class="text-base py-2 pl-16 border-bottom-line">
			<div class="font-semibold"><span>${reply.writerName }</span></div>
			<div class="my-1 pl-2"><span>${reply.body }</span></div>
			<div class="text-xs text-gray-400"><span>${reply.updateDate }</span></div>
		</div>
		</c:forEach>
		<form action="../reply/doWrite" method="POST">
		<div class="mt-4 border-gray-400 rounded-lg p-4">
			<div class="mb-2"><span>닉네임</span></div>
			<textarea class="textarea textarea-bordered w-full" name="body" placeholder="댓글을 남겨주세요"></textarea>
			<div class="mt-1 flex justify-end"><button class="btn btn-warning btn-sm">등록</button></div>
		</div>	
		</form>
	</div>
</section>

<%@ include file="../common/foot.jsp"%>