#############################################################################
# Makefile for building: Demo
# Generated by qmake (3.0) (Qt 5.5.1)
# Project:  Demo.pro
# Template: app
# Command: /usr/lib/i386-linux-gnu/qt5/bin/qmake -o Makefile Demo.pro
#############################################################################

MAKEFILE      = Makefile

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = -DQT_NO_DEBUG -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_SQL_LIB -DQT_CORE_LIB
CFLAGS        = -pipe -O2 -Wall -W -D_REENTRANT -fPIC $(DEFINES)
CXXFLAGS      = -pipe -O2 -Wall -W -D_REENTRANT -fPIC $(DEFINES)
INCPATH       = -I. -I. -isystem /usr/include/i386-linux-gnu/qt5 -isystem /usr/include/i386-linux-gnu/qt5/QtWidgets -isystem /usr/include/i386-linux-gnu/qt5/QtGui -isystem /usr/include/i386-linux-gnu/qt5/QtSql -isystem /usr/include/i386-linux-gnu/qt5/QtCore -I. -I. -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++
QMAKE         = /usr/lib/i386-linux-gnu/qt5/bin/qmake
DEL_FILE      = rm -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p
COPY          = cp -f
COPY_FILE     = cp -f
COPY_DIR      = cp -f -R
INSTALL_FILE  = install -m 644 -p
INSTALL_PROGRAM = install -m 755 -p
INSTALL_DIR   = cp -f -R
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
TAR           = tar -cf
COMPRESS      = gzip -9f
DISTNAME      = Demo1.0.0
DISTDIR = /media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo/.tmp/Demo1.0.0
LINK          = g++
LFLAGS        = -Wl,-O1
LIBS          = $(SUBLIBS) -lQt5Widgets -lQt5Gui -lQt5Sql -lQt5Core -lGL -lpthread 
AR            = ar cqs
RANLIB        = 
SED           = sed
STRIP         = strip

####### Output directory

OBJECTS_DIR   = ./

####### Files

SOURCES       = aboutus.cpp \
		cell.cpp \
		connexion.cpp \
		coursemanager.cpp \
		deliberation.cpp \
		filteringwindow.cpp \
		finddialog.cpp \
		generateid.cpp \
		gotocelldialog.cpp \
		main.cpp \
		mainwindow.cpp \
		maquette.cpp \
		modelview.cpp \
		recordcourse.cpp \
		recordmarks.cpp \
		sortdialog.cpp \
		spreadsheet.cpp \
		welcomenote.cpp qrc_spreadsheet.cpp \
		moc_aboutus.cpp \
		moc_coursemanager.cpp \
		moc_deliberation.cpp \
		moc_filteringwindow.cpp \
		moc_finddialog.cpp \
		moc_gotocelldialog.cpp \
		moc_mainwindow.cpp \
		moc_maquette.cpp \
		moc_modelview.cpp \
		moc_recordcourse.cpp \
		moc_recordmarks.cpp \
		moc_sortdialog.cpp \
		moc_spreadsheet.cpp \
		moc_welcomenote.cpp
OBJECTS       = aboutus.o \
		cell.o \
		connexion.o \
		coursemanager.o \
		deliberation.o \
		filteringwindow.o \
		finddialog.o \
		generateid.o \
		gotocelldialog.o \
		main.o \
		mainwindow.o \
		maquette.o \
		modelview.o \
		recordcourse.o \
		recordmarks.o \
		sortdialog.o \
		spreadsheet.o \
		welcomenote.o \
		qrc_spreadsheet.o \
		moc_aboutus.o \
		moc_coursemanager.o \
		moc_deliberation.o \
		moc_filteringwindow.o \
		moc_finddialog.o \
		moc_gotocelldialog.o \
		moc_mainwindow.o \
		moc_maquette.o \
		moc_modelview.o \
		moc_recordcourse.o \
		moc_recordmarks.o \
		moc_sortdialog.o \
		moc_spreadsheet.o \
		moc_welcomenote.o
