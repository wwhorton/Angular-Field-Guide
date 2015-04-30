'use strict';

module.exports = function(grunt) {

    require('load-grunt-tasks')(grunt);


	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		app: 'app',
		dist: 'dist',

		sass: {
			options: {
				includePaths: ['<%= app %>/bower_components/foundation/scss']
			},
			dist: {
				options: {
					outputStyle: 'extended'
				},
				files: {
					'<%= app %>/css/style.css': '<%= app %>/scss/app.scss'
				}
			}
		},

    karma: {
      unit: {
        configFile: 'karma.conf.js',
        background: true,
        singleRun: false
      }
    },
		
    protractor: {
      options: {
      configFile: "node_modules/protractor/example/conf.js", // Default config file 
      keepAlive: true, // If false, the grunt process stops when the test fails. 
      noColor: false, // If true, protractor will not use colors in its output. 
      args: {
        // Arguments passed to the command 
        }
      },
      all: { },
    },


		jshint: {
			options: {
				jshintrc: '.jshintrc'
			},
			all: [
				'Gruntfile.js',
				'<%= app %>/js/*.js'
			]
		},

		clean: {
			dist: {
				src: ['<%= dist %>/*']
			},
		},
		copy: {
			dist: {
				files: [{
					expand: true,
          flatten: true,
					cwd:'<%= app %>/',
					src: ['vendor/fonts/foundation-icons/foundation-icons.*', '!vendor/fonts/foundation-icons/foundation-icons.css'],
					dest: '<%= dist %>/css/'
				} , {
					expand: true,
					cwd:'<%= app %>/',
					src: ['fonts/**', '*.html', '!**/*.scss', 'bower_components/**', 'js/**', 'partials/**', 'images/**'],
					dest: '<%= dist %>/'
				} , {
					expand: true,
					flatten: true,
					src: ['<%= app %>/bower_components/font-awesome/fonts/**'],
					dest: '<%= dist %>/fonts/',
					filter: 'isFile'
				} ]
			},
		},

		imagemin: {
			dynamic: {
				files: [{
					expand: true,
					cwd: '<%= app %>/images/',
					src: ['**/*.{jpg,gif,svg,jpeg,png}'],
					dest: '<%= dist %>/images/'
				}]
			}
		},

		uglify: {
			options: {
				preserveComments: 'some',
				mangle: false
			}
		},

		useminPrepare: {
			html: ['<%= app %>/index.html'],
			options: {
				dest: '<%= dist %>/'
			}
		},

		usemin: {
			html: ['<%= dist %>/*.html', '!<%= app %>/bower_components/**'],
			css: ['<%= dist %>/css/*.css'],
			options: {
				dirs: ['<%= dist %>/']
			}
		},

		watch: {
			grunt: {
				files: ['Gruntfile.js'],
				tasks: ['sass']
			},
			sass: {
				files: '<%= app %>/scss/*.scss',
				tasks: ['sass']
			},
			livereload: {
				files: ['<%= app %>/*.html', '!<%= app %>/bower_components/', '<%= app %>/js/*.js', '<%=app %>/partials/*.html', '<%= app %>\css\*.css', '<%= app %>/images/*.{jpg,gif,svg,jpeg,png}'],
				options: {
					livereload: true
				}
			},
      karma: {
        files: ['<%= app %>/js/*.js', '<%= app %>/test/unit/*.js'],
        tasks: ['karma']
      }
		},

		connect: {
			app: {
				options: {
					port: 9000,
					base: '<%= app %>',
					open: true,
					livereload: true,
					hostname: '127.0.0.1',
          middleware: function(connect, options, middlewares) {
            var modRewrite = require('connect-modrewrite');

            // enable Angular's HTML5 mode
            middlewares.unshift(modRewrite(['!\\.html|\\.js|\\.svg|\\.jpg|\\.woff|\\.ttf|\\.eot|\\.css|\\.png$ /index.html [L]']));

            return middlewares;
          }
				}
			},
			dist: {
				options: {
					port: 9001,
					base: '<%= dist %>',
					open: true,
					keepalive: true,
					livereload: false,
					hostname: '127.0.0.1',
          middleware: function(connect, options, middlewares) {
            var modRewrite = require('connect-modrewrite');

            // enable Angular's HTML5 mode
            middlewares.unshift(modRewrite(['!\\.html|\\.js|\\.svg|\\.jpg|\\.woff|\\.ttf|\\.eot|\\.css|\\.png$ /index.html [L]']));

            return middlewares;
          }
				}
			}
		},

		wiredep: {
			target: {
				src: [
					'<%= app %>/*.html'
				],
				exclude: [
					'modernizr',
					'font-awesome',
					'jquery-placeholder',
					'/foundation'
				]
			}
		}

	});

	grunt.registerTask('compile-sass', ['sass']);
	grunt.registerTask('bower-install', ['wiredep']);
	
	grunt.registerTask('default', ['bower-install', 'compile-sass', 'connect:app', 'watch']);
	grunt.registerTask('validate-js', ['jshint']);
	grunt.registerTask('server-dist', ['connect:dist']);
	
	grunt.registerTask('publish', ['compile-sass', 'clean:dist', 'validate-js', 'karma', 'useminPrepare', 'copy:dist', 'concat', 'cssmin', 'uglify', 'usemin', 'newer:imagemin']);

  grunt.loadNpmTasks('grunt-karma');
  grunt.loadNpmTasks('grunt-protractor-runner');
};
