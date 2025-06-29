/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { createLogger } from 'tgui/logging';

const logger = createLogger('AudioPlayer');

type CustomAudioElement = HTMLAudioElement & { stop: Function };

function isProtectedError(error: ErrorEvent): boolean {
  return (
    typeof error === 'object' &&
    error !== null &&
    'isTrusted' in error &&
    error.isTrusted
  );
}

export class AudioPlayer {
  node: CustomAudioElement;
  playing: boolean;
  volume: number;
  options: { pitch?: number; start?: number; end?: number };
  onPlaySubscribers: Function[];
  onStopSubscribers: Function[];
  playbackInterval: NodeJS.Timeout;
  constructor() {
    // Set up the HTMLAudioElement node
    this.node = document.createElement('audio') as CustomAudioElement;
    this.node.style.setProperty('display', 'none');
    document.body.appendChild(this.node);
    // Set up other properties
    this.playing = false;
    this.volume = 1;
    this.options = {};
    this.onPlaySubscribers = [];
    this.onStopSubscribers = [];
<<<<<<< HEAD
    // Listen for playback start events
    this.node.addEventListener('canplaythrough', () => {
      logger.log('canplaythrough');
      this.playing = true;
      this.node.playbackRate = this.options.pitch || 1;
      this.node.currentTime = this.options.start || 0;
      this.node.volume = this.volume;
      this.node.play();
      for (let subscriber of this.onPlaySubscribers) {
        subscriber();
      }
    });
    // Listen for playback stop events
    this.node.addEventListener('ended', () => {
      logger.log('ended');
      this.stop();
    });
    // Listen for playback errors
    this.node.addEventListener('error', (e) => {
      if (this.playing) {
        logger.log('playback error', e.error);
        this.stop();
      }
=======
  }

  destroy() {
    this.element = null;
  }

  play(url: string, options: AudioOptions = {}) {
    if (this.element) {
      this.stop();
    }
    this.options = options;

    const audio = new Audio(url);
    if (!audio) {
      logger.log('failed to create audio element');
      return;
    }
    this.element = audio;

    audio.volume = this.volume;
    audio.playbackRate = this.options.pitch || 1;

    logger.log('playing', url, options);

    audio.addEventListener('ended', () => {
      logger.log('ended');
      this.stop();
    });

    audio.addEventListener('error', (error) => {
      if (isProtectedError(error)) {
        Byond.sendMessage('audio/protected');
      }
      logger.log('playback error:', JSON.stringify(error));
      this.stop();
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129))
    });
    // Check every second to stop the playback at the right time
    this.playbackInterval = setInterval(() => {
      if (!this.playing) {
        return;
      }
      const shouldStop =
        this.options.end &&
        this.options.end > 0 &&
        this.node.currentTime >= this.options.end;
      if (shouldStop) {
        this.stop();
      }
    }, 1000);
  }

  destroy() {
    if (!this.node) {
      return;
    }
    this.node.stop();
    document.removeChild(this.node);
    clearInterval(this.playbackInterval);
  }

<<<<<<< HEAD
  play(url, options = {}) {
    if (!this.node) {
      return;
    }
    logger.log('playing', url, options);
    this.options = options;
    this.node.src = url;
=======
    audio.play()?.catch(() => {
      // no error is passed here, it's sent to the event listener
      logger.log('playback failed');
    });

    this.onPlaySubscribers.forEach((subscriber) => subscriber());
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129))
  }

  stop() {
    if (!this.node) {
      return;
    }
    if (this.playing) {
      for (let subscriber of this.onStopSubscribers) {
        subscriber();
      }
    }
    logger.log('stopping');
<<<<<<< HEAD
    this.playing = false;
    this.node.src = '';
=======

    this.element.pause();
    this.destroy();

    this.onStopSubscribers.forEach((subscriber) => subscriber());
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129))
  }

  setVolume(volume) {
    if (!this.node) {
      return;
    }
    this.volume = volume;
    this.node.volume = volume;
  }

  onPlay(subscriber) {
    if (!this.node) {
      return;
    }
    this.onPlaySubscribers.push(subscriber);
  }

  onStop(subscriber) {
    if (!this.node) {
      return;
    }
    this.onStopSubscribers.push(subscriber);
  }
}
