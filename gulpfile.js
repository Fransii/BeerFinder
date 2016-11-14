/**
 * Created by mr_shadow on 13.11.16.
 */
var gulp = require('gulp');

gulp.task('css', function () {
    return gulp.src("./node_modules/bootstrap/dist/css/*.css")
        .pipe(gulp.dest("web/resources/css"));
});

gulp.task('js', function () {
    return gulp.src("./node_modules/bootstrap/dist/js/*.js")
        .pipe(gulp.dest("web/resources/js"));
});

gulp.task('font', function () {
    return gulp.src("./node_modules/bootstrap/dist/fonts/*")
        .pipe(gulp.dest("web/resources/fonts"));
});


gulp.task('build', ['css', 'js', 'font']);
