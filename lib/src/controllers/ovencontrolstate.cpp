#include "ovencontrolstate.h"

namespace controllers {

  OvenControlState::OvenControlState(QObject *parent) : QObject(parent)
  {
    setInitialState();

  }

  void OvenControlState::setInitialState()
  {
    ovenTurnedOn = false;
    ovenRunning = false;
    lightTurnedOn = false;

    time = new QTime(QTime::currentTime());
    date = new QDate(QDate::currentDate());

    currentTime = time->toString("hh:mm A");
    currentDate = date->toString("dddd, MMMM d");

    qDebug() << currentTime << currentDate;

  }

}