DIST          = /usr/lib/i386-linux-gnu/qt5/mkspecs/features/spec_pre.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/unix.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/linux.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/sanitize.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/gcc-base.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/gcc-base-unix.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/g++-base.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/g++-unix.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/qconfig.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_bootstrap_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_core.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_core_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_eglfs_device_lib_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_gui.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_gui_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_network.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_network_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_platformsupport_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_sql.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_sql_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xcb_qpa_lib_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xml.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xml_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt_functions.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt_config.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++/qmake.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/spec_post.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/exclusive_builds.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/default_pre.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resolve_config.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/default_post.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/warn_on.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resources.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/moc.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/unix/opengl.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/uic.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/unix/thread.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/testcase_targets.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/exceptions.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/yacc.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/lex.prf \
		Demo.pro aboutus.h \
		cell.h \
		connexion.h \
		coursemanager.h \
		deliberation.h \
		filteringwindow.h \
		finddialog.h \
		generateid.h \
		gotocelldialog.h \
		mainwindow.h \
		maquette.h \
		modelview.h \
		recordcourse.h \
		recordmarks.h \
		sortdialog.h \
		spreadsheet.h \
		ui_gotocelldialog.h \
		ui_mainwindow.h \
		ui_sortdialog.h \
		welcomenote.h aboutus.cpp \
		cell.cpp \
		connexion.cpp \
		coursemanager.cpp \
		deliberation.cpp \
		filteringwindow.cpp \
		finddialog.cpp \
		generateid.cpp \
		gotocelldialog.cpp \
		main.cpp \
		mainwindow.cpp \
		maquette.cpp \
		modelview.cpp \
		recordcourse.cpp \
		recordmarks.cpp \
		sortdialog.cpp \
		spreadsheet.cpp \
		welcomenote.cpp
QMAKE_TARGET  = Demo
DESTDIR       = #avoid trailing-slash linebreak
TARGET        = Demo


first: all
####### Implicit rules

.SUFFIXES: .o .c .cpp .cc .cxx .C

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.C.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.c.o:
	$(CC) -c $(CFLAGS) $(INCPATH) -o "$@" "$<"

####### Build rules

$(TARGET): ui_gotocelldialog.h ui_mainwindow.h ui_sortdialog.h $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)

Makefile: Demo.pro /usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++/qmake.conf /usr/lib/i386-linux-gnu/qt5/mkspecs/features/spec_pre.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/unix.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/linux.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/sanitize.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/gcc-base.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/gcc-base-unix.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/g++-base.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/common/g++-unix.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/qconfig.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_bootstrap_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_core.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_core_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_eglfs_device_lib_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_gui.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_gui_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_network.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_network_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_platformsupport_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_sql.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_sql_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xcb_qpa_lib_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xml.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xml_private.pri \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt_functions.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt_config.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++/qmake.conf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/spec_post.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/exclusive_builds.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/default_pre.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resolve_config.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/default_post.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/warn_on.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resources.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/moc.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/unix/opengl.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/uic.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/unix/thread.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/testcase_targets.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/exceptions.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/yacc.prf \
		/usr/lib/i386-linux-gnu/qt5/mkspecs/features/lex.prf \
		Demo.pro \
		spreadsheet.qrc \
		/usr/lib/i386-linux-gnu/libQt5Widgets.prl \
		/usr/lib/i386-linux-gnu/libQt5Gui.prl \
		/usr/lib/i386-linux-gnu/libQt5Sql.prl \
		/usr/lib/i386-linux-gnu/libQt5Core.prl
	$(QMAKE) -o Makefile Demo.pro
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/spec_pre.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/common/unix.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/common/linux.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/common/sanitize.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/common/gcc-base.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/common/gcc-base-unix.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/common/g++-base.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/common/g++-unix.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/qconfig.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_bootstrap_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_core.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_core_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_eglfs_device_lib_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_gui.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_gui_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_network.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_network_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_platformsupport_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_sql.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_sql_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xcb_qpa_lib_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xml.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/modules/qt_lib_xml_private.pri:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt_functions.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt_config.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++/qmake.conf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/spec_post.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/exclusive_builds.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/default_pre.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resolve_config.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/default_post.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/warn_on.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/qt.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/resources.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/moc.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/unix/opengl.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/uic.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/unix/thread.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/testcase_targets.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/exceptions.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/yacc.prf:
/usr/lib/i386-linux-gnu/qt5/mkspecs/features/lex.prf:
Demo.pro:
spreadsheet.qrc:
/usr/lib/i386-linux-gnu/libQt5Widgets.prl:
/usr/lib/i386-linux-gnu/libQt5Gui.prl:
/usr/lib/i386-linux-gnu/libQt5Sql.prl:
/usr/lib/i386-linux-gnu/libQt5Core.prl:
qmake: FORCE
	@$(QMAKE) -o Makefile Demo.pro

