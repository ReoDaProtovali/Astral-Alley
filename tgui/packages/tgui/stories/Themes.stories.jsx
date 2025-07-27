/**
 * @file
 * @copyright 2021 Aleksej Komarov
 * @license MIT
 */

import { Input, LabeledList, Section } from 'tgui-core/components';

export const meta = {
  title: 'Themes',
  render: (
    theme: string,
    setTheme: (value: React.SetStateAction<string>) => void,
  ) => <Story theme={theme} setTheme={setTheme} />,
};

<<<<<<< HEAD:tgui/packages/tgui/stories/Themes.stories.jsx
const Story = (props) => {
  const [theme, setTheme] = useState('kitchenSinkTheme');
=======
function Story(props: {
  theme: string;
  setTheme: (value: React.SetStateAction<string>) => void;
}) {
  const { theme, setTheme } = props;

>>>>>>> 053f149ebc ([MIRROR] fix stories (#11250)):tgui/packages/tgui/stories/Themes.stories.tsx
  return (
    <Section>
      <LabeledList>
        <LabeledList.Item label="Use theme">
          <Input
            placeholder="theme_name"
            value={theme}
            onInput={(e, value) => setTheme(value)}
          />
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};
