<<<<<<< HEAD
import { BooleanLike } from 'common/react';

import { useBackend } from '../../backend';
import {
  Box,
  Button,
  Flex,
  Icon,
  Knob,
  LabeledList,
  Section,
  Tabs,
} from '../../components';
import { operations, rejuvenatorsDoses } from './constants';
import { DNAModifierBlocks } from './DNAModifierBlocks';
=======
import { useBackend } from 'tgui/backend';
import { Icon, Section, Tabs } from 'tgui-core/components';

import { operations } from './constants';
>>>>>>> 7bfffc808d ([MIRROR] Adds Trait Genetics (#10142))
import { DNAModifierMainBuffers } from './DNAModifierMainBuffers';
import { DNAModifierMainRejuvenators } from './DNAMofifierMainTabs/DNAModifierMainRejuvenators';
import { DNAModifierMainSE } from './DNAMofifierMainTabs/DNAModifierMainSE';
import { Data } from './types';

export const DNAModifierMain = (props) => {
  const { act, data } = useBackend<Data>();

  const { selectedMenuKey } = data;

  const tabs: React.JSX.Element[] = [];

  tabs['se'] = <DNAModifierMainSE />;
  tabs['buffer'] = <DNAModifierMainBuffers />;
  tabs['rejuvenators'] = <DNAModifierMainRejuvenators />;

<<<<<<< HEAD
  if (!hasOccupant) {
    return (
      <Section flexGrow>
        <Flex height="100%">
          <Flex.Item grow="1" align="center" textAlign="center" color="label">
            <Icon name="user-slash" mb="0.5rem" size={5} />
            <br />
            No occupant in DNA modifier.
          </Flex.Item>
        </Flex>
      </Section>
    );
  } else if (props.isDNAInvalid) {
    return (
      <Section flexGrow>
        <Flex height="100%">
          <Flex.Item grow="1" align="center" textAlign="center" color="label">
            <Icon name="user-slash" mb="0.5rem" size={5} />
            <br />
            No operation possible on this subject.
          </Flex.Item>
        </Flex>
      </Section>
    );
  }
  let body;
  if (selectedMenuKey === 'ui') {
    body = (
      <>
        <DNAModifierMainUI />
        <DNAModifierMainRadiationEmitter />
      </>
    );
  } else if (selectedMenuKey === 'se') {
    body = (
      <>
        <DNAModifierMainSE />
        <DNAModifierMainRadiationEmitter />
      </>
    );
  } else if (selectedMenuKey === 'buffer') {
    body = <DNAModifierMainBuffers />;
  } else if (selectedMenuKey === 'rejuvenators') {
    body = <DNAModifierMainRejuvenators />;
  }
=======
>>>>>>> 7bfffc808d ([MIRROR] Adds Trait Genetics (#10142))
  return (
    <Section fill>
      <Tabs>
        {operations.map((op, i) => (
          <Tabs.Tab
            key={i}
            selected={selectedMenuKey === op[0]}
            onClick={() => act('selectMenuKey', { key: op[0] })}
          >
            <Icon name={op[2]} />
            {op[1]}
          </Tabs.Tab>
        ))}
      </Tabs>
      {tabs[selectedMenuKey]}
    </Section>
  );
};
