<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%@ include file = "../include/head.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function () {
		    var formObj = $("form[role='form']");
		    var postNo = ${post.postNo};
		    
		    $(".modBtn").on("click", function () {
		        formObj.attr("action", "/bbs/post/modify");
		        formObj.attr("method", "get");
		        formObj.submit();
		    });
	
		    $(".delBtn").on("click", function () {
		       formObj.attr("action", "/bbs/post/delete");
		       formObj.submit();
		    });
	
		    $(".listBtn").on("click", function () {
		       self.location = "/bbs/post/list?bbsNo=${param.bbsNo}&curPage=1";
		    });
		    
		    /* $(".replyAddBtn").click(function(){
	            var replyContent= $("#replyContent").val();
	            var replyWriter = $("#replyWriter").val();	            
	            var param="replyContent=" + replyContent + "&replyWriter=" + replyWriter + "&postNo="+postNo;
	            
	            $.ajax({                
	                type: "post",
	                url: "${path}/reply/insert",
	                data: param,
	                success: function(){
	                    alert("댓글이 등록되었습니다.");
	                    listReply();
	                }
	            });
	        });

		    // 게시글 삭제 버튼 클릭이벤트
	        $("#btnDelete").click(function(){
	            if(confirm("삭제하시겠습니까?")){
	                document.form1.action = "${path}/board/delete.do";
	                document.form1.submit();
	            }
	        });
		    
	        function listReply(){
		        $.ajax({
		            type: "get",
		            url: "${path}/reply/list?postNo="+postNo,
		            success: function(result){
     					console.log(result);
		            }
		        });
		    } */
		    
		});
	</script>
	
	<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">
			<%@ include file = "../include/main_header.jsp" %>
			<%@ include file = "../include/menu.jsp" %>
			
			<div class="content-wrapper">
				<section class="content-header">
					<h1>
						게시글 조회
		        		<small>게시글을 조회하는 곳입니다.</small>
					</h1>
				</section>
				<section class="content container-fluid">
					<div class="col-lg-12">
					    <div class="box box-primary">
					        <div class="box-header with-border">
					            <h3 class="box-title">[${post.categoryNm}] ${post.postTitle}</h3>
					        </div>
					        <div class="with-border">
					        	<h4 class="box-body">[작성일자] <fmt:formatDate value="${post.uptDate}" pattern="yyyy-MM-dd a HH:mm"/></h4>
					        </div>
					        <div class="box-body" style="height: 400px">
					            ${post.postContent}
					        </div>
					        <div class="box-footer">
					            <div class="user-block">
					                <img class="img-circle img-bordered-sm" src="${path}/resources/bootstrap/dist/img/user1-128x128.jpg" alt="user image">
					                <span class="username">
					                    <a href="#">${post.postWriter}</a>
					                </span>
					                <span class="description"><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${post.regDate}"/></span>
					            </div>
					        </div>
					        <div class="box-footer">
					            <form role="form" method="post">
					            	<input type="hidden" name="bbsNo" value="${param.bbsNo}">
					                <input type="hidden" name="postNo" value="${post.postNo}">
					            </form>
					            <button type="submit" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
					            <div class="pull-right">
					                <button type="submit" class="btn btn-warning modBtn"><i class="fa fa-edit"></i> 수정</button>
					                <button type="submit" class="btn btn-danger delBtn"><i class="fa fa-trash"></i> 삭제</button>
					            </div>
					        </div>
					    </div>
					</div>
					
					<!-- <div class="box box-warning">
					    <div class="box-header with-border">
					        <a class="link-black text-lg"><i class="fa fa-pencil"></i> 댓글작성</a>
					    </div>
					    <div class="box-body">
					        <form class="form-horizontal">
					            <div class="form-group margin">
					                <div class="col-sm-10">
					                    <textarea class="form-control" id="replyContent" name="replyContent" rows="3" placeholder="댓글내용..." style="resize: none"></textarea>
					                </div>
					                <div class="col-sm-2">
					                    <input class="form-control" id="replyWriter" name="replyWriter" type="text" placeholder="댓글작성자">
					                </div>
					                <hr/>
					                <div class="col-sm-2">
					                    <button type="button" class="btn btn-primary btn-block replyAddBtn"><i class="fa fa-save"></i> 저장</button>
					                </div>
					            </div>
					        </form>
					    </div>
					</div> -->

					<!-- <div class="box box-success collapsed-box">
					    <div class="box-header with-border">
					        <a href="" class="link-black text-lg"><i class="fa fa-comments-o margin-r-5 replyCount"></i></a>
					        <div class="box-tools">
					            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
					        </div>
					    </div>
					    <div class="box-body replyList"></div>
					</div> -->
					
				</section>
			</div>
			
			<%@ include file = "../include/main_footer.jsp" %>
		</div>
	</body>
</html>