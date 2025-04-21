/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import fs, { globSync } from 'node:fs';
import path from 'node:path';

export const resolvePath = path.resolve;

/** Combines path.resolve with glob patterns. */
export function resolveGlob(...sections) {
  /** @type {string[]} */
  const unsafePaths = globSync(path.resolve(...sections));

  /** @type {string[]} */
  const safePaths = [];
<<<<<<< HEAD
  for (let path of unsafePaths) {
=======

  for (const path of unsafePaths) {
>>>>>>> 335ff75144 ([MIRROR] tgstation/tgstation#90646 (#10681))
    try {
      fs.statSync(path);
      safePaths.push(path);
    } catch {}
  }

  return safePaths;
}
