/**
 * Gruntfile: The "JavaScript Makefile"
 *
 * Runs tasks so that you don't have to mindlessly
 * type the same commands over and over.
 *
 * $ grunt           # Builds the site into directory "output/"
 * $ grunt preview   # Builds and previews on "localhost:1337"
 * $ grunt check     # Builds and validates HTML5 and Bootstrap
 * $ grunt upload    # Builds and uploads to remote server
 *
 */

module.exports = function(grunt) {

	// Loads all grunt plugins found on 'package.json'
	require('load-grunt-tasks')(grunt);

	// Shows cute time statistics on the terminal
	require('time-grunt')(grunt);

	grunt.initConfig({

		// Configuring Jekyll so we don't need to
		// have a Rakefile or something like that
		jekyll: {

			// Default settings, shared by
			// both targets below
			options: {
				src:    "source",
				dest:   "output",
				config: "jekyll-config.yml"
			},

			// Simply builds the site and
			// places resulting files on "output"
			build: {
				options: {
					serve: false
				}
			},

			// Besides building, preview changes
			// with localhost server
			serve: {
				options: {
					watch: true,
					serve: true,
					port:  1337
				}
			}
		},

		// HTML5 validation of `.html` files
		validation: {
			files: {
				src: ['output/**/*.html']
			}
		},

		// Bootstrap validation of `.html` files
		// Assumes total HTML5 validation
		bootlint: {
			files: ['output/**/*.html']
		},

		// Zips all final files from the site
		// and places it on the output directory
		zip: {
			dist: {
				cwd: 'output/',

				src: ['output/**/*'],
				dest: 'output/doodlemeat.zip'
			}
		},

		// Makes sure to remove the zip before
		// zipping, so it won't contain itself
		clean: {
			zip: ['output/doodlemeat.zip']
		},

		// Pushes all built files on a remote server
		rsync: {
			options: {
				recursive: true
			},
			dist: {
				options: {
					src: "output/",

					dest: "~/public_html/tmp/",
					host: "alexd075@alexdantas.net",
					port: 2222
				}
			}
		}
	});

	// All tasks!
	grunt.registerTask('default', ['jekyll:build']);
	grunt.registerTask('preview', ['jekyll:serve']);
	grunt.registerTask('check',   ['jekyll:build', 'validation', 'bootlint']);
	grunt.registerTask('upload',  ['jekyll:build', 'clean:zip', 'zip:dist', 'rsync:dist']);
};

