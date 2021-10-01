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
//= require rails-ujs
//= require turbolinks
//= require activestorage
//= require jquery/dist/jquery.js
//= require bootstrap/dist/js/bootstrap.min
//= require_tree .
$(function() {
    $('.contents2').slick({
      autoplay: true,         //自動再生
	    autoplaySpeed: 2000,　  //自動再生のスピード
	    speed: 800,		　 //スライドするスピード
	    dots: true,　　　　　　//スライドしたのドット
	    arrows: true,          //左右の矢印
	    infinite: true,　　　　//スライドのループ
	    pauseOnHover: false,   //ホバーしたときにスライドを一時停止しない　
    });
});
