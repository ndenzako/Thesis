PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE faculty(facultyId INTEGER PRIMARY KEY AUTOINCREMENT ,facultyName TEXT);
INSERT INTO "faculty" VALUES(1,'Science');
INSERT INTO "faculty" VALUES(2,'Economy');
INSERT INTO "faculty" VALUES(3,'Law');
INSERT INTO "faculty" VALUES(4,'Geography');
INSERT INTO "faculty" VALUES(5,'ISA');
INSERT INTO "faculty" VALUES(6,'IEPS');
INSERT INTO "faculty" VALUES(7,'History');
INSERT INTO "faculty" VALUES(8,'FABI');
INSERT INTO "faculty" VALUES(9,'Medecine');
INSERT INTO "faculty" VALUES(10,'FSI');
CREATE TABLE classtable(classId INTEGER,departmentId INTEGER,className TEXT,
PRIMARY KEY(classId,departmentId));
INSERT INTO "classtable" VALUES(1,1,'Bac I');
INSERT INTO "classtable" VALUES(2,2,'Bac II');
INSERT INTO "classtable" VALUES(3,4,'Bac III');
CREATE TABLE ENSEIGNANT(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
postname TEXT,
courseId TEXT,
matricule INTEGER,
FOREIGN KEY (courseId) REFERENCES COURSE
);
INSERT INTO "ENSEIGNANT" VALUES(1,'MAJAMBERE','Lucien','3407',38);
INSERT INTO "ENSEIGNANT" VALUES(2,'KUBWAYO','Donacien','8765',34);
INSERT INTO "ENSEIGNANT" VALUES(3,'MANARIYO','Pierre','8763',38);
INSERT INTO "ENSEIGNANT" VALUES(4,'KUBWIMANA','Theoneste','8753',65);
INSERT INTO "ENSEIGNANT" VALUES(5,'KAGAYO','Pontien','8725',78);
INSERT INTO "ENSEIGNANT" VALUES(6,'SIRYUYUMUSI','Lin','6374',87);
INSERT INTO "ENSEIGNANT" VALUES(7,'KABURA','Damien','8645',54);
INSERT INTO "ENSEIGNANT" VALUES(8,'NAHABAKOMEYE','Longin','8763',54);
INSERT INTO "ENSEIGNANT" VALUES(9,'NDUWIMANA','Zabulon','9836',52);
INSERT INTO "ENSEIGNANT" VALUES(10,'HABIMANA','Clovis','2432',89);
INSERT INTO "ENSEIGNANT" VALUES(11,'NTAHONDEREYE','Jean','9875',98);
CREATE TABLE campusLocation(
campusId INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(40) NOT NULL);
INSERT INTO "campusLocation" VALUES(1,'Kamenge');
INSERT INTO "campusLocation" VALUES(2,'Kiriri');
INSERT INTO "campusLocation" VALUES(3,'Mutanga');
INSERT INTO "campusLocation" VALUES(4,'Rohero');
INSERT INTO "campusLocation" VALUES(5,'Zege');
CREATE TABLE department(
departmentId INTEGER PRIMARY KEY AUTOINCREMENT,
departmentname VARCHAR(40) NOT NULL,
facultyId INTEGER NOT NULL,
FOREIGN KEY (facultyId) REFERENCES faculty,
FOREIGN KEY (departmentId) REFERENCES liststudent);
INSERT INTO "department" VALUES(0,'Groupe science',1);
INSERT INTO "department" VALUES(1,'Poly I',1);
INSERT INTO "department" VALUES(2,'Biologie',1);
INSERT INTO "department" VALUES(3,'Chimie',1);
INSERT INTO "department" VALUES(4,'Geologie',1);
INSERT INTO "department" VALUES(5,'Mathematique',1);
INSERT INTO "department" VALUES(6,'Physique',1);
CREATE TABLE COURSE(
courseId INTEGER PRIMARY KEY AUTOINCREMENT,
courseNumber TEXT,
courseName VARCHAR(40) NOT NULL,
courseCredit INTEGER,
departmentId INTEGER NOT NULL,
classId INTEGER,
FOREIGN KEY (departmentId) REFERENCES department,
FOREIGN KEY (courseId) REFERENCES liststudent
);
INSERT INTO "COURSE" VALUES(100,'','',5,4,1);
INSERT INTO "COURSE" VALUES(110,'','',2,9,1);
INSERT INTO "COURSE" VALUES(120,'','',5,4,2);
INSERT INTO "COURSE" VALUES(130,'','',2,9,3);
INSERT INTO "COURSE" VALUES(140,'','',5,4,1);
INSERT INTO "COURSE" VALUES(150,'','',2,9,2);
INSERT INTO "COURSE" VALUES(160,'','',5,4,3);
INSERT INTO "COURSE" VALUES(170,'','',2,9,1);
CREATE TABLE GRADE_REPORT(
studentId TEXT PRIMARY KEY,
classID INTEGER,
grade VARCHAR(20),
departmentId INTEGER,
FOREIGN KEY (departmentId) REFERENCES department
);
CREATE TABLE CLASS(
classID INTEGER PRIMARY KEY AUTOINCREMENT,
courseNumber TEXT,
semester INTEGER,
year DATE,
instructor TEXT,
departmentId INTEGER,
FOREIGN KEY (departmentId) REFERENCES department,
FOREIGN KEY (classID) REFERENCES liststudent
);
INSERT INTO "CLASS" VALUES(7,'87','Physique Generale','2006-7-23','Jean',98);
CREATE TABLE prerequisite(departmentId INTEGER, classId INTEGER,courseId TEXT,ueId TEXT,prerequisiteId INTEGER
);
CREATE TABLE MARKS(
studentId TEXT NOT NULL,
courseId TEXT NOT NULL,
marks REAL,
classID INTEGER,
departmentId INTEGER,
PRIMARY KEY(studentId,courseId)
);
INSERT INTO "MARKS" VALUES('1','PHY1101',12.0,1,6);
INSERT INTO "MARKS" VALUES('2','PHY1101',13.0,1,6);
INSERT INTO "MARKS" VALUES('3','PHY1101',14.0,1,6);
INSERT INTO "MARKS" VALUES('4','PHY1101',11.0,1,6);
INSERT INTO "MARKS" VALUES('5','PHY1101',15.0,1,6);
INSERT INTO "MARKS" VALUES('6','PHY1102',12.0,1,6);
INSERT INTO "MARKS" VALUES('7','PHY1102',14.0,1,6);
INSERT INTO "MARKS" VALUES('8','PHY1102',17.0,1,6);
INSERT INTO "MARKS" VALUES('9','PHY1103',11.0,1,6);
INSERT INTO "MARKS" VALUES('10','PHY1103',18.0,1,6);
INSERT INTO "MARKS" VALUES('11','PHY1103',12.0,1,6);
INSERT INTO "MARKS" VALUES('12','PHY1104',14.0,1,6);
INSERT INTO "MARKS" VALUES('13','PHY1104',11.0,1,6);
INSERT INTO "MARKS" VALUES('14','PHY1105',15.0,1,6);
CREATE TABLE facultydepartment (studentId TEXT PRIMARY KEY NOT NULL,facultyname TEXT, departmentname TEXT,classname TEXT);
INSERT INTO "facultydepartment" VALUES('0','Science','Groupe science','Bac I');
INSERT INTO "facultydepartment" VALUES('1','Science','Poly I','Bac I');
INSERT INTO "facultydepartment" VALUES('2','Science','Biologie','Bac II');
INSERT INTO "facultydepartment" VALUES('3','Science','Chimie','Bac II');
INSERT INTO "facultydepartment" VALUES('4','Science','Geologie','Bac II');
INSERT INTO "facultydepartment" VALUES('5','Science','Mathematique','Bac II');
INSERT INTO "facultydepartment" VALUES('6','Science','Physique','Bac II');
INSERT INTO "facultydepartment" VALUES('123','ISA','Groupe science','Bac I');
INSERT INTO "facultydepartment" VALUES('9874','Geography','Groupe science','Bac I');
INSERT INTO "facultydepartment" VALUES('98744','Geography','Groupe science','Bac I');
INSERT INTO "facultydepartment" VALUES('123788','ISA','Groupe science','Bac I');
INSERT INTO "facultydepartment" VALUES('54346767','Science','Groupe science','Bac I');
INSERT INTO "facultydepartment" VALUES('987653241','Science','Biologie','Bac III');
CREATE TABLE liststudent (studentId TEXT PRIMARY KEY NOT NULL,name TEXT, postname TEXT);
INSERT INTO "liststudent" VALUES('15/08821','NDIKUBWAYO','Clement');
INSERT INTO "liststudent" VALUES('15/08822','NDIKUBWAYO','Frederic');
INSERT INTO "liststudent" VALUES('15/08823','NDIKUBWAYO','Onesime');
INSERT INTO "liststudent" VALUES('15/08824','NDUWAYO','Ezechiel');
INSERT INTO "liststudent" VALUES('15/08825','NDIKURIYO','Thierry');
INSERT INTO "liststudent" VALUES('15/08826','NDIKUMANA','Roger');
INSERT INTO "liststudent" VALUES('15/08827','NDIKUMWENAYO','Jean Bosco');
INSERT INTO "liststudent" VALUES('15/08828','NDIKURIYO','Sicaire');
INSERT INTO "liststudent" VALUES('15/08829','RUZINDAMA','Julius');
INSERT INTO "liststudent" VALUES('15/08830','SABUSHIMIKE','J. Bosco');
INSERT INTO "liststudent" VALUES('15/08831','NIZIGIYIMANA',' Athanase');
INSERT INTO "liststudent" VALUES('15/08832','RUKUNDO','Jean');
INSERT INTO "liststudent" VALUES('15/08833','TWAGIRIMANA','Gerard');
INSERT INTO "liststudent" VALUES('15/08834','VYUKUSENGE','Renovat');
INSERT INTO "liststudent" VALUES('15/08835','WIZEYIMANA','Emmanuel');
INSERT INTO "liststudent" VALUES('15/08836','TUYOZERE','Thierry');
INSERT INTO "liststudent" VALUES('15/08837','NIYOMUTABAZI','Alfred');
INSERT INTO "liststudent" VALUES('15/08838','NIYONGABO','Didace');
INSERT INTO "liststudent" VALUES('15/08839','NIYONGABO','Ernest');
INSERT INTO "liststudent" VALUES('15/08840','NIYOMWUNGERE','Epitace');
INSERT INTO "liststudent" VALUES('15/08841','MUNEZERO','Elias');
INSERT INTO "liststudent" VALUES('15/08842','MUNEZERO','Innoncent');
INSERT INTO "liststudent" VALUES('15/08843','MUKURARINDA','Jean Claude');
INSERT INTO "liststudent" VALUES('15/08844','NDARUZANIYE','Sylvetsre');
INSERT INTO "liststudent" VALUES('15/08845','MUNEZERO','Elias');
INSERT INTO "liststudent" VALUES('15/08846','MUNEZERO','Innoncent');
INSERT INTO "liststudent" VALUES('15/08847','MUKURARINDA','Jean Claude');
INSERT INTO "liststudent" VALUES('15/08848','NDARUZANIYE','Sylvetsre');
INSERT INTO "liststudent" VALUES('15/08849','KARENZO','Sylvain');
INSERT INTO "liststudent" VALUES('15/08850','KEZA','Constantin');
INSERT INTO "liststudent" VALUES('15/08851','KEZAKIMANA','Yvone');
INSERT INTO "liststudent" VALUES('15/08852','KEZIMANA','Gloria Parfaite');
INSERT INTO "liststudent" VALUES('15/08853','MUCAMO','Levi');
INSERT INTO "liststudent" VALUES('15/08854','MUGISHA','Edith');
INSERT INTO "liststudent" VALUES('15/08855','MUGISHA','Daniella');
INSERT INTO "liststudent" VALUES('15/08856','NDAGIJIMANA','J. Claude');
INSERT INTO "liststudent" VALUES('15/08857','TUYUMVIRE','Claver');
INSERT INTO "liststudent" VALUES('15/08858','SINIREMERA','Francine');
INSERT INTO "liststudent" VALUES('15/08859','SINDAYIGAYA','Venuste');
INSERT INTO "liststudent" VALUES('15/08860','SINAMUZIGA','Renovat');
INSERT INTO "liststudent" VALUES('15/08861','NIYONSABA','Aplhonse');
INSERT INTO "liststudent" VALUES('15/08862','NIYONSABA','Gaspard');
INSERT INTO "liststudent" VALUES('15/08863','NIYONSABA','Eliole');
INSERT INTO "liststudent" VALUES('15/08864','NIYONSABA','Pascal');
INSERT INTO "liststudent" VALUES('15/08865','NIYONGABO','J. Claude');
INSERT INTO "liststudent" VALUES('15/08866','NIYONGERE','Ambroise');
INSERT INTO "liststudent" VALUES('15/08867','NIYONSABA','Alphonse');
INSERT INTO "liststudent" VALUES('15/08868','NIYONIZEYE','Channelle');
INSERT INTO "liststudent" VALUES('15/08869','KAGABO','Jean Marie');
CREATE TABLE markstable (departmentId INTEGER,classId INTEGER, courseId INTEGER, studentId TEXT, courseCredit INTEGER, 
marks REAL,PRIMARY KEY(studentId,courseId));
CREATE TABLE semester(semesterId INTEGER PRIMARY KEY, semesterName TEXT,
levelName TEXT);
INSERT INTO "semester" VALUES(1,'Semester 1','BAC');
INSERT INTO "semester" VALUES(2,'Semester 2','BAC');
INSERT INTO "semester" VALUES(3,'Semester 3','BAC');
INSERT INTO "semester" VALUES(4,'Semester 4','BAC');
INSERT INTO "semester" VALUES(5,'Semester 5','Master');
INSERT INTO "semester" VALUES(6,'Semester 6','Master');
INSERT INTO "semester" VALUES(7,'Semester 7','Master');
INSERT INTO "semester" VALUES(8,'Semester 8','Master');
CREATE TABLE maquette(courseId TEXT PRIMARY KEY,
cm REAL,
td REAL,
tp REAL,
vhp REAL,
tpe REAL,
tge REAL
);
CREATE TABLE yearstatus(classId INTEGER,yearstatId INTEGER,departmentId INTEGER,currenttime DATE,PRIMARY KEY(classId,departmentId,yearstatId));
INSERT INTO "yearstatus" VALUES(1,1,1,'2017-10-12');
INSERT INTO "yearstatus" VALUES(1,1,2,'2017-10-12');
INSERT INTO "yearstatus" VALUES(2,0,1,'2016-1-12');
INSERT INTO "yearstatus" VALUES(3,0,1,'2016-1-9');
INSERT INTO "yearstatus" VALUES(3,1,1,'2016-1-9');
INSERT INTO "yearstatus" VALUES(2,1,1,'2017-1-9');
INSERT INTO "yearstatus" VALUES(1,0,1,'2017-1-9');
INSERT INTO "yearstatus" VALUES(1,0,2,'2017-1-9');
INSERT INTO "yearstatus" VALUES(1,0,3,'2017-1-9');
INSERT INTO "yearstatus" VALUES(1,1,3,'2017-10-19');
INSERT INTO "yearstatus" VALUES(2,0,3,'2016-5-19');
INSERT INTO "yearstatus" VALUES(2,1,3,'2017-3-12');
CREATE TABLE yearstatusvalue(yearstatId INTEGER,statusvalue TEXT,FOREIGN KEY(yearstatId) REFERENCES yearstatus);
INSERT INTO "yearstatusvalue" VALUES(0,'Pending');
INSERT INTO "yearstatusvalue" VALUES(1,'Completed');
INSERT INTO "yearstatusvalue" VALUES(0,'Pending');
INSERT INTO "yearstatusvalue" VALUES(1,'Completed');
INSERT INTO "yearstatusvalue" VALUES(0,'Pending');
INSERT INTO "yearstatusvalue" VALUES(1,'Completed');
INSERT INTO "yearstatusvalue" VALUES(0,'Pending');
INSERT INTO "yearstatusvalue" VALUES(1,'Completed');
INSERT INTO "yearstatusvalue" VALUES(0,'Pending');
INSERT INTO "yearstatusvalue" VALUES(1,'Completed');
INSERT INTO "yearstatusvalue" VALUES(0,'Pending');
INSERT INTO "yearstatusvalue" VALUES(1,'Completed');
CREATE TABLE studentreference(studentId TEXT NOT NULL UNIQUE,facultyId INTEGER,departmentId INTEGER,classId INTEGER,PRIMARY KEY(studentId,departmentId,classId),FOREIGN KEY(studentId) REFERENCES liststudent,FOREIGN KEY(departmentId) REFERENCES department,FOREIGN KEY(classId) REFERENCES classtable);
INSERT INTO "studentreference" VALUES('15/08821',1,0,1);
INSERT INTO "studentreference" VALUES('15/08822',1,0,1);
INSERT INTO "studentreference" VALUES('15/08823',1,0,1);
INSERT INTO "studentreference" VALUES('15/08824',1,0,1);
INSERT INTO "studentreference" VALUES('15/08825',1,1,2);
INSERT INTO "studentreference" VALUES('15/08826',1,1,2);
INSERT INTO "studentreference" VALUES('15/08827',1,1,2);
INSERT INTO "studentreference" VALUES('15/08828',1,1,2);
INSERT INTO "studentreference" VALUES('15/08829',1,1,3);
INSERT INTO "studentreference" VALUES('15/08830',1,1,3);
INSERT INTO "studentreference" VALUES('15/08831',1,1,3);
INSERT INTO "studentreference" VALUES('15/08832',1,1,3);
INSERT INTO "studentreference" VALUES('15/08833',1,2,2);
INSERT INTO "studentreference" VALUES('15/08834',1,2,2);
INSERT INTO "studentreference" VALUES('15/08835',1,2,2);
INSERT INTO "studentreference" VALUES('15/08836',1,2,2);
INSERT INTO "studentreference" VALUES('15/08837',1,2,3);
INSERT INTO "studentreference" VALUES('15/08838',1,2,3);
INSERT INTO "studentreference" VALUES('15/08839',1,2,3);
INSERT INTO "studentreference" VALUES('15/08840',1,2,3);
INSERT INTO "studentreference" VALUES('15/08841',1,3,2);
INSERT INTO "studentreference" VALUES('15/08842',1,3,2);
INSERT INTO "studentreference" VALUES('15/08843',1,3,2);
INSERT INTO "studentreference" VALUES('15/08844',1,3,2);
INSERT INTO "studentreference" VALUES('15/08845',1,3,3);
INSERT INTO "studentreference" VALUES('15/08846',1,3,3);
INSERT INTO "studentreference" VALUES('15/08847',1,3,3);
INSERT INTO "studentreference" VALUES('15/08848',1,3,3);
INSERT INTO "studentreference" VALUES('15/08849',1,4,2);
INSERT INTO "studentreference" VALUES('15/08850',1,4,2);
INSERT INTO "studentreference" VALUES('15/08851',1,4,2);
INSERT INTO "studentreference" VALUES('15/08852',1,4,2);
INSERT INTO "studentreference" VALUES('15/08853',1,4,3);
INSERT INTO "studentreference" VALUES('15/08854',1,4,3);
INSERT INTO "studentreference" VALUES('15/08855',1,4,3);
INSERT INTO "studentreference" VALUES('15/08856',1,4,3);
INSERT INTO "studentreference" VALUES('15/08857',1,5,2);
INSERT INTO "studentreference" VALUES('15/08858',1,5,2);
INSERT INTO "studentreference" VALUES('15/08859',1,5,2);
INSERT INTO "studentreference" VALUES('15/08860',1,5,2);
INSERT INTO "studentreference" VALUES('15/08861',1,5,3);
INSERT INTO "studentreference" VALUES('15/08862',1,5,3);
INSERT INTO "studentreference" VALUES('15/08863',1,5,3);
INSERT INTO "studentreference" VALUES('15/08864',1,5,3);
INSERT INTO "studentreference" VALUES('15/08865',1,6,2);
INSERT INTO "studentreference" VALUES('15/08866',1,6,2);
INSERT INTO "studentreference" VALUES('15/08867',1,6,2);
INSERT INTO "studentreference" VALUES('15/08868',1,6,2);
INSERT INTO "studentreference" VALUES('15/08869',1,6,3);
CREATE TABLE uetabe(ueId TEXT PRIMARY KEY,uename TEXT);
INSERT INTO "uetabe" VALUES('MAIV','Math appli IV');
INSERT INTO "uetabe" VALUES('PTH2','Physique Theorique');
INSERT INTO "uetabe" VALUES('PAP3','Physique Approfondie');
INSERT INTO "uetabe" VALUES('SMA4','Sciences de la matiere');
INSERT INTO "uetabe" VALUES('SUN5','Sciences de l''Univers');
INSERT INTO "uetabe" VALUES('ELE6','Electricite');
INSERT INTO "uetabe" VALUES('SPR7','Stage et projet');
INSERT INTO "uetabe" VALUES('MFOI','Mathematiques Fondamentales I');
INSERT INTO "uetabe" VALUES('PHYI','Physique I');
INSERT INTO "uetabe" VALUES('COA1','Cours d''Appui');
INSERT INTO "uetabe" VALUES('MFOII','Mathematiques Fondamentales II');
INSERT INTO "uetabe" VALUES('MAI','Mathematiques Appliquees I');
INSERT INTO "uetabe" VALUES('SUNI','Sciences de l''Univers');
INSERT INTO "uetabe" VALUES('MFOIII','Mathematiques Fondamentale III');
INSERT INTO "uetabe" VALUES('PHYII','Physique II');
INSERT INTO "uetabe" VALUES('MAII','Mathematiques Appliquees II');
INSERT INTO "uetabe" VALUES('MAIII','Mathematiques Appliquees III');
INSERT INTO "uetabe" VALUES('PHYIII','Physique III');
INSERT INTO "uetabe" VALUES('COA2','Cours d''appui');
CREATE TABLE classue(departmentId INTEGER,classId INTEGER,facultyId INTEGER,ueId TEXT,PRIMARY KEY(departmentId,classId,ueId) );
INSERT INTO "classue" VALUES(6,1,1,'PHY1101');
INSERT INTO "classue" VALUES(6,1,1,'PHY1102');
INSERT INTO "classue" VALUES(6,1,1,'PHY1103');
INSERT INTO "classue" VALUES(6,1,1,'PHY1104');
INSERT INTO "classue" VALUES(6,1,1,'PHY1105');
INSERT INTO "classue" VALUES(6,1,1,'PHY1106');
INSERT INTO "classue" VALUES(6,1,1,'PHY1207');
INSERT INTO "classue" VALUES(6,1,1,'PHY1208');
INSERT INTO "classue" VALUES(6,1,1,'PHY1209');
INSERT INTO "classue" VALUES(6,1,1,'PHY1210');
INSERT INTO "classue" VALUES(6,1,1,'PHY1211');
INSERT INTO "classue" VALUES(6,1,1,'PHY1212');
INSERT INTO "classue" VALUES(6,1,1,'PHY1213');
INSERT INTO "classue" VALUES(6,3,1,'MAT3101');
INSERT INTO "classue" VALUES(6,3,1,'MAT3102');
INSERT INTO "classue" VALUES(6,3,1,'MAT3103');
INSERT INTO "classue" VALUES(6,3,1,'PHY3104');
INSERT INTO "classue" VALUES(6,3,1,'PHY3105');
INSERT INTO "classue" VALUES(6,3,1,'PHY3106');
INSERT INTO "classue" VALUES(6,3,1,'PHY3107');
INSERT INTO "classue" VALUES(6,3,1,'PHY3108');
INSERT INTO "classue" VALUES(6,3,1,'PHY3109');
INSERT INTO "classue" VALUES(6,3,1,'PHY3210');
INSERT INTO "classue" VALUES(6,3,1,'CHI3211');
INSERT INTO "classue" VALUES(6,3,1,'CHI3212');
INSERT INTO "classue" VALUES(6,3,1,'PHY3213');
INSERT INTO "classue" VALUES(6,3,1,'PHY3214');
INSERT INTO "classue" VALUES(6,3,1,'PHY3215');
INSERT INTO "classue" VALUES(6,3,1,'PHY3216');
INSERT INTO "classue" VALUES(6,3,1,'PHY3217');
INSERT INTO "classue" VALUES(6,3,1,'PHY3218');
INSERT INTO "classue" VALUES(6,3,1,'PHY3219');
INSERT INTO "classue" VALUES(6,3,1,'PHY3220');
INSERT INTO "classue" VALUES(6,2,1,'MAT2101');
INSERT INTO "classue" VALUES(6,2,1,'MAT2102');
INSERT INTO "classue" VALUES(6,2,1,'PHY2103');
INSERT INTO "classue" VALUES(6,2,1,'PHY2104');
INSERT INTO "classue" VALUES(6,2,1,'PHY2105');
INSERT INTO "classue" VALUES(6,2,1,'PHY2106');
INSERT INTO "classue" VALUES(6,2,1,'MAT2207');
INSERT INTO "classue" VALUES(6,2,1,'MAT2208');
INSERT INTO "classue" VALUES(6,2,1,'MAT2209');
INSERT INTO "classue" VALUES(6,2,1,'INF2210');
INSERT INTO "classue" VALUES(6,2,1,'PHY2211');
INSERT INTO "classue" VALUES(6,2,1,'PHY2212');
INSERT INTO "classue" VALUES(6,2,1,'CHI2213');
INSERT INTO "classue" VALUES(6,2,1,'LAN2214');
CREATE TABLE uecourse(courseId TEXT, ueId TEXT,PRIMARY KEY(courseId,ueId));
INSERT INTO "uecourse" VALUES('MAT3101','MAIV');
INSERT INTO "uecourse" VALUES('MAT3102','MAIV');
INSERT INTO "uecourse" VALUES('MAT3103','MAIV');
INSERT INTO "uecourse" VALUES('PHY3104','PTH2');
INSERT INTO "uecourse" VALUES('PHY3105','PTH2');
INSERT INTO "uecourse" VALUES('PHY3106','PTH2');
INSERT INTO "uecourse" VALUES('PHY3107','PAP3');
INSERT INTO "uecourse" VALUES('PHY3108','PAP3');
INSERT INTO "uecourse" VALUES('PHY3109','PAP3');
INSERT INTO "uecourse" VALUES('PHY3210','SMA4');
INSERT INTO "uecourse" VALUES('CHI3211','SMA4');
INSERT INTO "uecourse" VALUES('CHI3212','SMA4');
INSERT INTO "uecourse" VALUES('PHY3213','SMA4');
INSERT INTO "uecourse" VALUES('PHY3214','SUN3');
INSERT INTO "uecourse" VALUES('PHY3215','SUN3');
INSERT INTO "uecourse" VALUES('PHY3216','ELE6');
INSERT INTO "uecourse" VALUES('PHY3217','ELE6');
INSERT INTO "uecourse" VALUES('PHY3218','SPR7');
INSERT INTO "uecourse" VALUES('PHY3219','SPR7');
INSERT INTO "uecourse" VALUES('PHY3220','SPR7');
INSERT INTO "uecourse" VALUES('PHY1101','MFOI');
INSERT INTO "uecourse" VALUES('PHY1102','MFOI');
INSERT INTO "uecourse" VALUES('PHY1103','PHYI');
INSERT INTO "uecourse" VALUES('PHY1104','PHYI');
INSERT INTO "uecourse" VALUES('PHY1105','COA1');
INSERT INTO "uecourse" VALUES('PHY1106','COA1');
INSERT INTO "uecourse" VALUES('PHY1207','MFOII');
INSERT INTO "uecourse" VALUES('PHY1208','MFOII');
INSERT INTO "uecourse" VALUES('PHY1209','MAI');
INSERT INTO "uecourse" VALUES('PHY1210','MAI');
INSERT INTO "uecourse" VALUES('PHY1211','SUNI');
INSERT INTO "uecourse" VALUES('PHY1212','SUNI');
INSERT INTO "uecourse" VALUES('PHY1213','SUNI');
INSERT INTO "uecourse" VALUES('MAT2101','MFOII');
INSERT INTO "uecourse" VALUES('MAT2102','MFOII');
INSERT INTO "uecourse" VALUES('PHY2103','PHYII');
INSERT INTO "uecourse" VALUES('PHY2104','PHYII');
INSERT INTO "uecourse" VALUES('PHY2105','PHYII');
INSERT INTO "uecourse" VALUES('PHY2106','PHYII');
INSERT INTO "uecourse" VALUES('MAT2207','MAII');
INSERT INTO "uecourse" VALUES('MAT2208','MAII');
INSERT INTO "uecourse" VALUES('MAT2209','MAIII');
INSERT INTO "uecourse" VALUES('INF2210','MAII');
INSERT INTO "uecourse" VALUES('PHY2211','PHYIII');
INSERT INTO "uecourse" VALUES('PHY2212','PHYIII');
INSERT INTO "uecourse" VALUES('CHI2213','COA2');
INSERT INTO "uecourse" VALUES('LAN2214','COA2');
CREATE TABLE coursetable(courseId TEXT PRIMARY KEY,
courseName TEXT NOT NULL,
departmentId INTEGER,
credit INTEGER,
semesterId INTEGE);
INSERT INTO "coursetable" VALUES('MAT2101','Analyse Avancee pour Physiciens',6,4,3);
INSERT INTO "coursetable" VALUES('MAT2102','Algebre II',6,6,3);
INSERT INTO "coursetable" VALUES('PHY2103','Electricite et Magnetisme',6,7,3);
INSERT INTO "coursetable" VALUES('PHY2104','Ondes',6,3,3);
INSERT INTO "coursetable" VALUES('PHY2105','Calcul des Circuits Electriques',6,3,3);
INSERT INTO "coursetable" VALUES('PHY2106','Mecanique Analytique II',6,7,3);
INSERT INTO "coursetable" VALUES('MAT2207','Analyse Complexe',6,4,4);
INSERT INTO "coursetable" VALUES('MAT2208','Equations Differentielles',6,6,4);
INSERT INTO "coursetable" VALUES('MAT2209','Probabilite et Statistique',6,5,4);
INSERT INTO "coursetable" VALUES('INF2210','Algorithmique II et Programmation',6,6,4);
INSERT INTO "coursetable" VALUES('PHY2211','Physique Statistique',6,2,4);
INSERT INTO "coursetable" VALUES('PHY2212','Introduction a la Mecanique Quantique',6,3,4);
INSERT INTO "coursetable" VALUES('CHI2213','Chimie Generale I',6,2,4);
INSERT INTO "coursetable" VALUES('LAN2214','Anglais II',6,2,4);
INSERT INTO "coursetable" VALUES('PHY1101','Analyse I',6,6,1);
INSERT INTO "coursetable" VALUES('PHY1102','Algebre',6,6,1);
INSERT INTO "coursetable" VALUES('PHY1103','Physique Generale I',6,9,1);
INSERT INTO "coursetable" VALUES('PHY1104','Mecanique Analytique I',6,5,1);
INSERT INTO "coursetable" VALUES('PHY1105','Anglais I',6,2,1);
INSERT INTO "coursetable" VALUES('PHY1207','Analyse II',6,7,2);
INSERT INTO "coursetable" VALUES('PHY1208','Geometrie I',6,7,2);
INSERT INTO "coursetable" VALUES('PHY1209','Calcul Numerique et Programmation',6,3,2);
INSERT INTO "coursetable" VALUES('PHY1210','Algorithmique',6,7,2);
INSERT INTO "coursetable" VALUES('PHY1212','Astronomie',6,2,2);
INSERT INTO "coursetable" VALUES('PHY1213','Chimie Generale I',6,2,2);
INSERT INTO "coursetable" VALUES('PHY1211','Introduction aux Sciences de la terre',6,2,2);
INSERT INTO "coursetable" VALUES('PHY1106','Initiation a l''Informatique',6,2,1);
INSERT INTO "coursetable" VALUES('MAT3101','Methode maths de la physique',6,5,5);
INSERT INTO "coursetable" VALUES('MAT3102','Theorie de la Mesure',6,3,5);
INSERT INTO "coursetable" VALUES('MAT3103','Analyse Numerique et Programmation',6,3,5);
INSERT INTO "coursetable" VALUES('PHY3104','Mecanique Analytique III',6,3,5);
INSERT INTO "coursetable" VALUES('PHY3105','Physique Nucleaire',6,3,5);
INSERT INTO "coursetable" VALUES('PHY3107','Electrodynamique Classique',6,3,5);
INSERT INTO "coursetable" VALUES('PHY3106','Mecanique Quantique Non-Relativiste',6,4,5);
INSERT INTO "coursetable" VALUES('PHY3108','Relativité Restreinte',6,3,5);
INSERT INTO "coursetable" VALUES('PHY3109','Physique du Solide I',6,3,5);
INSERT INTO "coursetable" VALUES('PHY3210','Physique Atomique et Moleculaire',6,4,6);
INSERT INTO "coursetable" VALUES('CHI3211','Chimie Generale II',6,2,6);
INSERT INTO "coursetable" VALUES('CHI3212','Chimmie Physique',6,3,6);
INSERT INTO "coursetable" VALUES('PHY3213','Spectroscopie Instrumentale',6,2,6);
INSERT INTO "coursetable" VALUES('PHY3214','Astrophysique',6,2,6);
INSERT INTO "coursetable" VALUES('PHY3215','Physique et Chimie de l''Atmosphere',6,2,6);
INSERT INTO "coursetable" VALUES('PHY3216','Electronique',6,4,6);
INSERT INTO "coursetable" VALUES('PHY3217','Mesures Electriques',6,2,6);
INSERT INTO "coursetable" VALUES('PHY3218','Travaux Pratiques Integres',6,2,6);
INSERT INTO "coursetable" VALUES('PHY3219','Seminaire',6,2,6);
INSERT INTO "coursetable" VALUES('PHY3220','Projet Personel',6,5,6);
INSERT INTO "coursetable" VALUES('MAT1101','Analyse I',5,6,1);
INSERT INTO "coursetable" VALUES('MAT1102','Algèbre I',5,6,1);
INSERT INTO "coursetable" VALUES('MAT1103','Physique Générale I',5,9,1);
INSERT INTO "coursetable" VALUES('MAT1104','Mécanique Analytique I',5,5,1);
INSERT INTO "coursetable" VALUES('MAT1105','Anglais I',5,2,1);
INSERT INTO "coursetable" VALUES('MAT1106','Initiation à l’Informatique',5,2,1);
CREATE TABLE markssynthesis(studentId TEXT,departmentId INTEGER,classId INTEGER,courseId TEXT,ueId TEXT,marks REAL,credit REAL,
PRIMARY KEY(studentId,departmentId,classID,courseId));
INSERT INTO "markssynthesis" VALUES('15/08821',6,1,'PHY1101','MFOI',12.5,6.0);
INSERT INTO "markssynthesis" VALUES('15/08822',6,1,'PHY1101','MFOI',14.0,6.0);
INSERT INTO "markssynthesis" VALUES('15/08823',6,1,'PHY1101','MFOI',13.5,6.0);
INSERT INTO "markssynthesis" VALUES('15/08821',6,1,'PHY1102','MFOI',14.5,6.0);
INSERT INTO "markssynthesis" VALUES('15/08822',6,1,'PHY1102','MFOI',16.0,6.0);
INSERT INTO "markssynthesis" VALUES('15/08823',6,1,'PHY1102','MFOI',12.5,6.0);
INSERT INTO "markssynthesis" VALUES('15/08821',6,1,'PHY1103','PHYI',11.0,6.0);
INSERT INTO "markssynthesis" VALUES('15/08822',6,1,'PHY1103','PHYI',17.0,6.0);
INSERT INTO "markssynthesis" VALUES('15/08823',6,1,'PHY1103','PHYI',15.5,6.0);
INSERT INTO "markssynthesis" VALUES('15/08821',6,1,'PHY1104','PHYI',11.0,6.0);
INSERT INTO "markssynthesis" VALUES('15/08822',6,1,'PHY1104','PHYI',12.0,6.0);
INSERT INTO "markssynthesis" VALUES('15/08823',6,1,'PHY1104','PHYI',16.5,6.0);
INSERT INTO "markssynthesis" VALUES('15/08821',6,1,'PHY1105','COA1',15.5,6.0);
INSERT INTO "markssynthesis" VALUES('15/08822',6,1,'PHY1105','COA1',12.0,6.0);
INSERT INTO "markssynthesis" VALUES('15/08823',6,1,'PHY1105','COA1',16.5,6.0);
INSERT INTO "markssynthesis" VALUES('15/08821',6,1,'PHY1106','COA1',15.0,6.0);
INSERT INTO "markssynthesis" VALUES('15/08822',6,1,'PHY1106','COA1',12.5,6.0);
INSERT INTO "markssynthesis" VALUES('15/08823',6,1,'PHY1106','COA1',16.0,6.0);
INSERT INTO "markssynthesis" VALUES('15/08824',6,3,'MAT3101','MAIV',17.0,5.0);
INSERT INTO "markssynthesis" VALUES('15/08825',6,3,'MAT3101','MAIV',17.0,5.0);
INSERT INTO "markssynthesis" VALUES('15/08826',6,3,'MAT3101','MAIV',4.0,5.0);
INSERT INTO "markssynthesis" VALUES('15/08824',6,3,'MAT3102','MAIV',5.0,3.0);
INSERT INTO "markssynthesis" VALUES('15/08825',6,3,'MAT3102','MAIV',18.0,3.0);
INSERT INTO "markssynthesis" VALUES('15/08826',6,3,'MAT3102','MAIV',12.0,3.0);
INSERT INTO "markssynthesis" VALUES('15/08824',6,3,'MAT3103','MAIV',5.2,3.0);
INSERT INTO "markssynthesis" VALUES('15/08825',6,3,'MAT3103','MAIV',14.5,3.0);
INSERT INTO "markssynthesis" VALUES('15/08826',6,3,'MAT3103','MAIV',18.5,3.0);
INSERT INTO "markssynthesis" VALUES('15/08824',6,3,'MAT3104','PTH2',11.3,3.0);
INSERT INTO "markssynthesis" VALUES('15/08825',6,3,'MAT3104','PTH2',16.5,3.0);
INSERT INTO "markssynthesis" VALUES('15/08826',6,3,'MAT3104','PTH2',17.4,3.0);
INSERT INTO "markssynthesis" VALUES('15/08824',6,3,'PHY3105','PTH2',17.0,3.0);
INSERT INTO "markssynthesis" VALUES('15/08825',6,3,'PHY3105','PTH2',10.0,3.0);
INSERT INTO "markssynthesis" VALUES('15/08826',6,3,'PHY3105','PTH2',9.0,3.0);
INSERT INTO "markssynthesis" VALUES('15/08824',6,3,'PHY3106','PTH2',10.0,4.0);
INSERT INTO "markssynthesis" VALUES('15/08825',6,3,'PHY3106','PTH2',16.0,4.0);
INSERT INTO "markssynthesis" VALUES('15/08826',6,3,'PHY3106','PTH2',7.0,4.0);
CREATE TABLE marksummarysettings (departmentId INTEGER, classId INTEGER, courseId TEXT NOT NULL, uenumber INTEGER,coursenumber INTEGER, PRIMARY KEY(classId,courseId,uenumber));
INSERT INTO "marksummarysettings" VALUES(6,1,'PHY1101',1,1);
INSERT INTO "marksummarysettings" VALUES(6,1,'PHY1102',1,2);
INSERT INTO "marksummarysettings" VALUES(6,1,'PHY1103',1,3);
INSERT INTO "marksummarysettings" VALUES(6,1,'PHY1104',2,4);
INSERT INTO "marksummarysettings" VALUES(6,1,'PHY1105',2,5);
INSERT INTO "marksummarysettings" VALUES(6,1,'PHY1207',3,7);
INSERT INTO "marksummarysettings" VALUES(6,2,'PHY1213',1,1);
INSERT INTO "marksummarysettings" VALUES(6,2,'INF2210',1,2);
INSERT INTO "marksummarysettings" VALUES(6,2,'LAN2214',2,3);
INSERT INTO "marksummarysettings" VALUES(6,2,'MAT2101',2,4);
INSERT INTO "marksummarysettings" VALUES(6,2,'MAT2102',3,4);
INSERT INTO "marksummarysettings" VALUES(6,2,'MAT2207',4,6);
INSERT INTO "marksummarysettings" VALUES(6,2,'MAT2208',4,7);
INSERT INTO "marksummarysettings" VALUES(6,2,'MAT2209',5,8);
INSERT INTO "marksummarysettings" VALUES(6,2,'PHY2103',6,9);
INSERT INTO "marksummarysettings" VALUES(6,2,'PHY2104',6,10);
INSERT INTO "marksummarysettings" VALUES(6,2,'PHY2105',6,11);
INSERT INTO "marksummarysettings" VALUES(6,2,'PHY2106',7,12);
INSERT INTO "marksummarysettings" VALUES(6,3,'CHI3211',1,1);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('faculty',10);
INSERT INTO "sqlite_sequence" VALUES('classtable',3);
INSERT INTO "sqlite_sequence" VALUES('ENSEIGNANT',11);
INSERT INTO "sqlite_sequence" VALUES('campusLocation',5);
INSERT INTO "sqlite_sequence" VALUES('department',6);
INSERT INTO "sqlite_sequence" VALUES('COURSE',170);
INSERT INTO "sqlite_sequence" VALUES('CLASS',7);
INSERT INTO "sqlite_sequence" VALUES('facultydepartment',987653241);
INSERT INTO "sqlite_sequence" VALUES('liststudent1',987653241);
INSERT INTO "sqlite_sequence" VALUES('liststudent',7612);
COMMIT;
