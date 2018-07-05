$(document).ready(function() {
    ("div#choices").hide();
    // .delay(5000).fadeIn('slow');

    var face = '<%= j @face.name %>';

$('.choice').click(function() {
	if ($(this).text() === face ) {
		$(this).children().prepend('<%= fa_icon "check", class: 'icon correct' %>');
		// $('#correct_sound')[0].play();
	} else {
		$(this).children().prepend('<%= fa_icon "times", class: 'icon wrong' %>');
		// $('#error_sound')[0].play();
	}

	
});

});