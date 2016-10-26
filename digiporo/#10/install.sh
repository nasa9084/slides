#!/usr/bin/sh

version=1.0
npm_ver=`npm -v`

vecho() {
    if [ $verbose ]
    then
        echo $1
    fi
    return 0
}

global_setup() {
    vecho "+--------------+"
    vecho "| global setup |"
    vecho "+--------------+"
    vecho ""
    if [ "$USER" != "root" ]
    then
        echo "sudo is required."
        exit 1
    fi

    vecho "install gulp..."
    npm install -g gulp

    if [ $? ]
    then
        vecho "gulp is installed."
        vecho "install browser-sync..."
        npm install -g browser-sync
    fi

    if [ $? ]
    then
        vecho "browser-sync is installed."
        vecho "install gulp-pleeease..."
        npm install -g gulp-pleeease
    fi

    if [ $? ]
    then
        vecho "gulp-pleeease is installed."
        vecho "install gulp-plumber..."
        npm install -g gulp-plumber
    fi

    if [ $? ]
    then
        vecho "gulp-plumber is installed."
        vecho "install gulp-sass..."
        npm install -g gulp-sass
    fi

    if [ $? ]
    then
        vecho "gulp-sass is installed."
        vecho ""
        vecho "+--------------------------------------+"
        vecho "| global setup is done.                |"
        vecho "+- - - - - - - - - - - - - - - - - - - +"
        vecho "| 1. goto project dir                  |"
        vecho "| 2. run this script without -g option |"
        vecho "+--------------------------------------+"
    fi

    return 0
}

check_global() {
    global_list=`npm list -g`
    for idx in "gulp@" "browser-sync@" "gulp-sass@" "gulp-plumber@" "gulp-pleeease@"; do
        cat <<EOF | grep $idx
$global_list
EOF
        if [ $? -eq 1 ]
        then
            echo "${idx} is required."
            echo "run this script with -g option and su"
            exit 1
        fi
    done
    return 0
}

local_install() {
    vecho "+---------------+"
    vecho "| local install |"
    vecho "+---------------+"
    vecho ""
    vecho "check global installation status..."
    check_global
    if [ $? ]
    then
        vecho "global setup is already done."
        vecho "initialize npm..."
        npm init -y
    else
        exit 1
    fi
    if [ $? ]
    then
        vecho "npm initialization is done."
        npm install --save-dev gulp browser-sync gulp-sass gulp-plumber gulp-pleeease
    fi

    mkdir sass
    chmod 777 sass
    mkdir css
    chmod 777 css
    cat <<EOF > gulpfile.js
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
EOF

    vecho "+-----------------------------------+"
    vecho "| local installation is done.       |"
    vecho "| enjoy your coding.                |"
    vecho "+- - - - - - - - - - - - - - - - - -+"
    vecho "| after make scss file in sass dir, |"
    vecho "| run below                         |"
    vecho "|                                   |"
    vecho "| $ gulp                            |"
    vecho "+-----------------------------------+"
    return 0
}

while getopts :gvV OPT; do
    case $OPT in
        g|+g)
            global=1
            ;;
        v|+v)
            version=1
            ;;
        V|+V)
            verbose=1
            ;;
        *)
            echo "usage: `basename $0` [+-gvV} [--] ARGS..."
            exit 2
    esac
done
shift `expr $OPTIND - 1`
OPTIND=1

if [ $ver ]
then
    echo "v${version}"
    exit 0
fi

if [ $global ]
then
    global_setup
else
    local_install
fi

exit $?
