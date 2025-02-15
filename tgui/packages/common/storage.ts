/**
 * Browser-agnostic abstraction of key-value web storage.
 *
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

export const IMPL_MEMORY = 0;
<<<<<<< HEAD:tgui/packages/common/storage.js
export const IMPL_LOCAL_STORAGE = 1;
export const IMPL_INDEXED_DB = 2;
=======
export const IMPL_HUB_STORAGE = 1;

type StorageImplementation = typeof IMPL_MEMORY | typeof IMPL_HUB_STORAGE;
>>>>>>> 39c89988b5 ([MIRROR] Revert "Revert "storage to typescript"" (#10181)):tgui/packages/common/storage.ts

const INDEXED_DB_VERSION = 1;
const INDEXED_DB_NAME = 'chomp'; // CHOMPEdit - CHOMPStation Localstore
const INDEXED_DB_STORE_NAME = 'storage-v1';

const READ_ONLY = 'readonly';
const READ_WRITE = 'readwrite';

type StorageBackend = {
  impl: StorageImplementation;
  get(key: string): Promise<any>;
  set(key: string, value: any): Promise<void>;
  remove(key: string): Promise<void>;
  clear(): Promise<void>;
};

const testGeneric = (testFn: () => boolean) => (): boolean => {
  try {
    return Boolean(testFn());
  } catch {
    return false;
  }
};

<<<<<<< HEAD:tgui/packages/common/storage.js
// Localstorage can sometimes throw an error, even if DOM storage is not
// disabled in IE11 settings.
// See: https://superuser.com/questions/1080011
// prettier-ignore
const testLocalStorage = testGeneric(() => (
  window.localStorage && window.localStorage.getItem
));

// prettier-ignore
const testIndexedDb = testGeneric(() => (
  (window.indexedDB || window.msIndexedDB)
  && (window.IDBTransaction || window.msIDBTransaction)
));

class MemoryBackend {
=======
const testHubStorage = testGeneric(
  () => window.hubStorage && !!window.hubStorage.getItem,
);

class HubStorageBackend implements StorageBackend {
  public impl: StorageImplementation;

>>>>>>> 39c89988b5 ([MIRROR] Revert "Revert "storage to typescript"" (#10181)):tgui/packages/common/storage.ts
  constructor() {
    this.impl = IMPL_MEMORY;
    this.store = {};
  }

<<<<<<< HEAD:tgui/packages/common/storage.js
  get(key) {
    return this.store[key];
  }

  set(key, value) {
    this.store[key] = value;
  }

  remove(key) {
    this.store[key] = undefined;
  }

  clear() {
    this.store = {};
  }
}

class LocalStorageBackend {
  constructor() {
    this.impl = IMPL_LOCAL_STORAGE;
  }

  get(key) {
    const value = localStorage.getItem(key);
=======
  async get(key: string): Promise<any> {
    const value = await window.hubStorage.getItem('chomp-' + key); // CHOMPEdit
>>>>>>> 39c89988b5 ([MIRROR] Revert "Revert "storage to typescript"" (#10181)):tgui/packages/common/storage.ts
    if (typeof value === 'string') {
      return JSON.parse(value);
    }
    return undefined;
  }

<<<<<<< HEAD:tgui/packages/common/storage.js
  set(key, value) {
    localStorage.setItem(key, JSON.stringify(value));
  }

  remove(key) {
    localStorage.removeItem(key);
  }

  clear() {
    localStorage.clear();
  }
}

class IndexedDbBackend {
  constructor() {
    this.impl = IMPL_INDEXED_DB;
    /** @type {Promise<IDBDatabase>} */
    this.dbPromise = new Promise((resolve, reject) => {
      const indexedDB = window.indexedDB || window.msIndexedDB;
      const req = indexedDB.open(INDEXED_DB_NAME, INDEXED_DB_VERSION);
      req.onupgradeneeded = () => {
        try {
          req.result.createObjectStore(INDEXED_DB_STORE_NAME);
        } catch (err) {
          reject(new Error('Failed to upgrade IDB: ' + req.error));
        }
      };
      req.onsuccess = () => resolve(req.result);
      req.onerror = () => {
        reject(new Error('Failed to open IDB: ' + req.error));
      };
    });
  }

  getStore(mode) {
    // prettier-ignore
    return this.dbPromise.then((db) => db
      .transaction(INDEXED_DB_STORE_NAME, mode)
      .objectStore(INDEXED_DB_STORE_NAME));
  }

  async get(key) {
    const store = await this.getStore(READ_ONLY);
    return new Promise((resolve, reject) => {
      const req = store.get(key);
      req.onsuccess = () => resolve(req.result);
      req.onerror = () => reject(req.error);
    });
  }

  async set(key, value) {
    // The reason we don't _save_ null is because IE 10 does
    // not support saving the `null` type in IndexedDB. How
    // ironic, given the bug below!
    // See: https://github.com/mozilla/localForage/issues/161
    if (value === null) {
      value = undefined;
    }
    // NOTE: We deliberately make this operation transactionless
    const store = await this.getStore(READ_WRITE);
    store.put(value, key);
  }

  async remove(key) {
    // NOTE: We deliberately make this operation transactionless
    const store = await this.getStore(READ_WRITE);
    store.delete(key);
  }

  async clear() {
    // NOTE: We deliberately make this operation transactionless
    const store = await this.getStore(READ_WRITE);
    store.clear();
=======
  async set(key: string, value: any): Promise<void> {
    window.hubStorage.setItem('chomp-' + key, JSON.stringify(value)); // CHOMPEdit
  }

  async remove(key: string): Promise<void> {
    window.hubStorage.removeItem('chomp-' + key); // CHOMPEdit
  }

  async clear(): Promise<void> {
    window.hubStorage.clear();
>>>>>>> 39c89988b5 ([MIRROR] Revert "Revert "storage to typescript"" (#10181)):tgui/packages/common/storage.ts
  }
}

/**
 * Web Storage Proxy object, which selects the best backend available
 * depending on the environment.
 */
class StorageProxy implements StorageBackend {
  private backendPromise: Promise<StorageBackend>;
  public impl: StorageImplementation = IMPL_MEMORY;

  constructor() {
    this.backendPromise = (async () => {
      if (testIndexedDb()) {
        try {
          const backend = new IndexedDbBackend();
          await backend.dbPromise;
          return backend;
        } catch {}
      }
<<<<<<< HEAD:tgui/packages/common/storage.js
      if (testLocalStorage()) {
        return new LocalStorageBackend();
      }
      return new MemoryBackend();
    })();
=======
    })() as Promise<StorageBackend>;
>>>>>>> 39c89988b5 ([MIRROR] Revert "Revert "storage to typescript"" (#10181)):tgui/packages/common/storage.ts
  }

  async get(key: string): Promise<any> {
    const backend = await this.backendPromise;
    return backend.get(key);
  }

  async set(key: string, value: any): Promise<void> {
    const backend = await this.backendPromise;
    return backend.set(key, value);
  }

  async remove(key: string): Promise<void> {
    const backend = await this.backendPromise;
    return backend.remove(key);
  }

  async clear(): Promise<void> {
    const backend = await this.backendPromise;
    return backend.clear();
  }
}

export const storage = new StorageProxy();
