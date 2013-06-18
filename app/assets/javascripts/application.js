// This is a manifest file that'll  Last Signed Inbe compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require_tree .


$(document).ready(function() {

	jQuery(function() {
		return $('#users_list1').dataTable({
			sPaginationType : "full_numbers",
			bJQueryUI : true,
			bProcessing : true,
			bServerSide : true,
			sAjaxSource : $('#users_list1').data('source')
		});
	});

	// sign in Error messege Begin
	$('#member_invite, #new_user').live("ajax:success", function(evt, data, status, xhr) {
		$.colorbox.close();
	});

	$(document).ajaxError(function(e, xhr, settings) {
		if(xhr.status == 401) {
			$('.for_login_errors    ').html(xhr.responseText);
		}
	});
	// sign in Error messege End
	$('#search').tokenInput('/toons.json', {
		crossDomain : false
	});
	// Clearing inputs Begin
	
	$('input[type=password]').each(function() {
		$(this).val('');
	});

	// Clearing inputs End

	// Uploading Image Begin
	$(".upload input[type=file]").bind('click change', function() {
		var src = $(this).val();
		$(".upload").find('input[type=text]').val(src);
	});
	// Uploading Image End
	// Ajax Search Begin
	$("#search").keyup(function() {
		$.get($("#toons_search").attr("action"), $("#toons_search").serialize(), null, "script");
		return false;
	});
	// Ajax Search End

	var imgCount = $(".imagesContainer").find('img').length;
	imgwidth = $(".imagesContainer").find('img').width();
	width = imgCount * 111 + 50;
	$(".imagesContainer").css("width", width + "px");
	$(".slideShowContainer").width(width);
	containerWidth = $(".slideShowContainer").width();
	if(width < 1000) {
		$("p.slideShowControls span.next").css("left", width + "px");
		// alert(imgwidth+"   "+width);
	} else {
		$("p.slideShowControls span.next").css("left", containerWidth + "px");
	}

	$('span.next').click(function() {
		var slidePosition = $(".imagesContainer").position().left - width * 1 / imgCount;
		var x = (((-1 * (slidePosition)) + containerWidth) - width) + slidePosition;
		if(slidePosition + width > containerWidth) {
			$(".imagesContainer").css("left", slidePosition + "px");
		} else {
			$(".imagesContainer").css("left", x + "px")
		}
	});

	$('span.prev').click(function() {
		var slidePosition = $(".imagesContainer").position().left + width * 0.9 / imgCount;
		if(slidePosition <= 0) {
			$(".imagesContainer").css("left", slidePosition + "px");
		} else {
			$(".imagesContainer").css("left", 0 + "px");
		}
	});
	// Carousel End
	// });

	// Login popup begin

	$("#login_close_popup").live("click", function() {
		$(".login-form-div").hide();
		$(".login-div").hide();
		+$(".overlay").hide();
	});

	$(".login").click(function(e) {

		var h = $(window).height();
		var h1 = $(document).height();
		var w = $("body").width();
		var t = ((parseInt(h / 2) - (parseInt($(".login-div").height()) / 2)));
		var l = (parseInt($(window).width()) / 2) - (parseInt($(".login-div").width()) / 2);
		$(".overlay").show().css({
			height : h1 + "px",
			width : w + "px"
		});
		$(".login-div").show().css({
			top : t + "px",
			left : l + "px"
		});
		e.preventDefault();
	});
	// alert(xmlhttp.responseText);
	// Login popup End

	// Toons status in myshow Begin
	$(".toon_status").each(function() {
		if($(this).html() == "disapproved") {
			$(this).addClass("toon_status_disapproved");
		} else if($(this).html() == "published") {
			$(this).addClass("toon_status_published");
		} else if($(this).html() == "approved") {
			$(this).html("Processing...");
			$(this).addClass("toon_status_processing");
		} else if($(this).html() == "inactive") {
			$(this).html("Processing...");
			$(this).addClass("toon_status_processing");
		}
	});
	// Toons status in myshow End
});
