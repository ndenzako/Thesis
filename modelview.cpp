#include<QSqlTableModel>
#include<QTableView>
#include<QPushButton>
#include"modelview.h"
#include<QString>
#include<QHBoxLayout>
#include<QVBoxLayout>
#include<QMessageBox>
#include<QHeaderView>

#include"generateid.h"

ArtistForm::ArtistForm(const QString &name, QWidget *parent)
 : QDialog(parent)
{
//setFixedWidth(600);
//setMinimumHeight(600);
setMinimumSize(600,600);
QString strQuery = "SELECT name, postname FROM liststudent";
model = new QSqlTableModel(this);
model->setTable("liststudent"); //define a table with an attribute artist//
//model->setFilter(strQuery);
model->setSort(student_Name, Qt::AscendingOrder);
model->setHeaderData(student_Name, Qt::Horizontal, tr("Name"));
model->setHeaderData(student_Post_Name, Qt::Horizontal, tr("Post Name"));
//model->setHeaderData(className, Qt::Horizontal, tr("Class"));
//model->setHeaderData(departmentName, Qt::Horizontal, tr("Department"));
//model->setHeaderData(Artist_Matricule, Qt::Horizontal, tr("Matricule"));
model->select();
setWindowTitle(tr("Data viewer"));

connect(model, SIGNAL(beforeInsert(QSqlRecord &)),
this, SLOT(beforeInsertArtist(QSqlRecord &)));
tableView = new QTableView;
tableView->setStyleSheet("QTableView { border: 30px solid magenta;"
                                      "background-color: #8EDE21;"
                                      "selection-background-color: #999}");
tableView->setAlternatingRowColors(true);
tableView->setModel(model);
tableView->setShowGrid(false);
tableView->verticalHeader()->setVisible(false);
tableView->setColumnHidden(studentID, true);
//tableView->setColumnHidden(classId, true);
//tableView->setColumnHidden(departmentID, true);



tableView->setSelectionBehavior(QAbstractItemView::SelectRows);
tableView->resizeColumnsToContents();
for (int row = 0; row < model->rowCount(); ++row) {
QSqlRecord record = model->record(row);
if (record.value(student_Name).toString() == name) {
tableView->selectRow(row);

break;
}
}
//Implementaton of the layout and slot connexions//
addButton = new QPushButton(tr("Add"));
deleteButton = new QPushButton(tr("Delete"));
deleteButton->setEnabled(false);
closeButton = new QPushButton(tr("Close"));

hBoxLayoutButton = new QHBoxLayout;
vBoxlayout = new QVBoxLayout;
hBoxLayoutButton->addWidget(addButton);
hBoxLayoutButton->addWidget(deleteButton);
hBoxLayoutButton->addStretch();
hBoxLayoutButton->addWidget(closeButton);
vBoxlayout->addWidget(tableView);
vBoxlayout->addLayout(hBoxLayoutButton);
setLayout(vBoxlayout);
connect(closeButton,SIGNAL(clicked()),this,SLOT(close()));
connect(addButton,SIGNAL(clicked()),this,SLOT(addArtist()));
connect(deleteButton,SIGNAL(clicked()),this,SLOT(deleteArtist()));
}


void ArtistForm::addArtist()
{
    int row = model->rowCount();
    model->insertRow(row);
    QModelIndex index = model->index(row, student_Name);
    tableView->setCurrentIndex(index);
    tableView->edit(index);
}

void ArtistForm::beforeInsertArtist(QSqlRecord &record)
{
    record.setValue("id", generateId("artist"));
}

void ArtistForm::deleteArtist()
{
    tableView->setFocus();
    QModelIndex index = tableView->currentIndex();
if (!index.isValid())
    return;
    QSqlRecord record = model->record(index.row());
    QSqlTableModel cdModel;
    cdModel.setTable("cd");
    cdModel.setFilter("artistid = " + record.value("id").toString());
    cdModel.select();
if (cdModel.rowCount() == 0) 
   {
        model->removeRow(tableView->currentIndex().row());
   }
   else 
      {
        QMessageBox::information(this,tr("Delete Artist"),
       tr("Cannot delete %1 because there are CDs associated "
      "with this artist in the collection.")
     .arg(record.value("name").toString()));
      }
}
