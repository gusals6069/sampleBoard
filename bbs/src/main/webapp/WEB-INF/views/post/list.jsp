<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%@ include file = "../include/head.jsp" %>
	<%@ include file = "../include/result.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function () {
			var formObj = $("form[role='form']");
			
			$("#writeBtn").on("click", function () {
				self.location = "/bbs/post/write?bbsNo=${param.bbsNo}";
		    });	
			
			$("#searchBtn").on("click", function () {
				formObj.attr("action", "/bbs/post/list");
		        formObj.attr("method", "get");
				
		        formObj.submit();
		    });
		});				
	</script>
	
	<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">
			<%@ include file = "../include/main_header.jsp" %>
			<%@ include file = "../include/menu.jsp" %>
			
			<div class="content-wrapper">
				<section class="content-header">
					<h1>
						게시글 리스트
		        		<small>등록된 게시글의 리스트입니다.</small>
					</h1>
				</section>
				<section class="content container-fluid">
					<div class="col-lg-12">
					    <div class="box box-primary">
					        <div class="box-header with-border">
					            <h3 class="box-title">총 게시글 갯수 : ${postCount} 건</h3>
					        </div>

					        <div class="box-body">
					            <table class="table table-bordered">
					                <tbody>
					                <tr>
					                    <th style="width: 30px;  text-align:center;" >No.</th>
					                    <th style="text-align:center;">제목</th>
					                    <th style="width: 100px; text-align:center;">작성자</th>
					                    <th style="width: 150px; text-align:center;">작성시간</th>
					                    <th style="width: 60px;  text-align:center;">조회수</th>
					                </tr>
					                
					                <c:if test="${param.bbsNo == '2'}">
							       		<c:forEach items="${postNews}" var="news">
							       		<tr style="background-color:#BBDEFB;">
						                    <td style="text-align:center;">${news.postNo}</td>
						                    <td style="text-align:left;">						                    							                 	
						                    	<span style="font-weight:bold; color:red;">[${news.categoryNm}]&nbsp;</span>
						                    	<a href="${path}/post/view?bbsNo=${param.bbsNo}&postNo=${news.postNo}">${news.postTitle}</a>
						                    </td>
						                    <td style="text-align:center;">${news.postWriter}</td>
						                    <td style="text-align:center;"><fmt:formatDate value="${news.regDate}" pattern="yyyy-MM-dd a HH:mm"/></td>
						                    <td style="text-align:center;"><span class="badge bg-red">${news.viewCnt}</span></td>
						                </tr>
							       		</c:forEach>
							       	</c:if>
					                
					                <c:if test="${fn:length(postList) > 0}">
										<c:forEach items="${postList}" var="post">
						                <tr>
						                    <td style="text-align:center;">${post.postNo}</td>
						                    <td style="text-align:left;">						                    							                 	
						                    	<span style=
													<c:if test="${post.categoryId=='1'}">
														"font-weight:bold; color:red;" 
													</c:if>
						                    	>[${post.categoryNm}]&nbsp;</span>
						                    	<a href="${path}/post/view?bbsNo=${param.bbsNo}&postNo=${post.postNo}">${post.postTitle}</a>
						                    </td>
						                    <td style="text-align:center;">${post.postWriter}</td>
						                    <td style="text-align:center;"><fmt:formatDate value="${post.regDate}" pattern="yyyy-MM-dd a HH:mm"/></td>
						                    <td style="text-align:center;"><span class="badge bg-red">${post.viewCnt}</span></td>
						                </tr>
						                </c:forEach>
									</c:if>
													                
					                </tbody>
					            </table>
					        </div>
					        
					        <div class="box-footer">
							    <div class="text-center">
							        <ul class="pagination">
				                        <%-- <li><a href="${path}/post/list?bbsNo=${param.bbsNo}&curPage=${pageMaker.firstPageNo}">처음</a></li> --%>
				                    	<li><a href="${path}/post/list?bbsNo=${param.bbsNo}&curPage=${pageMaker.prevPageNo}">◀</a></li>					                    
					                    <c:forEach var="pageNum" begin="${pageMaker.startPageNo }" end="${pageMaker.endPageNo }" step="1">
					                        <c:choose>
					                            <c:when test="${pageNum eq  pageMaker.pageNo}">
					                            	<li class="active"><a href="${path}/post/list?bbsNo=${param.bbsNo}&curPage=${pageNum}">${pageNum}</a></li>
					                            </c:when>
					                            <c:otherwise>
					                                <li><a href="${path}/post/list?bbsNo=${param.bbsNo}&curPage=${pageNum}">${pageNum}</a></li>
					                            </c:otherwise>
					                        </c:choose>
					                    </c:forEach>
					                    <li><a href="${path}/post/list?bbsNo=${param.bbsNo}&curPage=${pageMaker.nextPageNo}">▶</a></li>
    									<%-- <li><a href="${path}/post/list?bbsNo=${param.bbsNo}&curPage=${pageMaker.finalPageNo}">마지막</a></li>	 --%>	            
							        </ul>
							    </div>
							</div>
							
							<form id="searchForm" role="form">	
								<input type="hidden" name="bbsNo" value="${param.bbsNo}"/>
								<input type="hidden" name="curPage" value="1"/>						
								<div class="form-group col-sm-2">
							        <select class="form-control" name="searchType" id="searchType" >
							            <option value="1"   <c:out value="${searchType eq '1' ? 'selected' : ''}"/>>제목</option>
							            <option value="2"   <c:out value="${searchType eq '2' ? 'selected' : ''}"/>>내용</option>
							            <option value="3"   <c:out value="${searchType eq '3' ? 'selected' : ''}"/>>작성자</option>
							        </select>
							    </div>
							    <div class="form-group col-sm-10">
							        <div class="input-group">
							            <input type="text" class="form-control" name="searchKeyword" id="searchKeyword" value="${searchKeyword}" placeholder="검색어">
							            <span class="input-group-btn">
							                <button type="button" class="btn btn-primary btn-flat" id="searchBtn">
							                    <i class="fa fa-search"></i> 검색
							                </button>
							            </span>
							        </div>
							    </div>
							</form>
							
					        <div class="box-footer">
					            <div class="pull-right">
					                <button type="button" class="btn btn-success btn-flat" id="writeBtn">
					                    <i class="fa fa-pencil"></i> 글쓰기
					                </button>
					            </div>
					        </div>
					    </div>
					</div>
				</section>
			</div>
			
			<%@ include file = "../include/main_footer.jsp" %>
		</div>
	</body>
</html>