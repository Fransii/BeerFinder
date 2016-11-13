/**
 * Created by mr_shadow on 13.11.16.
 */
var gulp = require('gulp');

gulp.task('css', function () {
    return gulp.src("./node_modules/bootstrap/dist/css/*.css")
        .pipe(gulp.dest("web/assets/css"));
});

gulp.task('js', function () {
    return gulp.src("./node_modules/bootstrap/dist/js/*.js")
        .pipe(gulp.dest("web/assets/js"));
});

gulp.task('build', ['css', 'js']);
