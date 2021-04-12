#ifndef WIFI_H
#define WIFI_H

#include <QObject>

namespace controllers {
  namespace connectivity {

    class WiFi : public QObject
    {
      Q_OBJECT
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
