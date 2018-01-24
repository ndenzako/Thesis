#include<QtDebug>
#include<QMenu>
#include<QMenuBar>
#include<QAction>
#include<QSqlDatabase>
#include<QMessageBox>
#include<QFileDialog>
#include<QStatusBar>
#include<QFileInfo>
#include<QLabel>
#include<QToolBar>
#include"mainwindow.h"
#include"spreadsheet.h"
#include"coursemanager.h"
#include"recordcourse.h"
#include"ui_mainwindow.h"
#include"welcomenote.h"
#include"maquette.h"
#include"finddialog.h"
#include"gotocelldialog.h"
#include"sortdialog.h"
#include"filteringwindow.h"
#include"deliberation.h"

#include"recordmarks.h"

#include"modelview.h"

//#include<QMutableStringListIterator>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
setAttribute(Qt::WA_DeleteOnClose);
initActions();



    //this->setStyleSheet("background-color:  #aed;");
    setCentralWidget(ui->centralWidget_2);
ui->label->setPixmap(QPixmap(":/images/icon.png"));
setWindowIcon(QPixmap(":/images/icon.png"));
menuSwitcher = false;

createMenu();

    showMaximized();
QStringList list;
list<<"Admin"<<"User";
ui->acoubtComboBox->addItems(list);
connect(ui->loginButton,SIGNAL(clicked()),this,SLOT(establishConnection()));
connect(ui->pwdLineEdit,SIGNAL(returnPressed()),this,SLOT(establishConnection()));
connect(ui->usrLineEdit,SIGNAL(returnPressed()),this,SLOT(establishConnection()));
connect(newRecordAction,SIGNAL(triggered()),this, SLOT(newEntryData()));
connect(recordAction,SIGNAL(triggered()),this, SLOT(spreadsheetViewer()));
connect(closeSessionAction,SIGNAL(triggered()),this, SLOT(closeSession()));
connect(openSessionAction,SIGNAL(triggered()),this, SLOT(openSession()));
connect(aboutUsAction,SIGNAL(triggered()),this, SLOT(helpAboutUs()));
connect(aboutQtAction,SIGNAL(triggered()),this, SLOT(helpAboutQt()));
connect(newInpuAction,SIGNAL(triggered()),this, SLOT(recordNameSlot()));
connect(recordCourseAction,SIGNAL(triggered()),this, SLOT(courseRecord()));///===============
connect(processingAction,SIGNAL(triggered()),this,SLOT(maquetteCreator()));
connect(findAction, SIGNAL(triggered()), this, SLOT(find()));
connect(filterAction,SIGNAL(triggered()),this,SLOT(filterSlot()));
connect(deliberationAction,SIGNAL(triggered()),this,SLOT(deliberationSlot()));
connect(courseUeOrderAction,SIGNAL(triggered()),this,SLOT(courseFunction()));




//connect(recordName->okPushButton, SIGNAL(clicked()),recordName, SLOT(accept()));

connect(exitAction,SIGNAL(triggered()),qApp, SLOT(quit()));

setCurrentFile("");
createContextMenu();
createToolBars();
connectLots();
readSettings();

createStatusBar();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::initActions()
{
findDialog = new FindDialog(this);
findDialog = 0;
fileToolBar = new QToolBar;
editToolBar = new QToolBar;
newAction = new QAction(tr("&New"), this);
openAction = new QAction(tr("&Open..."), this);
openAction->setIcon(QIcon(":/images/open.png"));
saveAction = new QAction(tr("&Save"), this);
saveAction->setIcon(QIcon(":/images/save.png"));

cutAction = new QAction(tr("&Cut"), this);
cutAction->setIcon(QIcon(":/images/cut.png"));
copyAction = new QAction(tr("Copy"), this);
copyAction->setIcon(QIcon(":/images/copy.png"));
pasteAction = new QAction(tr("&Paste"), this);
pasteAction->setIcon(QIcon(":/images/paste.png"));

findAction = new QAction(tr("&Find"), this);
findAction->setIcon(QIcon(":/images/find.png"));
goToCellAction = new QAction(tr("&Go to cell"), this);
goToCellAction->setIcon(QIcon(":/images/gotocell.png"));

for (int i = 0; i < MaxRecentFiles; ++i) {
recentFileActions[i] = new QAction(tr(""),this);
recentFileActions[i]->setVisible(false);
connect(recentFileActions[i], SIGNAL(triggered()),
this, SLOT(openRecentFile()));
}


deliberationAction = new QAction(tr("Deliberation..."),this);
}


