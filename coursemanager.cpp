#include"coursemanager.h"
#include<QWidget>
#include<QStringList>
#include<QSqlQuery>
#include<QSqlError>
#include<QDebug>
#include<QComboBox>
#include<QLineEdit>
#include<QLabel>
#include<QPushButton>
#include<QSpinBox>
#include<QGroupBox>
#include<QGridLayout>
#include<QSqlQueryModel>
#include<QSqlRecord>
#include<QMessageBox>
courseManager::courseManager(QWidget *parent)
:QDialog(parent)
{
//setupUi(this);
init();
groupBox2->hide();
layout()->setSizeConstraint(QLayout::SetFixedSize);
morePushButton->setCheckable(true);
connect(morePushButton, SIGNAL(toggled(bool)), groupBox2, SLOT(setVisible(bool)));
//connect(saveCoursePushButton1,SIGNAL(clicked()),this, SLOT(saveCourse()));
connect(okPushButton,SIGNAL(clicked()),this,SLOT(accept()));
connect(facultyComboBox,SIGNAL(currentIndexChanged(int)),this,SLOT(facultyUpdate()));
connect(departmentComboBox1,SIGNAL(currentIndexChanged(int)),this,SLOT(courseFilter()));
connect(classComboBox,SIGNAL(currentIndexChanged(int)),this,SLOT(courseFilter()));
connect(saveCoursePushButton1,SIGNAL(clicked()),this, SLOT(saveSummary()));


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
}

