import { AddonIcon } from './constants';

export const GetAddons = (addons: string[]) => {
  let result: string[] = [];

  addons?.forEach((addon) => {
    result.push(
      `<span class="badge text-bg-secondary"><i class="${AddonIcon[addon]}"></i>${addon}</span>`,
    );
  });

  if (result.length === 0) {
    result.push('No Addons Set');
  }

  return result;
};
<<<<<<< HEAD
=======

export const GetLiquidAddons = (addons: string[]) => {
  const result: string[] = [];

  addons?.forEach((addon) => {
    result.push(
      `<span class="badge text-bg-secondary"><i class="${ReagentAddonIcon[addon]}"></i>${addon}</span>`,
    );
  });

  if (result.length === 0) {
    result.push('No Addons Set');
  }

  return result;
};

export const GetAutotransferFlags = (
  addons: string[],
  whitelist: BooleanLike,
) => {
  const result: string[] = [];

  addons?.forEach((addon) => {
    result.push(
      `<span class="badge text-bg-secondary"><i class="${AutotransferFlagIcon[addon]}"></i>${addon}</span>`,
    );
  });

  if (result.length === 0) {
    if (whitelist) {
      result.push('Everything');
    } else {
      result.push('Nothing');
    }
  }

  return result;
};
>>>>>>> 2e85d4421a ([MIRROR] ban panel as tgui (#11222))
