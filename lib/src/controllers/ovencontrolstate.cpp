#include "ovencontrolstate.h"

namespace controllers {

  OvenControlState::OvenControlState(QObject *parent) : QObject(parent)
  {
    setInitialState();

  }

  bool OvenControlState::isOvenTurnedOn() const
  {
    return this->ovenTurnedOn;
  }

  QString OvenControlState::getTime() const
  {
    return time;
  }

  QString OvenControlState::getDate() const
  {
    return date;
  }

  void OvenControlState::setInitialState()
  {

    time = QTime::currentTime().toString("hh:mm A");
    date = QDate::currentDate().toString("dddd, MMMM d");
    updateDateTime = new QTimer();

    ovenTurnedOn = false;
    ovenRunning = false;
    lightTurnedOn = false;

    this->setConnections();
    updateDateTime->start(5000);


  }

  void OvenControlState::setConnections()
  {
    connect(updateDateTime,SIGNAL(timeout()),this,SLOT(updateDateTimeLabels()));
    connect(this,SIGNAL(powerButtonStateChanged(bool)),this,SLOT(updateOvenState(bool)));
  }

  void OvenControlState::updateDateTimeLabels()
  {
    if (time != QTime::currentTime().toString("hh:mm A")) {
        time = QTime::currentTime().toString("hh:mm A");
        emit timeChanged();
      }
    if (date != QDate::currentDate().toString("dddd, MMMM d")) {
        date = QDate::currentDate().toString("dddd, MMMM d");
        emit dateChanged();
      }
  }

  void OvenControlState::updateOvenState(bool newOvenState)
  {
    ovenTurnedOn = newOvenState;
    qDebug() << "newOvenState" << newOvenState;
    if (ovenTurnedOn)
      qDebug() << "horno prendido";
    else
      qDebug() << "horno apagado";
    emit ovenStateChanged();

  }

}
