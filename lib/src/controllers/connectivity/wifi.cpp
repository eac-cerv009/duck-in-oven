#include "wifi.h"

namespace controllers {
  namespace connectivity {

    WiFi::WiFi(QObject *parent) : QObject(parent)
    {
      wifiAvailable = true;

    }

    bool WiFi::isWiFiAvailable()
    {
      return this->wifiAvailable;
    }

  }
}

