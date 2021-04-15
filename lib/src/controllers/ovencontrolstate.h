#ifndef OVENCONTROLSTATE_H
#define OVENCONTROLSTATE_H

#include <QObject>
#include <QTimer>
#include <QTime>
#include <QString>

#include <lib_global.h>

namespace controllers {

  class OvenControlState : public QObject
  {
    Q_OBJECT

    Q_PROPERTY(QString ui_time MEMBER time READ getTime NOTIFY timeChanged)
    Q_PROPERTY(QString ui_date MEMBER date READ getDate NOTIFY dateChanged)
    Q_PROPERTY(bool ui_ovenTurnedOn MEMBER ovenTurnedOn READ isOvenTurnedOn NOTIFY ovenPowerStateChanged)
    Q_PROPERTY(bool ui_lightTurnedOn MEMBER lightTurnedOn READ isLightTurnedOn NOTIFY ovenLightStateChanged)
    Q_PROPERTY(bool ui_ovenRunning MEMBER ovenRunning READ isOvenRunning NOTIFY ovenRunningStateChanged)
    Q_PROPERTY(QString ui_temperature MEMBER temperature NOTIFY ovenTemperatureChanged)
    Q_PROPERTY(QString ui_timerTimeLeft MEMBER timerTimeLeft NOTIFY timerTimeLeftChanged)
    Q_PROPERTY(int ui_selectedTime MEMBER selectedTime NOTIFY timerSelected)

  public:
    explicit OvenControlState(QObject *parent = nullptr);

    bool isOvenTurnedOn() const;
    bool isOvenRunning() const;
    bool isLightTurnedOn() const;

    QString getTime() const;
    QString getDate() const;

  signals:
    void powerButtonStateChanged(bool);

    void lightButtonStateChanged(bool);
    void runningButtonPressed();
    void ovenTemperatureChoosen(QString);
    void ovenTimerChoosen(QString);

    void ovenPowerStateChanged();
    void ovenLightStateChanged();
    void ovenRunningStateChanged();
    void ovenTemperatureChanged();
    void timerTimeLeftChanged();
    void timerSelected();

    void timeChanged();
    void dateChanged();

  private:
    bool ovenTurnedOn;
    bool ovenRunning;
    bool lightTurnedOn;

    QString time;
    QString date;
    QTimer* updateDateTime;

    int selectedTemperature;
    int selectedTime;
    int timerMinutesLeft;
    int timerHoursLeft;
    QString temperature;
    QString timerTimeLeft;
    QTimer* ovenTimer;
    QTimer* updateRunningTime;

    void setInitialState();
    void setConnections();

  private slots:

      void updateDateTimeLabels();
      void updateOvenPowerState(bool newOvenPowerState);
      void updateLightState(bool newLightState);
      void updateTemperature(QString newTemperature);
      void updateTimer(QString newTime);
      void updateOvenRunningState();
      void updateRunningTimeLabel();

  };
}

#endif // OVENCONTROLSTATE_H
