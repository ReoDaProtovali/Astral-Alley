<<<<<<< HEAD:tgui/packages/tgui/interfaces/pda/pda_status_display.tsx
import { useBackend } from '../../backend';
import { Box, Button, LabeledList } from '../../components';
=======
import { useBackend } from 'tgui/backend';
import { Box, Button, LabeledList } from 'tgui-core/components';
>>>>>>> 3aa9314ff4 ([MIRROR] Moves UIs to TGUI core (#9967)):tgui/packages/tgui/interfaces/Pda/pda_screens/pda_status_display.tsx

type Data = { records: { message1: string; message2: string } | null };

export const pda_status_display = (props) => {
  const { act, data } = useBackend<Data>();

  const { records } = data;

  return (
    <Box>
      <LabeledList>
        <LabeledList.Item label="Code">
          <Button
            color="transparent"
            icon="trash"
            onClick={() => act('Status', { statdisp: 'blank' })}
          >
            Clear
          </Button>
          <Button
            color="transparent"
            icon="cog"
            onClick={() => act('Status', { statdisp: 'shuttle' })}
          >
            Evac ETA
          </Button>
          <Button
            color="transparent"
            icon="cog"
            onClick={() => act('Status', { statdisp: 'message' })}
          >
            Message
          </Button>
          <Button
            color="transparent"
            icon="exclamation-triangle"
            onClick={() => act('Status', { statdisp: 'alert' })}
          >
            ALERT
          </Button>
        </LabeledList.Item>
        <LabeledList.Item label="Message line 1">
          <Button
            icon="pen"
            onClick={() => act('Status', { statdisp: 'setmsg1' })}
          >
            {records && records.message1 + ' (set)'}
          </Button>
        </LabeledList.Item>
        <LabeledList.Item label="Message line 2">
          <Button
            icon="pen"
            onClick={() => act('Status', { statdisp: 'setmsg2' })}
          >
            {records && records.message2 + ' (set)'}
          </Button>
        </LabeledList.Item>
      </LabeledList>
    </Box>
  );
};
