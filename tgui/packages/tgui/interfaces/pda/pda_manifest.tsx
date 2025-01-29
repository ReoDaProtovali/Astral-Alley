<<<<<<< HEAD:tgui/packages/tgui/interfaces/pda/pda_manifest.tsx
import { useBackend } from '../../backend';
import { Box } from '../../components';
import { CrewManifestContent } from '../CrewManifest';
=======
import { useBackend } from 'tgui/backend';
import { Box } from 'tgui-core/components';

import { CrewManifestContent } from '../../CrewManifest';
>>>>>>> 3aa9314ff4 ([MIRROR] Moves UIs to TGUI core (#9967)):tgui/packages/tgui/interfaces/Pda/pda_screens/pda_manifest.tsx

export const pda_manifest = (props) => {
  const { act, data } = useBackend();

  return (
    <Box color="white">
      <CrewManifestContent />
    </Box>
  );
};
