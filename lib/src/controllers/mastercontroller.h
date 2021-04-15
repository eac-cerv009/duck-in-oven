#ifndef MASTERCONTROLLER_H
#define MASTERCONTROLLER_H

#include <QObject>
#include <QScopedPointer>
#include <QString>

#include <lib_global.h>
#include <controllers/uicontrolflow.h>
#include <controllers/ovencontrolstate.h>

namespace controllers {

class MasterController : public QObject
{
  Q_OBJECT

  //Q_PROPERTY(QString ui_welcomeMessage MEMBER welcomeMessage CONSTANT);
  Q_PROPERTY(QString ui_welcomeMessage READ welcomeMessage CONSTANT )
  Q_PROPERTY(controllers::UiControlFlow* ui_controlFlow READ uiControlFlow CONSTANT)
  Q_PROPERTY(controllers::OvenControlState* ui_ovenControlState READ ovenControlState CONSTANT)

public:
  explicit MasterController(QObject* parent = nullptr);
  ~MasterController();

  UiControlFlow* uiControlFlow();
  OvenControlState* ovenControlState();

  //QString welcomeMessage = "Hallo aus MasterController";

  const QString& welcomeMessage() const;

private:
  class Implementation;
  QScopedPointer<Implementation> implementation;

};

}

#endif // MASTERCONTROLLER_H
