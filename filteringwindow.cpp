#include"filteringwindow.h"
#include<QGroupBox>
#include<QLayout>
#include<QLabel>
#include<QHBoxLayout>
#include<QVBoxLayout>
#include<QPushButton>
#include<QComboBox>
#include<QRadioButton>
#include<QGridLayout>
#include<QTableView>
#include<QSqlQueryModel>
#include<QStringList>
#include<QSqlRecord>
#include<QSqlQuery>
#include<QDebug>
#include<QMessageBox>
#include<QSqlTableModel>
#include<QSqlError>



filterWindow::filterWindow(QWidget *parent)
:QWidget(parent)
{
    initWidgets();
    positionWidgets();
    connectionsInit();
    //updFacultyCombo();
    iniCombo(facultyCombo,"faculty","facultyName");
    //iniCombo(departmentCombo,"department","name");
    iniCombo(classCombo,"classtable","className");
    this->setStyleSheet("QGroupBox"
    "{"
        "background-color:transparent;"
        "border-bottom-left-radius: 3px;"
        "border-bottom-right-radius: 3px;"
        "border: 3px solid #acacac;"
        "border-top: 3px solid #acacac none;"
        "margin-top: 15px;"
        "margin-left: 0px;"
    "}"
    "QGroupBox::title"
    "{"
        "subcontrol-origin: margin;"
        "background:url(:/assets/subWindowBackground);"
        "border-top-left-radius: 3px;"
        "border-top-right-radius: 3px;"
        "border: 3px solid #0b477b;"
        "border-bottom: none;"
        "background-color: qlineargradient(x1: 30, y1: 10, x2: 30, y2: 10,"
            "stop: 0 #005192, stop: 1 #002f60);"
        "padding: 2 2px;"
        "color: white;"
    "}");
    
    
//initwidgets();
}

    void filterWindow::initWidgets()
    {
    facultyCombo = new QComboBox;
    facultyCombo->setFixedSize(300,30);
    departmentCombo = new QComboBox;
    departmentCombo->setFixedSize(300,30);
    classCombo = new QComboBox;
    classCombo->setFixedSize(200,30);
    facultyLabel = new QLabel(tr("Faculty"));
    departmentLabel = new QLabel(tr("Department"));
    classLabel = new QLabel(tr("Class"));
    facultyHBox = new QHBoxLayout;
    departmentHBox = new QHBoxLayout;
    classHBox = new QHBoxLayout;
    mainVBoxLayout = new QVBoxLayout;
    
    groupBoxFac = new QGroupBox(tr("Student location"));
    buttonGroupBox = new QGroupBox(tr("Actions"));
    buttonGroupBox1 = new QGroupBox(tr("Status"));
    radio1 = new QRadioButton(tr("&All students"));

    radio2 = new QRadioButton(tr("&Faculty students"));
    radio3 = new QRadioButton(tr("&Class students"));
    radio4 = new QRadioButton(tr("&Success"));
    radio5 = new QRadioButton(tr("&Fail"));
    mainGrid = new QGridLayout(this);
    tableView = new QTableView;
    statusStudentCombo = new QComboBox;
    statusStudentLabel = new QLabel(tr("Select student"));
    statusStudentLayout = new QHBoxLayout;
    buttonGroupBoxChecker = false;

    vBoxTest = new QVBoxLayout;
    
    }
    
   
    void filterWindow::positionWidgets()
    {
    facultyCombo->addItem(tr("All"));
    facultyHBox->addWidget(facultyLabel);
    facultyHBox->addWidget(facultyCombo);
    
    departmentHBox->addWidget(departmentLabel);
    departmentHBox->addWidget(departmentCombo);
    classHBox->addWidget(classLabel);
    classHBox->addWidget(classCombo);
    mainVBoxLayout->addLayout(facultyHBox);
    mainVBoxLayout->addLayout(departmentHBox);
    mainVBoxLayout->addLayout(classHBox);
    mainVBoxLayout->addStretch();
    groupBoxFac->setLayout(mainVBoxLayout);
    
    vBoxTest->addWidget(groupBoxFac);
    vBoxTest->addWidget(createFirstExclusiveGroup());
    vBoxTest->addWidget(createSecondExclusiveGroup());
    vBoxTest->addStretch();
    mainGrid->addLayout(vBoxTest,0,0);
    
    
    //============================================================================================
    //This ca=ould be implemented in a public method to be more general for any case of tableModel
    
    QSqlTableModel *model =new QSqlTableModel;
    model->setTable("liststudent");  
    model->select();
    if (model->lastError().type() != QSqlError::NoError)
    qDebug()<<"Error: Selection table failed!...";
    
    tableView->setAlternatingRowColors(true);
    model->setHeaderData(1, Qt::Horizontal, tr("Name"));
    model->setHeaderData(2, Qt::Horizontal, tr("Post Name"));
    model->setHeaderData(className, Qt::Horizontal, tr("Class"));
    model->setHeaderData(departmentName, Qt::Horizontal, tr("Department"));
    tableView->setModel(model);
    tableView->setColumnHidden(0, true);
    //tableView->setColumnHidden(3, true);
    //tableView->setColumnHidden(5, true);
    tableView->resizeColumnsToContents();
    
    //============================================================================================
    
    tableView->setStyleSheet("QTableView { border: 15px solid magenta;"
                                      "background-color: #8EDE21;"
                                      "selection-background-color: #999}");
    mainGrid->addWidget(tableView,0,1,3,1);
    }
    
    
