<<<<<<< HEAD:tgui/packages/tgui/interfaces/chompstation/VorePanel/VoreUserPreferencesTabs/VoreUserPreferencesSoulcatcher.tsx
import { Box, Section, Stack } from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';
=======
import { Section, Stack } from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';
>>>>>>> da9d408106 ([MIRROR] re adds the gap beteen section buttons (#10632)):tgui/packages/tgui/interfaces/VorePanel/VoreUserPreferencesTabs/VoreUserPreferencesSoulcatcher.tsx

import { localPrefs } from '../types';
import { VoreUserPreferenceItem } from '../VoreUserPreferenceItem';

export const VoreUserPreferencesSoulcatcher = (props: {
  soulcatcher_allow_capture: BooleanLike;
  preferences: localPrefs;
}) => {
  const { soulcatcher_allow_capture, preferences } = props;

  return (
    <Section
      title="Soulcatcher Preferences"
      buttons={
        <VoreUserPreferenceItem
          spec={preferences.soulcatcher}
          tooltipPosition="top"
        />
      }
    >
      {soulcatcher_allow_capture ? (
        <Stack wrap="wrap" justify="center">
          <Stack.Item
            basis="32%"
            style={{
              marginLeft: '0.5em', // Remove if tgui core implements gap
            }}
          >
            <VoreUserPreferenceItem
              spec={preferences.soulcatcher_transfer}
              tooltipPosition="right"
            />
          </Stack.Item>
          <Stack.Item basis="32%">
            <VoreUserPreferenceItem
              spec={preferences.soulcatcher_takeover}
              tooltipPosition="top"
            />
          </Stack.Item>
          <Stack.Item basis="32%">
            <VoreUserPreferenceItem
              spec={preferences.soulcatcher_delete}
              tooltipPosition="left"
            />
          </Stack.Item>
        </Stack>
      ) : (
        ''
      )}
    </Section>
  );
};