void MainWindow::createMenu()
{

    spreadsheet = new Spreadsheet;
    spreadsheet->setStyleSheet("Spreadsheet { border: 10px solid magenta;"
                                      "background-color: #8EDE21;"
                                      "selection-background-color: #999}");
    activateSpreadSheet = false;
    menuBar = new QMenuBar;
    menuFile = menuBar->addMenu(tr("&File"));
    editMenu = menuBar->addMenu(tr("&Edit"));
    //cutAction = new QAction(editMenu);
    cutAction->setText(tr("Cu&t"));
    cutAction->setShortcut(tr("Ctrl+X"));
    editMenu->addAction(cutAction);
    //copyAction = new QAction(editMenu);
    copyAction->setText(tr("&Copy"));
    copyAction->setShortcut(tr("Ctrl+C"));
    editMenu->addAction(copyAction);
    //pasteAction = new QAction(editMenu);
    pasteAction->setText(tr("Paste"));
    pasteAction->setShortcut(tr("Ctrl+V"));
    editMenu->addAction(pasteAction);
    deleteAction = new QAction(editMenu);
    deleteAction->setText(tr("&Delete"));
    deleteAction->setShortcut(tr("Del"));
    editMenu->addAction(deleteAction);
    selectSubMenu=editMenu->addMenu(tr("Select"));
    selectRowAction = new QAction(selectSubMenu);
    selectRowAction ->setText(tr("Select Row"));
    selectSubMenu->addAction(selectRowAction);
    selectColumnAction = new QAction(selectSubMenu);
    selectColumnAction->setText(tr("Select Column"));
    selectSubMenu->addAction(selectColumnAction);
    selectAllAction = new QAction(selectSubMenu);
    selectAllAction->setText(tr("Select All"));
    selectSubMenu->addAction(selectAllAction);
    /*selectAction = new QAction(editMenu);
    selectAction->setText(tr("&Select"));
    editMenu->addAction(selectAction);*/
    //findAction = new QAction(editMenu);
    findAction->setText(tr("&Find..."));
    findAction->setShortcut(tr("Ctrl+F"));
    editMenu->addAction(findAction);
    //goToCellAction = new QAction(editMenu);
    goToCellAction->setText(tr("&Go To Cell"));
    goToCellAction->setShortcut(tr("Ctrl+G"));
    editMenu->addAction(goToCellAction);
    
    menuSession = menuBar->addMenu(tr("&Session"));
    menuRecord = menuBar->addMenu(tr("&Record"));
    recordSubMenu = menuRecord->addMenu(tr("Administration"));
    courseUeOrderAction = new QAction(tr("Course order"),this);
    filterAction =new QAction(tr("Filter"),this);
    recordSubMenu->addAction(courseUeOrderAction);
    processingAction  = new QAction(menuRecord);
    processingAction->setText(tr("Maquette..."));
    recordSubMenu->addAction(processingAction);

    recordSubMenu->addAction(filterAction);
    menuProcessing = menuBar->addMenu("Processing");
    toolsMenu = menuBar->addMenu(tr("&Tools"));
    optionsMenu = menuBar->addMenu(tr("&Options"));
    separatorAction =new QAction(menuFile);
    separatorAction = menuFile->addSeparator();
    menuBar->addSeparator();
    menuHelp=menuBar->addMenu(tr("&Help"));
    aboutUsAction = new QAction(menuHelp);
    //aboutUsAction->setEnabled(false);
    aboutUsAction->setText(tr("About us"));
    menuHelp->addAction(aboutUsAction);
    aboutQtAction =new QAction(menuHelp);
    aboutQtAction->setText(tr("About Qt"));
    menuHelp->addAction(aboutQtAction);
    //newAction = new QAction(menuFile);
    newAction->setIcon(QIcon(":/images/new.png"));
    recordAction = new QAction(menuFile);
    newRecordAction = new QAction(recordAction);
    exitAction = new QAction(menuFile);
    newRecordAction->setText(tr("View students..."));
    newRecordAction->setStatusTip(tr("View the list of students and departments"));
    recordSubMenu->addAction(newRecordAction);
    recordAction->setText(tr("Data view"));
    recordAction->setEnabled(true);///========================================================
    menuRecord->addAction(recordAction);
    newInpuAction = new QAction(newRecordAction);
    newInpuAction->setText(tr("Record marks..."));
    menuRecord->addAction(newInpuAction);
    newInpuAction->setStatusTip(tr("Enter marks in the database"));
    recordCourseAction = new QAction(newRecordAction);
    recordCourseAction->setStatusTip(tr("This is a dialog for registering new course entries in the database."));
    recordCourseAction->setText(tr("Record Course..."));
    menuRecord->addAction(recordCourseAction);

    recalculateAction = new QAction(toolsMenu);
    recalculateAction->setShortcut(tr("F9"));
    recalculateAction->setText(tr("&Recalculate"));
    toolsMenu->addAction(recalculateAction);
    sortAction = new QAction(toolsMenu);
    sortAction->setText(tr("&Sort..."));
    toolsMenu->addAction(sortAction);
    showGridAction = new QAction(optionsMenu);
    showGridAction->setCheckable(true);
    showGridAction->setText(tr("&Show Grid"));
    optionsMenu->addAction(showGridAction);
    autoRecalcAction = new QAction(optionsMenu);
    autoRecalcAction->setText(tr("&Auto-Recalculate"));
    optionsMenu->addAction(autoRecalcAction);
    
    newAction->setShortcut(tr("Ctrl+N"));
    newAction->setText(tr("New..."));
    menuFile->addAction(newAction);
    connect(newAction, SIGNAL(triggered()), this, SLOT(newFile()));
    //openAction = new QAction(menuFile);
    openAction->setShortcut(tr("Ctrl+O"));
    //openAction->setText(tr("Open"));
    menuFile ->addAction(openAction);
    connect(openAction,SIGNAL(triggered()),this,SLOT(open()));
    //saveAction = new QAction(menuFile);
    saveAction->setShortcut(tr("Ctrl+S"));
    saveAction->setText(tr("&Save"));
    menuFile->addAction(saveAction);
    connect(saveAction,SIGNAL(triggered()),this,SLOT(save()));
    saveAsAction =new QAction(menuFile);
    saveAsAction->setText(tr("Save As..."));
    menuFile->addAction(saveAsAction);
    connect(saveAsAction,SIGNAL(triggered()),this,SLOT(saveAs()));
    exitAction->setText(tr("&Exit"));
    
    openSessionAction = new QAction(menuSession);
    openSessionAction->setText(tr("Open Session"));
    menuSession ->addAction(openSessionAction);
    
    closeSessionAction = new QAction(menuFile);
    closeSessionAction ->setText(tr("Close Session"));
    
    menuFile->addAction(closeSessionAction);
    
    menuFile->addSeparator();
    closeAction=new QAction(menuFile);
    closeAction->setText(tr("Close"));
    menuFile->addAction(closeAction);
    
    for (int i = 0; i < MaxRecentFiles; ++i)
    menuFile->addAction(recentFileActions[i]);
    menuFile->addSeparator();
    

    menuFile->addAction(exitAction);
    menuActivator();
    //connect(addNew, SIGNAL(triggered()), this, SLOT(onAddNew()));
    setMenuBar(menuBar);
    menuSession->setEnabled(false);
    menuBar->setNativeMenuBar(false);



menuProcessing->addAction(deliberationAction);
archivageMenu = menuProcessing->addMenu(tr("Archivage"));
transcriptAction = new QAction(tr("Transcript order"),this);
archivageMenu->addAction(transcriptAction);
certificateAction = new QAction(tr("Certificate status"),this);
archivageMenu->addAction(certificateAction);



//courseManagerObject = new courseManager;

}

