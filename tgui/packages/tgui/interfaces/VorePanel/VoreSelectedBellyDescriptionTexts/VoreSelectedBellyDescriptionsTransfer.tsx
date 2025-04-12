import { useBackend } from 'tgui/backend';
import { Button, LabeledList, Stack } from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import type { interactData } from '../types';

export const VoreSelectedBellyDescriptionsTransfer = (props: {
  message_mode: BooleanLike;
  interacts: interactData;
}) => {
  const { act } = useBackend();

  const { message_mode, interacts } = props;

  return (
    <LabeledList.Item label="Transfer Messages">
<<<<<<< HEAD
      {(message_mode || !!interacts.transferlocation) && (
        <>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'trnspp',
              })
            }
          >
            Primary Transfer Message (to prey)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'trnspo',
              })
            }
          >
            Primary Transfer Message (to you)
          </Button>
        </>
      )}
      {(message_mode || !!interacts.transferlocation_secondary) && (
        <>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'trnssp',
              })
            }
          >
            Secondary Transfer Message (to prey)
          </Button>
          <Button
            onClick={() =>
              act('set_attribute', {
                attribute: 'b_msgs',
                msgtype: 'trnsso',
              })
            }
          >
            Secondary Transfer Message (to you)
          </Button>
        </>
      )}
=======
      <Stack wrap>
        {(message_mode || !!interacts.transferlocation) && (
          <>
            <Stack.Item>
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_msgs',
                    msgtype: 'trnspp',
                  })
                }
              >
                Primary Transfer Message (to prey)
              </Button>
            </Stack.Item>
            <Stack.Item>
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_msgs',
                    msgtype: 'trnspo',
                  })
                }
              >
                Primary Transfer Message (to you)
              </Button>
            </Stack.Item>
          </>
        )}
        {(message_mode || !!interacts.transferlocation_secondary) && (
          <>
            <Stack.Item>
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_msgs',
                    msgtype: 'trnssp',
                  })
                }
              >
                Secondary Transfer Message (to prey)
              </Button>
            </Stack.Item>
            <Stack.Item>
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_msgs',
                    msgtype: 'trnsso',
                  })
                }
              >
                Secondary Transfer Message (to you)
              </Button>
            </Stack.Item>
          </>
        )}
        {(message_mode || !!autotransfer.autotransferlocation) && (
          <>
            <Stack.Item>
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_msgs',
                    msgtype: 'atrnspp',
                  })
                }
              >
                Primary Auto-Transfer Message (to prey)
              </Button>
            </Stack.Item>
            <Stack.Item>
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_msgs',
                    msgtype: 'atrnspo',
                  })
                }
              >
                Primary Auto-Transfer Message (to you)
              </Button>
            </Stack.Item>
          </>
        )}
        {(message_mode || !!autotransfer.autotransferlocation_secondary) && (
          <>
            <Stack.Item>
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_msgs',
                    msgtype: 'atrnssp',
                  })
                }
              >
                Secondary Auto-Transfer Message (to prey)
              </Button>
            </Stack.Item>
            <Stack.Item>
              <Button
                onClick={() =>
                  act('set_attribute', {
                    attribute: 'b_msgs',
                    msgtype: 'atrnsso',
                  })
                }
              >
                Secondary Auto-Transfer Message (to you)
              </Button>
            </Stack.Item>
          </>
        )}
      </Stack>
>>>>>>> da9d408106 ([MIRROR] re adds the gap beteen section buttons (#10632))
    </LabeledList.Item>
  );
};
