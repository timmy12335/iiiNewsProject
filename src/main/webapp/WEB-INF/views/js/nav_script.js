(function ($) {

  // $.fn是指jquery的名稱空間，加上fn上的方法及屬性，會對jquery例項每一個有效
  // 並搭配extend方法，將 $.fn.XXX() 當作是某種擴充套件
  // 接下來就可以用$("#什麼什麼").menumaker()去使用
  // 這裡的$.fn.menumaker會被下方的$("#cssmenu").menumaker做使用
  // 用以判斷視窗大小不同而產生不同的navbar樣式
  // dropdown表示一般的橫列bar multitoggle表示視窗變小變窄後的樣子
  // 類方法用以動態新增選單的樣式指令
  // 可在有偵測到有下一層級（也就是原先的li內有下一組ul li時）
  // 新增出加號

  $.fn.menumaker = function (options) {

    
    var cssmenu = $(this), settings = $.extend({
      title: "功能選單",
      format: "dropdown",
      sticky: false
    }, options);

    return this.each(function () {
      cssmenu.prepend('<div id="menu-button">' + settings.title + '</div>');
      $(this).find("#menu-button").on('click', function () {
        $(this).toggleClass('menu-opened');
        var mainmenu = $(this).next('ul');
        if (mainmenu.hasClass('open')) {
          mainmenu.hide().removeClass('open');
        }
        else {
          mainmenu.show().addClass('open');
          if (settings.format === "dropdown") {
            mainmenu.find('ul').show();
          }
        }
      });

      cssmenu.find('li ul').parent().addClass('has-sub');

      multiTg = function () {
        cssmenu.find(".has-sub").prepend('<span class="submenu-button"></span>');
        cssmenu.find('.submenu-button').on('click', function () {
          $(this).toggleClass('submenu-opened');
          if ($(this).siblings('ul').hasClass('open')) {
            $(this).siblings('ul').removeClass('open').hide();
          }
          else {
            $(this).siblings('ul').addClass('open').show();
          }
        });
      };

      // 檢查設定是否為multitoggle並執行上方multiTg()方法
      if (settings.format === 'multitoggle') multiTg();
      else cssmenu.addClass('dropdown');

      if (settings.sticky === true) cssmenu.css('position', 'fixed');


      // 跟調整視窗大小後navbar的變化有關
      resizeFix = function () {
        if ($(window).width() > 768) {
          cssmenu.find('ul').show();
        }

        if ($(window).width() <= 768) {
          cssmenu.find('ul').hide().removeClass('open');
        }
      };
      resizeFix();
      return $(window).on('resize', resizeFix);

    });
  };
})(jQuery);


// 用以來更改format名稱為multitoggle
// 改用縮精簡的"三"樣式的下拉選單進行操作
(function ($) {
  $(document).ready(function () {

    $("#cssmenu").menumaker({
      title: "功能選單XXX",
      format: "multitoggle"
    });

  });
})(jQuery);