qmake_all: FORCE


all: Makefile $(TARGET)

dist: distdir FORCE
	(cd `dirname $(DISTDIR)` && $(TAR) $(DISTNAME).tar $(DISTNAME) && $(COMPRESS) $(DISTNAME).tar) && $(MOVE) `dirname $(DISTDIR)`/$(DISTNAME).tar.gz . && $(DEL_FILE) -r $(DISTDIR)

distdir: FORCE
	@test -d $(DISTDIR) || mkdir -p $(DISTDIR)
	$(COPY_FILE) --parents $(DIST) $(DISTDIR)/
	$(COPY_FILE) --parents spreadsheet.qrc $(DISTDIR)/
	$(COPY_FILE) --parents aboutus.h cell.h connexion.h coursemanager.h deliberation.h filteringwindow.h finddialog.h generateid.h gotocelldialog.h mainwindow.h maquette.h modelview.h recordcourse.h recordmarks.h sortdialog.h spreadsheet.h ui_gotocelldialog.h ui_mainwindow.h ui_sortdialog.h welcomenote.h $(DISTDIR)/
	$(COPY_FILE) --parents aboutus.cpp cell.cpp connexion.cpp coursemanager.cpp deliberation.cpp filteringwindow.cpp finddialog.cpp generateid.cpp gotocelldialog.cpp main.cpp mainwindow.cpp maquette.cpp modelview.cpp recordcourse.cpp recordmarks.cpp sortdialog.cpp spreadsheet.cpp welcomenote.cpp $(DISTDIR)/
	$(COPY_FILE) --parents gotocelldialog.ui mainwindow.ui sortdialog.ui $(DISTDIR)/


clean: compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


distclean: clean 
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) Makefile


####### Sub-libraries

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

check: first

compiler_rcc_make_all: qrc_spreadsheet.cpp
compiler_rcc_clean:
	-$(DEL_FILE) qrc_spreadsheet.cpp
qrc_spreadsheet.cpp: spreadsheet.qrc \
		images/icon.png \
		images/save.png \
		images/open.png \
		images/cut.png \
		images/splash.png \
		images/copy.png \
		images/splash1.png \
		images/gotocell.png \
		images/paste.png \
		images/new.png \
		images/find.png
	/usr/lib/i386-linux-gnu/qt5/bin/rcc -name spreadsheet spreadsheet.qrc -o qrc_spreadsheet.cpp

compiler_moc_header_make_all: moc_aboutus.cpp moc_coursemanager.cpp moc_deliberation.cpp moc_filteringwindow.cpp moc_finddialog.cpp moc_gotocelldialog.cpp moc_mainwindow.cpp moc_maquette.cpp moc_modelview.cpp moc_recordcourse.cpp moc_recordmarks.cpp moc_sortdialog.cpp moc_spreadsheet.cpp moc_welcomenote.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) moc_aboutus.cpp moc_coursemanager.cpp moc_deliberation.cpp moc_filteringwindow.cpp moc_finddialog.cpp moc_gotocelldialog.cpp moc_mainwindow.cpp moc_maquette.cpp moc_modelview.cpp moc_recordcourse.cpp moc_recordmarks.cpp moc_sortdialog.cpp moc_spreadsheet.cpp moc_welcomenote.cpp
moc_aboutus.cpp: aboutus.h
	/usr/lib/i386-linux-gnu/qt5/bin/moc $(DEFINES) -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtSql -I/usr/include/i386-linux-gnu/qt5/QtCore -I/usr/include/c++/5 -I/usr/include/i386-linux-gnu/c++/5 -I/usr/include/c++/5/backward -I/usr/lib/gcc/i686-linux-gnu/5/include -I/usr/local/include -I/usr/lib/gcc/i686-linux-gnu/5/include-fixed -I/usr/include/i386-linux-gnu -I/usr/include aboutus.h -o moc_aboutus.cpp

moc_coursemanager.cpp: coursemanager.h
	/usr/lib/i386-linux-gnu/qt5/bin/moc $(DEFINES) -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtSql -I/usr/include/i386-linux-gnu/qt5/QtCore -I/usr/include/c++/5 -I/usr/include/i386-linux-gnu/c++/5 -I/usr/include/c++/5/backward -I/usr/lib/gcc/i686-linux-gnu/5/include -I/usr/local/include -I/usr/lib/gcc/i686-linux-gnu/5/include-fixed -I/usr/include/i386-linux-gnu -I/usr/include coursemanager.h -o moc_coursemanager.cpp

