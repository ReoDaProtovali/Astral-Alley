import { Box, Section, Stack } from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

<<<<<<< HEAD:tgui/packages/tgui/interfaces/chompstation/VorePanel/VoreUserPreferencesTabs/VoreUserPreferencesSoulcatcher.tsx
import { localPrefs } from '../types';
import { VoreUserPreferenceItem } from '../VoreUserPreferenceItem';
=======
import type { localPrefs } from '../types';
import { VoreUserPreferenceItem } from '../VorePanelElements/VoreUserPreferenceItem';
>>>>>>> e707f50344 ([MIRROR] vorepanel reloaded (#10961)):tgui/packages/tgui/interfaces/VorePanel/VoreUserPreferencesTabs/VoreUserPreferencesSoulcatcher.tsx

export const VoreUserPreferencesSoulcatcher = (props: {
  soulcatcher_allow_capture: BooleanLike;
  preferences: localPrefs;
}) => {
  const { soulcatcher_allow_capture, preferences } = props;

  return (
    <Section
      title="Soulcatcher Preferences"
      buttons={
        <Box nowrap>
          <VoreUserPreferenceItem
            spec={preferences.soulcatcher}
            tooltipPosition="top"
          />
        </Box>
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
