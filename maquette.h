#ifndef MAQUETTE_H
#define MAQUETTE_H
#include<QWidget>
#include<QDialog>
class QComboBox;
class QLabel;
class QVBoxLayout;
class QPushButton;
class QSpinBox;
class QHBoxLayout;
class QGroupBox;
class QSqlQueryModel;
class QStringList;
class QSqlRecord;
class QSqlQuery;
class QDebug;

class maquetteDialog : public QDialog
{
Q_OBJECT
public:
maquetteDialog(QWidget *parent=0);

public slots:
void updateDepartmentCombo();

private:

void updCombo(QComboBox *comboBox, QString strQuery);
QString getText(QComboBox *widgetCombo);
void setItems(QComboBox *widgetCombo, QStringList list);
void initService();


QComboBox *facultyMaquetteCombo;
QComboBox *departmentMaquetteCombo;
QComboBox *classMaquetteCombo;
QComboBox *courseMaquetteCombo;

QLabel *facultyMaquetteLabel;
QLabel *departmentMaquetteLabel;
QLabel *classMaquetteLabel;
QLabel *courseMaquetteLabel;

QSpinBox *cmSpinBox;
QSpinBox *tdSpinBox;
QSpinBox *tpSpinBox;
QSpinBox *vhpSpinBox;
QSpinBox *tpeSpinBox;

QLabel *cmLabel;
QLabel *tdLabel;
QLabel *tpLabel;
QLabel *vhpLabel;
QLabel *tpeLabel;


QHBoxLayout *facHBoxLayout;
QHBoxLayout *departmentHBoxLayout;
QHBoxLayout *classHBoxLayout;
QHBoxLayout *courseHBoxLayout;
QHBoxLayout *moreButtonHBoxLayout;


QHBoxLayout *cmHBoxLayout;
QHBoxLayout *tdHBoxLayout;
QHBoxLayout *tpHBoxLayout;
QHBoxLayout *vhpHBoxLayout;
QHBoxLayout *tpeHBoxLayout;




QHBoxLayout *okButtonHBoxLayout;
QPushButton *morePushButton;
QPushButton *savePushButton;
QPushButton *okPushButton;

QVBoxLayout *mainVBoxLayout;
QVBoxLayout *vBoxLayout1;
QVBoxLayout *vBoxLayout2;
QGroupBox *groupBox1;
QGroupBox *groupBox2;
};
#endif