moc_deliberation.cpp: deliberation.h
	/usr/lib/i386-linux-gnu/qt5/bin/moc $(DEFINES) -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtSql -I/usr/include/i386-linux-gnu/qt5/QtCore -I/usr/include/c++/5 -I/usr/include/i386-linux-gnu/c++/5 -I/usr/include/c++/5/backward -I/usr/lib/gcc/i686-linux-gnu/5/include -I/usr/local/include -I/usr/lib/gcc/i686-linux-gnu/5/include-fixed -I/usr/include/i386-linux-gnu -I/usr/include deliberation.h -o moc_deliberation.cpp

moc_filteringwindow.cpp: filteringwindow.h
	/usr/lib/i386-linux-gnu/qt5/bin/moc $(DEFINES) -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtSql -I/usr/include/i386-linux-gnu/qt5/QtCore -I/usr/include/c++/5 -I/usr/include/i386-linux-gnu/c++/5 -I/usr/include/c++/5/backward -I/usr/lib/gcc/i686-linux-gnu/5/include -I/usr/local/include -I/usr/lib/gcc/i686-linux-gnu/5/include-fixed -I/usr/include/i386-linux-gnu -I/usr/include filteringwindow.h -o moc_filteringwindow.cpp

moc_finddialog.cpp: sortdialog.h \
		ui_sortdialog.h \
		finddialog.h
	/usr/lib/i386-linux-gnu/qt5/bin/moc $(DEFINES) -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtSql -I/usr/include/i386-linux-gnu/qt5/QtCore -I/usr/include/c++/5 -I/usr/include/i386-linux-gnu/c++/5 -I/usr/include/c++/5/backward -I/usr/lib/gcc/i686-linux-gnu/5/include -I/usr/local/include -I/usr/lib/gcc/i686-linux-gnu/5/include-fixed -I/usr/include/i386-linux-gnu -I/usr/include finddialog.h -o moc_finddialog.cpp

moc_gotocelldialog.cpp: ui_gotocelldialog.h \
		gotocelldialog.h
	/usr/lib/i386-linux-gnu/qt5/bin/moc $(DEFINES) -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtSql -I/usr/include/i386-linux-gnu/qt5/QtCore -I/usr/include/c++/5 -I/usr/include/i386-linux-gnu/c++/5 -I/usr/include/c++/5/backward -I/usr/lib/gcc/i686-linux-gnu/5/include -I/usr/local/include -I/usr/lib/gcc/i686-linux-gnu/5/include-fixed -I/usr/include/i386-linux-gnu -I/usr/include gotocelldialog.h -o moc_gotocelldialog.cpp

moc_mainwindow.cpp: mainwindow.h
	/usr/lib/i386-linux-gnu/qt5/bin/moc $(DEFINES) -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtSql -I/usr/include/i386-linux-gnu/qt5/QtCore -I/usr/include/c++/5 -I/usr/include/i386-linux-gnu/c++/5 -I/usr/include/c++/5/backward -I/usr/lib/gcc/i686-linux-gnu/5/include -I/usr/local/include -I/usr/lib/gcc/i686-linux-gnu/5/include-fixed -I/usr/include/i386-linux-gnu -I/usr/include mainwindow.h -o moc_mainwindow.cpp

moc_maquette.cpp: maquette.h
	/usr/lib/i386-linux-gnu/qt5/bin/moc $(DEFINES) -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtSql -I/usr/include/i386-linux-gnu/qt5/QtCore -I/usr/include/c++/5 -I/usr/include/i386-linux-gnu/c++/5 -I/usr/include/c++/5/backward -I/usr/lib/gcc/i686-linux-gnu/5/include -I/usr/local/include -I/usr/lib/gcc/i686-linux-gnu/5/include-fixed -I/usr/include/i386-linux-gnu -I/usr/include maquette.h -o moc_maquette.cpp

moc_modelview.cpp: modelview.h
	/usr/lib/i386-linux-gnu/qt5/bin/moc $(DEFINES) -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtSql -I/usr/include/i386-linux-gnu/qt5/QtCore -I/usr/include/c++/5 -I/usr/include/i386-linux-gnu/c++/5 -I/usr/include/c++/5/backward -I/usr/lib/gcc/i686-linux-gnu/5/include -I/usr/local/include -I/usr/lib/gcc/i686-linux-gnu/5/include-fixed -I/usr/include/i386-linux-gnu -I/usr/include modelview.h -o moc_modelview.cpp

