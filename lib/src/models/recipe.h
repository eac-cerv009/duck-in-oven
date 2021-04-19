#ifndef RECIPE_H
#define RECIPE_H

#include <QObject>
#include <QTime>

namespace models {

  class Recipe : public QObject
  {
    Q_OBJECT

    Q_PROPERTY(QString ui_name MEMBER m_name)
    Q_PROPERTY(int ui_cookingTemperature MEMBER m_cookingTemperature)
    Q_PROPERTY(QTime ui_cookingTime MEMBER m_cookingTime)

  public:
    explicit Recipe(QObject *parent = nullptr);
    ~Recipe();

    Recipe(QString recipeName, int defaultTemperature, QTime defaultCookingTime);

  signals:

  private:
    QString m_name;
    int m_cookingTemperature;
    QTime m_cookingTime;

  };

}

#endif // RECIPE_H
