#include"maquette.h"
#include<QComboBox>
#include<QSpinBox>
#include<QHBoxLayout>
#include<QVBoxLayout>
#include<QPushButton>
#include<QLabel>
#include<QGroupBox>
#include<QSqlQueryModel>
#include<QStringList>
#include<QSqlRecord>
#include<QSqlQuery>
#include<QDebug>

maquetteDialog::maquetteDialog(QWidget *parent)
:QDialog(parent)
{
setWindowTitle(tr("Maquette editor"));
facultyMaquetteCombo = new QComboBox;
facultyMaquetteCombo->setFixedSize(300,30);
departmentMaquetteCombo = new QComboBox;
departmentMaquetteCombo->setFixedSize(300,30);
classMaquetteCombo = new QComboBox;
classMaquetteCombo->setFixedSize(300,30);
courseMaquetteCombo = new QComboBox;
courseMaquetteCombo->setFixedSize(300,30);

facultyMaquetteLabel = new QLabel(tr("Faculty"));
departmentMaquetteLabel = new QLabel(tr("Department"));
classMaquetteLabel = new QLabel(tr("Class"));
courseMaquetteLabel = new QLabel(tr("Course"));

cmSpinBox = new QSpinBox;
cmSpinBox->setFixedSize(100,30);
tdSpinBox = new QSpinBox;
tdSpinBox->setFixedSize(100,30);
tpSpinBox = new QSpinBox;
tpSpinBox->setFixedSize(100,30);
vhpSpinBox = new QSpinBox;
vhpSpinBox->setFixedSize(100,30);
tpeSpinBox = new QSpinBox;
tpeSpinBox->setFixedSize(100,30);

cmLabel = new QLabel(tr("CM"));
tdLabel = new QLabel(tr("TD"));
tpLabel = new QLabel(tr("TP"));
vhpLabel = new QLabel(tr("VHP"));
tpeLabel = new QLabel(tr("TPE"));

facHBoxLayout = new QHBoxLayout;
departmentHBoxLayout = new QHBoxLayout;
classHBoxLayout = new QHBoxLayout;
courseHBoxLayout = new QHBoxLayout;
moreButtonHBoxLayout = new QHBoxLayout;

cmHBoxLayout = new QHBoxLayout;
tdHBoxLayout = new QHBoxLayout;
tpHBoxLayout = new QHBoxLayout;
vhpHBoxLayout = new QHBoxLayout;
tpeHBoxLayout = new QHBoxLayout;

savePushButton = new QPushButton(tr("Save"));
okButtonHBoxLayout = new QHBoxLayout;

morePushButton = new QPushButton(tr("More>>"));
okPushButton = new QPushButton(tr("Ok"));

mainVBoxLayout = new QVBoxLayout(this);
vBoxLayout1 = new QVBoxLayout;
vBoxLayout2 =new QVBoxLayout;

groupBox1 = new QGroupBox;
groupBox1->setTitle(tr("Service"));
groupBox2 = new QGroupBox;
groupBox2->setTitle(tr("Grade repartition"));
this->setStyleSheet("QGroupBox"
    "{"
        "background-color:transparent;"
        "border-bottom-left-radius: 3px;"
        "border-bottom-right-radius: 3px;"
        "border: 3px solid #acacac;"
        "border-top: 3px solid #acacac none;"
        "margin-top: 5px;"
    "}"
    "QGroupBox::title"
    "{"
        "subcontrol-origin: margin;"
        "background:url(:/assets/subWindowBackground);"
        "border-top-left-radius: 3px;"
        "border-top-right-radius: 3px;"
        "border: 3px solid #0b477b;"
        "border-bottom: none;"
        "background-color: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,"
            "stop: 0 #005192, stop: 1 #002f60);"
        "padding: 2 2px;"
        "color: white;"
    "}");

facHBoxLayout->addWidget(facultyMaquetteLabel);
facHBoxLayout->addWidget(facultyMaquetteCombo);
departmentHBoxLayout->addWidget(departmentMaquetteLabel);
departmentHBoxLayout->addWidget(departmentMaquetteCombo);
classHBoxLayout->addWidget(classMaquetteLabel);
classHBoxLayout->addWidget(classMaquetteCombo);
courseHBoxLayout->addWidget(courseMaquetteLabel);
courseHBoxLayout->addWidget(courseMaquetteCombo);

cmHBoxLayout->addWidget(cmLabel);
cmHBoxLayout->addStretch();
cmHBoxLayout->addWidget(cmSpinBox);

tdHBoxLayout->addWidget(tdLabel);
tdHBoxLayout->addStretch();
tdHBoxLayout->addWidget(tdSpinBox);

tpHBoxLayout->addWidget(tpLabel);
tpHBoxLayout->addStretch();
tpHBoxLayout->addWidget(tpSpinBox);

vhpHBoxLayout->addWidget(vhpLabel);
vhpHBoxLayout->addStretch();
vhpHBoxLayout->addWidget(vhpSpinBox);

tpeHBoxLayout->addWidget(tpeLabel);
tpeHBoxLayout->addStretch();
tpeHBoxLayout->addWidget(tpeSpinBox);

moreButtonHBoxLayout->addStretch();
moreButtonHBoxLayout->addWidget(morePushButton);

okButtonHBoxLayout->addStretch();
okButtonHBoxLayout->addWidget(savePushButton);
okButtonHBoxLayout->addWidget(okPushButton);

vBoxLayout1->addLayout(facHBoxLayout);
vBoxLayout1->addLayout(departmentHBoxLayout);
vBoxLayout1->addLayout(classHBoxLayout);
vBoxLayout1->addLayout(courseHBoxLayout);

groupBox1->setLayout(vBoxLayout1);

//vBoxLayout1->addLayout(moreButtonHBoxLayout);

vBoxLayout2->addLayout(cmHBoxLayout);
vBoxLayout2->addLayout(tdHBoxLayout);
vBoxLayout2->addLayout(tpHBoxLayout);
vBoxLayout2->addLayout(vhpHBoxLayout);
vBoxLayout2->addLayout(tpeHBoxLayout);
vBoxLayout2->addStretch();

groupBox2->setLayout(vBoxLayout2);

mainVBoxLayout->addWidget(groupBox1);
mainVBoxLayout->addLayout(moreButtonHBoxLayout);
mainVBoxLayout->addWidget(groupBox2);
mainVBoxLayout->addLayout(okButtonHBoxLayout);

setLayout(mainVBoxLayout);

//facultyMaquetteCombo->addItems(strFacList);

morePushButton->setCheckable(true);

groupBox2->hide();
layout()->setSizeConstraint(QLayout::SetFixedSize);
initService();

connect(morePushButton,SIGNAL(toggled(bool)),groupBox2,SLOT(setVisible(bool)));
connect(okPushButton,SIGNAL(clicked()),this, SLOT(accept()));
connect(facultyMaquetteCombo,SIGNAL(currentTextChanged(QString)),this,SLOT(updateDepartmentCombo()));
}