moc_recordcourse.cpp: recordcourse.h
	/usr/lib/i386-linux-gnu/qt5/bin/moc $(DEFINES) -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtSql -I/usr/include/i386-linux-gnu/qt5/QtCore -I/usr/include/c++/5 -I/usr/include/i386-linux-gnu/c++/5 -I/usr/include/c++/5/backward -I/usr/lib/gcc/i686-linux-gnu/5/include -I/usr/local/include -I/usr/lib/gcc/i686-linux-gnu/5/include-fixed -I/usr/include/i386-linux-gnu -I/usr/include recordcourse.h -o moc_recordcourse.cpp

moc_recordmarks.cpp: recordmarks.h
	/usr/lib/i386-linux-gnu/qt5/bin/moc $(DEFINES) -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtSql -I/usr/include/i386-linux-gnu/qt5/QtCore -I/usr/include/c++/5 -I/usr/include/i386-linux-gnu/c++/5 -I/usr/include/c++/5/backward -I/usr/lib/gcc/i686-linux-gnu/5/include -I/usr/local/include -I/usr/lib/gcc/i686-linux-gnu/5/include-fixed -I/usr/include/i386-linux-gnu -I/usr/include recordmarks.h -o moc_recordmarks.cpp

moc_sortdialog.cpp: ui_sortdialog.h \
		sortdialog.h
	/usr/lib/i386-linux-gnu/qt5/bin/moc $(DEFINES) -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtSql -I/usr/include/i386-linux-gnu/qt5/QtCore -I/usr/include/c++/5 -I/usr/include/i386-linux-gnu/c++/5 -I/usr/include/c++/5/backward -I/usr/lib/gcc/i686-linux-gnu/5/include -I/usr/local/include -I/usr/lib/gcc/i686-linux-gnu/5/include-fixed -I/usr/include/i386-linux-gnu -I/usr/include sortdialog.h -o moc_sortdialog.cpp

moc_spreadsheet.cpp: spreadsheet.h
	/usr/lib/i386-linux-gnu/qt5/bin/moc $(DEFINES) -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtSql -I/usr/include/i386-linux-gnu/qt5/QtCore -I/usr/include/c++/5 -I/usr/include/i386-linux-gnu/c++/5 -I/usr/include/c++/5/backward -I/usr/lib/gcc/i686-linux-gnu/5/include -I/usr/local/include -I/usr/lib/gcc/i686-linux-gnu/5/include-fixed -I/usr/include/i386-linux-gnu -I/usr/include spreadsheet.h -o moc_spreadsheet.cpp

moc_welcomenote.cpp: welcomenote.h
	/usr/lib/i386-linux-gnu/qt5/bin/moc $(DEFINES) -I/usr/lib/i386-linux-gnu/qt5/mkspecs/linux-g++ -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/media/ionesco/0000EBE10008BC7B/Ma_Programmation/2018project/application02012018/Demo -I/usr/include/i386-linux-gnu/qt5 -I/usr/include/i386-linux-gnu/qt5/QtWidgets -I/usr/include/i386-linux-gnu/qt5/QtGui -I/usr/include/i386-linux-gnu/qt5/QtSql -I/usr/include/i386-linux-gnu/qt5/QtCore -I/usr/include/c++/5 -I/usr/include/i386-linux-gnu/c++/5 -I/usr/include/c++/5/backward -I/usr/lib/gcc/i686-linux-gnu/5/include -I/usr/local/include -I/usr/lib/gcc/i686-linux-gnu/5/include-fixed -I/usr/include/i386-linux-gnu -I/usr/include welcomenote.h -o moc_welcomenote.cpp

compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all: ui_gotocelldialog.h ui_mainwindow.h ui_sortdialog.h
compiler_uic_clean:
	-$(DEL_FILE) ui_gotocelldialog.h ui_mainwindow.h ui_sortdialog.h
ui_gotocelldialog.h: gotocelldialog.ui
	/usr/lib/i386-linux-gnu/qt5/bin/uic gotocelldialog.ui -o ui_gotocelldialog.h