void MainWindow::showMaximized()
{
    // ...
    setWindowState((windowState() & ~(Qt::WindowMinimized | Qt::WindowFullScreen))
                   | Qt::WindowMaximized);
    show();
}


void MainWindow::establishConnection()
{

QString pwd;
QString usr;

pwd = ui->pwdLineEdit->text();
usr = ui->usrLineEdit->text();
int admin = ui->acoubtComboBox->currentIndex();
switch(admin)
{
case 0:
if (usr == "abc" && pwd == "abc")
{
menuSwitcher=true;
welcomeNoteWindow = new welcomeNote;

menuActivator();
qDebug() << "Connexction successfull";
ui->centralWidget_2->hide();

mainWin = new QMainWindow;

setCentralWidget(mainWin);
//setWindowTitle(tr("KMKSEdu Software"));
    //this->setStyleSheet("background-color:  #aed;");
    //this->setStyleSheet("{background-image: url(/media/ioneso/0000EBE10008BC7B/Ma_Programmation/2017project/application5092017/Demo/images/splash.png);}");
     QPixmap bkgnd(":/images/splash.png");
    bkgnd = bkgnd.scaled(this->size(), Qt::IgnoreAspectRatio);
    QPalette palette;
    palette.setBrush(QPalette::Background, bkgnd);
    this->setPalette(palette);
welcomeNoteWindow->exec();

}
else
{
QMessageBox::information(0,tr("Connection failure"),tr("<b><i><font color = red>Wrong user name or password</font></><i/><b/>"), QMessageBox::Ok);// | QMessageBox::Retry | QMessageBox::Ignore);
}
break;
case 1:
{
QMessageBox::information(0,tr("Connection failure"),tr("Guest account not yet ready, comming soon"), QMessageBox::Ignore);
break;
}

/*default:
{
 QMessageBox::StandardButton reply;
reply = QMessageBox::information(0,tr("Connection failure"),tr("Wrong user name or password"), QMessageBox::Abort | QMessageBox::Retry | QMessageBox::Ignore);
if(reply == QMessageBox::Retry)
{
ui->lineEdit_2->clear();
ui->lineEdit->clear();
}
}*/
}
}