void maquetteDialog::updCombo(QComboBox *widgetCombo, QString strQuery)
{
QSqlQuery query;
query.exec(strQuery);
//widgetCombo->addItems(strQuery);
}

//Gets current text form a combo and return it as a Qtring

QString maquetteDialog::getText(QComboBox *widgetCombo)
{
QString strCombo= widgetCombo->currentText();
return strCombo;
}

//Sets items to a xomboBox given a stringList

void maquetteDialog::setItems(QComboBox *widgetCombo, QStringList list)
{
widgetCombo->addItems(list);
}

void maquetteDialog::initService()
{
QSqlQueryModel tableModel;
QString strFacQuery = "SELECT facultyName FROM faculty";
tableModel.setQuery(strFacQuery);
QStringList strFacList;

QString fac;
for(int i = 0;i<tableModel.rowCount();i++)
{
fac = tableModel.record(i).value("facultyname").toString();
strFacList.append(fac);
}
setItems(facultyMaquetteCombo,strFacList);
QString facValue0 = strFacList.value(0);
//classMaquetteCombo->addItem(fac1);
QString strFacIdQuery = QString("SELECT facultyId FROM faculty WHERE facultyName = %1%2%3").arg("'").arg(facValue0).arg("'");
tableModel.setQuery(strFacIdQuery);
//departmentMaquetteCombo->addItem(strFacIdQuery);
int facultyId = tableModel.record(0).value("facultyId").toInt();
//classMaquetteCombo->addItem(QString::number(facultyId));

QString strDepartmentQuery = QString("SELECT departmentname FROM department WHERE facultyId = %1").arg(facultyId); 
//locationID to be chnaged into facultyId
tableModel.setQuery(strDepartmentQuery);
QStringList departmentList;
QString department;
for(int i = 0; i < tableModel.rowCount(); i++)
{
department  = tableModel.record(i).value("departmentname").toString();
departmentList.append(department);
}
departmentMaquetteCombo->addItems(departmentList);

//Initialisation of class comboBox

department = departmentList.value(0);

qDebug()<<"Department 0"<<department;

//QString strclassNaneQuery = QString("SELECT className FROM classtable WHERE departmentId = %1").arg("'").arg(department).arg("'");

QString strclassNaneQuery = QString("SELECT className FROM classtable");
QSqlQueryModel classQuery;
classQuery.setQuery(strclassNaneQuery );
QString classname;
QStringList classList;
for(int i = 0;i<classQuery.rowCount();i++)
{
classname = classQuery.record(i).value("className").toString();
classList.append(classname);
}
//Initialisation of Course combo Box
classMaquetteCombo->addItems(classList);

QString strDepartmentIdQuery = QString("SELECT departmentId FROM department WHERE name = %1%2%3").arg("'").arg(department).arg("'");
tableModel.setQuery(strDepartmentIdQuery);

int departmentId;

for(int i = 0;i<tableModel.rowCount();i++)
{
departmentId = tableModel.record(i).value("departmentId").toInt();
}

qDebug()<<departmentId;

QString strCourseNameQuery = QString("SELECT courseName FROM coursetable WHERE departmentId = %1").arg(departmentId);
tableModel.setQuery(strCourseNameQuery);
QStringList courseList;
QString strCourse;
for(int i = 0; i < tableModel.rowCount(); i++)
{
strCourse = tableModel.record(i).value("courseName").toString();
courseList.append(strCourse);
}

courseMaquetteCombo->addItems(courseList);

}

void maquetteDialog::updateDepartmentCombo()
{
QString currentFac = facultyMaquetteCombo->currentText();
QString strCurrentFac = QString("SELECT facultyId FROM faculty WHERE facultyName = %1%2%3").arg("'").arg(currentFac).arg("'");
QSqlQueryModel queryModel;
queryModel.setQuery(strCurrentFac);

int currentFacId;
for(int i = 0;i<queryModel.rowCount();i++)
{
currentFacId = queryModel.record(i).value("facultyId").toInt();
}

qDebug()<<currentFacId<<"  "<<currentFac;
QString strDepartmentQuery = QString("SELECT departmentname FROM department WHERE facultyId = %1").arg(currentFacId);
QStringList departmentList;
QString strDepartment;
queryModel.setQuery(strDepartmentQuery);
for(int i = 0; i < queryModel.rowCount(); i++)
{
strDepartment = queryModel.record(i).value("departmentname").toString();
departmentList.append(strDepartment);
}
departmentMaquetteCombo->clear();
departmentMaquetteCombo->addItems(departmentList);
}




















