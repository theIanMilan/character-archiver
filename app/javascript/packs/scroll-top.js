$(document).ready(function () {
  $('.scroll-top').on("click", scrollToTop)
  $(window).on("scroll", toggleScrollTop)
});

function scrollToTop() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

function toggleScrollTop() {
  // when user scrolls down 20px from document, show button
  if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
    $('.scroll-top').addClass('scroll-top-show');
  } else {
    $('.scroll-top').removeClass('scroll-top-show');
  }
}
