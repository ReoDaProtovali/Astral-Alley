import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  Box,
  Button,
  LabeledList,
  ProgressBar,
  Section,
} from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

type Data = {
  mode: number;
  pressure: number;
  isAI: BooleanLike;
  panel_open: BooleanLike;
  flushing: BooleanLike;
};

export const DisposalBin = (props) => {
  const { act, data } = useBackend<Data>();
  const { mode, pressure, isAI, panel_open, flushing } = data;
  let stateColor;
  let stateText;
  if (mode === 2) {
    stateColor = 'good';
    stateText = 'Ready';
  } else if (mode <= 0) {
    stateColor = 'bad';
    stateText = 'N/A';
  } else if (mode === 1) {
    stateColor = 'average';
    stateText = 'Pressurizing';
  } else {
    stateColor = 'average';
    stateText = 'Idle';
  }
  return (
    <Window width={300} height={250}>
      <Window.Content>
        <Section>
          <Box bold m={1}>
            Status
          </Box>
          <LabeledList>
            <LabeledList.Item label="State" color={stateColor}>
              {stateText}
            </LabeledList.Item>
            <LabeledList.Item label="Pressure">
              <ProgressBar
                ranges={{
                  bad: [-Infinity, 0],
                  average: [0, 99],
                  good: [99, Infinity],
                }}
                value={pressure}
                minValue={0}
                maxValue={100}
              />
            </LabeledList.Item>
          </LabeledList>
          <Box bold m={1}>
            Controls
          </Box>
          <LabeledList>
            <LabeledList.Item label="Handle">
              <Button
                icon="toggle-off"
                disabled={isAI || panel_open}
                selected={flushing ? null : true}
                onClick={() => act('disengageHandle')}
              >
                Disengaged
              </Button>
              <Button
                icon="toggle-on"
                disabled={isAI || panel_open}
                selected={flushing ? true : null}
                onClick={() => act('engageHandle')}
              >
                Engaged
              </Button>
            </LabeledList.Item>
            <LabeledList.Item label="Power">
              <Button
                icon="toggle-off"
                disabled={mode === -1}
                selected={mode ? null : true}
                onClick={() => act('pumpOff')}
              >
                Off
              </Button>
              <Button
                icon="toggle-on"
                disabled={mode === -1}
                selected={mode ? true : null}
                onClick={() => act('pumpOn')}
              >
                On
              </Button>
            </LabeledList.Item>
            <LabeledList.Item label="Eject">
              <Button
                icon="sign-out-alt"
                disabled={isAI}
                onClick={() => act('eject')}
              >
                Eject Contents
              </Button>
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
<<<<<<< HEAD
=======

const EjectButton = (props) => {
  const { act, data } = useBackend<Data>();
  const { isAI } = data;
  const [buttonPressed, setButtonPressed] = useState(false);

  useEffect(() => {
    if (!buttonPressed) {
      return;
    }

    const timer = setTimeout(() => {
      setButtonPressed(false);
    }, 250);

    return () => {
      clearTimeout(timer);
    };
  }, [buttonPressed]);

  return (
    <Stack vertical align="center">
      <Stack.Item>
        <Box
          backgroundColor={isAI ? '#1a1a1a' : '#3a3a3a'}
          p={1}
          style={{
            boxShadow: buttonPressed ? 'none' : '5px 5px 2px #000000',
            cursor: 'pointer',
            transition: '0.2s all ease-in',
          }}
          onClick={() => {
            act('eject');
            setButtonPressed(true);
          }}
        >
          <Icon color={isAI ? '#5a5a5a' : '#ffffff'} name="eject" size={3} />
        </Box>
      </Stack.Item>
      <Stack.Item bold>Eject</Stack.Item>
    </Stack>
  );
};

const GiantLever = (props) => {
  const { act, data } = useBackend<Data>();

  return (
    <Box position="relative" width={5} height={6}>
      {/* Track 1 */}
      <Box
        position="absolute"
        top={0}
        left={1.5}
        height={6}
        width={2}
        backgroundColor="#262728"
        style={{
          border: '6px solid #3b3d38',
        }}
      />
      {/* Lever */}
      <Box
        position="absolute"
        top={1.4}
        left={2.2}
        height={2}
        width={0.6}
        backgroundColor="#9f9f9f"
        style={{
          borderRadius: '10px',
          transition: 'transform .3s cubic-bezier(0.600, 0.040, 0.980, 0.335)',
          transitionDelay: '.2s',
          transform: data.flushing ? 'translateY(20px)' : 'none',
        }}
      />
      {/* Handle */}
      <Box
        position="absolute"
        top={0.5}
        left={0}
        height={1.4}
        width={5}
        onClick={() => act(data.flushing ? 'disengageHandle' : 'engageHandle')}
        style={{
          background: 'linear-gradient(180deg,rgb(141, 17, 13), #200e0d)',
          cursor: 'pointer',
          transition: 'transform .5s cubic-bezier(0.600, 0.040, 0.980, 0.335)',
          transform: data.flushing ? 'translateY(43px)' : 'none',
        }}
      />
    </Box>
  );
};

const Lights = (props: { state: string }) => {
  const { state } = props;
  return (
    <Stack vertical>
      <Stack.Item>
        <Box
          height={2}
          width={2}
          style={{
            background:
              state === 'Pressurizing'
                ? 'linear-gradient(90deg,rgb(190, 54, 54), #482214)'
                : 'linear-gradient(90deg, #1c0f0d, #130b0a)',
            transition: 'background 0.5s linear',
          }}
        />
      </Stack.Item>
      <Stack.Item>
        <Box
          height={2}
          width={2}
          style={{
            background:
              state === 'Ready'
                ? 'linear-gradient(90deg, #4a6c14, #164b20)'
                : 'linear-gradient(90deg, #24310e, #122a15)',
            transition: 'background 0.5s linear',
          }}
        />
      </Stack.Item>
    </Stack>
  );
};

const EStopSvg = (props: React.SVGProps<SVGSVGElement>) => {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="15mm"
      height="15mm"
      viewBox="0 0 100 100"
      {...props}
    >
      <defs>
        {/** biome-ignore lint/correctness/useUniqueElementIds: Required for SVG */}
        <marker
          id="b"
          markerHeight={2}
          markerUnits="userSpaceOnUse"
          markerWidth={2}
          orient="auto-start-reverse"
          preserveAspectRatio="xMidYMid"
          refX={0}
          refY={0}
          style={{
            overflow: 'visible',
          }}
          viewBox="0 0 1 1"
        >
          <path
            d="m5.77 0-8.65 5V-5Z"
            style={{
              fill: 'context-stroke',
              fillRule: 'evenodd',
              stroke: 'context-stroke',
              strokeWidth: '1pt',
            }}
            transform="scale(.5)"
          />
        </marker>
        {/** biome-ignore lint/correctness/useUniqueElementIds: Required for SVG */}
        <marker
          id="c"
          markerHeight={2}
          markerUnits="userSpaceOnUse"
          markerWidth={2}
          orient="auto-start-reverse"
          preserveAspectRatio="xMidYMid"
          refX={0}
          refY={0}
          style={{
            overflow: 'visible',
          }}
          viewBox="0 0 1 1"
        >
          <path
            d="m5.77 0-8.65 5V-5Z"
            style={{
              fill: 'context-stroke',
              fillRule: 'evenodd',
              stroke: 'context-stroke',
              strokeWidth: '1pt',
            }}
            transform="scale(.5)"
          />
        </marker>
        {/** biome-ignore lint/correctness/useUniqueElementIds: Required for SVG */}
        <marker
          id="a"
          markerHeight={2}
          markerUnits="userSpaceOnUse"
          markerWidth={2}
          orient="auto-start-reverse"
          preserveAspectRatio="xMidYMid"
          refX={0}
          refY={0}
          style={{
            overflow: 'visible',
          }}
          viewBox="0 0 1 1"
        >
          <path
            d="m5.77 0-8.65 5V-5Z"
            style={{
              fill: 'context-stroke',
              fillRule: 'evenodd',
              stroke: 'context-stroke',
              strokeWidth: '1pt',
            }}
            transform="scale(.5)"
          />
        </marker>
      </defs>
      <circle
        cx={50}
        cy={50}
        r={50}
        style={{
          fill: '#b2362d',
          fillOpacity: 1,
          strokeWidth: 1.5875,
        }}
      />
      <path
        d="M84.641 70A40 40 0 0 1 30 84.641"
        style={{
          fill: 'none',
          fillOpacity: 1,
          stroke: '#fff',
          strokeWidth: 5,
          strokeDasharray: 'none',
          strokeOpacity: 1,
          markerEnd: 'url(#a)',
        }}
      />
      <path
        d="M15.386 70.027a40 40 0 0 1 14.641-54.64"
        style={{
          display: 'inline',
          fill: 'none',
          fillOpacity: 1,
          stroke: '#fff',
          strokeWidth: 5,
          strokeDasharray: 'none',
          strokeOpacity: 1,
          markerEnd: 'url(#b)',
        }}
      />
      <path
        d="M50.027 10.027a40 40 0 0 1 40 40"
        style={{
          display: 'inline',
          fill: 'none',
          fillOpacity: 1,
          stroke: '#fff',
          strokeWidth: 5,
          strokeDasharray: 'none',
          strokeOpacity: 1,
          markerEnd: 'url(#c)',
        }}
      />
    </svg>
  );
};
>>>>>>> cce52199f3 ([MIRROR] allow to clear chat highlight settings (#11483))
