#include<QLabel>
#include<QComboBox>
#include<QDateEdit>
#include<QPushButton>
#include<QRadioButton>
#include<QGroupBox>
#include<QHBoxLayout>
#include<QVBoxLayout>
#include<QGridLayout>
#include<QTableView>
#include<QSqlQueryModel>
#include<QSqlError>
#include<QStringList>
#include<QSqlRecord>
#include"deliberation.h"

delibeWidget::delibeWidget(QWidget *parent)
:QDialog(parent)
{
initWidget();
QObject::connect(okPushButtion,SIGNAL(clicked()),this,SLOT(accept()));
}

void delibeWidget::initWidget()
{
departLabel = new QLabel(tr("Department"));
classLabel = new QLabel(tr("Class"));
dateLabel = new QLabel(tr("Deliberation date"));
departCombo = new QComboBox;
departCombo->setFixedSize(300,30);
classCombo = new QComboBox;
classCombo->setFixedSize(300,30);
delibeDate = new QDateEdit(QDate::currentDate());
delibeDate->setFixedSize(120,30);

delibeRadioButton = new QRadioButton(tr("Deliberation"));
grilleRadioButton = new QRadioButton(tr("View Grille"));
afficheRadioButton = new QRadioButton(tr("Print"));
runPushButton = new QPushButton(tr("Run"));
runPushButton->setToolTip(tr("Run deliberation for selected class"));
okPushButtion = new QPushButton(tr("Ok"));

departGroupBox = new QGroupBox(tr("Department"));
actionGroupBox = new QGroupBox(tr("Actions"));

departmentHBoxLayout = new QHBoxLayout;
classHBoxLayout = new QHBoxLayout;
dateHBoxLayout = new QHBoxLayout;
okHBoxLayout = new QHBoxLayout;
runDelibeHboxLayout = new QHBoxLayout;
delibeVBoxLayout = new QVBoxLayout;
actionVBoxLayout = new QVBoxLayout;
mainVBoxLayout = new QVBoxLayout;
mainGrid = new QGridLayout;
delibeTableView = new QTableView;

departmentHBoxLayout->addWidget(departLabel);
departmentHBoxLayout->addWidget(departCombo);

classHBoxLayout->addWidget(classLabel);
classHBoxLayout->addWidget(classCombo);

dateHBoxLayout->addWidget(dateLabel);
dateHBoxLayout->addWidget(delibeDate);

runDelibeHboxLayout->addStretch(5);
runDelibeHboxLayout->addWidget(runPushButton);

okHBoxLayout->addStretch(5);
okHBoxLayout->addWidget(okPushButtion);

actionVBoxLayout->addWidget(delibeRadioButton);
actionVBoxLayout->addWidget(grilleRadioButton);
actionVBoxLayout->addWidget(afficheRadioButton);
actionVBoxLayout->addLayout(runDelibeHboxLayout);
//actionVBoxLayout->addLayout(okHBoxLayout);

delibeVBoxLayout->addLayout(departmentHBoxLayout);
delibeVBoxLayout->addLayout(classHBoxLayout);
delibeVBoxLayout->addLayout(dateHBoxLayout);
departGroupBox->setLayout(delibeVBoxLayout);

//actionVBoxLayout->addLayout


actionGroupBox->setLayout(actionVBoxLayout);

//============================================
//actionGroupBox->setLayout();
//actionGroupBox->setLayout(okHBoxLayout);



mainVBoxLayout->addWidget(departGroupBox);
mainVBoxLayout->addWidget(actionGroupBox);
//mainVBoxLayout->addLayout(runDelibeHboxLayout);
mainVBoxLayout->addStretch();
mainVBoxLayout->addLayout(okHBoxLayout);


mainGrid->addLayout(mainVBoxLayout,0,0);
mainGrid->addWidget(delibeTableView,0,1,3,1);


setLayout(mainGrid);



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
     QString strDepartQuery = "SELECT departmentname FROM department";
     QSqlQueryModel query;
     query.setQuery(strDepartQuery);
     QStringList departList;
     QString depart;
     for(int i=0;i<query.rowCount();i++)
     {
     depart = query.record(i).value("departmentname").toString();
     departList.append(depart);
     }
     departCombo->addItems(departList);
     
     QString strClassQuery = "SELECT className FROM classtable";
     
     query.setQuery(strClassQuery);
     QStringList classList;
     QString strClass;
     for(int i=0;i<query.rowCount();i++)
     {
     strClass = query.record(i).value("className").toString();
     classList.append(strClass);
     }
     classCombo->addItems(classList);
}














