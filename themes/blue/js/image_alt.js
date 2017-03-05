$(document).ready(function(){
	$("#posts img").each(function(i){
		// adds a caption to the image with the content of the alt tag
		if ($(this).attr("alt").length) {
			$(this).after("<div class=\"image-footnote\">" + $(this).attr("alt") + "</div>");
		}
		// resizes the images and takes it out of the borders of the body div if it is big enough
		if($(this)){
			// okay this is really complicated because of the browser scaling and stuff. Will come back to this
		}
	});
});