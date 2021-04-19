#include "mastercontroller.h"

namespace controllers {

  class MasterController::Implementation
  {
  public:
    Implementation(MasterController* _masterController) : masterController(_masterController)
    {
      uiControlFlow = new UiControlFlow(masterController);
      ovenControlState = new OvenControlState(masterController);
      wiFi = new WiFi(masterController);
      bluetooth = new Bluetooth(masterController);
    }

    MasterController* masterController{nullptr};
    UiControlFlow* uiControlFlow{nullptr};
    OvenControlState* ovenControlState{nullptr};
    WiFi *wiFi{nullptr};
    Bluetooth* bluetooth{nullptr};

    QString welcomeMessage = "Hallo from MstrCtrller";

  };

  MasterController::MasterController(QObject* parent)
      : QObject(parent)
  {
    implementation.reset(new Implementation(this));
  }

  MasterController::~MasterController()
  {
  }

  UiControlFlow *MasterController::uiControlFlow()
  {
    return implementation->uiControlFlow;
  }

  OvenControlState* MasterController::ovenControlState()
  {
    return implementation->ovenControlState;
  }

  WiFi *MasterController::wiFi()
  {
    return implementation->wiFi;
  }

  Bluetooth *MasterController::bluetooth()
  {
    return implementation->bluetooth;
  }

  const QString &MasterController::welcomeMessage() const
  {
    return implementation->welcomeMessage;
  }

}
