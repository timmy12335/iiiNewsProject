<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後臺管理 廣告商業列表</title>

<script>

</script>
<style>
	html{
		margin-left:calc(100vw - 100%);
		overflow-y: scroll;
	}
</style>
</head>
<body>
<jsp:include page="/fragment/BMnav.jsp"></jsp:include>

	
	<div class='card-body'>
		<h3>後臺管理 廣告商業列表</h3>
		<br>
		<div class="row">
			<div class="col-md-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
	                	<p class="card-title text-md-center text-xl-left">Sales 本月總業績</p>
	                	<div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
	                    	<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">34040</h3>
	                    	<i class="ti-money icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
	                  	</div>  
	                  	<p class="mb-0 mt-2 text-danger">0.12% <span class="text-black ml-1"><small>(30 days)</small></span></p>
	                </div>
	                <div class="card-body">
	                	<p class="card-title text-md-center text-xl-left">Sales 交易筆數</p>
	                	<div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
	                    	<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">34040</h3>
	                    	<i class="ti-shopping-cart icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
	                  	</div>  
	                  	<p class="mb-0 mt-2 text-danger">0.12% <span class="text-black ml-1"><small>(30 days)</small></span></p>
	                </div>
	                <div class="card-body">
	                	<p class="card-title text-md-center text-xl-left">Sales 成交比例</p>
	                	<div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
	                    	<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">34040</h3>
	                    	<i class="ti-stats-up icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
	                  	</div>  
	                  	<p class="mb-0 mt-2 text-danger">0.12% <span class="text-black ml-1"><small>(30 days)</small></span></p>
	                </div>
				</div>
			</div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">Sales details</p>
                  <p class="text-muted font-weight-light">Received overcame oh sensible so at an. Formed do change merely to county it. Am separate contempt domestic to to oh. On relation my so addition branched.</p>
                  <div id="sales-legend" class="chartjs-legend mt-4 mb-2"></div>
                  <canvas id="cateChart"></canvas>
                </div>
                <div class="card border-right-0 border-left-0 border-bottom-0">
                  <div class="d-flex justify-content-center justify-content-md-end">
                    <div class="dropdown flex-md-grow-1 flex-xl-grow-0">
                      <button class="btn btn-lg btn-outline-light dropdown-toggle rounded-0 border-top-0 border-bottom-0" type="button" id="dropdownMenuDate2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        Today
                      </button>
                      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuDate2">
	                        <a class="dropdown-item" href="#">January - March</a>
	                        <a class="dropdown-item" href="#">March - June</a>
	                        <a class="dropdown-item" href="#">June - August</a>
	                        <a class="dropdown-item" href="#">August - November</a>
                      </div>
                    </div>
                    <button class="btn btn-lg btn-outline-light text-primary rounded-0 border-0 d-none d-md-block" type="button"> View all </button>
                  </div>
                </div>
              </div>
            </div>
		<hr>
		<a href='..'>回前頁</a>
		</div>
	</div>
	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
</body>
</html>