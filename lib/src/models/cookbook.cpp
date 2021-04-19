#include "cookbook.h"

namespace models {

  CookBook::CookBook(QObject *parent)
    : QObject(parent)
  {


  }

  CookBook::~CookBook()
  {

  }

  int CookBook::getTotalRecipes()
  {
    return 0;
  }

  QObject* CookBook::recipeAt(int index) const
  {
    qDebug ()<< index;
    QObject *ret = new QObject(nullptr);

    if (index < 0 || index >= m_recipes.count())
      return 0;

    //QQmlEngine::setObjectOwnership(m_recipes[index], QQmlEngine::CppOwnership);

    //return m_recipes[index];
    return ret;

  }

  void CookBook::AddRecipesDemo()
  {
    //m_recipes << new Recipe("Duck", 200, QTime(1,15));
  }

}

