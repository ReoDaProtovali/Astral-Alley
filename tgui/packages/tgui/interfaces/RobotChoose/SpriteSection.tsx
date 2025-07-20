import { useState } from 'react';
import { Button, Input, Section, Stack } from 'tgui-core/components';

import { robotSpriteSearcher } from './functions';
import { SelectorElement } from './SelectorElement';
import type { spriteOption } from './types';

export const SpriteSection = (props: {
  title: string;
  selected?: string | null;
  sortable?: spriteOption[];
}) => {
  const { title, sortable, selected } = props;

  const [searchText, setSearchText] = useState<string>('');
  const [includeDefault, setIncludeDefault] = useState<boolean>(false);
  const [includeWide, setInclideDog] = useState<boolean>(false);
  const [includeTall, setIncludeTall] = useState<boolean>(false);

  const filtered = robotSpriteSearcher(
    searchText,
    includeDefault,
    includeWide,
    includeTall,
    sortable,
  );
  return (
    <Section
      title={title}
      fill
      buttons={
        <>
          <Button.Checkbox
            checked={includeDefault}
            onClick={() => setIncludeDefault(!includeDefault)}
          >
            Def
          </Button.Checkbox>
          <Button.Checkbox
            checked={includeWide}
            onClick={() => setInclideDog(!includeWide)}
          >
            Wide
          </Button.Checkbox>
          <Button.Checkbox
            checked={includeTall}
            onClick={() => setIncludeTall(!includeTall)}
          >
            Tall
          </Button.Checkbox>
        </>
      }
    >
<<<<<<< HEAD
      <Stack.Item mb={'10px'}>
        <Input
          fluid
          value={searchText}
          placeholder="Search for sprites..."
          onInput={(e, value: string) => setSearchText(value)}
        />
      </Stack.Item>
      <Stack.Item>
        <Stack vertical>
          {!!filtered &&
            filtered.map((filter) => (
              <SelectorElement
                key={filter.sprite}
                option={filter.sprite}
                action="pick_icon"
                selected={selected}
                belly={filter.belly}
              />
            ))}
        </Stack>
      </Stack.Item>
=======
      <Stack vertical fill>
        <Stack.Item>
          <Input
            fluid
            value={searchText}
            placeholder="Search for sprites..."
            onChange={(value: string) => setSearchText(value)}
          />
        </Stack.Item>
        <Stack.Divider />
        <Stack.Item grow>
          <Section fill scrollable>
            <Stack vertical fill>
              {!!filtered &&
                filtered.map((filter) => (
                  <SelectorElement
                    key={filter.sprite}
                    option={filter.sprite}
                    action="pick_icon"
                    selected={selected}
                    belly={filter.belly}
                  />
                ))}
            </Stack>
          </Section>
        </Stack.Item>
      </Stack>
>>>>>>> 47c7add324 ([MIRROR] simple ghost pod find (#11205))
    </Section>
  );
};
