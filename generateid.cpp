#include<QSqlQuery>
#include<QVariant>
#include"generateid.h"
inline int generateId(const QString &table)
{
QSqlQuery query;
query.exec("SELECT MAX(id) FROM " + table);
int id = 0;
if (query.next())
id = query.value(0).toInt() + 1;
return id;
}