void MainWindow::spreadsheetViewer()
{
setCentralWidget(spreadsheet);
spreadsheet->show();
activateSpreadSheet = true;
}

void MainWindow::newEntryData()
{

//spreadsheet = new Spreadsheet;
addDataView = new ArtistForm("");
//setCentralWidget(spreadsheet);
//setCentralWidget(addDataView);
addDataView->exec();
//spreadsheet->show();
}

void MainWindow::menuActivator()
{
if(!menuSwitcher)
    {
         menuFile->setEnabled(false);
         menuRecord->setEnabled(false);
         menuHelp->setEnabled(false);
    }
else
    {
         menuFile->setEnabled(true);
         menuRecord->setEnabled(true);
         menuHelp->setEnabled(true);
    }
}

void MainWindow::closeSession()
{
if(menuSwitcher)
{
menuSwitcher = false;
//activateSpreadSheet = true;
spreadsheet->hide();
menuActivator();
menuSession->setEnabled(true);
}
}

void MainWindow::openSession()
{
menuSwitcher = true;
//spreadsheet->show();
menuActivator();
menuSession->setEnabled(false);
if(activateSpreadSheet)
{
setCentralWidget(spreadsheet);
spreadsheet->show();
//activateSpreadSheet=false;
}
}

void MainWindow::helpAboutUs()
{
     QMessageBox::about(this, "About Project",
                         "<h3><font color = red>This program have been designed by Eugene NDENZAKO Msc in the framework of a big project on data mining.</font></h3>"
"<h3>It provides many functionalities related to data management in relational data management system.</h3>"
"<h3>The first release of the program will focus more attention on the tasks related to the management of grades in academic institution.</h3>"
"<h3>The next step of its development will be extended to various areas such as economy and banking.</h3>" 
"<h3>We will be gracefull to anybody who will support the project."
"<h1> So far provide a link to the project web site for information.");
}

void MainWindow::helpAboutQt()
{
     QMessageBox::aboutQt(this);
}

void MainWindow::recordNameSlot()
{
recordName =new recordMarks;
recordName->exec();
}


//*========================================

void MainWindow::maquetteCreator()
{
maquetteWindow = new maquetteDialog;
maquetteWindow->exec();
}


/*void MainWindow::newFile()
{
    if (okToContinue()) {
    
        spreadsheet->clear();
        setCurrentFile("");
    }
}*/

void MainWindow::newFile()
{
if (okToContinue()) {
MainWindow *mainWin = new MainWindow;
mainWin->show();
}
}


bool MainWindow::okToContinue()
{
    if (isWindowModified()) 
    {
    
        int r = QMessageBox::warning(this, tr("Spreadsheet"),
        tr("The document has been modified.\n"
        "Do you want to save your changes?"),
        QMessageBox::Yes | QMessageBox::No
        | QMessageBox::Cancel);
    if (r == QMessageBox::Yes) 
    {
        return save();
    } 
    else if (r == QMessageBox::Cancel) 
    {
        return false;
    }
    }
    return true;
}

