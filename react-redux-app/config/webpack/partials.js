import curry from 'lodash.curry';
import { mergeStringIntoConfig, mergeObjectIntoConfig } from '../utils';

export const context = curry((context, config) =>
  mergeStringIntoConfig('context', context, config),
);

export const mode = curry((mode, config) =>
  mergeStringIntoConfig('mode', mode, config),
);

export const entry = curry((entryPoint, config) =>
  mergeObjectIntoConfig('entry', entryPoint, config),
);

export const output = curry((output, config) =>
  mergeObjectIntoConfig('output', output, config),
);

export const devtool = curry((devtool, config) =>
  mergeStringIntoConfig('devtool', devtool, config),
);
