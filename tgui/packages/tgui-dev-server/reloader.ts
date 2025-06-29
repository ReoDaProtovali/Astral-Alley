/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

<<<<<<< HEAD:tgui/packages/tgui-dev-server/reloader.js
import fs from 'fs';
import os from 'os';
import { basename } from 'path';
=======
import os from 'node:os';
import path from 'node:path';
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/reloader.ts

import { DreamSeeker } from './dreamseeker';
import { createLogger } from './logging';
import { resolveGlob, resolvePath } from './util';
import { regQuery } from './winreg';

const logger = createLogger('reloader');

const HOME = os.homedir();
const SEARCH_LOCATIONS = [
  // Custom location
  process.env.BYOND_CACHE,
  // Windows
  `${HOME}/*/BYOND/cache`,
  // Wine
  `${HOME}/.wine/drive_c/users/*/*/BYOND/cache`,
  // Lutris
  `${HOME}/Games/byond/drive_c/users/*/*/BYOND/cache`,
  // WSL
  `/mnt/c/Users/*/*/BYOND/cache`,
];

let cacheRoot: string;

<<<<<<< HEAD:tgui/packages/tgui-dev-server/reloader.js
export const findCacheRoot = async () => {
=======
export async function findCacheRoot(): Promise<string | undefined> {
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/reloader.ts
  if (cacheRoot) {
    return cacheRoot;
  }
  logger.log('looking for byond cache');
  // Find BYOND cache folders
<<<<<<< HEAD:tgui/packages/tgui-dev-server/reloader.js
  for (let pattern of SEARCH_LOCATIONS) {
=======

  for (const pattern of SEARCH_LOCATIONS) {
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/reloader.ts
    if (!pattern) {
      continue;
    }

    const paths = await resolveGlob(pattern);
    if (paths.length > 0) {
      cacheRoot = paths[0];
      onCacheRootFound(cacheRoot);
      return cacheRoot;
    }
  }

  // Query the Windows Registry
  if (process.platform === 'win32') {
    logger.log('querying windows registry');
    let userpath = await regQuery('HKCU\\Software\\Dantom\\BYOND', 'userpath');
    if (userpath) {
<<<<<<< HEAD:tgui/packages/tgui-dev-server/reloader.js
      // prettier-ignore
      cacheRoot = userpath
        .replace(/\\$/, '')
        .replace(/\\/g, '/')
        + '/cache';
      onCacheRootFound(cacheRoot);
=======
      cacheRoot = userpath.replace(/\\$/, '').replace(/\\/g, '/') + '/cache';
      await onCacheRootFound(cacheRoot);
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/reloader.ts
      return cacheRoot;
    }
  }
  logger.log('found no cache directories');
};

<<<<<<< HEAD:tgui/packages/tgui-dev-server/reloader.js
const onCacheRootFound = (cacheRoot) => {
  logger.log(`found cache at '${cacheRoot}'`);
  // Plant a dummy browser window file, we'll be using this to avoid world topic. For byond 514.
  fs.closeSync(fs.openSync(cacheRoot + '/dummy', 'w'));
};

export const reloadByondCache = async (bundleDir) => {
=======
async function onCacheRootFound(cacheRoot: string): Promise<void> {
  logger.log(`found cache at '${cacheRoot}'`);
  // Plant a dummy browser window file, we'll be using this to avoid world topic. For byond 514.
  await Bun.write(cacheRoot + '/dummy.htm', '');
}

export async function reloadByondCache(bundleDir: string): Promise<void> {
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/reloader.ts
  const cacheRoot = await findCacheRoot();
  if (!cacheRoot) return;

  // Find tmp folders in cache
  const cacheDirs = await resolveGlob(cacheRoot, './tmp*');
  if (cacheDirs.length === 0) {
    logger.log('found no tmp folder in cache');
    return;
  }
  // Get dreamseeker instances
  const pids = cacheDirs.map((cacheDir) =>
    parseInt(cacheDir.split('/cache/tmp').pop(), 10),
  );
  const dssPromise = DreamSeeker.getInstancesByPids(pids);
  // Copy assets
<<<<<<< HEAD:tgui/packages/tgui-dev-server/reloader.js
  const assets = await resolveGlob(
    bundleDir,
    './*.+(bundle|chunk|hot-update).*',
  );
  for (let cacheDir of cacheDirs) {
    // Clear garbage
    const garbage = await resolveGlob(
      cacheDir,
      './*.+(bundle|chunk|hot-update).*',
    );
    try {
      // Plant a dummy browser window file, we'll be using this to avoid world topic. For byond 515.
      fs.closeSync(fs.openSync(cacheDir + '/dummy', 'w'));

      for (let file of garbage) {
        fs.unlinkSync(file);
      }
      // Copy assets
      for (let asset of assets) {
        const destination = resolvePath(cacheDir, basename(asset));
        fs.writeFileSync(destination, fs.readFileSync(asset));
=======
  const assets = await resolveGlob(bundleDir, bundleGlob);

  for (const cacheDir of cacheDirs) {
    // Clear garbage
    const garbage = await resolveGlob(cacheDir, bundleGlob);
    for (const file of garbage) {
      await Bun.file(file).delete();
    }

    try {
      // Plant a dummy browser window file, we'll be using this to avoid world topic. For byond 515-516.
      await Bun.write(cacheDir + '/dummy.htm', '');

      // Copy assets
      for (const asset of assets) {
        const destination = resolvePath(cacheDir, path.basename(asset));
        const input = Bun.file(asset);
        const output = Bun.file(destination);

        await Bun.write(output, input);
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/reloader.ts
      }
      logger.log(`copied ${assets.length} files to '${cacheDir}'`);
    } catch (err) {
      logger.error(`failed copying to '${cacheDir}'`);
      logger.error(err);
    }
  }
  // Notify dreamseeker
  const dss = await dssPromise;
  if (dss.length > 0) {
    logger.log(`notifying dreamseeker`);
    for (let dreamseeker of dss) {
      dreamseeker.topic({
        tgui: 1,
        type: 'cacheReloaded',
      });
    }
  }
};
