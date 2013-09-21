module.exports = (grunt) ->
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-shell'

    grunt.initConfig
        shell:
            server:
                command: 'node dist/server.js'

        coffee:
            compile:
                files:
                    'dist/server.js': [
                        "src/**/*.coffee"
                    ]

        copy:
            main:
                files: [
                    {
                        expand: true,
                        src:  'static/*.html',
                        dest: 'dist/',
                        flatten: true,
                        filter: 'isFile'
                    }
                ]

        clean: ['dist']

    grunt.registerTask "default", ["clean", "coffee", "copy", "shell:server"]

