#include "date.h"

Date::Date(QObject *parent) : QObject(parent)
{
    m_currentDate = QDate::currentDate().toString();
}

const QString &Date::currentDate() const
{
    return m_currentDate;
}
