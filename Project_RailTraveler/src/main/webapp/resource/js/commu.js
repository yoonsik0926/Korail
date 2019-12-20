function sendLinkFacebook() {
		var facebook_share_url = "https://www.facebook.com/sharer/sharer.php?u={{ request.build_absolute_uri }}";
		window.open(facebook_share_url, 'Share on Facebook',
				'scrollbars=no, width=500, height=500');
	}
	function sendLinkTwitter() {
		var twitter_share_text = "{{ post.title }}";
		var twitter_share_url = "{{ request.build_absolute_uri }}";
		window.open("https://twitter.com/share?text=" + twitter_share_text
				+ "&url=" + twitter_share_url, 'Share on Twitter',
				'scrollbars=no, width=500, height=500');
	}
	function sendLinkNaver() {
		var raw_url = "{{ request.build_absolute_uri }}";
		var raw_title = "{{ post.title }}"
		var naver_root_url = "http://share.naver.com/web/shareView.nhn?url="
		var naver_share_url = naver_root_url + encodeURI(raw_url) + "&title="
				+ encodeURI(raw_title);
		window.open(naver_share_url, 'Share on Naver',
				'scrollbars=no, width=500, height=500');
	}
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});

		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
	
	function snsShare() {
		$('#snsModal').modal('show');
		$("body").css({"padding-right": "0px"}).removeClass("modal-open");
		$(".modal-backdrop").remove();
	}
	function declare() {
		$('#declarationModal').modal('show');
		$("body").css({"padding-right": "0px"}).removeClass("modal-open");
		$(".modal-backdrop").remove();
	}