/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { useDispatch, useSelector } from 'tgui/backend';
import { Box, Button, Stack, Tabs } from 'tgui-core/components';

import { openChatSettings } from '../settings/actions';
import { addChatPage, changeChatPage } from './actions';
import { selectChatPages, selectCurrentChatPage } from './selectors';

<<<<<<< HEAD
const UnreadCountWidget = ({ value }) => (
  <Box
    style={{
      fontSize: '0.7em',
      borderRadius: '0.25em',
      width: '1.7em',
      lineHeight: '1.55em',
      backgroundColor: 'crimson',
      color: '#fff',
    }}
  >
    {Math.min(value, 99)}
  </Box>
=======
const UnreadCountWidget = ({ value }: { value: number }) => (
  <Box className="UnreadCount">{Math.min(value, 99)}</Box>
>>>>>>> 8164837ba0 ([MIRROR] [TGUI v6] Migration to CSS Variables, styles refactor & React 19  (#10615))
);

export const ChatTabs = (props) => {
  const pages = useSelector(selectChatPages);
  const currentPage = useSelector(selectCurrentChatPage);
  const dispatch = useDispatch();
  return (
    <Stack align="center">
      <Stack.Item>
        <Tabs textAlign="center">
          {pages.map((page) => (
            <Tabs.Tab
              key={page.id}
              selected={page === currentPage}
              onClick={() =>
                dispatch(
                  changeChatPage({
                    pageId: page.id,
                  }),
                )
              }
            >
              {page.name}
              {!page.hideUnreadCount && page.unreadCount > 0 && (
                <UnreadCountWidget value={page.unreadCount} />
              )}
            </Tabs.Tab>
          ))}
        </Tabs>
      </Stack.Item>
      <Stack.Item ml={1}>
        <Button
          color="transparent"
          icon="plus"
          onClick={() => {
            dispatch(addChatPage());
            dispatch(openChatSettings());
          }}
        />
      </Stack.Item>
    </Stack>
  );
};
