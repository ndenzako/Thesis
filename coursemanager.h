#ifndef COURSEMANAGER_H
#define COURSEMANAGER_H
//#include"ui_courseManager.h"
#include<QDialog>
class QWidget;
class QVBoxLayout;
class QStringList;
class QSqlQuery;
class QSqlError;
class QSqlRecord;
class QDebug;
class QComboBox;
class QLineEdit;
class QLabel;
class QPushButton;
class QSpinBox;
class QGridLayout;
class QGroupBox;
class QVBoxLayout;
class QHBoxLayout;
class QSqlQueryModel;
class QMessageBox;
class courseManager:public QDialog//, public Ui::courseManager
{
Q_OBJECT
public:
courseManager(QWidget *parent = 0);
QWidget *widget;
QVBoxLayout *vBoxLayout;
void init();
QSqlQuery runQuery(QString);
public slots:
//void saveCourse();
void facultyUpdate();
void courseFilter();
void saveSummary();
private:
QComboBox *departmentComboBox1;
QComboBox *semesterComboBox1;
QComboBox *departmentComboBox2;
QComboBox *modifyClassCombBox;
QComboBox *courseCombo;
QComboBox *facultyComboBox;
QComboBox *classComboBox;


QSpinBox *courseSpinBox;
QSpinBox *ueSpinBox;

//QLineEdit *courseNameLineEdit1;
//QLineEdit *courseIdLineEdit1;

QLabel *departmentLabel1;
QLabel *departmentLabel2;
QLabel *modifyClassLabel;
//QLabel *modifyCourseNameLabel;
//QLabel *courseNameLabel;
//QLabel *courseIdLabel;
QLabel *courseLabel;
QLabel *courseNumberLabel;
QLabel *facultyLabel;
QLabel *classLabel;
QLabel *ueLabel;

QPushButton *courseCancelPushButton1;
QPushButton *courseCancelPushButton2;
QPushButton *saveCoursePushButton1;
QPushButton *saveCoursePushButton2;
QPushButton *morePushButton;
QGridLayout *gridLayout1;
QGridLayout *gridLayout2;
QGroupBox *groupBox1;
QGroupBox *groupBox2;
QPushButton *okPushButton;

QHBoxLayout *saveHBoxLayout;
QHBoxLayout *okHBoxLayout;



};
#endif //COURSEMANAGER_H

