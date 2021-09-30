$(document).ready(function () {
  $('.scroll-top').on("click", scrollToTop)
  $(window).on("scroll", toggleScrollTop)
});

function scrollToTop() {
  $('html, body').stop().animate({ scrollTop: 0 }, 500);
  return false;
}

function toggleScrollTop() {
  // when user scrolls down 20px from document, show button
  if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
    $('.scroll-top').addClass('scroll-top-show');
  } else {
    $('.scroll-top').removeClass('scroll-top-show');
  }
}
