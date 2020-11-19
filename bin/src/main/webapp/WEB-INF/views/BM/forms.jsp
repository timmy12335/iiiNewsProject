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
    <title>Forms</title>
    <meta content='' name='author'>
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
            <i class='icon-edit icon-large'></i>
            	預設表單
          </div>
          <div class='panel-body'>
            <form>
              <fieldset>
                <legend>預設輸入</legend>
                <div class='form-group'>
                  <label class='control-label'>填寫使用者</label>
                  <input class='form-control' placeholder='請輸入帳號?' type='text'>
                </div>
                <div class='form-group'>
                  <label class='control-label'>輸入標題</label>
                  <input class='form-control' placeholder='Enter password' type='password'>
                </div>
                <div class='form-group'>
                  <label class='control-label'>輸入內容</label>
                  <input class='form-control' placeholder='.help-block'>
                  <p class='help-block'>Example block-level help text here.</p>
                </div>
                <div class='form-group'>
                  <label class='control-label'>Disabled field</label>
                  <input class='form-control' disabled placeholder='This is field is disabled!'>
                </div>
                <div class='form-group'>
                  <label class='control-label'>Tooltip field</label>
                  <input class='form-control' data-toggle='tooltip' placeholder='This is field is disabled!' title='Input tips here'>
                </div>
                <div class='form-group'>
                  <label class='control-label'>Textarea field</label>
                  <textarea class='form-control' rows='4'></textarea>
                </div>
                <div class='form-group'>
                  <label class='control-label'>File input</label>
                  <input type='file'>
                </div>
                <div class='form-group'>
                  <label class='control-label'>Large field</label>
                  <input class='form-control input-lg' placeholder='.input-lg' type='text'>
                </div>
                <div class='form-group'>
                  <label class='control-label'>Small field</label>
                  <input class='form-control input-sm' placeholder='.input-sm' type='text'>
                </div>
                <div class='form-group row'>
                  <div class='col-lg-2'>
                    <label class='control-label'>Column sizing</label>
                    <input class='form-control' placeholder='.col-lg-2' type='text'>
                  </div>
                  <div class='col-lg-3'>
                    <label class='control-label'>Column sizing</label>
                    <input class='form-control' placeholder='.col-lg-3' type='text'>
                  </div>
                  <div class='col-lg-7'>
                    <label class='control-label'>Column sizing</label>
                    <input class='form-control' placeholder='.col-lg-7' type='text'>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend>Input Validation States</legend>
                <div class='form-group has-warning'>
                  <label class='control-label'>Input field with help</label>
                  <input class='form-control' placeholder='.has-warning'>
                  <p class='help-block'>Example block-level help text here.</p>
                </div>
                <div class='form-group has-error'>
                  <label class='control-label'>Input field with help</label>
                  <input class='form-control' placeholder='.has-error'>
                  <p class='help-block'>Example block-level help text here.</p>
                </div>
                <div class='form-group has-success'>
                  <label class='control-label'>Input field with help</label>
                  <input class='form-control' placeholder='.has-success'>
                  <p class='help-block'>Example block-level help text here.</p>
                </div>
              </fieldset>
              <fieldset>
                <legend>勾選方格請參考這裡</legend>
                <div class='form-group'>
                  <label class='control-label'>Checkbox</label>
                  <div class='checkbox'>
                    <input type='checkbox' value=''>
                   
                  </div>
                </div>
                <div class='form-group'>
                  <label class='control-label'>Inline checkbox</label>
                  <br>
                  <div class='checkbox-inline'>
                    <input type='checkbox' value=''>
                    1
                  </div>
                  <div class='checkbox-inline'>
                    <input type='checkbox' value=''>
                    2
                  </div>
                  <div class='checkbox-inline'>
                    <input type='checkbox' value=''>
                    3
                  </div>
                </div>
                <div class='form-group'>
                  <label class='control-label'>單選按鍵請選這</label>
                  <div class='radio'>
                    <input checked name='options_radio' type='radio' value='option1'>
					選項一
                    <br>
                    <input checked name='options_radio' type='radio' value='option2'>
					選項二
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend>選單請參考這</legend>
                <div class='form-group'>
                  <label class='control-label'>單選式選單</label>
                  <select class='form-control'>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                  </select>
                </div>
                <div class='form-group'>
                  <label class='control-label'>多選式選單</label>
                  <select class='form-control' multiple>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                  </select>
                </div>
              </fieldset>
              <div class='form-actions'>
                <button class='btn btn-default' type='submit'>送出</button>
                <a class='btn' href='#'>取消</a>
              </div>
            </form>
          </div>
        </div>
        <div class='panel panel-default'>
          <div class='panel-heading'>
            <i class='icon-edit icon-large'></i>
            Form Horizontal
          </div>
          <div class='panel-body'>
            <form class='form-horizontal'>
              <fieldset>
                <legend>Default inputs</legend>
                <div class='form-group'>
                  <label class='col-lg-2 control-label'>Text field</label>
                  <div class='col-lg-10'>
                    <input class='form-control' placeholder='Enter username' type='text'>
                  </div>
                </div>
                <div class='form-group'>
                  <label class='col-lg-2 control-label'>Password field</label>
                  <div class='col-lg-10'>
                    <input class='form-control' placeholder='Enter password' type='password'>
                  </div>
                </div>
                <div class='form-group'>
                  <label class='col-lg-2 control-label'>Input field with help</label>
                  <div class='col-lg-10'>
                    <input class='form-control' placeholder='.help-block'>
                    <p class='help-block'>Example block-level help text here.%fieldset</p>
                  </div>
                </div>
                <legend>Validation inputs</legend>
                <div class='form-group has-warning'>
                  <label class='col-lg-2 control-label'>Text field</label>
                  <div class='col-lg-10'>
                    <input class='form-control' placeholder='Enter username' type='text'>
                  </div>
                </div>
                <div class='form-group has-error'>
                  <label class='col-lg-2 control-label'>Password field</label>
                  <div class='col-lg-10'>
                    <input class='form-control' placeholder='Enter password' type='password'>
                  </div>
                </div>
                <div class='form-group has-success'>
                  <label class='col-lg-2 control-label'>Input field with help</label>
                  <div class='col-lg-10'>
                    <input class='form-control' placeholder='.help-block'>
                    <p class='help-block'>Example block-level help text here.</p>
                  </div>
                </div>
              </fieldset>
              <div class='form-actions'>
                <button class='btn btn-default' type='submit'>Save</button>
                <a class='btn' href='#'>Cancel</a>
              </div>
            </form>
          </div>
        </div>
        <div class='panel panel-default'>
          <div class='panel-heading'>
            <i class='icon-edit icon-large'></i>
            Knob Inputs
          </div>
          <div class='panel-body text-center'>
            <input class='knob' data-height='150' data-width='150' type='text' value='75'>
            <input class='knob' data-fgColor='#16a085' data-height='150' data-width='150' type='text' value='100'>
            <input class='knob' data-fgColor='#7f8c8d' data-height='150' data-width='150' type='text' value='200'>
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
