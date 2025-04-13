/**
 * @file
 * @copyright 2021 Aleksej Komarov
 * @license MIT
 */

import { useState } from 'react';
import { Input, LabeledList, Section } from 'tgui-core/components';

export const meta = {
  title: 'Themes',
  render: () => <Story />,
};

const Story = (props) => {
  const [theme, setTheme] = useState('kitchenSinkTheme');
  return (
    <Section>
      <LabeledList>
        <LabeledList.Item label="Use theme">
          <Input
            placeholder="theme_name"
<<<<<<< HEAD:tgui/packages/tgui/stories/Themes.stories.jsx
            value={theme}
            onInput={(e, value) => setTheme(value)}
=======
            value={props.theme}
            onChange={(value) => props.setTheme(value)}
>>>>>>> fb18560061 ([MIRROR] RS pack port and tgui core 3.0.4 (#10638)):tgui/packages/tgui/stories/Themes.stories.tsx
          />
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};
