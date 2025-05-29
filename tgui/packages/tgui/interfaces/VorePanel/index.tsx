import { useState } from 'react';
import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import { Button, Icon, NoticeBox, Stack, Tabs } from 'tgui-core/components';

import type { Data } from './types';
import { VoreBellySelectionAndCustomization } from './VoreBellySelectionAndCustomization';
import { VoreInsidePanel } from './VoreInsidePanel';
import { VoreUserPreferences } from './VoreUserPreferences';

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

  const [tabIndex, setTabIndex] = useState(0);
=======
  const {
    active_tab,
    active_vore_tab,
    persist_edit_mode,
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

  const [editMode, setEditMode] = useState(!!persist_edit_mode);
>>>>>>> 17a58042c3 ([MIRROR] vorepanel hotfix (#10970))

  const tabs: React.JSX.Element[] = [];

  tabs[0] = (
    <VoreBellySelectionAndCustomization
      our_bellies={our_bellies}
      selected={selected}
      host_mobtype={host_mobtype}
<<<<<<< HEAD
=======
      icon_overflow={icon_overflow}
      vore_words={vore_words}
      toggleEditMode={setEditMode}
      editMode={editMode}
      persist_edit_mode={persist_edit_mode}
    />
  );
  tabs[1] = our_bellies && soulcatcher && abilities && (
    <VoreSoulcatcher
      our_bellies={our_bellies}
      soulcatcher={soulcatcher}
      abilities={abilities}
      toggleEditMode={setEditMode}
      editMode={editMode}
      persist_edit_mode={persist_edit_mode}
    />
  );
  tabs[2] = general_pref_data && our_bellies && (
    <VoreUserGeneral
      general_pref_data={general_pref_data}
      our_bellies={our_bellies}
      editMode={editMode}
      toggleEditMode={setEditMode}
      persist_edit_mode={persist_edit_mode}
    />
  );
  tabs[3] = prefs && (
    <VoreUserPreferences
      prefs={prefs}
>>>>>>> 17a58042c3 ([MIRROR] vorepanel hotfix (#10970))
      show_pictures={show_pictures}
    />
  );

  tabs[1] = <VoreUserPreferences prefs={prefs} show_pictures={show_pictures} />;

  return (
    <Window width={890} height={660} theme="abstract">
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
                selected={tabIndex === 0}
                onClick={() => setTabIndex(0)}
              >
                Bellies
                <Icon name="list" ml={0.5} />
              </Tabs.Tab>
              <Tabs.Tab
                selected={tabIndex === 1}
                onClick={() => setTabIndex(1)}
              >
                Preferences
                <Icon name="user-cog" ml={0.5} />
              </Tabs.Tab>
            </Tabs>
          </Stack.Item>
          <Stack.Item grow>{tabs[tabIndex] || 'Error'}</Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