void MainWindow::setCurrentFile(const QString &fileName)
{
    curFile = fileName;
    setWindowModified(false);
    QString shownName = tr("Untitled");
    if (!curFile.isEmpty()) 
    {
        shownName = strippedName(curFile);
        recentFiles.removeAll(curFile);
        recentFiles.prepend(curFile);
        updateRecentFileActions();
        }
    setWindowTitle(tr("%1[*] - %2").arg(shownName).arg(tr("QEUEducation Software")));
}

bool MainWindow::save()
{
    if (curFile.isEmpty()) 
    {
        return saveAs();
    } 
    else 
    {
        return saveFile(curFile);
    }
}

bool MainWindow::saveAs()
{
QString fileName = QFileDialog::getSaveFileName(this,tr("Save Spreadsheet"), ".",
                                tr("Spreadsheet files (*.sp)"));
    if (fileName.isEmpty())
        return false;
    return saveFile(fileName);
}

bool MainWindow::saveFile(const QString &fileName)
{
    if (!spreadsheet->writeFile(fileName)) 
    {
    statusBar()->showMessage(tr("Saving canceled"), 2000);
    return false;
    }
    setCurrentFile(fileName);
    statusBar()->showMessage(tr("File saved"), 2000);
    return true;
}

QString MainWindow::strippedName(const QString &fullFileName)
{
return QFileInfo(fullFileName).fileName();
}

void MainWindow::updateRecentFileActions()
{
    QMutableStringListIterator i(recentFiles);
    while (i.hasNext()) 
    {
    if (!QFile::exists(i.next()))
    i.remove();
    }
    for (int j = 0; j < MaxRecentFiles; ++j) 
    {
        if (j < recentFiles.count()) 
        {
            QString text = tr("&%1 %2").arg(j + 1).arg(strippedName(recentFiles[j]));
            recentFileActions[j]->setText(text);
            recentFileActions[j]->setData(recentFiles[j]);
            recentFileActions[j]->setVisible(true);
        } 
        else 
        {
            recentFileActions[j]->setVisible(false);
        }
    }
    separatorAction->setVisible(!recentFiles.isEmpty());
}

void MainWindow::open()
{
    if (okToContinue()) {
        QString fileName = QFileDialog::getOpenFileName(this,
        tr("Open Spreadsheet"), ".",
        tr("Spreadsheet files (*.sp)"));
    if (!fileName.isEmpty())
        loadFile(fileName);
    }
}

bool MainWindow::loadFile(const QString &fileName)
{
    if (!spreadsheet->readFile(fileName)) 
    {
        statusBar()->showMessage(tr("Loading canceled"), 2000);
        return false;
    }
    setCurrentFile(fileName);
    statusBar()->showMessage(tr("File loaded"), 2000);
    return true;
}

void MainWindow::createContextMenu()
{
spreadsheet->addAction(cutAction);
spreadsheet->addAction(copyAction);
spreadsheet->addAction(pasteAction);
spreadsheet->setContextMenuPolicy(Qt::ActionsContextMenu);
}

//===========================================

void MainWindow::updateStatusBar()
{
locationLabel->setText(spreadsheet->currentLocation());
formulaLabel->setText(spreadsheet->currentFormula());
}

void MainWindow::spreadsheetModified()
{
setWindowModified(true);
updateStatusBar();
}


void MainWindow::openRecentFile()
{
if (okToContinue()) {
QAction *action = qobject_cast<QAction *>(sender());
if (action)
loadFile(action->data().toString());
}
}

void MainWindow::goToCell()
{
GoToCellDialog *dialog = new GoToCellDialog(this);
if (dialog->exec()) {
QString str = dialog->lineEdit->text().toUpper();
spreadsheet->setCurrentCell(str.mid(1).toInt() - 1,
str[0].unicode() - 'A');
}
delete dialog;
}


void MainWindow::sort()
{
SortDialog dialog(this);
QTableWidgetSelectionRange range = spreadsheet->selectedRange();
dialog.setColumnRange('A' + range.leftColumn(),
'A' + range.rightColumn());
if (dialog.exec()) {
SpreadsheetCompare compare;
compare.keys[0] =
dialog.primaryColumnCombo->currentIndex();
compare.keys[1] =
dialog.secondaryColumnCombo->currentIndex() - 1;
compare.keys[2] =
dialog.tertiaryColumnCombo->currentIndex() - 1;
compare.ascending[0] =
(dialog.primaryOrderCombo->currentIndex() == 0);
compare.ascending[1] =
(dialog.secondaryOrderCombo->currentIndex() == 0);
compare.ascending[2] =
(dialog.tertiaryOrderCombo->currentIndex() == 0);
spreadsheet->sort(compare);
}
}

