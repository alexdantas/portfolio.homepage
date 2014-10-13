/**
 * This file allows to dynamically reload CSS
 * files to change themes on-the-fly.
 */

// Loads when everything's done being loaded
jQuery(document).ready(function($){

	// Global variable that holds the last
	// loaded CSS file.
	// We need it to prevent multiple CSS
	// styles overlapping each other.
	var last_loaded_theme = "";

	// Dynamically loads a theme with `theme_name`.
	//
	// It knows where to look for the CSS files and
	// merely adds a <link> element inside <head>.
	//
	var load_theme = function(theme_name) {

		// First, delete the previous <link> element
		if (last_loaded_theme.length !== 0)
			$('#' + last_loaded_theme).remove();

		// Default location of theme files
		var filename = 'css/themes/' + theme_name + '.css';

		// Create dynamically a HTML element...
		$('head').append(
			// ...which is a link to a stylesheet
			$('<link rel="stylesheet" type="text/css" />')
				// At this location...
				.attr('href', filename)
				// ...marking it, so we can delete it later.
				.attr('id',   theme_name)
		);

		last_loaded_theme = theme_name;
	};

	// Now we tediously check for each clicked element
	// and load it's theme.
	//
	// ...in case you're wondering... No, I did not type
	// all this by hand
	$('#amelia').click(        function() { load_theme('amelia');        });
	$('#bootstrap').click(     function() { load_theme('bootstrap');     });
	$('#cerulean').click(      function() { load_theme('cerulean');      });
	$('#cosmo').click(         function() { load_theme('cosmo');         });
	$('#cyborg').click(        function() { load_theme('cyborg');        });
	$('#darkly').click(        function() { load_theme('darkly');        });
	$('#facebook-like').click( function() { load_theme('facebook-like'); });
	$('#flatly').click(        function() { load_theme('flatly');        });
	$('#fonts').click(         function() { load_theme('fonts');         });
	$('#holo-like').click(     function() { load_theme('holo-like');     });
	$('#journal').click(       function() { load_theme('journal');       });
	$('#lumen').click(         function() { load_theme('lumen');         });
	$('#readable').click(      function() { load_theme('readable');      });
	$('#simplex').click(       function() { load_theme('simplex');       });
	$('#slate').click(         function() { load_theme('slate');         });
	$('#spacelab').click(      function() { load_theme('spacelab');      });
	$('#superhero').click(     function() { load_theme('superhero');     });
	$('#united').click(        function() { load_theme('united');        });
	$('#yeti').click(          function() { load_theme('yeti');          });

});

