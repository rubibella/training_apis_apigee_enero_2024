var reporter = require('cucumber-html-reporter');

var options = {
        theme: 'bootstrap',
        jsonFile: 'features/resultados/cucumber_report.json',
        output: 'features/resultados/cucumber_report.html',
        reportSuiteAsScenarios: true,
        launchReport: true,
        metadata: {
            "Test Environment": "STAGING"
        }
    };

    reporter.generate(options);
 