ui_mainwindow.h: mainwindow.ui
	/usr/lib/i386-linux-gnu/qt5/bin/uic mainwindow.ui -o ui_mainwindow.h

ui_sortdialog.h: sortdialog.ui
	/usr/lib/i386-linux-gnu/qt5/bin/uic sortdialog.ui -o ui_sortdialog.h

compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_rcc_clean compiler_moc_header_clean compiler_uic_clean 

####### Compile

aboutus.o: aboutus.cpp aboutus.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o aboutus.o aboutus.cpp

cell.o: cell.cpp cell.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o cell.o cell.cpp

connexion.o: connexion.cpp connexion.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o connexion.o connexion.cpp

coursemanager.o: coursemanager.cpp coursemanager.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o coursemanager.o coursemanager.cpp

deliberation.o: deliberation.cpp deliberation.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o deliberation.o deliberation.cpp

filteringwindow.o: filteringwindow.cpp filteringwindow.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o filteringwindow.o filteringwindow.cpp

finddialog.o: finddialog.cpp finddialog.h \
		sortdialog.h \
		ui_sortdialog.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o finddialog.o finddialog.cpp

generateid.o: generateid.cpp generateid.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o generateid.o generateid.cpp

gotocelldialog.o: gotocelldialog.cpp gotocelldialog.h \
		ui_gotocelldialog.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o gotocelldialog.o gotocelldialog.cpp

main.o: main.cpp mainwindow.h \
		connexion.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o main.o main.cpp

mainwindow.o: mainwindow.cpp mainwindow.h \
		spreadsheet.h \
		coursemanager.h \
		recordcourse.h \
		ui_mainwindow.h \
		welcomenote.h \
		maquette.h \
		finddialog.h \
		sortdialog.h \
		ui_sortdialog.h \
		gotocelldialog.h \
		ui_gotocelldialog.h \
		filteringwindow.h \
		deliberation.h \
		recordmarks.h \
		modelview.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o mainwindow.o mainwindow.cpp

maquette.o: maquette.cpp maquette.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o maquette.o maquette.cpp

modelview.o: modelview.cpp modelview.h \
		generateid.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o modelview.o modelview.cpp

recordcourse.o: recordcourse.cpp recordcourse.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o recordcourse.o recordcourse.cpp

recordmarks.o: recordmarks.cpp recordmarks.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o recordmarks.o recordmarks.cpp

sortdialog.o: sortdialog.cpp sortdialog.h \
		ui_sortdialog.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o sortdialog.o sortdialog.cpp

spreadsheet.o: spreadsheet.cpp cell.h \
		spreadsheet.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o spreadsheet.o spreadsheet.cpp

welcomenote.o: welcomenote.cpp welcomenote.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o welcomenote.o welcomenote.cpp

qrc_spreadsheet.o: qrc_spreadsheet.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o qrc_spreadsheet.o qrc_spreadsheet.cpp

moc_aboutus.o: moc_aboutus.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_aboutus.o moc_aboutus.cpp

moc_coursemanager.o: moc_coursemanager.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_coursemanager.o moc_coursemanager.cpp

moc_deliberation.o: moc_deliberation.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_deliberation.o moc_deliberation.cpp

moc_filteringwindow.o: moc_filteringwindow.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_filteringwindow.o moc_filteringwindow.cpp

moc_finddialog.o: moc_finddialog.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_finddialog.o moc_finddialog.cpp

moc_gotocelldialog.o: moc_gotocelldialog.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_gotocelldialog.o moc_gotocelldialog.cpp

moc_mainwindow.o: moc_mainwindow.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_mainwindow.o moc_mainwindow.cpp

moc_maquette.o: moc_maquette.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_maquette.o moc_maquette.cpp

moc_modelview.o: moc_modelview.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_modelview.o moc_modelview.cpp

moc_recordcourse.o: moc_recordcourse.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_recordcourse.o moc_recordcourse.cpp

moc_recordmarks.o: moc_recordmarks.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_recordmarks.o moc_recordmarks.cpp

moc_sortdialog.o: moc_sortdialog.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_sortdialog.o moc_sortdialog.cpp

moc_spreadsheet.o: moc_spreadsheet.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_spreadsheet.o moc_spreadsheet.cpp

moc_welcomenote.o: moc_welcomenote.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_welcomenote.o moc_welcomenote.cpp

####### Install

install:  FORCE

uninstall:  FORCE

FORCE:

