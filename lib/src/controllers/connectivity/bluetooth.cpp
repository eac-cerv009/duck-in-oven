#include "bluetooth.h"

namespace controllers {
  namespace connectivity {

    Bluetooth::Bluetooth(QObject *parent) : QObject(parent)
    {
      bluetoothAvailable = false;

    }

    bool Bluetooth::isBluetoothAvailable()
    {
      return this->bluetoothAvailable;
    }

  }
}
