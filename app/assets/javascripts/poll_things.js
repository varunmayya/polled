$(document).ready(function (){
	$('.progbar_value').each(function() 
	{
		if (parseFloat($(this).html()) > 0)
		{
	    $(this).css("width", $(this).html() +"%");
	    $(this).text(parseFloat($(this).html()).toFixed(2) + "%"); }
	    else
	{
		$(this).css("width", "100px");
		$(this).css("border", "none");
		$(this).css("background-color","transparent");
		$(this).css("box-shadow", "none");
		$(this).css("color", "#575757");
		$(this).text("-");
	}

	});
	

	
});