void courseManager::init()
{
setWindowTitle(tr("Marks summary settings"));
departmentComboBox1 = new QComboBox;
departmentComboBox1->setMinimumSize(300,30);
semesterComboBox1 = new QComboBox;
departmentComboBox2 = new QComboBox;
courseCombo = new QComboBox;
courseCombo->setMinimumSize(300,30);
modifyClassCombBox =  new QComboBox;
facultyComboBox = new QComboBox;
classComboBox = new QComboBox;


courseSpinBox = new QSpinBox;
courseSpinBox->setMinimum(1);
courseSpinBox->setMinimumSize(100,30);

ueSpinBox = new QSpinBox;
ueSpinBox->setMinimumSize(100,30);
ueSpinBox->setMinimum(1);
//courseNameLineEdit1 = new QLineEdit;
//courseIdLineEdit1 = new QLineEdit;

departmentLabel1 = new QLabel(tr("Department"));
departmentLabel2 = new QLabel(tr("Department"));
modifyClassLabel = new QLabel(tr("Class"));
//modifyCourseNameLabel = new QLabel(tr("Course name"));
//courseNameLabel =  new QLabel(tr("Course name"));
//courseIdLabel = new QLabel(tr("Course ID"));
courseLabel = new QLabel(tr("Course name"));
courseNumberLabel = new QLabel(tr("Course number"));
departmentLabel2 = new QLabel(tr("Department"));
facultyLabel = new QLabel(tr("Faculty"));
classLabel = new QLabel(tr("Class"));
ueLabel = new QLabel(tr("Ue number"));

courseCancelPushButton1 = new QPushButton(tr("Cancel"));
courseCancelPushButton1->setEnabled(false);
//courseCancelPushButton2 = new QPushButton(tr("Cancel"));
saveCoursePushButton1 = new QPushButton(tr("Save"));
//saveCoursePushButton2 = new QPushButton(tr("Save"));
morePushButton = new QPushButton(tr("More>>"));
okPushButton =  new QPushButton(tr("Ok"));
gridLayout1 = new QGridLayout;
gridLayout2 = new QGridLayout;
groupBox1 = new QGroupBox;
groupBox1->setTitle(tr("Course settings"));
groupBox2 = new QGroupBox;

saveHBoxLayout = new QHBoxLayout;
okHBoxLayout = new QHBoxLayout;



groupBox2->setTitle(tr("Set numbers"));
gridLayout1->addWidget(facultyLabel,0,0);
gridLayout1->addWidget(facultyComboBox,0,1);
gridLayout1->addWidget(departmentLabel1,2,0);
gridLayout1->addWidget(departmentComboBox1,2,1);
gridLayout1->addWidget(classLabel,3,0);
gridLayout1->addWidget(classComboBox,3,1);

//gridLayout1->addWidget(courseNameLabel,1,0);
//gridLayout1->addWidget(courseNameLineEdit1,1,1);
//gridLayout1->addWidget(courseIdLabel,2,0);
//gridLayout1->addWidget(courseIdLineEdit1,2,1);



//gridLayout2->addWidget(creditSpinBox1,0,1);


groupBox1->setLayout(gridLayout1);


gridLayout2->addWidget(courseLabel ,0,0);
gridLayout2->addWidget(courseCombo,0,1);

gridLayout2->addWidget(ueLabel,1,0);
gridLayout2->addWidget(ueSpinBox,1,1);

gridLayout2->addWidget(courseNumberLabel,2,0);
gridLayout2->addWidget(courseSpinBox,2,1);
gridLayout2->addWidget(saveCoursePushButton1,3,2);

gridLayout2->addWidget(courseCancelPushButton1,4,2);

//gridLayout2->addWidget(modifyClassLabel,1,0);
//gridLayout2->addWidget(modifyClassCombBox,1,1);
//->addWidget(,2,0);
//gridLayout2->addWidget(creditSpinBox1,2,1);


saveHBoxLayout->addStretch();
saveHBoxLayout->addWidget(morePushButton);
saveHBoxLayout->addStretch();

groupBox2->setLayout(gridLayout2);

vBoxLayout = new QVBoxLayout;
vBoxLayout->addWidget(groupBox1);
vBoxLayout->addLayout(saveHBoxLayout);
okHBoxLayout->addStretch();
okHBoxLayout->addWidget(okPushButton);
vBoxLayout->addWidget(groupBox2);
vBoxLayout->addLayout(okHBoxLayout);

QString strClassInit = "SELECT className FROM classtable";
QStringList classList;
QString classStr;
QSqlQueryModel classQueryModel;
classQueryModel.setQuery(strClassInit);
for(int i=0;i<classQueryModel.rowCount();i++)
{
classStr = classQueryModel.record(i).value("className").toString();
classList.append(classStr);
}

if(!classList.isEmpty())
{
modifyClassCombBox->addItems(classList);
classComboBox->addItems(classList);
}


setLayout(vBoxLayout);
//gridLayout2->addWidget(departmentLabe2,0,0);
//gridLayout2->addWidget(departmentLabe2,0,0);

//courseCancelPushButton1->setEnabled(false);
//morePushpushButton->setEnabled(false);
QString strQuerySemester = "SELECT semesterName FROM semester";

QString strQueryFaculty = QString("SELECT DISTINCT departmentname FROM department");// WHERE facultyId =%1").arg(facCurrentIndex+1);



QSqlQuery semesterQuery;
QSqlQuery departmentQuery;
QStringList semesterList;
QStringList facultyList;
semesterQuery.exec(strQuerySemester);
departmentQuery.exec(strQueryFaculty);
/*while(semesterQuery.next())
{
semesterList.append(semesterQuery.value(0).toString());
}
semesterComboBox1->addItems(semesterList);
//semesterComboBox2->addItems(semesterList);*/
while(departmentQuery.next())
{
facultyList.append(departmentQuery.value(0).toString());
}
departmentComboBox1->addItems(facultyList);
departmentComboBox2->addItems(facultyList);
QString strFaculytyQuery = "SELECT facultyName FROM faculty";
QSqlQuery facultyQuery;
facultyQuery.exec(strFaculytyQuery);
QString strFac;
QStringList facList;
while(facultyQuery.next())
{
strFac = facultyQuery.value(0).toString();
facList.append(strFac);
}
facultyComboBox->addItems(facList);

int facCurrentIndex = facultyComboBox->currentIndex()+1;
QString strQueryFacultyupd = QString("SELECT DISTINCT departmentname FROM department WHERE facultyId =%1").arg(facCurrentIndex);
qDebug()<<facCurrentIndex<<strQueryFacultyupd;
}


