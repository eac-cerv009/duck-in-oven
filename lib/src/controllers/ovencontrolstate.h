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

    Q_PROPERTY(QString ui_time MEMBER time NOTIFY timeChanged)
    Q_PROPERTY(QString ui_date MEMBER date NOTIFY dateChanged)
    Q_PROPERTY(bool ui_ovenTurnedOn MEMBER ovenTurnedOn READ isOvenTurnedOn NOTIFY ovenStateChanged)

  public:
    explicit OvenControlState(QObject *parent = nullptr);

    bool isOvenTurnedOn() const;

  signals:
    void powerButtonStateChanged(bool);
    void ovenStateChanged();

    void timeChanged();
    void dateChanged();

  private:
    bool ovenTurnedOn;
    bool ovenRunning;
    bool lightTurnedOn;


    QString time;
    QString date;
    QTimer* updateDateTime;

    void setInitialState();
    void setConnections();

  private slots:

      void updateDateTimeLabels();
      void updateOvenState(bool newOvenState);


  };
}

#endif // OVENCONTROLSTATE_H
