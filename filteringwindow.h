#ifndef FILTERWINDOW_H
#define FILTERWINDOW_H
#include<QWidget>
class QGroupBox;
class QLabel;
class QHBoxLayout;
class QVBoxLayout;
class QPushButton;
class QComboBox;
class QGridLayout;
class QRadioButton;
class QTableView;
class QSqlQueryModel;
class QStringList;
class QSqlRecord;
class QSqlQuery;
class QDebug;
class QMessageBox;
class QSqlTableModel;
class QSqlError;


enum selectionCase{allstudent,facstudent,classstudent};

class filterWindow : public QWidget
{
    Q_OBJECT

public:
    filterWindow(QWidget *parent = 0);
    void connectionsInit();
public slots:
//void initGroupBox1();
void selectionCaseSlot();
void updFacultyCombo();
void updTable();
void allStudentSlot();
void locFacClassSlot();

private:
    QGroupBox *createFirstExclusiveGroup();
    QGroupBox *createSecondExclusiveGroup();
    int selectionFunction();
    //QGroupBox *createNonExclusiveGroup();
    //QGroupBox *createPushButtonGroup();
    //QVBoxLayout *createLayout();
   //; void initFacultyCombo();
   // void initDepartmentCombo();
   // void initClassCombo();
    void initWidgets();
    void positionWidgets();
    QGroupBox *groupBoxFac;
    QGroupBox *buttonGroupBox;
    QGroupBox *buttonGroupBox1;
    QComboBox *facultyCombo;
    QComboBox *departmentCombo;
    QComboBox *classCombo;
    QComboBox *statusStudentCombo;
    QLabel *facultyLabel;
    QLabel *departmentLabel;
    QLabel *classLabel;
    QLabel *statusStudentLabel;
    QHBoxLayout *facultyHBox;
    QHBoxLayout *departmentHBox;
    QHBoxLayout *classHBox;
    QVBoxLayout *mainVBoxLayout;
    QRadioButton *radio1;
    QRadioButton *radio2;
    QRadioButton *radio3;
    QRadioButton *radio4;
    QRadioButton *radio5;
    QGridLayout *mainGrid;
    QTableView *tableView;
    QHBoxLayout *statusStudentLayout;
    QVBoxLayout *vBoxTest;
    bool buttonGroupBoxChecker;
    void iniCombo(QComboBox *combo,const QString tablename,const QString colname);
    enum {
//studentID= 0,
student_Name = 0,
student_Post_Name = 1,
classId = 3,
className = 4,
departmentID = 5,
departmentName = 6
};
};
#endif //FILTERWINDOW_H
