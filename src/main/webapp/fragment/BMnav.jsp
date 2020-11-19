<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" />
  <style>
	html{
		margin-left:calc(100vw - 100%);
		overflow-y: scroll;
	}
</style>

 <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="ti-view-list"></span>
        </button>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/dashboard">
              <i class="ti-shield menu-icon"></i>
              <span class="menu-title">回首頁</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="ti-palette menu-icon"></i>
              <span class="menu-title">商品類</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="<c:url value='/getAllNews'/>">新聞商品列表</a></li>
                <li class="nav-item"> <a class="nav-link" href="/iiiNews/src/main/webapp/WEB-INF/views/NP/backBoard/NewsTypepie.jsp">新聞商品列表</a></li>
                <li class="nav-item"> <a class="nav-link" href="<c:url value='/backGetAdListAjax'/>">廣告商品列表(AJAX JSON)</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="連結">
              <i class="ti-layout-list-post menu-icon"></i>
              <span class="menu-title">人員維護</span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#aaa" aria-expanded="false" aria-controls="aaa">
              <i class="ti-flag-alt menu-icon"></i>
              <span class="menu-title">社群管理</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="aaa">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/getAllMtAdd">會員文章總覽 </a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/getAllMemArticle"> 個人發文紀錄查詢 </a></li>
              </ul>
            </div>
          </li>
          
          
<!--           <li class="nav-item"> -->
<%--             <a class="nav-link" href="${pageContext.request.contextPath}/getAllMtAdd"> --%>
<!--               <i class="ti-flag-alt menu-icon"></i> -->
<!--               <span class="menu-title">社群文章管理</span> -->
<!--             </a> -->
<!--           </li> -->
		<li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-order" aria-expanded="false" aria-controls="ui-order">
              <i class="ti-view-list-alt menu-icon"></i>
              <span class="menu-title">訂單管理系統</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-order">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="<c:url value='/getOrderListEnd'/>">廣告商品訂單列表</a></li>
              </ul>
            </div>
          </li>
<!--           <li class="nav-item"> -->
<!--             <a class="nav-link" href="連結"> -->
<!--               <i class="ti-star menu-icon"></i> -->
<!--               <span class="menu-title">備用</span> -->
<!--             </a> -->
<!--           </li> -->
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="ti-user menu-icon"></i>
              <span class="menu-title">會員管理系統</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="連結"> 查看所有會員 </a></li>
                <li class="nav-item"> <a class="nav-link" href="連結"> 備用 2 </a></li>
                <li class="nav-item"> <a class="nav-link" href="連結"> 備用 3</a></li>
                <li class="nav-item"> <a class="nav-link" href="連結"> 備用 4 </a></li>
                <li class="nav-item"> <a class="nav-link" href="連結"> 備用 5</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#CRList" aria-expanded="false" aria-controls="CRList">
              <i class="ti-write menu-icon"></i>
              <span class="menu-title">客服管理系統</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="CRList">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="<c:url value='/customerReports'/>"> 客服表單管理</a></li>
                <li class="nav-item"> <a class="nav-link" href="<c:url value='/allemployee'/>"> 客服人員管理 </a></li>
                <li class="nav-item"> <a class="nav-link" href="<c:url value='/addboard'/>"> 公佈欄管理</a></li>
                <li class="nav-item"> <a class="nav-link" href="<c:url value='/chatMan'/>"> 聊天機器管理</a></li>
                <li class="nav-item"> <a class="nav-link" href="連結"> 備用 5</a></li>
              </ul>
              </div>
          </li>
      </nav>
      <div class="main-panel">
      <div class="content-wrapper" width="1000px">
                 <div class="card">
           <div class="card-body">

         