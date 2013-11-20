module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    coffeelint:
      app: ['*.coffee']
    jshint:
      all: ['*.js']
    nodemon:
      dev:
        options:
          file: 'app.coffee'
          args: []
          nodeArgs: ['--debug']
          ignoredFiles: ['README.md', 'node_modules/**', '.DS_Store']
          watchedExtensions: ['js', 'coffee']
          delayTime: 1
          env:
            PORT: 3000

          cwd: __dirname

  # Load the plugin that provides the "uglify" task.
  #grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-contrib-jshint'

  # Default task(s).
  #grunt.registerTask('default', ['uglify'])
  grunt.registerTask 'default',['coffeelint', 'jshint', 'nodemon']
