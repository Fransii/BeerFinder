/**
 * Created by mr_shadow on 13.11.16.
 */

var RESOURCES_PATH = "web/resources";
var RESOURCES_BOOTSTRAP_PATH = RESOURCES_PATH + "/bootstrap";
var RESOURCES_LIBS_PATH = RESOURCES_PATH + "/libs";

var gulp = require('gulp');

gulp.task('bootstrap_css', function () {
    return gulp.src("./node_modules/bootstrap/dist/css/*.css")
        .pipe(gulp.dest(RESOURCES_BOOTSTRAP_PATH + "/css"));
});

gulp.task('bootstrap_js', function () {
    return gulp.src("./node_modules/bootstrap/dist/js/*.js")
        .pipe(gulp.dest("web/resources/js"));
});

gulp.task('bootstrap_css', function () {
    return gulp.src("./node_modules/bootstrap/dist/fonts/*")
        .pipe(gulp.dest(RESOURCES_BOOTSTRAP_PATH + "/fonts"));
});

gulp.task('libs_js', function() {
    return gulp.src("./node_modules/jquery/dist/jquery.min.js")
        .pipe(gulp.dest(RESOURCES_LIBS_PATH + "/js/"));
});



gulp.task('build', ['bootstrap_css', 'bootstrap_css', 'bootstrap_css', 'libs_js']);
