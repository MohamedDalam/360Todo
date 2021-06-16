#ifndef DATE_H
#define DATE_H

#include <QObject>
#include <QDate>
#include <QTime>

class Date : public QObject
{
    Q_OBJECT
    QString m_currentDate;

public:
    explicit Date(QObject *parent = nullptr);
    Q_PROPERTY(QString currentDate READ currentDate NOTIFY currentDateChanged)
    const QString &currentDate() const;

signals:
    void currentDateChanged();
};

#endif // DATE_H
