<<<<<<< HEAD
import { BooleanLike } from 'common/react';

import { useBackend } from '../../../../backend';
import { Button, LabeledList } from '../../../../components';
=======
import { useBackend } from 'tgui/backend';
import { Button, LabeledList } from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';
>>>>>>> 4c7ad3003b (Tgui core for our UIs (#9925))

export const VoreSelectedBellyDescriptionsBellymode = (props: {
  message_mode: BooleanLike;
  mode: string;
}) => {
  const { act } = useBackend();

  const { message_mode, mode } = props;

  return (
    <LabeledList.Item label="Bellymode Messages">
      {(message_mode || mode === 'Digest' || mode === 'Selective') && (
        <>
          <Button
            onClick={() =>
              act('set_attribute', { attribute: 'b_msgs', msgtype: 'dmp' })
            }
          >
            Digest Message (to prey)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', { attribute: 'b_msgs', msgtype: 'dmo' })
            }
          >
            Digest Message (to you)
          </Button>
        </>
      )}
      {(message_mode || mode === 'Absorb' || mode === 'Selective') && (
        <>
          <Button
            onClick={() =>
              act('set_attribute', { attribute: 'b_msgs', msgtype: 'amp' })
            }
          >
            Absorb Message (to prey)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', { attribute: 'b_msgs', msgtype: 'amo' })
            }
          >
            Absorb Message (to you)
          </Button>
        </>
      )}
      {(message_mode || mode === 'Unabsorb') && (
        <>
          <Button
            onClick={() =>
              act('set_attribute', { attribute: 'b_msgs', msgtype: 'uamp' })
            }
          >
            Unabsorb Message (to prey)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', { attribute: 'b_msgs', msgtype: 'uamo' })
            }
          >
            Unabsorb Message (to you)
          </Button>
        </>
      )}
    </LabeledList.Item>
  );
};
