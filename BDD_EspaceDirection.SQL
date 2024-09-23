CREATE TABLE SessionUniteFormation
(
	idSessionUniteFormation INTEGER NOT NULL AUTO_INCREMENT,
	idUniteFormation INTEGER NOT NULL,
	idSession INTEGER NOT NULL,
	nombreInscrit BIGINT NOT NULL,
	PRIMARY KEY (idSessionUniteFormation),
	KEY (idSession),
	KEY (idUniteFormation)
) 
;


CREATE TABLE TypeEvaluation
(
	idTypeEvaluation INTEGER NOT NULL AUTO_INCREMENT,
	libelleTypeEvaluation VARCHAR(50) NOT NULL,
	PRIMARY KEY (idTypeEvaluation)
) 
;


CREATE TABLE Categorie
(
	idCategorie INTEGER NOT NULL,
	libelleCategorie VARCHAR(50) NOT NULL,
	PRIMARY KEY (idCategorie)
) 
;


CREATE TABLE Message
(
	idMessage INTEGER NOT NULL AUTO_INCREMENT,
	libelleMessage VARCHAR(50) NOT NULL,
	idActivite INTEGER NOT NULL,
	idActivite2 INTEGER NOT NULL,
	PRIMARY KEY (idMessage),
	KEY (idActivite2)
) 
;


CREATE TABLE ActiviteEvaluation
(
	idActiviteEvaluation INTEGER NOT NULL AUTO_INCREMENT,
	idActivite INTEGER NOT NULL,
	idEvalution INTEGER NOT NULL,
	PRIMARY KEY (idActiviteEvaluation),
	KEY (idActivite),
	KEY (idEvalution)
) 
;


CREATE TABLE FormateurUniteFormation
(
	idFormateurUniteFormation INTEGER NOT NULL AUTO_INCREMENT,
	dateFormateurUniteFormation DATE NOT NULL,
	idFormateur INTEGER NOT NULL,
	idUniteFormation INTEGER NOT NULL,
	PRIMARY KEY (idFormateurUniteFormation),
	KEY (idFormateur),
	KEY (idUniteFormation)
) 
;


CREATE TABLE Activite
(
	idActivite INTEGER NOT NULL AUTO_INCREMENT,
	libelleActivite VARCHAR(50) NOT NULL,
	idInscription INTEGER NOT NULL,
	idCours INTEGER NOT NULL,
	PRIMARY KEY (idActivite),
	KEY (idCours),
	KEY (idInscription)
) 
;


CREATE TABLE Session
(
	idSession INTEGER NOT NULL AUTO_INCREMENT,
	dateDebutSession DATE NOT NULL,
	dateFinSession DATE NOT NULL,
	nomSession VARCHAR(50) NOT NULL,
	statutSession VARCHAR(50) NOT NULL,
	PRIMARY KEY (idSession)
) 
;


CREATE TABLE Entreprise
(
	idEntreprise INTEGER NOT NULL AUTO_INCREMENT,
	nomEntreprise VARCHAR(50) NOT NULL,
	adresseEntreprise VARCHAR(50) NOT NULL,
	mailEntreprise VARCHAR(50) NOT NULL,
	telephoneEntreprise VARCHAR(50) NOT NULL,
	activitePrincipaleEntreprise VARCHAR(200) NOT NULL,
	PRIMARY KEY (idEntreprise)
) 
;


CREATE TABLE TypeSupport
(
	idTypeSupport INTEGER NOT NULL AUTO_INCREMENT,
	libelleTypeSupport VARCHAR(50) NOT NULL,
	PRIMARY KEY (idTypeSupport)
) 
;


CREATE TABLE Support
(
	idSupport INTEGER NOT NULL AUTO_INCREMENT,
	libelleSupport VARCHAR(50) NOT NULL,
	idCours INTEGER NOT NULL,
	idTypeSupport INTEGER NOT NULL,
	PRIMARY KEY (idSupport),
	KEY (idCours),
	KEY (idTypeSupport)
) 
;


CREATE TABLE Inscription
(
	idInscription INTEGER NOT NULL AUTO_INCREMENT,
	dateInscription DATE NOT NULL,
	idClient INTEGER NOT NULL,
	idSessionUniteFormation INTEGER NOT NULL,
	PRIMARY KEY (idInscription),
	KEY (idClient),
	KEY (idSessionUniteFormation)
) 
;


CREATE TABLE Evaluation
(
	idEvaluation INTEGER NOT NULL AUTO_INCREMENT,
	libelleEvaluation VARCHAR(50) NOT NULL,
	noteEvaluation DOUBLE NOT NULL,
	idCours INTEGER NOT NULL,
	idTypeEvaluation  INTEGER NOT NULL,
	PRIMARY KEY (idEvaluation),
	KEY (idCours),
	KEY (idTypeEvaluation )
) 
;


CREATE TABLE Formateur
(
	idFormateur INTEGER NOT NULL AUTO_INCREMENT,
	nomFormateur VARCHAR(50) NOT NULL,
	prenomFormateur VARCHAR(50) NOT NULL,
	telephoneFormateur VARCHAR(50) NOT NULL,
	mailFormateur VARCHAR(50) NOT NULL,
	PRIMARY KEY (idFormateur)
) 
;


