<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%@ include file = "../include/head.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function () {
		    var formObj = $("form[role='form']");
		   	
		    $(".cancelBtn").on("click", function () {
		       self.location = "/bbs/post/view?bbsNo=${param.bbsNo}&postNo=${param.postNo}";
		    });
		    
		    $('#categoryId').change(function() {
		    	var index = $("#categoryId option").index($("#categoryId option:selected"));
		        $('#categoryId option').attr('selected', false);
		        $('#categoryId option:eq('+ index +')').attr('selected', true);
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
						게시글 수정
		        		<small>게시글을 수정하는 곳입니다.</small>
					</h1>
				</section>
				<section class="content container-fluid">
					<div class="col-lg-12">
					    <form role="form" id="writeForm" method="post" action="${path}/post/modify">
					        <div class="box box-primary">
					            <div class="box-header with-border">
					                <h3 class="box-title">게시글 작성</h3>
					            </div>
					            <div class="box-body">
					            	<input type="hidden" name="bbsNo"  value="${param.bbsNo}"/>
					                <input type="hidden" name="postNo" value="${post.postNo}"/>
					                <div class="form-group">
					                    <label for="postTitle">제목</label>
					                    <input class="form-control" id="postTitle" name="postTitle" placeholder="제목을 입력해주세요" value="${post.postTitle}">
					                </div>
					                <div class="form-group">
					                	<label for="categoryId">분류</label>
					                	<select id="categoryId" name="categoryId" class="form-control">
					                		<option value="">선택</option>
											<c:forEach var="i" items="${categoryList}">
											    <option value="${i.categoryId}" <c:if test="${i.categoryId eq post.categoryId}">selected</c:if>>${i.categoryNm}</option>
											</c:forEach>
										</select>					                	
					                </div>
					                <div class="form-group">
					                    <label for="content">내용</label>
					                    <textarea class="form-control" id="postContent" name="postContent" rows="30"
					                              placeholder="내용을 입력해주세요" style="resize: none;">${post.postContent}</textarea>
					                </div>
					                <div class="form-group">
					                    <label for="writer">작성자</label>
					                    <input class="form-control" id="postWriter" name="postWriter" value="${post.postWriter}" readonly>
					                </div>
					            </div>
					            <div class="box-footer">
					                <button type="button" class="btn btn-primary"><i class="fa fa-list"></i> 목록</button>
					                <div class="pull-right">
					                    <button type="button" class="btn btn-warning cancelBtn"><i class="fa fa-trash"></i> 취소</button>
					                    <button type="submit" class="btn btn-success modBtn"><i class="fa fa-save"></i> 수정 </button>
					                </div>
					            </div>
					        </div>
					    </form>
					</div>
				</section>
			</div>
			
			<%@ include file = "../include/main_footer.jsp" %>
		</div>
	</body>
</html>