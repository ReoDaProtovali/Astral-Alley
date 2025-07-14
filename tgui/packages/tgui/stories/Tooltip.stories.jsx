/**
 * @file
 * @copyright 2021 Aleksej Komarov
 * @license MIT
 */

<<<<<<< HEAD:tgui/packages/tgui/stories/Tooltip.stories.jsx
import { Box, Button, Section, Tooltip } from 'tgui-core/components';
=======
import type { ComponentProps } from 'react';
import {
  Box,
  Button,
  type Floating,
  Section,
  Tooltip,
} from 'tgui-core/components';
>>>>>>> 7819f84cf3 ([MIRROR] some linter fixes (#11187)):tgui/packages/tgui/stories/Tooltip.stories.tsx

export const meta = {
  title: 'Tooltip',
  render: () => <Story />,
};

const Story = () => {
  const positions = [
    'top',
    'left',
    'right',
    'bottom',
    'bottom-start',
    'bottom-end',
  ];

  return (
    <Section>
      <Box>
        <Tooltip content="Tooltip text.">
          <Box inline position="relative" mr={1}>
            Box (hover me).
          </Box>
        </Tooltip>
        <Button tooltip="Tooltip text.">Button</Button>
      </Box>
      <Box mt={1}>
        {positions.map((position) => (
          <Button
            key={position}
            color="transparent"
            tooltip="Tooltip text."
            tooltipPosition={position}
          >
            {position}
          </Button>
        ))}
      </Box>
    </Section>
  );
};
