<<<<<<< HEAD
import './styles/main.scss';

import { createRoot, Root } from 'react-dom/client';
=======
import { createRoot, type Root } from 'react-dom/client';
>>>>>>> 7819f84cf3 ([MIRROR] some linter fixes (#11187))

import { TguiSay } from './TguiSay';

let reactRoot: Root | null = null;

document.onreadystatechange = () => {
  if (document.readyState !== 'complete') return;

  if (!reactRoot) {
    const root = document.getElementById('react-root');
    reactRoot = createRoot(root!);
  }

  reactRoot.render(<TguiSay />);
};