QGroupBox *filterWindow::createFirstExclusiveGroup()
{
    QVBoxLayout *vbox = new QVBoxLayout;
    vbox->addWidget(radio1);
    vbox->addWidget(radio2);
    vbox->addWidget(radio3);
    vbox->addStretch(5);
    buttonGroupBox->setCheckable(true);
    buttonGroupBox->setChecked(false);
    buttonGroupBox->setLayout(vbox);

    return buttonGroupBox;
}

QGroupBox *filterWindow::createSecondExclusiveGroup()
{
    QVBoxLayout *vbox = new QVBoxLayout;
    vbox->addWidget(radio4);
    vbox->addWidget(radio5);
    statusStudentCombo->setToolTip(tr("Select the student you want to view status"));
    statusStudentLayout->addWidget(statusStudentLabel);
    statusStudentLayout->addWidget(statusStudentCombo);
    
    vbox->addLayout(statusStudentLayout);
    vbox->addStretch();
    buttonGroupBox1->setCheckable(true);
    buttonGroupBox1->setChecked(false);
    buttonGroupBox1->setLayout(vbox);
    return buttonGroupBox1;
}



void filterWindow::connectionsInit()
{


QObject::connect(radio1,SIGNAL(clicked()),this,SLOT(selectionCaseSlot()));
QObject::connect(radio2,SIGNAL(clicked()),this,SLOT(selectionCaseSlot()));
QObject::connect(radio3,SIGNAL(clicked()),this,SLOT(selectionCaseSlot()));
QObject::connect(facultyCombo,SIGNAL(currentTextChanged(QString)),this,SLOT(updFacultyCombo()));
QObject::connect(departmentCombo,SIGNAL(currentTextChanged(QString)),this,SLOT(updTable()));
QObject::connect(radio1,SIGNAL(clicked()),this,SLOT(allStudentSlot()));
QObject::connect(facultyCombo,SIGNAL(currentTextChanged(QString)),this,SLOT(allStudentSlot()));
QObject::connect(facultyCombo,SIGNAL(currentTextChanged(QString)),this,SLOT(locFacClassSlot()));
//QObject::connect(facultyCombo,SIGNAL(currentTextChanged(QString)),this,SLOT(updTable()));

}

