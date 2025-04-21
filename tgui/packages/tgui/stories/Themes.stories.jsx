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

<<<<<<< HEAD:tgui/packages/tgui/stories/Themes.stories.jsx
const Story = (props) => {
  const [theme, setTheme] = useState('kitchenSinkTheme');
=======
function Story() {
  const [theme, setTheme] = useState('');

>>>>>>> 335ff75144 ([MIRROR] tgstation/tgstation#90646 (#10681)):tgui/packages/tgui/stories/Themes.stories.tsx
  return (
    <Section>
      <LabeledList>
        <LabeledList.Item label="Use theme">
          <Input
            placeholder="theme_name"
            value={theme}
<<<<<<< HEAD:tgui/packages/tgui/stories/Themes.stories.jsx
            onInput={(e, value) => setTheme(value)}
=======
            onChange={(value) => setTheme(value)}
>>>>>>> 335ff75144 ([MIRROR] tgstation/tgstation#90646 (#10681)):tgui/packages/tgui/stories/Themes.stories.tsx
          />
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
}
