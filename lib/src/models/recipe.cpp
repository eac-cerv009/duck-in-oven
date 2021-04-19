#include "recipe.h"

namespace models {

  Recipe::Recipe(QObject *parent) : QObject(parent)
  {

  }

  Recipe::~Recipe()
  {

  }

  Recipe::Recipe(QString recipeName, int defaultTemperature, QTime defaultCookingTime) :
    m_name(recipeName), m_cookingTemperature(defaultTemperature), m_cookingTime(defaultCookingTime)
  {

  }


}