int filterWindow::selectionFunction()
{
    if(radio1->isChecked())
    return allstudent;
    else
    if(radio2->isChecked())
    return facstudent;
    else

    return classstudent;
}


void filterWindow::selectionCaseSlot()
{
int select = selectionFunction();
switch(select)
{
case allstudent:
statusStudentCombo->clear();
statusStudentCombo->addItem(tr("All student have been selected"));
break;
case facstudent:
statusStudentCombo->clear();
statusStudentCombo->addItem(tr("Faculty's students have been selected"));
break;
case classstudent:
statusStudentCombo->clear();
statusStudentCombo->addItem(tr("Class's students have been selected"));
break;
}
}



void filterWindow::iniCombo(QComboBox *combo,const QString tablename,const QString colname)
{
QSqlQueryModel tableModel;
QString strFacQuery = QString("SELECT %1 FROM %2").arg(colname).arg(tablename);
tableModel.setQuery(strFacQuery);



QStringList strFacList;


qDebug()<<strFacQuery;



QString fac;
for(int i = 0;i<tableModel.rowCount();i++)
{

fac = tableModel.record(i).value(colname).toString();
if(fac.isEmpty())
{
QMessageBox::information(0,tr("Querry action"),tr("Querry from data base failed"));
}
strFacList.append(fac);
}
combo->addItems(strFacList);

}

void filterWindow::updFacultyCombo()
{   
    QString facName = facultyCombo->currentText();
    QString strFacultyQuery = QString("SELECT facultyId FROM faculty WHERE facultyName = %1%2%3").arg("'").arg(facName).arg("'");   
    qDebug()<<strFacultyQuery;
    QSqlQueryModel model;
    model.setQuery(strFacultyQuery);
    int facultyIdretrieved;
    for(int i = 0; i<model.rowCount();i++)
    {
    facultyIdretrieved = model.record(i).value("facultyId").toInt();
    }   
    QString strDepartmentQuery = QString("SELECT departmentname FROM department WHERE facultyId = %1").arg(facultyIdretrieved);
    qDebug()<<strDepartmentQuery;
    QSqlQueryModel *departModel =new QSqlQueryModel;
    departModel->setQuery(strDepartmentQuery);
    QStringList departList;
    QString departTemp;
    for(int i = 0; i<departModel->rowCount();i++)
    {
    departTemp = departModel->record(i).value("departmentname").toString();
    if(!departTemp.isEmpty())
    {
    departList.append(departTemp);
    qDebug()<<departTemp;
        
        
    }
    else
    {
        QMessageBox::information(0,tr("Querry action"),tr("Querry from data base failed"));
    
    }
   }
   
    departmentCombo->clear();
    departmentCombo->addItems(departList);    
    int departmentIdretrieved;
    QString strDepart = departmentCombo->currentText();
    //QString strDepartmentQuery = QString("SELECT departmentId FROM department WHERE facultyId = %1").arg("'").arg(strDepart).arg("'");
    QString departmentIdQuery = QString("SELECT departmentId FROM department WHERE departmentname = %1%2%3").arg("'").
    arg(strDepart).arg("'");    
    qDebug()<<departmentIdQuery;    
    departModel->setQuery(departmentIdQuery);    
    departmentIdretrieved = departModel->record(0).value("departmentId").toInt();
    QString departmentIdQuery1 = QString("SELECT name,postname FROM liststudent, studentreference,department WHERE "
    "liststudent.studentId = studentreference.studentId AND studentreference.departmentId = %1 AND "
    "department.departmentname = %2%3%4").arg(departmentIdretrieved).arg("'").arg(strDepart).arg("'");
    qDebug()<<" hdhgdf fhfggf "<<departmentIdQuery1;
    departModel->setQuery(departmentIdQuery1);
    departModel->setHeaderData(student_Name, Qt::Horizontal, tr("Name"));
    departModel->setHeaderData(student_Post_Name, Qt::Horizontal, tr("Post Name"));
    tableView->setColumnHidden(0, false);
    tableView->setModel(departModel);
    tableView->resizeColumnsToContents();
}