QSqlQuery courseManager::runQuery(QString queryString)
{
QSqlQuery tempQSqlQuery;
tempQSqlQuery.exec(queryString);
return tempQSqlQuery;
}

void courseManager::facultyUpdate()
{
int facCurrentIndex = facultyComboBox->currentIndex()+1;
QString strQueryFacultyupd = QString("SELECT DISTINCT departmentname FROM department WHERE facultyId =%1").arg(facCurrentIndex);
QSqlQuery slotQuery = runQuery(strQueryFacultyupd);
QString strDepart;
QStringList departList;
while(slotQuery.next())
{
strDepart = slotQuery.value(0).toString();
departList.append(strDepart);
}
departmentComboBox1->clear();
departmentComboBox1->addItems(departList);

}






void courseManager::courseFilter()
{
int departIndex = departmentComboBox1->currentIndex();
int classIndex = classComboBox->currentIndex();
//QString strQuery = QString("SELECT ueId FROM classue WHERE departmentId = %1 AND classId = %2").arg(departIndex).arg(classIndex);
QStringList courseList;
QSqlQueryModel model2;
QString course;
QString strueId;
QSqlQueryModel model1;


QString strTempQuery;
QString strQuery = QString("SELECT courseName FROM coursetable WHERE courseId IN (SELECT ueId FROM classue WHERE"
" departmentId = %1 AND classId = %2)").arg(departIndex).arg(classIndex+1);
//qDebug()<<strQuery;
model2.setQuery(strQuery);

strueId = model2.record(1).value("ueId").toString();
//qDebug() << "Fail to insert data: "<<model2.lastError()<<"\n";
//()<<strueId;


for(int i = 0; i< model2.rowCount();i++)
{
//strueId = model2.record(i).value("ueId").toString();

//qDebug()<<strueId;
//strTempQuery = QString("SELECT courseName FROM coursetable WHERE courseId = %1%2%3").arg("'").arg(strueId).arg("'");
//qDebug()<<strTempQuery;
//model1.setQuery(strTempQuery);
course = model2.record(i).value("courseName").toString();

courseList.append(course);
//qDebug()<<course;
//}
}

if(!courseList.isEmpty())
{
courseCombo->clear();
courseCombo->addItems(courseList);
}
else
{
courseCombo->clear();
}
}

void courseManager::saveSummary()
{
int departIndex = departmentComboBox1->currentIndex();
int classIndex = classComboBox->currentIndex()+1;
QString strCurrentCourse = courseCombo->currentText();
QString currentCourse;
QString strCourseQuery = QString("SELECT courseId FROM coursetable WHERE courseName = %1%2%3").arg("'").
arg(strCurrentCourse).arg("'");
QSqlQuery courseQuery;
courseQuery.exec(strCourseQuery);
while(courseQuery.next())
{
currentCourse = courseQuery.value(0).toString();
}

int ueNumber = ueSpinBox->value();
int coureNumber = courseSpinBox->value();
QString strSaveQuery = QString("INSERT INTO marksummarysettings VALUES(%1,%2,%3%4%5,%6,%7)").arg(departIndex).arg(classIndex).
arg("'").arg(currentCourse).arg("'").arg(ueNumber).arg(coureNumber);

if(!strCurrentCourse.isEmpty())
{

bool ok = courseQuery.exec(strSaveQuery);
if(!ok)
{
QMessageBox::critical(0,QObject::tr("Insertion Error"),QObject::tr("The systen fails to insert data in database!..."));
}
}
else
{
QMessageBox::warning(0,QObject::tr("Insertion Error"),QObject::tr("Warning: Course me can not be empty string!..."));
}
}

