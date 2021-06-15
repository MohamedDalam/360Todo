#ifndef MODELTODO_H
#define MODELTODO_H

#include <QAbstractListModel>
#include <QVector>
#include <QHash>
#include <QDebug>

struct Record{
    Record(){};
    Record(bool finished, QString description) :
        finished(finished), description(description) {};

    bool finished;
    QString description;
};

class ModelTodo : public QAbstractListModel
{
    Q_OBJECT
public:
    enum RoleNames {
        Finished = Qt::UserRole,
        Description
    };

    explicit ModelTodo(QObject *parent = nullptr);
    ~ModelTodo();

    Q_INVOKABLE void append(const bool finished, const QString& description);
    Q_INVOKABLE void remove(int index);

    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    virtual QHash<int, QByteArray> roleNames() const override;

private:
    QVector<Record> modelData;
    QHash<int, QByteArray> modelRoleNames;
};

#endif // MODELTODO_H
