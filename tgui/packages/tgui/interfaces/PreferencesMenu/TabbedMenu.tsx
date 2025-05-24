<<<<<<< HEAD
import {
  Component,
  ComponentProps,
  createRef,
  ReactNode,
  RefObject,
} from 'react';
import { Button, Section, Stack } from 'tgui-core/components';
=======
import { type ComponentProps, type ReactNode, useRef } from 'react';
import { Button, type Flex, Section, Stack } from 'tgui-core/components';
>>>>>>> 9805115973 (Character Setup Rework (#10930))

type TabbedMenuProps = {
  categoryEntries: [string, ReactNode][];
  contentProps?: ComponentProps<typeof Flex>;
};

<<<<<<< HEAD
export class TabbedMenu extends Component<TabbedMenuProps> {
  categoryRefs: Record<string, RefObject<HTMLDivElement>> = {};
  sectionRef: RefObject<HTMLDivElement> = createRef();

  getCategoryRef(category: string): RefObject<HTMLDivElement> {
    if (!this.categoryRefs[category]) {
      this.categoryRefs[category] = createRef();
    }
=======
export function TabbedMenu(props: TabbedMenuProps) {
  const sectionRef = useRef<HTMLDivElement>(null);
  const categoryRefs = useRef<Record<string, HTMLDivElement | null>>({});

  return (
    <Stack vertical fill>
      <Stack.Item>
        <Stack fill px={5}>
          {props.categoryEntries.map(([category]) => (
            <Stack.Item key={category} grow basis="content">
              <Button
                align="center"
                fontSize="1.2em"
                fluid
                onClick={() => {
                  const offsetTop = categoryRefs.current[category]?.offsetTop;
                  if (offsetTop === undefined) {
                    return;
                  }
>>>>>>> 9805115973 (Character Setup Rework (#10930))

                  const currentSection = sectionRef.current;
                  if (!currentSection) {
                    return;
                  }

                  currentSection.scrollTop = offsetTop;
                }}
              >
                {category}
              </Button>
            </Stack.Item>
          ))}
        </Stack>
      </Stack.Item>

      <Stack.Item
        grow
        ref={sectionRef}
        position="relative"
        overflowY="scroll"
        {...props.contentProps}
      >
        <Stack vertical fill px={2}>
          {props.categoryEntries.map(([category, children]) => (
            <div
              key={category}
              ref={(ref) => {
                categoryRefs.current[category] = ref;
              }}
            >
              <Section fill title={category}>
                {children}
              </Section>
            </div>
          ))}
        </Stack>
      </Stack.Item>
    </Stack>
  );
}
