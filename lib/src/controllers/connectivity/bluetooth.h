#ifndef BLUETOOTH_H
#define BLUETOOTH_H

#include <QObject>

#include <lib_global.h>

namespace controllers {
  namespace connectivity {

    class Bluetooth : public QObject
    {
      Q_OBJECT

      Q_PROPERTY(bool ui_bluetoothAvailable MEMBER bluetoothAvailable READ isBluetoothAvailable CONSTANT)

    public:
      explicit Bluetooth(QObject *parent = nullptr);

      bool isBluetoothAvailable();

    signals:

    private:
      bool bluetoothAvailable;

    };

  }
}
#endif // BLUETOOTH_H
