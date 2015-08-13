exports.config = {
  seleniumAddress: 'http://localhost:4444/wd/hub',
  specs: ['e2e/*-spec.js'],
  allScriptsTimeout: 11000,
  capabilities: {
    'browserName': 'chrome'
  },
  baseUrl: 'http://localhost:8000/app/',
  framework: 'jasmine',
  jasmineNodeOpts: {
    defaultTimeoutInterval: 30000
  }
};
