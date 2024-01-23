/*
5. Gulp API.

El API de Gulp es muy sencillo y consta 4 instrucciones básicas: gulp.task(), gulp.src(), gulp.dest() y gulp.watch().

codigo gulp

    gulp.task()
        Define una tarea
        Tiene 3 argumentos:
            el nombre de la tarea
            dependencias de otras tareas
            la función a ejecutar
    gulp.src()
        Toma como parámetro una cadena que coincida con uno o más archivos
        Utiliza patrones que usa el intérprete de comandos de unix(shell)
        Retorna un stream que puede ser “pipeado” a un plugin adicional ó hacia el método gulp.dest()
    gulp.dest()
        Canaliza y escribe archivos desde un stream
            Puede canalizar a varias carpetas
            Creará las carpetas que no existan
            Retornará el stream, por si deseamos realizar alguna acción más
        Sirve para escribir los datos actuales de un stream
    gulp.watch()
        Observa archivos y realiza una acción cuando se modifica un archivo
        Esto siempre devuelve un EventEmitter que emite los eventos de cambio
        Tiene 2 formas de uso:
            gulp.watch(glob, [tasks])
            gulp.watch(glob, callback)

*/
var gulp = require('gulp');
var cucumber = require('gulp-cucumber');
var clean = require('gulp-rimraf');
var runner = require("gulp-nodeunit-runner");
var mocker = require('gulp-apimocker');
var reporter = require('gulp-protractor-cucumber-html-report');


gulp.task('clean', () =>{
    return gulp.src(['features/resultados/*'],{read: false })
               .pipe(clean({force: true}))
   });

gulp.task('cucumber-test', () => {
    return gulp.src('*features/*')
                .pipe(cucumber({
                    'steps': '*features/step_definitions/*.js',
                    'support':'*features/support/*.js',
                    'format': 'json:features/resultados/cucumber_report.json'
                })
            );
});


gulp.task('apimocker', () => {
    return mocker.start({
      config: '../node/config-generated.json',
      mockDirectory: '../node/mock'
    });
});


gulp.task('plantilla-html', () =>{
    return gulp.src('index.js')
               .pipe(runner())
});


gulp.task('crear-reporte-protractor-cucumber',() => {
    return gulp.src('features/resultados/cucumber_report.json')
               .pipe(reporter({
                    dest: 'features/resultados/'
                }));
});

exports.bdd = gulp.parallel('apimocker',gulp.series('clean','cucumber-test', 'plantilla-html'));
exports.mockLocal = gulp.parallel('apimocker');

