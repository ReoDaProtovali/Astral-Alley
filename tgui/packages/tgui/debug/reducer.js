/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

<<<<<<< HEAD:tgui/packages/tgui/debug/reducer.js
export const debugReducer = (state = {}, action) => {
  const { type, payload } = action;
=======
type DebugState = {
  kitchenSink: boolean;
  debugLayout: boolean;
};

export function debugReducer(state = {} as DebugState, action) {
  const { type } = action;
>>>>>>> 335ff75144 ([MIRROR] tgstation/tgstation#90646 (#10681)):tgui/packages/tgui/debug/reducer.ts
  if (type === 'debug/toggleKitchenSink') {
    return {
      ...state,
      kitchenSink: !state.kitchenSink,
    };
  }
  if (type === 'debug/toggleDebugLayout') {
    return {
      ...state,
      debugLayout: !state.debugLayout,
    };
  }
  return state;
}