void filterWindow::updTable()
{
    //iniCombo(departmentCombo,"department","name");
    int departmentIdretrieved;
    QString strDepart = departmentCombo->currentText();
    //QString strDepartmentQuery = QString("SELECT departmentId FROM department WHERE facultyId = %1").arg("'").arg(strDepart).arg("'");
    QString departmentIdQuery = QString("SELECT departmentId FROM department WHERE departmentname = %1%2%3").arg("'").
    arg(strDepart).arg("'");
    
    qDebug()<<departmentIdQuery;
    QSqlQueryModel *departModel = new QSqlQueryModel;
    departModel->setQuery(departmentIdQuery);
    
    departmentIdretrieved = departModel->record(0).value("departmentId").toInt();
    if(departmentIdretrieved==0)
    {
    departModel->setQuery(QString("SELECT name,postname FROM liststudent, studentreference WHERE "
    "liststudent.studentId = studentreference.studentId AND studentreference.departmentId = %1").arg(0));
    departModel->setHeaderData(student_Name, Qt::Horizontal, tr("Name"));
    departModel->setHeaderData(student_Post_Name, Qt::Horizontal, tr("Post Name"));
    tableView->setColumnHidden(0, false);
    tableView->setModel(departModel);
    }
    QString departmentIdQuery1 = QString("SELECT name,postname FROM liststudent, studentreference WHERE "
    "liststudent.studentId = studentreference.studentId AND studentreference.departmentId = %1").arg(departmentIdretrieved);
    qDebug()<<" hdhgdf fhfggf "<<departmentIdQuery1;
    departModel->setQuery(departmentIdQuery1);
    departModel->setHeaderData(student_Name, Qt::Horizontal, tr("Name"));
    departModel->setHeaderData(student_Post_Name, Qt::Horizontal, tr("Post Name"));
    //departModel->setHeaderData(className, Qt::Horizontal, tr("Class"));
    //departModel->setHeaderData(departmentName, Qt::Horizontal, tr("Department"));
    tableView->setColumnHidden(0, false);
    tableView->setModel(departModel);
    //tableView->setColumnHidden(0, true);
    //tableView->setColumnHidden(3, true);
    //tableView->setColumnHidden(5, true);
    tableView->resizeColumnsToContents();
    
    //radio1->setChecked(false);
}


void filterWindow::allStudentSlot()
{
int curIndex = facultyCombo->currentIndex();

if(curIndex==0)
{
QString strAllStudentQuery = QString("SELECT name, postname FROM liststudent");
QSqlQueryModel *allStudenyModel = new QSqlQueryModel;
allStudenyModel->setQuery(strAllStudentQuery);
//tableView->clear();
    allStudenyModel->setHeaderData(student_Name, Qt::Horizontal, tr("Name"));
    allStudenyModel->setHeaderData(student_Post_Name, Qt::Horizontal, tr("Post Name"));
    //allStudenyModel->setHeaderData(className, Qt::Horizontal, tr("Class"));
    //allStudenyModel->setHeaderData(departmentName, Qt::Horizontal, tr("Department"));
    tableView->setColumnHidden(0, false);
    tableView->setModel(allStudenyModel);
    //tableView->setColumnHidden(0, true);
    //tableView->setColumnHidden(3, true);
    //tableView->setColumnHidden(5, true);
    tableView->resizeColumnsToContents();
}


}


void filterWindow::locFacClassSlot()
{
QString fac = facultyCombo->currentText();
if(fac == "All")
{
radio1->setEnabled(true);
radio2->setEnabled(false);
radio3->setEnabled(false);
}
else
{
radio2->setEnabled(true);
radio3->setEnabled(true);
radio1->setEnabled(false);
}

}

