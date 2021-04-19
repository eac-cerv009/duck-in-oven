#ifndef WIFI_H
#define WIFI_H

#include <QObject>

#include <lib_global.h>

namespace controllers {
  namespace connectivity {

    class WiFi : public QObject
    {
      Q_OBJECT

      Q_PROPERTY(bool ui_wiFiAvailable MEMBER wifiAvailable READ isWiFiAvailable CONSTANT)

    public:
      explicit WiFi(QObject *parent = nullptr);

      bool isWiFiAvailable();

    signals:

    private:
      bool wifiAvailable;

    };

  }
}


#endif // WIFI_H
