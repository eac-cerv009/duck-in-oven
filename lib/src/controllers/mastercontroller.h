#ifndef MASTERCONTROLLER_H
#define MASTERCONTROLLER_H

#include <QObject>
#include <QScopedPointer>
#include <QString>

#include <lib_global.h>
#include <controllers/uicontrolflow.h>
#include <controllers/ovencontrolstate.h>
#include <controllers/connectivity/bluetooth.h>
#include <controllers/connectivity/wifi.h>

namespace controllers {

  using namespace connectivity;

  class MasterController : public QObject
  {
    Q_OBJECT

    Q_PROPERTY(QString ui_welcomeMessage READ welcomeMessage CONSTANT )
    Q_PROPERTY(controllers::UiControlFlow* ui_controlFlow READ uiControlFlow CONSTANT)
    Q_PROPERTY(controllers::OvenControlState* ui_ovenControlState READ ovenControlState CONSTANT)
    Q_PROPERTY(controllers::connectivity::WiFi* ui_wiFi READ wiFi CONSTANT)
    Q_PROPERTY(controllers::connectivity::Bluetooth* ui_bluetooth READ bluetooth CONSTANT)

  public:
    explicit MasterController(QObject* parent = nullptr);
    ~MasterController();

    UiControlFlow* uiControlFlow();
    OvenControlState* ovenControlState();
    WiFi *wiFi();
    Bluetooth* bluetooth();

    const QString& welcomeMessage() const;

  private:
    class Implementation;
    QScopedPointer<Implementation> implementation;

  };

}

#endif // MASTERCONTROLLER_H
