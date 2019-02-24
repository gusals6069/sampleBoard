<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<aside class="main-sidebar">
	<section class="sidebar">
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${path}/resources/bootstrap/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>Alexander Pierce</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>

		<ul class="sidebar-menu" data-widget="tree">			
		    <li class="header">메뉴</li>

			<li class="treeview">
				<a href="${path}/post/list?bbsNo=1&curPage=1">
					<i class="fa fa-link"></i><span>공지사항</span>
					<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
				</a>
				<ul class="treeview-menu">
					<li><a href="${path}/post/list?bbsNo=1&curPage=1">공지사항</a></li>
					<li><a href="${path}/post/write?bbsNo=1">공지사항 글쓰기</a></li>
				</ul>
			</li>
			
			<li class="treeview">
				<a href="${path}/post/list?bbsNo=2&curPage=1">
					<i class="fa fa-link"></i><span>유저게시판</span>
					<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
				</a>
				<ul class="treeview-menu">
					<li><a href="${path}/post/list?bbsNo=2&curPage=1">유저게시판</a></li>
					<li><a href="${path}/post/write?bbsNo=2">유저게시판 글쓰기</a></li>
				</ul>
			</li>
		</ul>
	</section>
</aside>