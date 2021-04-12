#include "mastercontroller.h"

namespace controllers {

  class MasterController::Implementation
  {
  public:
    Implementation(MasterController* _masterController) : masterController(_masterController)
    {
      uiControlFlow = new UiControlFlow(masterController);
      ovenControlState = new OvenControlState(masterController);
    }

    MasterController* masterController{nullptr};
    UiControlFlow* uiControlFlow{nullptr};
    OvenControlState* ovenControlState{nullptr};

    QString welcomeMessage = "Hi from MstrCtrller";

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

  const QString &MasterController::welcomeMessage() const
  {
    return implementation->welcomeMessage;
  }

}
