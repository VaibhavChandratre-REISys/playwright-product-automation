import { After, DataTable, Given } from '@cucumber/cucumber';
import { CustomWorld } from '../world/custom-world';
import { ConfigurationRow, FrameworkConfigurationApi } from '../api/framework-configuration-api';
import { logger } from '../utils/logger';

interface ConfigurationState {
  api: FrameworkConfigurationApi;
  defaults: ConfigurationRow[];
}

const states = new WeakMap<CustomWorld, ConfigurationState>();

function stateFor(world: CustomWorld): ConfigurationState {
  let state = states.get(world);
  if (!state) {
    state = { api: new FrameworkConfigurationApi(world.savedValues), defaults: [] };
    states.set(world, state);
  }
  return state;
}

function configurationRows(table: DataTable): ConfigurationRow[] {
  return table.hashes().map((row) => ({
    configurationCategory: row.configurationCategory,
    fieldName: row.fieldName,
    fieldNewValue: row.fieldNewValue,
    fieldOrignalValue: row.fieldOrignalValue,
    coreComponentField: row.coreComponentField,
    coreCOmponentSubFieldName: row.coreCOmponentSubFieldName,
    coreComponentSubFieldValue: row.coreComponentSubFieldValue,
    filterId: row.filterId,
  }));
}

Given('I have {string} configuration as below:', function (
  this: CustomWorld,
  _configurationType: string,
  table: DataTable
) {
  stateFor(this).defaults.push(...configurationRows(table));
});

Given('I setup test configuration as below:', async function (this: CustomWorld, table: DataTable) {
  const state = stateFor(this);
  for (const row of configurationRows(table)) {
    await state.api.apply(row);
  }
});

After(async function (this: CustomWorld) {
  const state = states.get(this);
  if (!state?.defaults.length) return;
  try {
    for (const row of state.defaults) await state.api.apply(row);
  } catch (error) {
    logger.warn(`[CONFIG] Failed to restore framework configuration: ${error}`);
  } finally {
    states.delete(this);
  }
});
