<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="main-header">
<a href="${path}" class="logo">
	<span class="logo-mini"><b>A</b>LT</span>
	<span class="logo-lg"><b>Admin</b>LTE</span>
</a>
<nav class="navbar navbar-static-top" role="navigation">
	<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
		<span class="sr-only">Toggle navigation</span>
	</a>
	<div class="navbar-custom-menu">
		<ul class="nav navbar-nav">
			<li class="dropdown user user-menu">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<img src="${path}/resources/bootstrap/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
					<span class="hidden-xs">Alexander Pierce</span>
				</a>
				<ul class="dropdown-menu">				
					<li class="user-header">
						<img src="${path}/resources/bootstrap/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
						<p>
							Alexander Pierce - Web Developer 
							<small>Member since Nov. 2012</small>
						</p>
					</li>
					<li class="user-footer">
						<div class="pull-right">
							<a href="#" class="btn btn-default btn-flat">Sign out</a>
						</div>
					</li>
				</ul>
			</li>
			<li>
				<a href="javascript:alert('구현중입니다.');" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
			</li>
		</ul>
	</div>
</nav>
</header>