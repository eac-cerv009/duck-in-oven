#ifndef BLUETOOTH_H
#define BLUETOOTH_H

#include <QObject>


namespace controllers {
  namespace connectivity {

    class Bluetooth : public QObject
    {
      Q_OBJECT
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
