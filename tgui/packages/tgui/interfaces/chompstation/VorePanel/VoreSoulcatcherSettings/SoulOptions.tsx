import { useBackend } from 'tgui/backend';
<<<<<<< HEAD:tgui/packages/tgui/interfaces/chompstation/VorePanel/VoreSoulcatcherSettings/SoulOptions.tsx
import { Box, Button, LabeledList } from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';
=======
import { Button, LabeledList, Stack } from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';
>>>>>>> da9d408106 ([MIRROR] re adds the gap beteen section buttons (#10632)):tgui/packages/tgui/interfaces/VorePanel/VoreSoulcatcherSettings/SoulOptions.tsx

export const SoulOptions = (props: { taken_over: BooleanLike }) => {
  const { act } = useBackend();

  const { taken_over } = props;

  return (
    <LabeledList.Item label="Soul Options">
      <Stack>
        {!taken_over ? (
          <>
            <Stack.Item>
              <Button
                icon="key"
                tooltip="Release the currently selected soul as ghosts."
                tooltipPosition="bottom"
                onClick={() => act('soulcatcher_release')}
                selected
              >
                Release
              </Button>
            </Stack.Item>
            <Stack.Item>
              <Button
                icon="right-left"
                tooltip="Tansfer the currently selected soul into a held or nearby Sleevemate or MMI."
                tooltipPosition="bottom"
                onClick={() => act('soulcatcher_transfer')}
              >
                Transfer
              </Button>
            </Stack.Item>
            <Stack.Item>
              <Button.Confirm
                icon="skull"
                tooltip="Delete the currently selected soul if preferences align or release it."
                tooltipPosition="bottom"
                color="red"
                confirmIcon="triangle-exclamation"
                onClick={() => act('soulcatcher_delete')}
              >
                Delete
              </Button.Confirm>
            </Stack.Item>
          </>
        ) : (
          ''
        )}
        <Stack.Item>
          <Button
            icon="arrows-left-right"
            color="yellow"
            tooltip="Transfer control to the selected soul."
            tooltipPosition="bottom"
            onClick={() => act('soulcatcher_transfer_control')}
          >
            Transfer Control
          </Button>
        </Stack.Item>
      </Stack>
    </LabeledList.Item>
  );
};
