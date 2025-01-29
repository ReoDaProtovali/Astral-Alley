<<<<<<< HEAD
import { filter, sortBy } from 'common/collections';
import { flow } from 'common/fp';
import { BooleanLike } from 'common/react';
import { createSearch, toTitleCase } from 'common/string';

import { useBackend, useSharedState } from '../backend';
import { Box, Button, Dropdown, Flex, Input, Section } from '../components';
import { Window } from '../layouts';
import { mat } from './common/CommonTypes';
=======
import { useCallback, useMemo } from 'react';
import { useBackend, useSharedState } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  Box,
  Button,
  Icon,
  Input,
  Section,
  Stack,
  Tabs,
  VirtualList,
} from 'tgui-core/components';
import { formatSiUnit } from 'tgui-core/format';
import { BooleanLike } from 'tgui-core/react';
import { toTitleCase } from 'tgui-core/string';

>>>>>>> 3aa9314ff4 ([MIRROR] Moves UIs to TGUI core (#9967))
import { Materials } from './ExosuitFabricator/Material';

const canBeMade = (recipe, materials, mult: number = 1) => {
  if (recipe.requirements === null) {
    return true;
  }

  let recipeRequiredMaterials: string[] = Object.keys(recipe.requirements);

  for (let mat_id of recipeRequiredMaterials) {
    let material = materials.find((val: mat) => val.name === mat_id);
    if (!material) {
      continue; // yes, if we cannot find the material, we just ignore it :V
    }
    if (material.amount < recipe.requirements[mat_id] * mult) {
      return false;
    }
  }

  return true;
};
type Data = {
  recipes: recipe[];
  categories: string[];
  busy: string;
  materials: mat[];
};

type recipe = {
  category: string;
  name: string;
  ref: string;
  requirements: Record<string, number>;
  hidden: BooleanLike;
  coeff_applies: BooleanLike;
  is_stack: BooleanLike;
};

export const Autolathe = (props) => {
  const { act, data } = useBackend<Data>();

  const { recipes, busy, materials, categories } = data;

  const [category, setCategory] = useSharedState('category', 0);
  const [searchText, setSearchText] = useSharedState('search_text', '');

  const testSearch = createSearch(searchText, (recipe: recipe) => recipe.name);

  const recipesToShow: recipe[] = flow([
    (recipes: recipe[]) =>
      filter(recipes, (recipe) => recipe.category === categories[category]),
    (recipes: recipe[]) => {
      if (!searchText) {
        return recipes;
      } else {
        return filter(recipes, testSearch);
      }
    },
    (recipes: recipe[]) =>
      sortBy(recipes, (recipe) => recipe.name.toLowerCase()),
  ])(recipes);

  return (
    <Window width={550} height={700}>
      <Window.Content scrollable>
        <Section title="Materials">
          <Materials disableEject />
        </Section>
        <Section
          title="Recipes"
          buttons={
            <Dropdown
              autoScroll={false}
              width="190px"
              options={categories}
              selected={categories[category]}
              onSelected={(val) => setCategory(categories.indexOf(val))}
            />
          }
        >
          <Input
            fluid
            placeholder="Search for..."
            value={searchText}
            onInput={(e, v: string) => setSearchText(v)}
            mb={1}
          />
          {recipesToShow.map((recipe) => (
            <Flex justify="space-between" align="center" key={recipe.ref}>
              <Flex.Item>
                <Button
                  color={(recipe.hidden && 'red') || null}
                  icon="hammer"
                  iconSpin={busy === recipe.name}
                  disabled={!canBeMade(recipe, materials, 1)}
                  onClick={() => act('make', { make: recipe.ref })}
                >
                  {toTitleCase(recipe.name)}
                </Button>
                {(!recipe.is_stack && (
                  <Box as="span">
                    <Button
                      color={(recipe.hidden && 'red') || null}
                      disabled={!canBeMade(recipe, materials, 5)}
                      onClick={() =>
                        act('make', { make: recipe.ref, multiplier: 5 })
                      }
                    >
                      x5
                    </Button>
                    <Button
                      color={(recipe.hidden && 'red') || null}
                      disabled={!canBeMade(recipe, materials, 10)}
                      onClick={() =>
                        act('make', { make: recipe.ref, multiplier: 10 })
                      }
                    >
                      x10
                    </Button>
                  </Box>
                )) ||
                  null}
              </Flex.Item>
              <Flex.Item>
                {(recipe.requirements &&
                  Object.keys(recipe.requirements)
                    .map(
                      (mat) =>
                        toTitleCase(mat) + ': ' + recipe.requirements[mat],
                    )
                    .join(', ')) || <Box>No resources required.</Box>}
              </Flex.Item>
            </Flex>
          ))}
        </Section>
      </Window.Content>
    </Window>
  );
};
<<<<<<< HEAD
=======

const Designs = (props) => {
  const { act, data } = useBackend<Data>();

  const [selectedCategory, setSelectedCategory] = useSharedState(
    'selected_category',
    'No Category Selected',
  );
  const [searchText, setSearchText] = useSharedState('search_text', '');

  const materials = useMemo(() => {
    let materials = {};
    for (const material of data.materials) {
      materials[material.name] = material.amount;
    }
    return materials;
  }, [data.materials]);

  const categories = {};

  for (const recipe of data.recipes) {
    if (categories[recipe.category]) {
      categories[recipe.category] += 1;
    } else {
      categories[recipe.category] = 1;
    }
  }

  let recipes: RecipeData[];

  if (searchText.length > 0) {
    recipes = data.recipes.filter(
      (recipe) =>
        recipe.category !== 'All' &&
        recipe.name.toLowerCase().includes(searchText.toLowerCase()),
    );
  } else {
    recipes = data.recipes.filter(
      (recipe) => recipe.category === selectedCategory,
    );
  }

  return (
    <Stack fill>
      <Stack.Item width="240px">
        <Section title="Categories" fill>
          <Tabs vertical backgroundColor="rgba(0,0,0,0)">
            {Object.entries(categories).map(([category, amount]) => (
              <Tabs.Tab
                key={category}
                rightSlot={`(${amount})`}
                selected={selectedCategory === category}
                onClick={() => setSelectedCategory(category)}
              >
                {category}
              </Tabs.Tab>
            ))}
          </Tabs>
        </Section>
      </Stack.Item>
      <Stack.Item grow>
        <Section title={selectedCategory} fill>
          <Stack>
            <Stack.Item>
              <Icon name="magnifying-glass" />
            </Stack.Item>
            <Stack.Item grow>
              <Input
                fluid
                placeholder="Search all designs..."
                updateOnPropsChange
                value={searchText}
                onChange={(e, val) => setSearchText(val)}
              />
            </Stack.Item>
          </Stack>
          <Section fill height="94%" mt={1} scrollable>
            <VirtualList>
              {recipes.map((recipe) => (
                <Recipe
                  key={recipe.ref}
                  recipe={recipe}
                  materials={materials}
                  busy={data.busy}
                />
              ))}
            </VirtualList>
          </Section>
        </Section>
      </Stack.Item>
    </Stack>
  );
};

const canBeMade = (
  required: Record<string, number>,
  available: Record<string, number>,
  multiplier: number = 1,
): boolean => {
  for (let [id, amt] of Object.entries(required)) {
    if ((available[id] || 0) < amt * multiplier) {
      return false;
    }
  }
  return true;
};

const Recipe = (props: {
  recipe: RecipeData;
  materials: Record<string, number>;
  busy: string;
}) => {
  const { act } = useBackend();
  const { recipe, materials, busy } = props;

  const canBeMadeCb = useCallback(canBeMade, [recipe, materials]);

  const requirementString = Object.entries(recipe.requirements)
    .map(([name, number]) => `${toTitleCase(name)}: ${formatSiUnit(number, 0)}`)
    .join(', ');

  return (
    <Box>
      <Button
        width="80%"
        icon="hammer"
        iconSpin={busy === recipe.name}
        disabled={!canBeMadeCb(recipe.requirements, materials)}
        onClick={() => act('make', { make: recipe.ref, multiplier: 1 })}
        tooltip={requirementString}
      >
        {toTitleCase(recipe.name)}
      </Button>
      <Button
        disabled={!canBeMadeCb(recipe.requirements, materials, 5)}
        onClick={() => act('make', { make: recipe.ref, multiplier: 5 })}
      >
        x5
      </Button>
      <Button
        disabled={!canBeMadeCb(recipe.requirements, materials, 10)}
        onClick={() => act('make', { make: recipe.ref, multiplier: 10 })}
      >
        x10
      </Button>
    </Box>
  );
};
>>>>>>> 3aa9314ff4 ([MIRROR] Moves UIs to TGUI core (#9967))
