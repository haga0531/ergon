// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require activestorage

//= require_tree .
//= require popper
//= require bootstrap-sprockets


// views/users/showにあるタブ部分
$(function() {
  // ①タブをクリックしたら発動
  $('.tab li').click(function() {
    // ②クリックされたタブの順番を変数に格納
    var index = $('.tab li').index(this);
    // ③クリック済みタブのデザインを設定したcssのクラスを一旦削除
    $('.tab li').removeClass('active');
    // ④クリックされたタブにクリック済みデザインを適用する
    $(this).addClass('active');
    // ⑤コンテンツを一旦非表示にし、クリックされた順番のコンテンツのみを表示
    $('.area ul').removeClass('show').eq(index).addClass('show');
  });
});



//ヘッダー追従
$(function () {
    var offset = $('#headerContainer').offset();
    $(window).scroll(function () {

        if ($(this).scrollTop() > offset.top) {
            $('#headerContainer').addClass('is-fixed');
        } else {
            $('#headerContainer').removeClass('is-fixed');
        }
    });
});


//モーダル部分(ログイン画面、投稿画面)
$(function(){
  $('.modal-open').click(function(){
    $('body').append('<div class="modal-overlay"></div>');
    $('.modal-overlay').fadeIn('slow');

    var modal = '#' + $(this).attr('data-target');
    modalResize();
    $(modal).fadeIn('slow');

    $('.modal-overlay, .modal-close').off().click(function(){
      $(modal).fadeOut('slow');
      $('.modal-overlay').fadeOut('slow',function(){
        $('.modal-overlay').remove();
      });
    });

    $(window).on('resize',function(){
      modalResize();
    });

    function modalResize(){
      var w = $(window).width();
      var h = $(window).height();

      var x = (w - $(modal).outerWidth(true)) / 2;
      var y = (h - $(modal).outerHeight(true)) / 2;

      $(modal).css({'left': x + 'px','top': y + 'px'});
    }
  });
});
