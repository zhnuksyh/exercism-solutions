/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Implement the functions needed to solve the exercise here.
 * Do not forget to export them so they are available for the
 * tests. Here an example of the syntax as reminder:
 *
 * export function yourFunction(...) {
 *   ...
 * }
 */

export function cookingStatus(remainingTime) {

  if (remainingTime == undefined) {
    return 'You forgot to set the timer.';
  } else {
    if (remainingTime == 0) {
      return 'Lasagna is done.';
    } else {
      return 'Not done, please wait.'
    }
  }
}

export function preparationTime(layers, avgPrepTime) {
  if (avgPrepTime == undefined) {
    avgPrepTime = 2;
  }

  return layers.length * avgPrepTime;
}

export function quantities(layers) {
  let noodlesCounter = 0;
  let saucesCounter = 0;
  let noodlesQtty = 0;
  let saucesQtty = 0;
  
  for (let i = 0; i < layers.length; i++) {
    if (layers[i] == 'noodles') {
      noodlesCounter++;
    }
    
    if (layers[i] == 'sauce') {
      saucesCounter++;
    }
  }

  noodlesQtty = noodlesCounter * 50;
  saucesQtty = saucesCounter * 0.2;
  
  return {
    noodles: noodlesQtty,
    sauce: saucesQtty,
  };
}

export function addSecretIngredient(friendList, myList) {
  let secretIngredientIndex = friendList.length - 1;
  let secretIngredient = friendList[secretIngredientIndex];

  myList.push(secretIngredient);
  console.log(myList);
}

export function scaleRecipe(recipe, portion) {
  const newRecipe = {};

  for (let key in recipe) {
    newRecipe[key] = (recipe[key] / 2) * portion;
  };
  
  return newRecipe;
  console.log(recipe);
}
