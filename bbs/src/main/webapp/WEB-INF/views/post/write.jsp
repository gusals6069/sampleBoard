<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%@ include file = "../include/head.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function () {
		    var formObj = $("form[role='form']");
		   	
		    $(".listBtn").on("click", function () {
		       self.location = "/bbs/post/list?bbsNo=${param.bbsNo}&curPage=1";
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
						게시글 작성
		        		<small>게시글을 작성하는 곳입니다.</small>
					</h1>
				</section>
				<section class="content container-fluid">
					<div class="col-lg-12">
					    <form role="form" id="writeForm" method="post" action="${path}/post/write">
					    	<input type="hidden" name="bbsNo" value="${param.bbsNo}"/>
					        <div class="box box-primary">
					            <div class="box-header with-border">
					                <h3 class="box-title">게시글 작성</h3>
					            </div>
					            <div class="box-body">
					                <div class="form-group">
					                    <label for="postTitle">제목</label>
					                    <input class="form-control" id="postTitle" name="postTitle" placeholder="제목을 입력해주세요">
					                </div>
					                <div class="form-group">
					                	<label for="categoryId">분류</label>
					                	<select name="categoryId" class="form-control">
					                		<option value="">선택</option>
											<c:forEach var="i" items="${categoryList}">
											    <option value="${i.categoryId}">${i.categoryNm}</option>
											</c:forEach>
										</select>					                	
					                </div>
					                <div class="form-group">
					                    <label for="postContent">내용</label>
					                    <textarea class="form-control" id="postContent" name="postContent" rows="30"
					                              placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
					                </div>
					                <div class="form-group">
					                    <label for="postWriter">작성자</label>
					                    <input class="form-control" id="postWriter" name="postWriter">
					                </div>
					            </div>
					            <div class="box-footer">
					                <button type="button" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
					                <div class="pull-right">
					                    <button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
					                    <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 저장</button>
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