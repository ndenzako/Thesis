#ifndef ABOUTUS_H
#define ABOUTUS_H
#include<QDialog>
QT_BEGIN_NAMESPACE
class QPushButton;
class QDialogButtonBox;
class QVBoxLayout;
class QHBoxLayout;
class QTextBrowser;
QT_END_NAMESPACE
class aboutUs : public QDialog
{
Q_OBJECT
public:
aboutUs(QWidget *parent = 0);
void helpAboutUs();
void dialogInit();
private:
 QDialogButtonBox* bb;

  QPushButton* okBtn; 

  QPushButton* caBtn; 

  QVBoxLayout* dlgLayout ;
  QHBoxLayout *okBtnHBoxLayout;
  QTextBrowser *textBrowser;
};
#endif //ABOUTUS_H
