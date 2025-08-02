export const stats: (string | undefined)[] = [undefined, 'average', 'bad'];

export const digestModeToColor = {
  Hold: null,
  Digest: 'red',
  Absorb: 'purple',
  Unabsorb: 'purple',
  Drain: 'orange',
  Selective: 'orange',
  Shrink: 'teal',
  Grow: 'teal',
  'Size Steal': 'teal',
  Heal: 'green',
  'Encase In Egg': 'blue',
<<<<<<< HEAD
=======
  'Digest (Food Only)': 'red',
  'Digest (Dispersed Damage)': 'red',
};

export const reagentToColor = {
  Water: undefined,
  Milk: undefined,
  Cream: undefined,
  Honey: 'teal',
  'Cherry Jelly': 'teal',
  'Digestive acid': 'red',
  'Diluted digestive acid': 'red',
  'Space cleaner': undefined,
  'Space Lube': undefined,
  Biomass: 'teal',
  'Concentrated Radium': 'orange',
  Tricordrazine: 'green',
  Ethanol: undefined,
>>>>>>> 4b4edabce6 ([MIRROR] Transfer Liquids with Prey and Ethanol Bellies (#11285))
};

export const digestModeToPreyMode = {
  Hold: 'being held.',
  Digest: 'being digested.',
  Absorb: 'being absorbed.',
  Unabsorb: 'being unabsorbed.',
  Drain: 'being drained.',
  Selective: 'being processed.',
  Shrink: 'being shrunken.',
  Grow: 'being grown.',
  'Size Steal': 'having your size stolen.',
  Heal: 'being healed.',
  'Encase In Egg': 'being encased in an egg.',
};

export const SYNTAX_REGEX =
  /%belly|%pred|%prey|%countpreytotal|%countpreyabsorbed|%countprey|%countghosts|%count|%digestedprey|%ghost|%item|%dest|%goo|%happybelly|%fat|%grip|%cozy|%angry|%acid|%snack|%hot|%snake/g;
export const SYNTAX_COLOR = {
  '%belly': 'average',
  '%pred': 'bad',
  '%prey': 'good',
};
