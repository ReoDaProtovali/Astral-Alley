<<<<<<< HEAD:tgui/packages/tgui-dev-server/link/retrace.js
/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import fs from 'fs';
import { basename } from 'path';

import { createLogger } from '../logging.js';
import { require } from '../require.js';
import { resolveGlob } from '../util.js';
=======
import path from 'node:path';

import { SourceMapConsumer } from 'source-map';
import { parse as parseStackTrace } from 'stacktrace-parser';

import { createLogger } from '../logging';
import { resolveGlob } from '../util';

type SourceMap = {
  file: string;
  consumer: SourceMapConsumer;
};
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/link/retrace.ts

const SourceMap = require('source-map');
const { parse: parseStackTrace } = require('stacktrace-parser');

const logger = createLogger('retrace');

<<<<<<< HEAD:tgui/packages/tgui-dev-server/link/retrace.js
const { SourceMapConsumer } = SourceMap;
const sourceMaps = [];

export const loadSourceMaps = async (bundleDir) => {
=======
const sourceMaps: SourceMap[] = [];

export async function loadSourceMaps(bundleDir: string): Promise<void> {
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/link/retrace.ts
  // Destroy and garbage collect consumers
  while (sourceMaps.length !== 0) {
    const map = sourceMaps.shift();
    if (!map?.consumer) continue;
    map.consumer.destroy();
  }

  // Load new sourcemaps
<<<<<<< HEAD:tgui/packages/tgui-dev-server/link/retrace.js
  const paths = await resolveGlob(bundleDir, '*.map');
  for (let path of paths) {
=======
  const files = await resolveGlob(bundleDir, '*.map');
  for (const file of files) {
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/link/retrace.ts
    try {
      const loc = path.resolve(bundleDir, file);
      const parsed = await Bun.file(loc).json();
      const consumer = await new SourceMapConsumer(parsed);

      sourceMaps.push({ file, consumer });
    } catch (err) {
      logger.error(err);
    }
  }

  logger.log(`loaded ${sourceMaps.length} source maps`);
};

<<<<<<< HEAD:tgui/packages/tgui-dev-server/link/retrace.js
export const retrace = (stack) => {
=======
export function retrace(stack: string): string | undefined {
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/link/retrace.ts
  if (typeof stack !== 'string') {
    logger.log('ERROR: Stack is not a string!', stack);
    return stack;
  }
  const header = stack.split(/\n\s.*at/)[0];
  const mappedStack = parseStackTrace(stack)
    .map((frame) => {
      if (!frame.file) {
        return frame;
      }
      // Find the correct source map
      const sourceMap = sourceMaps.find((sourceMap) => {
        return frame.file!.includes(sourceMap.file);
      });
      if (!sourceMap) {
        return frame;
      }
      // Map the frame
      const { consumer } = sourceMap;
      const mappedFrame = consumer.originalPositionFor({
        line: frame.lineNumber || 0,
        column: frame.column || 0,
      });
      return {
        ...frame,
        file: mappedFrame.source,
        lineNumber: mappedFrame.line,
        column: mappedFrame.column,
      };
    })
    .map((frame) => {
      // Stringify the frame
      const { file, methodName, lineNumber } = frame;
      if (!file) {
        return `  at ${methodName}`;
      }
      const compactPath = file
        .replace(/^webpack:\/\/\/?/, './')
        .replace(/.*node_modules\//, '');
      return `  at ${methodName} (${compactPath}:${lineNumber})`;
    })
    .join('\n');

  return header + '\n' + mappedStack;
};
