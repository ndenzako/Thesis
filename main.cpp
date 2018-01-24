#include<QApplication>
#include<QPixmap>
#include<QMainWindow>
#include<QSplashScreen>
#include<QSqlDatabase>
#include<QSqlError>
#include<QMessageBox>
#include<qthread.h>
#include"mainwindow.h"
#include"connexion.h"

/*bool createConnexion()
{
QSqlDatabase testDb = QSqlDatabase::addDatabase("QSQLITE");
testDb.setDatabaseName("maindatabase.db");
//testDb.setHostName("127.0.0.1");
testDb.setUserName("username");
testDb.setPassword("pwd");

if (!testDb.open())
{
QMessageBox::critical(0, QObject::tr("Database Error"),
testDb.lastError().text());
}


if(!testDb.open())
	{
	qCritical("Cannot open database: %s (%s)",
testDb.lastError().text().toLatin1().data(),
qt_error_string().toLocal8Bit().data());
return false;
		}
		return true;
}*/





class I : public QThread

{

public:

        static void sleep(unsigned long secs) {

                QThread::sleep(secs);

        }

};

int main(int argc, char *argv[])
{

    QApplication app(argc, argv);
    createConnexion();
    QPixmap pixmap(":/images/splash1.png");
if (pixmap.isNull())
    {
        pixmap = QPixmap(600, 600);
        pixmap.fill(Qt::green);
    }
    QSplashScreen splash(pixmap);
    splash.show();
    qApp->processEvents(QEventLoop::WaitForMoreEvents,5000);
    /*for (int i = 0; i < 500000; ++i)
        qDebug() << i;*/
MainWindow window;
I::sleep(3);
    
    //
    splash.finish(&window);
//I::sleep(3);
window.show();
    return app.exec();
}
