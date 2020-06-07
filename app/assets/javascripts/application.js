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


//= require activestorage

//= require_tree .
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require bxslider


// プロフィールページのタブ
$(function() {
  $('.tab li').click(function() {
    var index = $('.tab li').index(this);
    $('.tab li').removeClass('active');
    $(this).addClass('active');
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

// 日付ごと投稿の水平スライド
$(document).ready(function(){
  $('.bxslider').bxSlider({
    moveSlides: 4,
    maxSlides: 6,
    slideWidth: 220,
  });
});
