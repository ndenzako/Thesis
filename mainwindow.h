#ifndef MAINWINDOW_H
#define MAINWINDOW_H
#include<QMainWindow>
QT_BEGIN_NAMESPACE
class QStringList;
class QMessageBox;
class QMenu;
class QAction;
class Spreadsheet;
class welcomeNote;
class maquetteDialog;
class QFileDialog;
class QStatusBar;
class QFileInfo;
//====================
class QLabel;
class FindDialog;
class QToolBar;
class QMenuBar;
class filterWindow;
class delibeWidget;
class recordCourse;
class courseManager;
class recordMarks;
class ArtistForm;
QT_END_NAMESPACE

//class QMutableStringListIterator;


//class ArtistForm;
namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    void showMaximized();
    void createMenu();
void menuActivator();
    //void createMenu1();

protected:
void closeEvent(QCloseEvent *event);


private:
    Ui::MainWindow *ui;
QMainWindow *mainWin;
Spreadsheet *spreadsheet;
ArtistForm *addDataView;
bool menuSwitcher;
bool activateSpreadSheet;
welcomeNote *welcomeNoteWindow;

recordMarks *recordName;

maquetteDialog *maquetteWindow;
bool okToContinue();
void setCurrentFile(const QString &fileName);
//bool save();
//bool saveAs();
bool saveFile(const QString &fileName);
QString curFile;
QString strippedName(const QString &fullFileName);
QStringList recentFiles;
enum { MaxRecentFiles = 5 };
QAction *recentFileActions[MaxRecentFiles];
QAction *separatorAction;
void updateRecentFileActions();
bool loadFile(const QString &fileName);
void createContextMenu();


//QAction *action;
//QMenu *file;
//QMenuBar *menuBar;

    QMenuBar *menuBar;
    QMenu *menuFile;
    QMenu *editMenu;
    QMenu *menuSession;
    QMenu *menuRecord;
    QMenu *menuHelp;
    QMenu *menuProcessing;
    QMenu *toolsMenu;
    QMenu *optionsMenu;
    QMenu *selectSubMenu;
    QMenu *recordSubMenu;
    QMenu *archivageMenu;
    
    QAction *newAction;
    QAction *recordAction;
    QAction *newRecordAction;
    QAction *exitAction;
    QAction *aboutUsAction;
    QAction *aboutQtAction;
    QAction *openSessionAction;
    QAction *closeSessionAction;
    QAction *newInpuAction;
    QAction *recordCourseAction;//=============================================
    QAction *processingAction;
    QAction *openAction;
    QAction *saveAction;
    QAction *saveAsAction;
    QAction *closeAction;
    QAction *cutAction;
    QAction *copyAction;
    QAction *pasteAction;
    QAction *deleteAction;
    //QAction *selectAction;
    QAction *findAction;
    QAction *goToCellAction;
    QAction *recalculateAction;
    QAction *sortAction;
    QAction *showGridAction;
    QAction *autoRecalcAction;
    QAction *selectRowAction;
    QAction *selectColumnAction;
    QAction *selectAllAction;
    QAction *filterAction;
    QAction *deliberationAction;
    QAction *transcriptAction;
    QAction *certificateAction;
    QAction *courseUeOrderAction;


public slots:
void newFile();
void open();
bool save();
bool saveAs();
void establishConnection();
void spreadsheetViewer();
void newEntryData();
void openSession();
void closeSession();
void helpAboutUs();
void helpAboutQt();
void recordNameSlot();
//========================================================
void maquetteCreator();
void filterSlot();
void deliberationSlot();


//=================================================
void find();
void goToCell();
void sort();
void openRecentFile();
void updateStatusBar();
void spreadsheetModified();
void courseFunction();
void courseRecord();



//void exitActionSlot();

private:
void createActions();
void createMenus();
void createToolBars();
void createStatusBar();
void readSettings();
void writeSettings();
void pointerDef();
void initActions();
void connectLots();
FindDialog *findDialog;
QLabel *locationLabel;
QLabel *formulaLabel;

QToolBar *fileToolBar;
QToolBar *editToolBar;
filterWindow *filterWidget;
delibeWidget *delibeWidgetAction;
courseManager *courseManagerObject;
recordCourse *courserecord;//=========================================
};

#endif // MAINWINDOW_H
