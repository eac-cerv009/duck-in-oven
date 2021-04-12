#ifndef OVENCONTROLSTATE_H
#define OVENCONTROLSTATE_H

#include <QObject>
#include <QTimer>
#include <QTime>

#include <lib_global.h>

namespace controllers {

  class OvenControlState : public QObject
  {
    Q_OBJECT

    Q_PROPERTY(QString ui_time MEMBER currentTime CONSTANT)
    Q_PROPERTY(QString ui_date MEMBER currentDate CONSTANT)

  public:
    explicit OvenControlState(QObject *parent = nullptr);

    bool isOvenTurnedOn();

  signals:
    void powerButtonStateChanged();

  private:
    bool ovenTurnedOn;
    bool ovenRunning;
    bool lightTurnedOn;

    QTimer* timer;
    QTime* time;
    QDate* date;

    QString currentTime;
    QString currentDate;

    void setInitialState();
  };
}

#endif // OVENCONTROLSTATE_H
