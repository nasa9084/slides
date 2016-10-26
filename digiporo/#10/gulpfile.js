var gulp = require("gulp");
var bs = require("browser-sync");
var plumber = require("gulp-plumber");
var sass = require("gulp-sass");
var pls = require("gulp-pleeease");

gulp.task("sass", function() {
    gulp.src("sass/*.scss")
        .pipe(plumber())
        .pipe(sass())
        .pipe(pls({
            fallbacks: {
                autoprefixer: {"browsers": ["not ie <= 8"]}
            },
            minifier: false
        }))
        .pipe(gulp.dest("./css/"));
});

gulp.task("browser-sync", function() {
    bs({
        server: {
            baseDir: "./"
            ,index: "index.html"
        }
    });
});

gulp.task("bs-reload", function() {
    bs.reload();
});

gulp.task("default", ["browser-sync"], function() {
    gulp.watch("./*.html", ["bs-reload"]);
    gulp.watch("sass/*.scss", ["sass", "bs-reload"]);
});
