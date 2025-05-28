import { useState } from 'react';
import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import { Button, Icon, NoticeBox, Stack, Tabs } from 'tgui-core/components';

import type { Data } from './types';
<<<<<<< HEAD
import { VoreBellySelectionAndCustomization } from './VoreBellySelectionAndCustomization';
import { VoreInsidePanel } from './VoreInsidePanel';
import { VoreUserPreferences } from './VoreUserPreferences';
=======
import { VoreBellySelectionAndCustomization } from './VorePanelMainTabs/VoreBellySelectionAndCustomization';
import { VoreInsidePanel } from './VorePanelMainTabs/VoreInsidePanel';
import { VoreSoulcatcher } from './VorePanelMainTabs/VoreSoulcatcher';
import { VoreUserGeneral } from './VorePanelMainTabs/VoreUserGeneral';
import { VoreUserPreferences } from './VorePanelMainTabs/VoreUserPreferences';
>>>>>>> e707f50344 ([MIRROR] vorepanel reloaded (#10961))

/**
 * There are three main sections to this UI.
 *  - The Inside Panel, where all relevant data for interacting with a belly you're in is located.
 *  - The Belly Selection Panel, where you can select what belly people will go into and customize the active one.
 *  - User Preferences, where you can adjust all of your vore preferences on the fly.
 */
export const VorePanel = (props) => {
  const { act, data } = useBackend<Data>();

<<<<<<< HEAD
  const { inside, our_bellies, selected, prefs, show_pictures, host_mobtype } =
    data;
=======
  const {
    active_tab,
    active_vore_tab,
    inside,
    our_bellies,
    selected,
    soulcatcher,
    abilities,
    prefs,
    show_pictures,
    icon_overflow,
    host_mobtype,
    unsaved_changes,
    vore_words,
    general_pref_data,
  } = data;
>>>>>>> e707f50344 ([MIRROR] vorepanel reloaded (#10961))

  const [editMode, setEditMode] = useState(false);

  const tabs: (React.JSX.Element | null | undefined)[] = [];

  tabs[0] = our_bellies && selected && host_mobtype && (
    <VoreBellySelectionAndCustomization
      activeVoreTab={active_vore_tab}
      our_bellies={our_bellies}
      selected={selected}
      host_mobtype={host_mobtype}
<<<<<<< HEAD
=======
      icon_overflow={icon_overflow}
      vore_words={vore_words}
      toggleEditMode={setEditMode}
      editMode={editMode}
    />
  );
  tabs[1] = our_bellies && soulcatcher && abilities && (
    <VoreSoulcatcher
      our_bellies={our_bellies}
      soulcatcher={soulcatcher}
      abilities={abilities}
      toggleEditMode={setEditMode}
      editMode={editMode}
    />
  );
  tabs[2] = general_pref_data && our_bellies && (
    <VoreUserGeneral
      general_pref_data={general_pref_data}
      our_bellies={our_bellies}
      editMode={editMode}
      toggleEditMode={setEditMode}
    />
  );
  tabs[3] = prefs && (
    <VoreUserPreferences
      prefs={prefs}
>>>>>>> e707f50344 ([MIRROR] vorepanel reloaded (#10961))
      show_pictures={show_pictures}
    />
  );

  tabs[1] = <VoreUserPreferences prefs={prefs} show_pictures={show_pictures} />;

  return (
<<<<<<< HEAD
    <Window width={890} height={660} theme="abstract">
=======
    <Window width={1030} height={760} theme="abstract">
>>>>>>> e707f50344 ([MIRROR] vorepanel reloaded (#10961))
      <Window.Content>
        <Stack fill vertical>
          <Stack.Item>
            {(data.unsaved_changes && (
              <NoticeBox danger>
                <Stack>
                  <Stack.Item basis="90%">Warning: Unsaved Changes!</Stack.Item>
                  <Stack.Item>
                    <Button icon="save" onClick={() => act('saveprefs')}>
                      Save Prefs
                    </Button>
                  </Stack.Item>
                  <Stack.Item>
                    <Button
                      icon="download"
                      onClick={() => {
                        act('saveprefs');
                        act('exportpanel');
                      }}
                    >
                      Save Prefs & Export Selected Belly
                    </Button>
                  </Stack.Item>
                </Stack>
              </NoticeBox>
            )) ||
              ''}
          </Stack.Item>
          <Stack.Item basis={inside?.desc?.length || 0 > 500 ? '30%' : '20%'}>
            <VoreInsidePanel inside={inside} show_pictures={show_pictures} />
          </Stack.Item>
          <Stack.Item>
            <Tabs>
              <Tabs.Tab
                selected={active_tab === 0}
                onClick={() => act('change_tab', { tab: 0 })}
              >
                Bellies
                <Icon name="list" ml={0.5} />
              </Tabs.Tab>
              <Tabs.Tab
                selected={active_tab === 1}
                onClick={() => act('change_tab', { tab: 1 })}
              >
<<<<<<< HEAD
=======
                Soulcatcher
                <Icon name="ghost" ml={0.5} />
              </Tabs.Tab>
              <Tabs.Tab
                selected={active_tab === 2}
                onClick={() => act('change_tab', { tab: 2 })}
              >
                General
                <Icon name="user-circle" ml={0.5} />
              </Tabs.Tab>
              <Tabs.Tab
                selected={active_tab === 3}
                onClick={() => act('change_tab', { tab: 3 })}
              >
>>>>>>> e707f50344 ([MIRROR] vorepanel reloaded (#10961))
                Preferences
                <Icon name="user-cog" ml={0.5} />
              </Tabs.Tab>
            </Tabs>
          </Stack.Item>
          <Stack.Item grow>{tabs[active_tab] || 'Error'}</Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
