import { useBackend } from 'tgui/backend';
import { Button, LabeledList, Section } from 'tgui-core/components';

export const VoreSelectedBellyInteractions = (props) => {
  const { act } = useBackend();

  const { belly } = props;
  const { escapable, interacts } = belly;

  return (
    <Section
      title="Belly Interactions"
      buttons={
        <Button
          onClick={() => act('set_attribute', { attribute: 'b_escapable' })}
          icon={escapable ? 'toggle-on' : 'toggle-off'}
          selected={escapable}
        >
<<<<<<< HEAD
          {escapable ? 'Interactions On' : 'Interactions Off'}
        </Button>
      }
    >
      {escapable ? (
        <LabeledList>
          <LabeledList.Item label="Escape Chance">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_escapechance' })
=======
          <Stack fill>
            {!!escapable && (
              <>
                <Stack.Item basis="49%" grow>
                  <LabeledList.Item label="Escape Chance">
                    <VorePanelEditNumber
                      action="set_attribute"
                      subAction="b_escapechance"
                      editMode={editMode}
                      value={interacts.escapechance}
                      minValue={0}
                      maxValue={100}
                      unit="%"
                      tooltip="Set prey escape chance on resist."
                    />
                  </LabeledList.Item>
                  <LabeledList.Item label="Escape Time">
                    <VorePanelEditNumber
                      action="set_attribute"
                      subAction="b_escapetime"
                      editMode={editMode}
                      value={escapeTimeSeconds}
                      minValue={1}
                      maxValue={60}
                      unit={escapeTimeSeconds === 1 ? 'second' : 'seconds'}
                      tooltip="Set number of seconds for prey to escape on resist."
                    />
                  </LabeledList.Item>
                  <LabeledList.Item label="Digest Chance">
                    <VorePanelEditNumber
                      action="set_attribute"
                      subAction="b_digestchance"
                      editMode={editMode}
                      value={interacts.digestchance}
                      minValue={0}
                      maxValue={100}
                      unit="%"
                      tooltip="Set belly digest mode chance on resist."
                    />
                  </LabeledList.Item>
                  <LabeledList.Divider />
                  <LabeledList.Item label="Primary Transfer Chance">
                    <VorePanelEditNumber
                      action="set_attribute"
                      subAction="b_transferchance"
                      editMode={editMode}
                      value={interacts.transferchance}
                      minValue={0}
                      maxValue={100}
                      unit="%"
                      tooltip="Set the primary belly transfer chance on resist. You must also set the location for this to have any effect."
                    />
                  </LabeledList.Item>
                  <LabeledList.Item label="Secondary Transfer Chance">
                    <VorePanelEditNumber
                      action="set_attribute"
                      subAction="b_transferchance_secondary"
                      editMode={editMode}
                      value={interacts.transferchance_secondary}
                      minValue={0}
                      maxValue={100}
                      unit="%"
                      tooltip="Set the secondary belly transfer chance on resist. You must also set the secondary location for this to have any effect."
                    />
                  </LabeledList.Item>
                </Stack.Item>
                <Stack.Item basis="49%" grow>
                  <LabeledList.Item label="Absorbed Escape Chance">
                    <VorePanelEditNumber
                      action="set_attribute"
                      subAction="b_escapechance_absorbed"
                      editMode={editMode}
                      value={interacts.escapechance_absorbed}
                      minValue={0}
                      maxValue={100}
                      unit="%"
                      tooltip="Set absorbed prey escape chance on resist."
                    />
                  </LabeledList.Item>
                  <LabeledList.Item label="Belch Chance">
                    <VorePanelEditNumber
                      action="set_attribute"
                      subAction="b_belchchance"
                      editMode={editMode}
                      value={interacts.belchchance}
                      minValue={0}
                      maxValue={100}
                      unit="%"
                      tooltip="Set chance for belch emote on prey resist."
                    />
                  </LabeledList.Item>
                  <LabeledList.Item label="Absorb Chance">
                    <VorePanelEditNumber
                      action="set_attribute"
                      subAction="b_absorbchance"
                      editMode={editMode}
                      value={interacts.absorbchance}
                      minValue={0}
                      maxValue={100}
                      unit="%"
                      tooltip="Set belly absorb mode chance on resist."
                    />
                  </LabeledList.Item>
                  <LabeledList.Divider />
                  <LabeledList.Item label="Primary Transfer Location">
                    <VorePanelEditDropdown
                      action="set_attribute"
                      subAction="b_transferlocation"
                      editMode={editMode}
                      options={locationNames}
                      color={
                        !editMode && !interacts.transferlocation
                          ? 'red'
                          : undefined
                      }
                      entry={
                        interacts.transferlocation
                          ? interacts.transferlocation
                          : 'Disabled'
                      }
                      tooltip="Target location of the primary transfer trigger on resist."
                    />
                  </LabeledList.Item>
                  <LabeledList.Item label="Secondary Transfer Location">
                    <VorePanelEditDropdown
                      action="set_attribute"
                      subAction="b_transferlocation_secondary"
                      editMode={editMode}
                      options={locationNames}
                      color={
                        !editMode && !interacts.transferlocation
                          ? 'red'
                          : undefined
                      }
                      entry={
                        interacts.transferlocation_secondary
                          ? interacts.transferlocation_secondary
                          : 'Disabled'
                      }
                      tooltip="Target location of the secondary transfer trigger on resist."
                    />
                  </LabeledList.Item>
                </Stack.Item>
              </>
            )}
            <Stack.Divider />
          </Stack>
        </Section>
      </Stack.Item>
      <Stack.Item mt="5px">
        <Section
          title="Auto-Transfer Options"
          buttons={
            <VorePanelEditSwitch
              action="set_attribute"
              subAction="b_autotransfer_enabled"
              editMode={editMode}
              active={!!autotransfer_enabled}
              tooltip={
                'Allows you to setup auto transfer options for this belly. So that prey is automatically moved depending on a timer or content count.'
>>>>>>> 0fc7bb29d1 ([MIRROR] browse to browser part 1 (#11017))
              }
            >
              {interacts.escapechance + '%'}
            </Button>
          </LabeledList.Item>
          <LabeledList.Item label="Absorbed Escape Chance">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_escapechance_absorbed' })
              }
            >
              {interacts.escapechance_absorbed + '%'}
            </Button>
          </LabeledList.Item>
          <LabeledList.Item label="Escape Time">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_escapetime' })
              }
            >
              {interacts.escapetime / 10 + 's'}
            </Button>
          </LabeledList.Item>
          <LabeledList.Divider />
          <LabeledList.Item label="Transfer Chance">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_transferchance' })
              }
            >
              {interacts.transferchance + '%'}
            </Button>
          </LabeledList.Item>
          <LabeledList.Item label="Transfer Location">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_transferlocation' })
              }
            >
              {interacts.transferlocation
                ? interacts.transferlocation
                : 'Disabled'}
            </Button>
          </LabeledList.Item>
          <LabeledList.Divider />
          <LabeledList.Item label="Secondary Transfer Chance">
            <Button
              onClick={() =>
                act('set_attribute', {
                  attribute: 'b_transferchance_secondary',
                })
              }
            >
              {interacts.transferchance_secondary + '%'}
            </Button>
          </LabeledList.Item>
          <LabeledList.Item label="Secondary Transfer Location">
            <Button
              onClick={() =>
                act('set_attribute', {
                  attribute: 'b_transferlocation_secondary',
                })
              }
            >
              {interacts.transferlocation_secondary
                ? interacts.transferlocation_secondary
                : 'Disabled'}
            </Button>
          </LabeledList.Item>
          <LabeledList.Divider />
          <LabeledList.Item label="Absorb Chance">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_absorbchance' })
              }
            >
              {interacts.absorbchance + '%'}
            </Button>
          </LabeledList.Item>
          <LabeledList.Item label="Digest Chance">
            <Button
              onClick={() =>
                act('set_attribute', { attribute: 'b_digestchance' })
              }
            >
              {interacts.digestchance + '%'}
            </Button>
          </LabeledList.Item>
        </LabeledList>
      ) : (
        'These options only display while interactions are turned on.'
      )}
    </Section>
  );
};
