import { Box, Collapsible, Section } from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

<<<<<<< HEAD:tgui/packages/tgui/interfaces/VorePanel/VoreInsidePanel.tsx
import { digestModeToColor, digestModeToPreyMode } from './constants';
import type { insideData } from './types';
import { VoreContentsPanel } from './VoreContentsPanel';
=======
import { digestModeToPreyMode, reagentToColor } from '../constants';
import { digestModeToColor } from '../constants';
import type { insideData } from '../types';
import { VoreContentsPanel } from '../VoreSelectedBellyTabs/VoreContentsPanel';
>>>>>>> e707f50344 ([MIRROR] vorepanel reloaded (#10961)):tgui/packages/tgui/interfaces/VorePanel/VorePanelMainTabs/VoreInsidePanel.tsx

export const VoreInsidePanel = (props: {
  inside: insideData;
  show_pictures: BooleanLike;
}) => {
  const { inside, show_pictures } = props;

  const { absorbed, belly_name, belly_mode, desc, pred, contents, ref } =
    inside;

  if (!belly_name) {
    return <Section title="Inside">You aren&apos;t inside anyone.</Section>;
  }

  return (
    <Section title="Inside" fill scrollable>
      <Box color="green" inline>
        You are currently {absorbed ? 'absorbed into' : 'inside'}
      </Box>
      &nbsp;
      <Box color="yellow" inline>
        {pred}&apos;s
      </Box>
      &nbsp;
      <Box color="red" inline>
        {belly_name}
      </Box>
<<<<<<< HEAD:tgui/packages/tgui/interfaces/VorePanel/VoreInsidePanel.tsx
=======
      {!!liq_lvl && liq_lvl > 0 && (
        <>
          ,&nbsp;
          <Box color="yellow" inline>
            bathing in a pool of
          </Box>
          &nbsp;
          <Box color={reagentToColor[liq_reagent_type!]} inline>
            {liuq_name}
          </Box>
        </>
      )}
>>>>>>> e707f50344 ([MIRROR] vorepanel reloaded (#10961)):tgui/packages/tgui/interfaces/VorePanel/VorePanelMainTabs/VoreInsidePanel.tsx
      &nbsp;
      <Box color="yellow" inline>
        and you are
      </Box>
      &nbsp;
      <Box color={digestModeToColor[belly_mode!]} inline>
        {digestModeToPreyMode[belly_mode!]}
      </Box>
      &nbsp;
      <Box color="label">{desc}</Box>
      {contents && contents.length ? (
        <Collapsible title="Belly Contents">
          <VoreContentsPanel
            contents={contents}
            belly={ref}
            show_pictures={show_pictures}
          />
        </Collapsible>
      ) : (
        'There is nothing else around you.'
      )}
    </Section>
  );
};
