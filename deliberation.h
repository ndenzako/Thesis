#ifndef DELIBERATION_H
#define DELIBERATION_H
#include<QWidget>
#include<QDialog>
class QLabel;
class QComboBox;
class QDateEdit;
class QPushButton;
class QRadioButton;
class QGroupBox;
class QGridLayout;
class QTableView;
class QHBoxLayout;
class QVBoxLayout;
class QSqlQueryModel;
class QSqlError;
class QStringList;
class QSqlRecord;

class delibeWidget:public QDialog
{
Q_OBJECT
public:
delibeWidget(QWidget *parent = 0);
void initWidget();



private:
QLabel *departLabel;
QLabel *classLabel;
QLabel *dateLabel;
QComboBox *departCombo;
QComboBox *classCombo;
QDateEdit *delibeDate;

QRadioButton *delibeRadioButton;
QRadioButton *grilleRadioButton;
QRadioButton *afficheRadioButton;
QPushButton *runPushButton;
QPushButton *okPushButtion;

QGroupBox *departGroupBox;
QGroupBox *actionGroupBox;

QHBoxLayout *departmentHBoxLayout;
QHBoxLayout *classHBoxLayout;
QHBoxLayout *dateHBoxLayout;
QHBoxLayout *okHBoxLayout;
QHBoxLayout *runDelibeHboxLayout;
QVBoxLayout *delibeVBoxLayout;
QVBoxLayout *actionVBoxLayout;
QVBoxLayout *mainVBoxLayout;
QTableView *delibeTableView;
//QVBoxLayout *mainHBoxLayout;

QGridLayout *mainGrid;


};

#endif //DELIBERATION_H
