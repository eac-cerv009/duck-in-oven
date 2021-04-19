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

  bool OvenControlState::isOvenRunning() const
  {
    return this->ovenRunning;
  }

  bool OvenControlState::isLightTurnedOn() const
  {
    return this->lightTurnedOn;
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

    selectedTemperature = 425;
    temperature = QString::number(selectedTemperature);
    selectedTime = 390000;
    timerTimeLeft =  QString("%1").arg(1, 2, 10, QChar('0')) + ":"+ QString("%1").arg(30, 2, 10, QChar('0'));
    ovenTimer = new QTimer();
    ovenTimer->setInterval(60000);

    this->setConnections();
    updateDateTime->start(5000);
  }

  void OvenControlState::setConnections()
  {
    connect(updateDateTime,SIGNAL(timeout()),this,SLOT(updateDateTimeLabels()));
    connect(this,SIGNAL(powerButtonStateChanged(bool)),this,SLOT(updateOvenPowerState(bool)));
    connect(this,SIGNAL(lightButtonStateChanged(bool)),this,SLOT(updateLightState(bool)));
    connect(this,SIGNAL(ovenTemperatureChoosen(QString)),this,SLOT(updateTemperature(QString)));
    connect(this,SIGNAL(ovenTimerChoosen(QString)),this,SLOT(updateTimer(QString)));
    connect(this,SIGNAL(runningButtonPressed()),this,SLOT(updateOvenRunningState()));
    connect(ovenTimer, SIGNAL(timeout()),this, SLOT(updateRunningTimeLabel()));
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

  void OvenControlState::updateOvenPowerState(bool newOvenPowerState)
  {
    ovenTurnedOn = newOvenPowerState;
    emit ovenPowerStateChanged();
  }

  void OvenControlState::updateLightState(bool newLightState)
  {
    lightTurnedOn = newLightState;
    emit ovenLightStateChanged();
  }

  void OvenControlState::updateTemperature(QString newTemperature)
  {
    temperature = newTemperature;
    selectedTemperature = temperature.toInt();
    emit ovenTemperatureChanged();
  }

  void OvenControlState::updateTimer(QString newTime)
  {
    timerMinutesLeft = newTime.last(2).toInt();
    timerHoursLeft = newTime.first(2).toInt();
    if (timerHoursLeft >= 99 && timerMinutesLeft > 59) {
        timerMinutesLeft = 59;
      }
    else {
        if (timerMinutesLeft > 59) {
            ++timerHoursLeft;
            timerMinutesLeft = timerMinutesLeft - 60;
      }
    }
    selectedTime = timerHoursLeft * 3600000 + timerMinutesLeft * 60000;
    timerTimeLeft =  QString("%1").arg(timerHoursLeft, 2, 10, QChar('0')) + ":"+ QString("%1").arg(timerMinutesLeft, 2, 10, QChar('0'));
    emit timerTimeLeftChanged();
  }

  void OvenControlState::updateOvenRunningState()
  {
    ovenRunning = !ovenRunning;
    if (ovenRunning) {
        qDebug() << "Oven START Running";
        ovenTimer->start();
      }
    else{
        ovenTimer->stop();
        qDebug() << "Oven STOP Running";
      }
    emit ovenRunningStateChanged();
  }

  void OvenControlState::updateRunningTimeLabel()
  {
    if (timerHoursLeft == 0) {
        --timerMinutesLeft;
        if (timerMinutesLeft == 0) {
            ovenTimer->stop();
            ovenRunning = false;
            emit ovenRunningStateChanged();
          }
      }
    else {
        if(timerMinutesLeft == 0) {
            timerMinutesLeft = 59;
            --timerHoursLeft;
          }
        else
          --timerMinutesLeft;
      }
    timerTimeLeft =  QString("%1").arg(timerHoursLeft, 2, 10, QChar('0')) + ":"+ QString("%1").arg(timerMinutesLeft, 2, 10, QChar('0'));
    emit timerTimeLeftChanged();
  }
}
