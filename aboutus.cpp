#include"aboutus.h"
#include<QPushButton>
#include<QDialogButtonBox>
#include<QVBoxLayout>
#include<QHBoxLayout>
#include<QTextBrowser>


aboutUs::aboutUs(QWidget *parent)
:QDialog(parent)
{
dialogInit();
connect(okBtn,SIGNAL(clicked()),this,SLOT(accept()));
}

void aboutUs::dialogInit()
{
bb = new QDialogButtonBox(QDialogButtonBox::Ok);
okBtn = new QPushButton;
okBtn = bb->button(QDialogButtonBox::Ok);
okBtn->setAutoDefault(true);
okBtn->setDefault(true);


//dlg = new QDialog;
setFixedSize(600,420);
setWindowTitle(tr("About us"));
dlgLayout = new QVBoxLayout;
okBtnHBoxLayout = new QHBoxLayout;
okBtnHBoxLayout->addStretch();
okBtnHBoxLayout->addWidget(okBtn);
textBrowser = new QTextBrowser;
dlgLayout->addWidget(textBrowser);
dlgLayout->addLayout(okBtnHBoxLayout);
setLayout(dlgLayout);
}

void aboutUs::helpAboutUs()
{
//textEdit->setReadOnly(true);
textBrowser->setEnabled(false);
//vBoxlayout->addWidget(textBrowser);
textBrowser->setOpenExternalLinks(true);
//textBrowser.setText("Link to <a >google.com</a> ... more text");
QString strAboutUs = QString("<h3 style=background-color:#FFFF00><font color = red>This program have been designed by Eugene NDENZAKO Msc in the framework of a big project on data mining.</font></h3>"
"<h3>It provides many functionalities related to data management. It makes use of relational data management system. It is released as a half time project about development of an application to manage marks and other type of data in academic instution</h3>"
"<h3>The main goal of this application is to manage library service and offer facilities for library. It tends to be scalable and manage data for various areas.</h3>"
"<h3 style=letter-spacing:5px>The next generation will cover economical and banking areas.</h3>" 
"<h3><font color = magenta>We will be gracefull to anybody who will support the project."
"<h3> Fill free to email us on <a href=eugene.ndenzako@ub.edu.bi>eugene.ndenzako@ub.edu.bi</a> for information. </font></h3>");
textBrowser->setText(strAboutUs);
}
