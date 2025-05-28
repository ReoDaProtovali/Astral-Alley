import { useBackend } from 'tgui/backend';
import { Button, LabeledList, Section, Stack } from 'tgui-core/components';

<<<<<<< HEAD
import type { selectedData } from '../types';
=======
import type { bellyVisualData } from '../types';
import { VorePanelEditColor } from '../VorePanelElements/VorePanelEditColor';
import { VorePanelEditSwitch } from '../VorePanelElements/VorePanelEditSwitch';
import { BellyFullscreenSelection } from './VisualTab/BellyFullscreenSelection';
import { VoreSpriteAffects } from './VisualTab/VoreSpriteAffect';
>>>>>>> e707f50344 ([MIRROR] vorepanel reloaded (#10961))

export const VoreSelectedBellyVisuals = (props: {
  editMode: boolean;
  bellyVisualData: bellyVisualData;
}) => {
  const { act } = useBackend();

  const { editMode, bellyVisualData } = props;
  const {
    belly_fullscreen,
<<<<<<< HEAD
    possible_fullscreens,
    disable_hud,
    belly_fullscreen_color,
    belly_fullscreen_color_secondary,
    belly_fullscreen_color_trinary,
    colorization_enabled,
    vore_sprite_flags,
    affects_voresprite,
    absorbed_voresprite,
    absorbed_multiplier,
    item_voresprite,
    item_multiplier,
    health_voresprite,
    resist_animation,
    voresprite_size_factor,
    belly_sprite_option_shown,
    belly_sprite_to_affect,
    undergarment_chosen,
    undergarment_if_none,
    tail_option_shown,
    tail_to_change_to,
  } = belly;

  return (
    <>
      <Section title="Vore Sprites">
        <Stack direction="row">
          <LabeledList>
            <LabeledList.Item label="Affect Vore Sprites">
              <Button
                onClick={() =>
                  act('set_attribute', { attribute: 'b_affects_vore_sprites' })
                }
                icon={affects_voresprite ? 'toggle-on' : 'toggle-off'}
                selected={affects_voresprite}
              >
                {affects_voresprite ? 'Yes' : 'No'}
              </Button>
            </LabeledList.Item>
            {affects_voresprite ? (
              <>
                <LabeledList.Item label="Vore Sprite Mode">
                  {(vore_sprite_flags.length && vore_sprite_flags.join(', ')) ||
                    'None'}
                  <Button
                    onClick={() =>
                      act('set_attribute', { attribute: 'b_vore_sprite_flags' })
                    }
                    ml={1}
                    icon="plus"
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Count Absorbed prey for vore sprites">
                  <Button
                    onClick={() =>
                      act('set_attribute', {
                        attribute: 'b_count_absorbed_prey_for_sprites',
                      })
                    }
                    icon={absorbed_voresprite ? 'toggle-on' : 'toggle-off'}
                    selected={absorbed_voresprite}
                  >
                    {absorbed_voresprite ? 'Yes' : 'No'}
                  </Button>
                </LabeledList.Item>
                <LabeledList.Item label="Absorbed Multiplier">
                  <Button
                    onClick={() =>
                      act('set_attribute', {
                        attribute: 'b_absorbed_multiplier',
                      })
                    }
                  >
                    {absorbed_multiplier}
                  </Button>
                </LabeledList.Item>
                <LabeledList.Item label="Count items for vore sprites">
                  <Button
                    onClick={() =>
                      act('set_attribute', {
                        attribute: 'b_count_items_for_sprites',
                      })
                    }
                    icon={item_voresprite ? 'toggle-on' : 'toggle-off'}
                    selected={item_voresprite}
                  >
                    {item_voresprite ? 'Yes' : 'No'}
                  </Button>
                </LabeledList.Item>
                <LabeledList.Item label="Items Multiplier">
                  <Button
                    onClick={() =>
                      act('set_attribute', { attribute: 'b_item_multiplier' })
                    }
                  >
                    {item_multiplier}
                  </Button>
                </LabeledList.Item>
                <LabeledList.Item label="Prey health affects vore sprites">
                  <Button
                    onClick={() =>
                      act('set_attribute', {
                        attribute: 'b_health_impacts_size',
                      })
                    }
                    icon={health_voresprite ? 'toggle-on' : 'toggle-off'}
                    selected={health_voresprite}
                  >
                    {health_voresprite ? 'Yes' : 'No'}
                  </Button>
                </LabeledList.Item>
                <LabeledList.Item label="Animation when prey resist">
                  <Button
                    onClick={() =>
                      act('set_attribute', { attribute: 'b_resist_animation' })
                    }
                    icon={resist_animation ? 'toggle-on' : 'toggle-off'}
                    selected={resist_animation}
                  >
                    {resist_animation ? 'Yes' : 'No'}
                  </Button>
                </LabeledList.Item>
                <LabeledList.Item label="Vore Sprite Size Factor">
                  <Button
                    onClick={() =>
                      act('set_attribute', {
                        attribute: 'b_size_factor_sprites',
                      })
                    }
                  >
                    {voresprite_size_factor}
                  </Button>
                </LabeledList.Item>
                {belly_sprite_option_shown ? (
                  <LabeledList.Item label="Belly Sprite to affect">
                    <Button
                      onClick={() =>
                        act('set_attribute', {
                          attribute: 'b_belly_sprite_to_affect',
                        })
                      }
                    >
                      {belly_sprite_to_affect}
                    </Button>
                  </LabeledList.Item>
                ) : (
                  <LabeledList.Item label="Belly Sprite to affect">
                    <Box textColor="red">You do not have any bellysprites.</Box>
                  </LabeledList.Item>
                )}
                {tail_option_shown &&
                vore_sprite_flags.includes('Undergarment addition') ? (
                  <>
                    <LabeledList.Item label="Undergarment type to affect">
                      <Button
                        onClick={() =>
                          act('set_attribute', {
                            attribute: 'b_undergarment_choice',
                          })
                        }
                      >
                        {undergarment_chosen}
                      </Button>
                    </LabeledList.Item>
                    <LabeledList.Item label="Undergarment if none equipped">
                      <Button
                        onClick={() =>
                          act('set_attribute', {
                            attribute: 'b_undergarment_if_none',
                          })
                        }
                      >
                        {undergarment_if_none}
                      </Button>
                    </LabeledList.Item>
                  </>
                ) : (
                  ''
                )}
                {tail_option_shown &&
                vore_sprite_flags.includes('Tail adjustment') ? (
                  <LabeledList.Item label="Tail to change to">
                    <Button
                      onClick={() =>
                        act('set_attribute', {
                          attribute: 'b_tail_to_change_to',
                        })
                      }
                    >
                      {tail_to_change_to}
                    </Button>
                  </LabeledList.Item>
                ) : (
                  ''
                )}
              </>
            ) : (
              ''
            )}
          </LabeledList>
        </Stack>
      </Section>
      <Section title="Belly Fullscreens Preview and Coloring">
        <Stack align="center">
          <Stack.Item shrink>
            <Box
              backgroundColor={belly_fullscreen_color}
              width="20px"
              height="20px"
            />
          </Stack.Item>
          <Stack.Item grow>
            <Button
              fluid
              icon="eye-dropper"
              onClick={() =>
                act('set_attribute', {
                  attribute: 'b_fullscreen_color',
                  val: null,
                })
              }
            >
              Select Primary Color
            </Button>
          </Stack.Item>
          <Stack.Item shrink>
            <Box
              backgroundColor={belly_fullscreen_color_secondary}
              width="20px"
              height="20px"
            />
          </Stack.Item>
          <Stack.Item grow>
            <Button
              fluid
              icon="eye-dropper"
              onClick={() =>
                act('set_attribute', {
                  attribute: 'b_fullscreen_color_secondary',
                  val: null,
                })
              }
            >
              Select Secondary Color
            </Button>
          </Stack.Item>
          <Stack.Item shrink>
            <Box
              backgroundColor={belly_fullscreen_color_trinary}
              width="20px"
              height="20px"
            />
          </Stack.Item>
          <Stack.Item grow>
            <Button
              fluid
              icon="eye-dropper"
              onClick={() =>
                act('set_attribute', {
                  attribute: 'b_fullscreen_color_trinary',
                  val: null,
                })
              }
            >
              Select Trinary Color
            </Button>
          </Stack.Item>
        </Stack>
        <Box mt={1}>
          <LabeledList>
            <LabeledList.Item label="Enable Coloration">
              <Button
                onClick={() =>
                  act('set_attribute', { attribute: 'b_colorization_enabled' })
                }
                icon={colorization_enabled ? 'toggle-on' : 'toggle-off'}
                selected={colorization_enabled}
              >
                {colorization_enabled ? 'Yes' : 'No'}
              </Button>
            </LabeledList.Item>
            <LabeledList.Item label="Preview Belly">
              <Button
                onClick={() =>
                  act('set_attribute', { attribute: 'b_preview_belly' })
                }
              >
                Preview
              </Button>
            </LabeledList.Item>
            <LabeledList.Item label="Clear Preview">
              <Button
                onClick={() =>
                  act('set_attribute', { attribute: 'b_clear_preview' })
                }
              >
                Clear
              </Button>
            </LabeledList.Item>
          </LabeledList>
        </Box>
      </Section>
      <Section>
=======
    colorization_enabled,
    belly_fullscreen_color,
    belly_fullscreen_color2,
    belly_fullscreen_color3,
    belly_fullscreen_color4,
    belly_fullscreen_alpha,
    possible_fullscreens,
    disable_hud,
    affects_voresprite,
  } = bellyVisualData;

  return (
    <Stack vertical fill>
      <Stack.Item>
        <Section
          title="Affect Vore Sprites"
          buttons={
            <VorePanelEditSwitch
              action="set_attribute"
              subAction="b_affects_vore_sprites"
              editMode={editMode}
              tooltip="Allows you to toggle if this belly should effect voresprites"
              active={!!affects_voresprite}
            />
          }
        >
          {!!affects_voresprite && (
            <VoreSpriteAffects
              editMode={editMode}
              bellyVisualData={bellyVisualData}
            />
          )}
        </Section>
      </Stack.Item>
      <Stack.Item>
>>>>>>> e707f50344 ([MIRROR] vorepanel reloaded (#10961))
        <Section title="Vore FX">
          <Stack vertical fill>
            <Stack.Item>
              <Stack>
                <Stack.Item basis="49%" grow>
                  <LabeledList>
                    <LabeledList.Item label="Enable Coloration">
                      <VorePanelEditSwitch
                        action="set_attribute"
                        subAction="b_colorization_enabled"
                        editMode={editMode}
                        active={!!colorization_enabled}
                        tooltip="Switches between the legacy pre-colored icon set and the modern colorable one."
                      />
                    </LabeledList.Item>
                    <LabeledList.Item label="Hide Prey HUD">
                      <VorePanelEditSwitch
                        action="set_attribute"
                        subAction="b_disable_hud"
                        editMode={editMode}
                        active={!!disable_hud}
                        tooltip="Allows you to hide your prey's game UI."
                      />
                    </LabeledList.Item>
                  </LabeledList>
                </Stack.Item>
                <Stack.Item basis="49%" grow>
                  <LabeledList>
                    <LabeledList.Item label="Preview Belly">
                      <Button
                        onClick={() =>
                          act('set_attribute', { attribute: 'b_preview_belly' })
                        }
                      >
                        Preview
                      </Button>
                    </LabeledList.Item>
                    <LabeledList.Item label="Clear Preview">
                      <Button
                        onClick={() =>
                          act('set_attribute', { attribute: 'b_clear_preview' })
                        }
                      >
                        Clear
                      </Button>
                    </LabeledList.Item>
                  </LabeledList>
                </Stack.Item>
              </Stack>
            </Stack.Item>
            {!!colorization_enabled && (
              <>
                <Stack.Divider />
                <Stack.Item>
                  <Stack align="center">
                    <VorePanelEditColor
                      editMode={editMode}
                      action="set_attribute"
                      subAction="b_fullscreen_color"
                      value_of={null}
                      back_color={belly_fullscreen_color}
                      name_of="Color 1:"
                      tooltip="Set the Vore FX overlay's first color."
                    />
                    <VorePanelEditColor
                      editMode={editMode}
                      action="set_attribute"
                      subAction="b_fullscreen_color2"
                      value_of={null}
                      back_color={belly_fullscreen_color2}
                      name_of="Color 2:"
                      tooltip="Set the Vore FX overlay's second color."
                    />
                    <VorePanelEditColor
                      editMode={editMode}
                      action="set_attribute"
                      subAction="b_fullscreen_color3"
                      value_of={null}
                      back_color={belly_fullscreen_color3}
                      name_of="Color 3:"
                      tooltip="Set the Vore FX overlay's third color."
                    />
                    <VorePanelEditColor
                      editMode={editMode}
                      action="set_attribute"
                      subAction="b_fullscreen_color4"
                      value_of={null}
                      back_color={belly_fullscreen_color4}
                      name_of="Color 4:"
                      tooltip="Set the Vore FX overlay's fourth color."
                    />
                    <VorePanelEditColor
                      removePlaceholder
                      editMode={editMode}
                      action="set_attribute"
                      subAction="b_fullscreen_alpha"
                      value_of={null}
                      back_color="#FFFFFF"
                      alpha={belly_fullscreen_alpha}
                      name_of="Alpha:"
                      tooltip="Set the Vore FX overlay's transparency."
                    />
                  </Stack>
                </Stack.Item>
              </>
            )}
          </Stack>
        </Section>
<<<<<<< HEAD
        <Section title="Belly Fullscreens Styles">
          Belly styles:
          <Button
            fluid
            selected={belly_fullscreen === '' || belly_fullscreen === null}
            onClick={() =>
              act('set_attribute', { attribute: 'b_fullscreen', val: null })
            }
          >
            Disabled
          </Button>
          {Object.keys(possible_fullscreens).map((key, index) => (
            <span key={index} style={{ width: '256px' }}>
              <Button
                key={key}
                width="256px"
                height="256px"
                selected={key === belly_fullscreen}
                onClick={() =>
                  act('set_attribute', { attribute: 'b_fullscreen', val: key })
                }
              >
                <Box
                  className={classes(['vore240x240', key])}
                  style={{
                    transform: 'translate(0%, 4%)',
                  }}
                />
              </Button>
            </span>
          ))}
        </Section>
      </Section>
    </>
=======
      </Stack.Item>
      <Stack.Item grow>
        <BellyFullscreenSelection
          editMode={editMode}
          belly_fullscreen={belly_fullscreen}
          colorization_enabled={colorization_enabled}
          possible_fullscreens={possible_fullscreens}
        />
      </Stack.Item>
    </Stack>
>>>>>>> e707f50344 ([MIRROR] vorepanel reloaded (#10961))
  );
};
