#ifndef COOKBOOK_H
#define COOKBOOK_H

#include <QObject>
#include <QTime>

class Recipe;


#include "lib_global.h"

namespace models {

  class CookBook : public QObject
  {
    Q_OBJECT

    Q_PROPERTY(int ui_recipesNumber READ getTotalRecipes CONSTANT)

  public:
    explicit CookBook(QObject *parent = nullptr);
    ~CookBook();

    int getTotalRecipes();

    Q_INVOKABLE QObject* recipeAt(int index) const;

  private:
    QVector<Recipe*> m_recipes;

    void AddRecipesDemo();
  };

}



#endif // COOKBOOK_H
