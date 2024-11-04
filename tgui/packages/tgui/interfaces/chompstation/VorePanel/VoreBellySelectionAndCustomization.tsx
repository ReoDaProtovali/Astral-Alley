import { BooleanLike } from 'common/react';
<<<<<<< HEAD
=======
import { useBackend } from 'tgui/backend';
import { Box, Divider, Icon, Section, Tabs } from 'tgui/components';
import { Stack } from 'tgui-core/components';
>>>>>>> e292b0cb49 ([MIRROR] Make vore panel layout better for long belly descriptions in the insi… (#9409))

import { useBackend } from '../../../backend';
import { Box, Divider, Flex, Icon, Section, Tabs } from '../../../components';
import { digestModeToColor } from './constants';
import { bellyData, hostMob, selectedData } from './types';
import { VoreSelectedBelly } from './VoreSelectedBelly';

export const VoreBellySelectionAndCustomization = (props: {
  our_bellies: bellyData[];
<<<<<<< HEAD
  selected: selectedData;
=======
  selected: selectedData | null;
>>>>>>> e292b0cb49 ([MIRROR] Make vore panel layout better for long belly descriptions in the insi… (#9409))
  show_pictures: BooleanLike;
  host_mobtype: hostMob;
  icon_overflow: BooleanLike;
}) => {
  const { act } = useBackend();

<<<<<<< HEAD
  const { our_bellies, selected, show_pictures, host_mobtype, icon_overflow } =
    props;

  return (
    <Flex>
      <Flex.Item shrink>
        <Section
          title="My Bellies"
          scrollable
          fill
          height="500px"
          width="200px"
        >
=======
  const {
    our_bellies,
    selected,
    show_pictures,
    host_mobtype,
    icon_overflow,
    vore_words,
  } = props;

  return (
    <Stack fill>
      <Stack.Item shrink basis="20%">
        <Section title="My Bellies" scrollable fill>
>>>>>>> e292b0cb49 ([MIRROR] Make vore panel layout better for long belly descriptions in the insi… (#9409))
          <Tabs vertical>
            <Tabs.Tab onClick={() => act('newbelly')}>
              New
              <Icon name="plus" ml={0.5} />
            </Tabs.Tab>
            <Tabs.Tab onClick={() => act('exportpanel')}>
              Export
              <Icon name="file-export" ml={0.5} />
            </Tabs.Tab>
            <Tabs.Tab onClick={() => act('importpanel')}>
              Import
              <Icon name="file-import" ml={0.5} />
            </Tabs.Tab>
            <Divider />
            {our_bellies.map((belly) => (
              <Tabs.Tab
                key={belly.name}
                selected={!!belly.selected}
                textColor={digestModeToColor[belly.digest_mode]}
                onClick={() => act('bellypick', { bellypick: belly.ref })}
              >
                <Box
                  inline
                  textColor={
                    (belly.selected && digestModeToColor[belly.digest_mode]) ||
                    null
                  }
                >
                  {belly.name} ({belly.contents})
                </Box>
              </Tabs.Tab>
            ))}
          </Tabs>
        </Section>
      </Stack.Item>
      <Stack.Item grow>
        {selected && (
<<<<<<< HEAD
          <Section title={selected.belly_name}>
=======
          <Section title={selected.belly_name} fill scrollable>
>>>>>>> e292b0cb49 ([MIRROR] Make vore panel layout better for long belly descriptions in the insi… (#9409))
            <VoreSelectedBelly
              belly={selected}
              show_pictures={show_pictures}
              host_mobtype={host_mobtype}
              icon_overflow={icon_overflow}
            />
          </Section>
        )}
      </Stack.Item>
    </Stack>
  );
};
