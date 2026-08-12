const project = process.env.PROJECT || 'nysed';

const common = {
  require: [
    'src/framework/support/timeout.ts',
    'src/framework/world/custom-world.ts',
    'src/framework/hooks/browser-hooks.ts',
    'src/framework/step-definitions/**/*.ts',
    `src/${project}/step-definitions/**/*.ts`,
  ],
  requireModule: ['tsx/cjs'],
  format: [
    'progress-bar',
    `json:reports/${project}/cucumber-report.json`,
    `html:reports/${project}/cucumber-report.html`,
  ],
  formatOptions: { snippetInterface: 'async-await' },
};

module.exports = {
  default: {
    ...common,
    paths: [`src/${project}/features/**/*.feature`],
    tags: process.env.TAGS || 'not @wip',
  },
  nysed: {
    ...common,
    paths: ['src/nysed/features/**/*.feature'],
    tags: process.env.TAGS || 'not @wip',
  },
  ksde: {
    ...common,
    paths: ['src/ksde/features/**/*.feature'],
    tags: process.env.TAGS || 'not @wip',
  },
  product: {
    ...common,
    paths: ['src/product/features/**/*.feature'],
    tags: process.env.TAGS || 'not @wip',
  },
};
