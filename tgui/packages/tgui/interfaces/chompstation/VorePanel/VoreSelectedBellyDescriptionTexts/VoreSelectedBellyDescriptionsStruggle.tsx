<<<<<<< HEAD
import { useBackend } from '../../../../backend';
import { Button, LabeledList } from '../../../../components';
=======
import { useBackend } from 'tgui/backend';
import { Button, LabeledList } from 'tgui-core/components';
>>>>>>> 4c7ad3003b (Tgui core for our UIs (#9925))

export const VoreSelectedBellyDescriptionsStruggle = (props) => {
  const { act } = useBackend();

  return (
    <LabeledList.Item label="Struggle Messages">
      <Button
        onClick={() =>
          act('set_attribute', { attribute: 'b_msgs', msgtype: 'smo' })
        }
      >
        Struggle Message (outside)
      </Button>
      <Button
        onClick={() =>
          act('set_attribute', { attribute: 'b_msgs', msgtype: 'smi' })
        }
      >
        Struggle Message (inside)
      </Button>
      <Button
        onClick={() =>
          act('set_attribute', { attribute: 'b_msgs', msgtype: 'asmo' })
        }
      >
        Absorbed Struggle Message (outside)
      </Button>
      <Button
        onClick={() =>
          act('set_attribute', { attribute: 'b_msgs', msgtype: 'asmi' })
        }
      >
        Absorbed Struggle Message (inside)
      </Button>
    </LabeledList.Item>
  );
};
