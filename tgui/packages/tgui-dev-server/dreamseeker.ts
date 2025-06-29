/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

<<<<<<< HEAD:tgui/packages/tgui-dev-server/dreamseeker.js
import { exec } from 'child_process';
import { promisify } from 'util';

import { createLogger } from './logging.js';
import { require } from './require.js';
=======
import { exec } from 'node:child_process';
import { promisify } from 'node:util';

import axios, { type AxiosInstance, type AxiosResponse } from 'axios';

import { createLogger } from './logging';

type Entry = {
  addr: string;
  pid: number;
};
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/dreamseeker.ts

const axios = require('axios');
const logger = createLogger('dreamseeker');

const instanceByPid = new Map();

export class DreamSeeker {
<<<<<<< HEAD:tgui/packages/tgui-dev-server/dreamseeker.js
  constructor(pid, addr) {
=======
  public pid: number;
  public addr: string;
  public client: AxiosInstance;

  constructor(pid: number, addr: string) {
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/dreamseeker.ts
    this.pid = pid;
    this.addr = addr;
    this.client = axios.create({
      baseURL: `http://${addr}/`,
    });
  }

<<<<<<< HEAD:tgui/packages/tgui-dev-server/dreamseeker.js
  topic(params = {}) {
    // prettier-ignore
=======
  topic(params: Record<string, any> = {}): Promise<AxiosResponse> {
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/dreamseeker.ts
    const query = Object.keys(params)
      .map(key => encodeURIComponent(key)
        + '=' + encodeURIComponent(params[key]))
      .join('&');
    logger.log(
      `topic call at ${this.client.defaults.baseURL + '/dummy?' + query}`,
    );
    return this.client.get('/dummy?' + query);
  }
}

<<<<<<< HEAD:tgui/packages/tgui-dev-server/dreamseeker.js
/**
 * @param {number[]} pids
 * @returns {DreamSeeker[]}
 */
DreamSeeker.getInstancesByPids = async (pids) => {
  if (process.platform !== 'win32') {
    return [];
  }
  const instances = [];
  const pidsToResolve = [];
  for (let pid of pids) {
    const instance = instanceByPid.get(pid);
    if (instance) {
      instances.push(instance);
    } else {
      pidsToResolve.push(pid);
=======
  static async getInstancesByPids(pids: number[]): Promise<DreamSeeker[]> {
    const instances: DreamSeeker[] = [];
    const pidsToResolve: number[] = [];

    for (const pid of pids) {
      const instance = instanceByPid.get(pid);
      if (instance) {
        instances.push(instance);
      } else {
        pidsToResolve.push(pid);
      }
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/dreamseeker.ts
    }
  }
  if (pidsToResolve.length > 0) {
    try {
      const command = 'netstat -ano | findstr TCP | findstr 0.0.0.0:0';
      const { stdout } = await promisify(exec)(command, {
        // Max buffer of 1MB (default is 200KB)
        maxBuffer: 1024 * 1024,
      });
      // Line format:
      // proto addr mask mode pid
      const entries: Entry[] = [];
      const lines = stdout.split('\r\n');
      for (let line of lines) {
        const words = line.match(/\S+/g);
        if (!words || words.length === 0) {
          continue;
        }
        const entry: Entry = {
          addr: words[1],
          pid: parseInt(words[4], 10),
        };
        if (pidsToResolve.includes(entry.pid)) {
          entries.push(entry);
        }
      }
      const len = entries.length;
      logger.log('found', len, plural('instance', len));
      for (let entry of entries) {
        const { pid, addr } = entry;
        const instance = new DreamSeeker(pid, addr);
        instances.push(instance);
        instanceByPid.set(pid, instance);
      }
    } catch (err) {
      if (err.code === 'ERR_CHILD_PROCESS_STDIO_MAXBUFFER') {
        logger.error(err.message, err.code);
      } else {
        logger.error(err);
      }
      return [];
    }
  }
  return instances;
};

<<<<<<< HEAD:tgui/packages/tgui-dev-server/dreamseeker.js
const plural = (word, n) => (n !== 1 ? word + 's' : word);
=======
function plural(word: string, n: number): string {
  return n !== 1 ? word + 's' : word;
}
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/dreamseeker.ts
