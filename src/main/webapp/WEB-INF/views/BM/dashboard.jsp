<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html class='no-js' lang='en'>
  <head>
    <meta charset='utf-8'>
    <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible'>
    <title>Dashboard</title>
    <meta content='lab2023' name='author'>
    <meta content='' name='description'>
    <meta content='' name='keywords'>
    <link href="${pageContext.request.contextPath}/assets/stylesheets/application-a07755f5.css" rel="stylesheet" type="text/css" /><link href="//netdna.bootstrapcdn.com/font-awesome/3.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/images/favicon.ico" rel="icon" type="image/ico" />
    
  </head>
  <body class='main page'>
  <jsp:include page="/fragment/BMnav.jsp"/>
  <jsp:include page="/fragment/BMsidebar.jsp"/>  
  <jsp:include page="/fragment/BMtool.jsp"/>  
  <!-- Content -->
      <div id='content'>
        <div class='panel panel-default'>
          <div class='panel-heading'>
            <i class='icon-beer icon-large'></i>
            iiiNews後台管理
            <div class='panel-tools'>
              <div class='btn-group'>
                <a class='btn' href='#'>
                  <i class='icon-refresh'></i>
                  Refresh statics
                </a>
                <a class='btn' data-toggle='toolbar-tooltip' href='#' title='Toggle'>
                  <i class='icon-chevron-down'></i>
                </a>
              </div>
            </div>
          </div>
          <div class='panel-body'>
            <div class='page-header'>
              <h4>System usage</h4>
            </div>
            <div class='progress'>
              <div class='progress-bar progress-bar-success' style='width: 35%'></div>
              <div class='progress-bar progress-bar-warning' style='width: 20%'></div>
              <div class='progress-bar progress-bar-danger' style='width: 10%'></div>
            </div>
            <div class='page-header'>
              <h4>使用者入站統計</h4>
            </div>
            <div class='row text-center'>
              <div class='col-md-3'>
                <input class='knob second' data-bgcolor='#d4ecfd' data-fgcolor='#30a1ec' data-height='140' data-inputcolor='#333' data-thickness='.3' data-width='140' type='text' value='50'>
              </div>
              <div class='col-md-3'>
                <input class='knob second' data-bgcolor='#c4e9aa' data-fgcolor='#8ac368' data-height='140' data-inputcolor='#333' data-thickness='.3' data-width='140' type='text' value='75'>
              </div>
              <div class='col-md-3'>
                <input class='knob second' data-bgcolor='#cef3f5' data-fgcolor='#5ba0a3' data-height='140' data-inputcolor='#333' data-thickness='.3' data-width='140' type='text' value='35'>
              </div>
              <div class='col-md-3'>
                <input class='knob second' data-bgcolor='#f8d2e0' data-fgcolor='#b85e80' data-height='140' data-inputcolor='#333' data-thickness='.3' data-width='140' type='text' value='85'>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Footer -->
    <!-- Javascripts -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js" type="text/javascript"></script><script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js" type="text/javascript"></script><script src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js" type="text/javascript"></script><script src="assets/javascripts/application-985b892b.js" type="text/javascript"></script>
    <!-- Google Analytics -->
    <script>
      var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
      (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
      g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
      s.parentNode.insertBefore(g,s)}(document,'script'));
    </script>
  </body>
</html>
