import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Button,
  LabeledList,
  ProgressBar,
  Section,
  Stack,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

type Data = {
  temperature: number;
  optimalTemp: number;
  temperatureEnough: BooleanLike;
  efficiency: number;
  containersRemovable: BooleanLike;
  our_contents: {
    empty: BooleanLike;
    progress: number;
    progressText: string;
    container: string | null;
  }[];
};

export const CookingAppliance = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    temperature,
    optimalTemp,
    temperatureEnough,
    efficiency,
    containersRemovable,
    our_contents,
  } = data;

  return (
    <Window width={600} height={600}>
      <Window.Content scrollable>
        <Section title="Status">
          <LabeledList>
            <LabeledList.Item label="Temperature">
              <ProgressBar
                color={temperatureEnough ? 'good' : 'blue'}
                value={temperature}
                maxValue={optimalTemp}
              >
                <AnimatedNumber value={temperature} />
                &deg;C / {optimalTemp}&deg;C
              </ProgressBar>
            </LabeledList.Item>
            <LabeledList.Item label="Efficiency">
              <AnimatedNumber value={efficiency} />%
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Containers">
          <LabeledList>
            {our_contents.map((content, i) => {
              if (content.empty) {
                return (
                  <LabeledList.Item key={i} label={'Slot #' + (i + 1)}>
                    <Button onClick={() => act('slot', { slot: i + 1 })}>
                      Empty
                    </Button>
                  </LabeledList.Item>
                );
              }

              return (
                <LabeledList.Item
                  label={'Slot #' + (i + 1)}
                  verticalAlign="middle"
                  key={i}
                >
                  <Stack>
                    <Stack.Item>
                      <Button
                        disabled={!containersRemovable}
                        onClick={() => act('slot', { slot: i + 1 })}
                      >
                        {content.container || 'No Container'}
                      </Button>
                    </Stack.Item>
                    <Stack.Item grow>
                      <ProgressBar
                        color={content.progressText[0]}
                        value={content.progress}
                        maxValue={1}
                      >
                        {content.progressText[1]}
                      </ProgressBar>
                    </Stack.Item>
                  </Stack>
                </LabeledList.Item>
              );
            })}
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
