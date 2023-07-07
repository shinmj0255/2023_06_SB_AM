<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Detail" />
<%@ include file="../common/head.jsp" %>

<script>
	function ArticleDetail_increaseVCnt() {
		
		const localStorageKey = 'article_['+ ${article.id} +']_alreadyView';
		
		if (localStorage.getItem(localStorageKey)) {
			return;
		}
		
		localStorage.setItem(localStorageKey, true);
		
		$.get('doIncreaseVCnt', {
			id : ${article.id}
		}, function(data){
			$('#articleDetail_increaseVCnt').empty().html(data.data1);
		}, 'json')
		
	}
	
	$(function(){
		// 실전코드
// 		ArticleDetail_increaseVCnt();
		
		// 테스트코드
		setTimeout(ArticleDetail_increaseVCnt, 2000);
	})
	
</script>

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
						<tr>
							<th>조회수</th>
							<td><span id="articleDetail_increaseVCnt">${article.VCnt }</span></td>
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