CREATE TABLE Cours
(
	idCours INTEGER NOT NULL AUTO_INCREMENT,
	intutileCours VARCHAR(50) NOT NULL,
	idUniteFormation INTEGER NOT NULL,
	PRIMARY KEY (idCours),
	KEY (idUniteFormation)
) 
;


CREATE TABLE UniteFormation
(
	idUniteFormation  INTEGER NOT NULL AUTO_INCREMENT,
	libelleUniteFormation VARCHAR(50) NOT NULL,
	prixUniteFormation FLOAT(24) NOT NULL,
	idCategorie INTEGER NOT NULL,
	PRIMARY KEY (idUniteFormation ),
	KEY (idCategorie)
) 
;


CREATE TABLE typeClient
(
	idTypeClient INTEGER NOT NULL AUTO_INCREMENT,
	libelleTypeClient VARCHAR(50) NOT NULL,
	PRIMARY KEY (idTypeClient)
) 
;


CREATE TABLE client
(
	idClient INTEGER NOT NULL AUTO_INCREMENT,
	nomClient VARCHAR(50) NOT NULL,
	prenomClient VARCHAR(50) NOT NULL,
	mailClient VARCHAR(50) NOT NULL,
	telephoneClient VARCHAR(15) NOT NULL,
	idTypeClient INTEGER NOT NULL,
	idEntreprise INTEGER NOT NULL,
	PRIMARY KEY (idClient),
	KEY (idEntreprise),
	KEY (idTypeClient)
) 
;





ALTER TABLE SessionUniteFormation ADD CONSTRAINT FK_SessionUniteFormation_Session/Periode 
	FOREIGN KEY (idSession) REFERENCES Session/Periode (idSession)
;

ALTER TABLE SessionUniteFormation ADD CONSTRAINT FK_SessionUniteFormation_UniteFormation 
	FOREIGN KEY (idUniteFormation) REFERENCES UniteFormation (idUniteFormation )
;

ALTER TABLE Message ADD CONSTRAINT FK_Message_Activite 
	FOREIGN KEY (idActivite) REFERENCES Activite (idActivite)
;
ALTER TABLE Message ADD CONSTRAINT FK_Message_Activite 
	FOREIGN KEY (idActivite2) REFERENCES Activite (idActivite)
;

ALTER TABLE ActiviteEvaluation ADD CONSTRAINT FK_ActiviteEvaluation_Activite 
	FOREIGN KEY (idActivite) REFERENCES Activite (idActivite)
;

ALTER TABLE ActiviteEvaluation ADD CONSTRAINT FK_ActiviteEvaluation_Evaluation 
	FOREIGN KEY (idEvalution) REFERENCES Evaluation (idEvaluation)
;

ALTER TABLE FormateurUniteFormation ADD CONSTRAINT FK_FormateurUniteFormation_Formateur 
	FOREIGN KEY (idFormateur) REFERENCES Formateur (idFormateur)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE FormateurUniteFormation ADD CONSTRAINT FK_FormateurUniteFormation_UniteFormation 
	FOREIGN KEY (idUniteFormation) REFERENCES UniteFormation (idUniteFormation )
;

ALTER TABLE Activite ADD CONSTRAINT FK_Activite_Cours 
	FOREIGN KEY (idCours) REFERENCES Cours (idCours)
;

ALTER TABLE Activite ADD CONSTRAINT FK_Activite_Inscription 
	FOREIGN KEY (idInscription) REFERENCES Inscription (idInscription)
;

ALTER TABLE Support ADD CONSTRAINT FK_Support_Cours 
	FOREIGN KEY (idCours) REFERENCES Cours (idCours)
;

ALTER TABLE Support ADD CONSTRAINT FK_Support_TypeSupport 
	FOREIGN KEY (idTypeSupport) REFERENCES TypeSupport (idTypeSupport)
;

ALTER TABLE Inscription ADD CONSTRAINT FK_Inscription_client 
	FOREIGN KEY (idClient) REFERENCES client (idClient)
;

ALTER TABLE Inscription ADD CONSTRAINT FK_Inscription_SessionUniteFormation 
	FOREIGN KEY (idSessionUniteFormation) REFERENCES SessionUniteFormation (idSessionUniteFormation)
;

ALTER TABLE Evaluation ADD CONSTRAINT FK_Evaluation_Cours 
	FOREIGN KEY (idCours) REFERENCES Cours (idCours)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Evaluation ADD CONSTRAINT FK_Evaluation_TypeEvaluation 
	FOREIGN KEY (idTypeEvaluation ) REFERENCES TypeEvaluation (idTypeEvaluation)
;

ALTER TABLE Cours ADD CONSTRAINT FK_Cours_UniteFormation 
	FOREIGN KEY (idUniteFormation) REFERENCES UniteFormation (idUniteFormation )
;

ALTER TABLE UniteFormation ADD CONSTRAINT FK_UniteFormation_Categorie 
	FOREIGN KEY (idCategorie) REFERENCES Categorie (idCategorie)
;

ALTER TABLE client ADD CONSTRAINT FK_client_Entreprise 
	FOREIGN KEY (idEntreprise) REFERENCES Entreprise (idEntreprise)
;

ALTER TABLE client ADD CONSTRAINT FK_client_typeClient 
	FOREIGN KEY (idTypeClient) REFERENCES typeClient (idTypeClient)
;
