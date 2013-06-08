$(document).ready(function (){
	      function afunction(event) {
	            $('.openmenu').toggleClass("chidden");
		return false;
	      }
		function bfunction(event) {
		            $('.openmenu').toggleClass("chidden");
		            return false;
		      }	
	
	      $('#drop_icon').mouseover(afunction);
           $('#settingsmenu').mouseleave(bfunction);

});