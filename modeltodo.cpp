#include "modeltodo.h"

ModelTodo::ModelTodo(QObject *parent):
    QAbstractListModel(parent)
{
    modelRoleNames[Active] = "active";
    modelRoleNames[Description] = "description";

    modelData.push_back(Record(false,"Task1"));
    modelData.push_back(Record(true,"Task2"));
    modelData.push_back(Record(false,"Task3"));
}

ModelTodo::~ModelTodo()
{
}

void ModelTodo::append(const bool active, const QString &description)
{
    if(description == "") return;
    const int row = rowCount(QModelIndex());
    beginInsertRows(QModelIndex(),row,row);
    modelData.push_back(Record(active,description));
    endInsertRows();
    emit countChanged();
}

void ModelTodo::remove(int index)
{
    if (index < 0 || index >= modelData.count())
        return;

    beginRemoveRows(QModelIndex(), index, index);
    modelData.removeAt(index);
    endRemoveRows();
    emit countChanged();
}

void ModelTodo::changeActiveState(int index)
{
    if (index < 0 || index >= modelData.count())
        return;
    modelData[index].active = !modelData.at(index).active;
}

int ModelTodo::rowCount(const QModelIndex &parent) const
{
    return modelData.count();
}

QVariant ModelTodo::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    if(row < 0 || row >= modelData.count()) {
        return QVariant();
    }
    const Record& record = modelData.at(row);
    switch(role) {
    case Active:
        return record.active;
    case Description:
        return record.description;
    }
    return QVariant();
}

QHash<int, QByteArray> ModelTodo::roleNames() const
{
    return modelRoleNames;
}


int ModelTodo::count() const
{
    return m_count;
}
