//메인페이지 배너 효과 스크립트
var swiper = new Swiper(".mySwiper", {
		cssMode: true,
		navigation: {
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev",
		},
		pagination: {
			el: ".swiper-pagination",
		},
		autoplay : { 
			delay : 3000,   
			disableOnInteraction : false, 
		},
		loop: true
	});/**
 * 
 */