/**
 * @file
 * @copyright 2021 Aleksej Komarov
 * @license MIT
 */

import { useState } from 'react';
<<<<<<< HEAD:tgui/packages/tgui/stories/ByondUi.stories.jsx
import { logger } from 'tgui/logging';
import { Box, Button, ByondUi, Section } from 'tgui-core/components';
=======
import { Button, ByondUi, Section, TextArea } from 'tgui-core/components';
>>>>>>> 335ff75144 ([MIRROR] tgstation/tgstation#90646 (#10681)):tgui/packages/tgui/stories/ByondUi.stories.tsx

import { logger } from '../logging';

export const meta = {
  title: 'ByondUi',
  render: () => <Story />,
};

function Story() {
  const [code, setCode] = useState(
    `Byond.winset('${Byond.windowId}', {\n  'is-visible': true,\n})`,
  );

  return (
    <>
      <Section title="Button">
        <ByondUi
          params={{
            type: 'button',
            text: 'Button',
          }}
        />
      </Section>
      <Section
        title="Make BYOND calls"
        buttons={
          <Button
            icon="chevron-right"
            onClick={() =>
              setTimeout(() => {
                try {
                  const result = new Function('return (' + code + ')')();
                  if (result && result.then) {
                    logger.log('Promise');
                    result.then(logger.log);
                  } else {
                    logger.log(result);
                  }
                } catch (err) {
                  logger.log(err);
                }
              })
            }
          >
            Evaluate
          </Button>
        }
      >
<<<<<<< HEAD:tgui/packages/tgui/stories/ByondUi.stories.jsx
        <Box
=======
        <TextArea
>>>>>>> 335ff75144 ([MIRROR] tgstation/tgstation#90646 (#10681)):tgui/packages/tgui/stories/ByondUi.stories.tsx
          as="textarea"
          width="100%"
          height="10em"
          onChange={(e) => setCode(e.target.value)}
        >
          {code}
        </Box>
      </Section>
    </>
  );
}
