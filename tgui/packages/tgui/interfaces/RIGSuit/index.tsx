import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import { Box } from 'tgui-core/components';

import { RIGSuitHardware } from './RIGSuitHardware';
import { RIGSuitModules } from './RIGSuitModules';
import { RIGSuitStatus } from './RIGSuitStatus';
import type { Data } from './types';

export const RIGSuit = (props) => {
  const { data } = useBackend<Data>();

  const { interfacelock, malf, aicontrol, ai } = data;

<<<<<<< HEAD
=======
  const [showLoading, setShowLoading] = useSharedState('rigsuit-loading', true);

  if (config.status < UI_INTERACTIVE) {
    return (
      <Window width={300} height={300}>
        <Window.Content backgroundColor="black">
          <Stack align="center" justify="center" fill>
            <Stack.Item fontSize={2} color="bad">
              --RIG Access Denied--
            </Stack.Item>
          </Stack>
        </Window.Content>
      </Window>
    );
  }

  if (showLoading) {
    return <RIGSuitLoader onFinish={() => setShowLoading(false)} />;
  }

>>>>>>> 7fe1535ad2 ([MIRROR] tgui core 5.2.0 (#11559))
  let override: React.JSX.Element | null = null;

  if (interfacelock || malf) {
    // Interface is offline, or a malf AI took over, either way, the user is
    // no longer permitted to view this interface.
    override = <Box color="bad">--HARDSUIT INTERFACE OFFLINE--</Box>;
  } else if (!ai && aicontrol) {
    // Non-AI trying to control the hardsuit while it's AI control overridden
    override = <Box color="bad">-- HARDSUIT CONTROL OVERRIDDEN BY AI --</Box>;
  }

  return (
    <Window height={480} width={550}>
      <Window.Content scrollable>
        {override || (
          <>
            <RIGSuitStatus />
            <RIGSuitHardware />
            <RIGSuitModules />
          </>
        )}
      </Window.Content>
    </Window>
  );
};