void MainWindow::find()
{
if (!findDialog) {
findDialog = new FindDialog(this);
connect(findDialog, SIGNAL(findNext(const QString &,
Qt::CaseSensitivity)),
spreadsheet, SLOT(findNext(const QString &,
Qt::CaseSensitivity)));
connect(findDialog, SIGNAL(findPrevious(const QString &,
Qt::CaseSensitivity)),
spreadsheet, SLOT(findPrevious(const QString &,
Qt::CaseSensitivity)));
}
findDialog->show();
findDialog->activateWindow();
}
void MainWindow::closeEvent(QCloseEvent *event)
{
if (okToContinue()) {
writeSettings();
event->accept();
} else {
event->ignore();
}
}

void MainWindow::writeSettings()
{
QSettings settings("Software Inc.", "Spreadsheet");
settings.setValue("geometry", geometry());
settings.setValue("recentFiles", recentFiles);
settings.setValue("showGrid", showGridAction->isChecked());
settings.setValue("autoRecalc", autoRecalcAction->isChecked());
}


void MainWindow::createToolBars()
{
fileToolBar = addToolBar(tr("&File"));
fileToolBar->addAction(newAction);
fileToolBar->addAction(openAction);
fileToolBar->addAction(saveAction);
editToolBar = addToolBar(tr("&Edit"));
editToolBar->addAction(cutAction);
editToolBar->addAction(copyAction);
editToolBar->addAction(pasteAction);
editToolBar->addSeparator();
editToolBar->addAction(findAction);
editToolBar->addAction(goToCellAction);
}

void MainWindow::connectLots()
{
connect(cutAction, SIGNAL(triggered()), spreadsheet, SLOT(cut()));
connect(copyAction, SIGNAL(triggered()), spreadsheet, SLOT(copy()));
connect(pasteAction, SIGNAL(triggered()), spreadsheet, SLOT(paste()));
connect(sortAction, SIGNAL(triggered()), this, SLOT(sort()));
//connect(showGridAction, SIGNAL(triggered()), this, SLOT(quit()));
connect(goToCellAction, SIGNAL(triggered()), this, SLOT(goToCell()));

}

void MainWindow::createStatusBar()
{
locationLabel = new QLabel(" W999 ");
locationLabel->setAlignment(Qt::AlignHCenter);
locationLabel->setMinimumSize(locationLabel->sizeHint());
formulaLabel = new QLabel;
formulaLabel->setIndent(3);
statusBar()->addWidget(locationLabel);
statusBar()->addWidget(formulaLabel, 1);

ui->dateTimeEdit= new QDateTimeEdit(QDateTime::currentDateTime());

ui->dateTimeEdit->setEnabled(false);
statusBar()->addWidget(ui->dateTimeEdit);

connect(spreadsheet, SIGNAL(currentCellChanged(int, int, int, int)),
this, SLOT(updateStatusBar()));
connect(spreadsheet, SIGNAL(modified()),
this, SLOT(spreadsheetModified()));
updateStatusBar();
}


void MainWindow::readSettings()
{
QSettings settings("Software Inc.", "Spreadsheet");
QRect rect = settings.value("geometry",
QRect(200, 200, 400, 400)).toRect();
move(rect.topLeft());
resize(rect.size());
recentFiles = settings.value("recentFiles").toStringList();
updateRecentFileActions();
bool showGrid = settings.value("showGrid", true).toBool();
showGridAction->setChecked(showGrid);
bool autoRecalc = settings.value("autoRecalc", true).toBool();
autoRecalcAction->setChecked(autoRecalc);
}


void MainWindow::filterSlot()
{
filterWidget = new filterWindow;
filterWidget->setWindowTitle(tr("Filtering operation"));
filterWidget->show();
}


void MainWindow::deliberationSlot()
{
delibeWidgetAction = new delibeWidget;
delibeWidgetAction->setWindowTitle(tr("Deliberation process"));
delibeWidgetAction->show();
}

void MainWindow::courseFunction()
{
courseManager *courseManagerObject = new courseManager;
courseManagerObject->exec();

}

void MainWindow::courseRecord()
{
courserecord = new recordCourse;
courserecord->exec();
}

