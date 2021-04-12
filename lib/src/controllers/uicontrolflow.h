#ifndef UICONTROLFLOW_H
#define UICONTROLFLOW_H
#include <QObject>

#include <lib_global.h>

namespace controllers {

class UiControlFlow : public QObject
{
  Q_OBJECT

public:
  explicit UiControlFlow(QObject * _parent = nullptr)
    : QObject(_parent)
  {}

signals:

  void goDefaultView();
  void goOvenManualSet();
  void goCookbookView();

  void goManualBakeView();
  void goManualTemperatureView();
  void goManualTimerView();
  void goRunningView();
  void goCameraPreview();
};

}

#endif // UICONTROLFLOW_H
