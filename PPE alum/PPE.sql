DROP DATABASE IF EXISTS PPE;

CREATE DATABASE IF NOT EXISTS PPE;
USE PPE;
# -----------------------------------------------------------------------------
#       TABLE : FACTURE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FACTURE
 (
   NUMFAC VARCHAR(128) NOT NULL  ,
   NUMCOM INTEGER NOT NULL  ,
   MONTANT REAL(20,2) NULL  
   , PRIMARY KEY (NUMFAC) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE FACTURE
# -----------------------------------------------------------------------------


CREATE UNIQUE INDEX I_FK_FACTURE_COMMANDE
     ON FACTURE (NUMCOM ASC);

# -----------------------------------------------------------------------------
#       TABLE : DEVIS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DEVIS
 (
   IDDEVIS VARCHAR(10) NOT NULL  ,
   NUMCOM INTEGER NULL  ,
   IDCLIENT INTEGER NOT NULL  ,
   DATEDEVIS DATE NULL  ,
   ETATDEVIS VARCHAR(128) NULL  ,
   FRAIS_DEPLACEMENT REAL(5,2) NULL  
   , PRIMARY KEY (IDDEVIS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE DEVIS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_DEVIS_COMMANDE
     ON DEVIS (NUMCOM ASC);

CREATE  INDEX I_FK_DEVIS_CLIENT
     ON DEVIS (IDCLIENT ASC);

# -----------------------------------------------------------------------------
#       TABLE : COMMANDE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMMANDE
 (
   NUMCOM INTEGER NOT NULL  ,
   IDCLIENT INTEGER NOT NULL  ,
   DATECOM DATETIME NULL  
   , PRIMARY KEY (NUMCOM) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE COMMANDE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_COMMANDE_CLIENT
     ON COMMANDE (IDCLIENT ASC);

# -----------------------------------------------------------------------------
#       TABLE : USINE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS USINE
 (
   NUMU INTEGER NOT NULL auto_increment  ,
   NOMU VARCHAR(128) NULL  
   , PRIMARY KEY (NUMU) 
 ) 
 comment = "";
 insert into USINE values
  (null, 'SCHMITZ' ),
  (null, 'LANZONI SRL' ),
  (null, 'TECHMARK' );
# -----------------------------------------------------------------------------
#       TABLE : CLIENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLIENT
 (
   IDCLIENT INTEGER NOT NULL auto_increment  ,
   NOM VARCHAR(70) NULL  ,
   EMAIL CHAR(70) NULL UNIQUE ,
   TEL INTEGER NULL ,
   MDP VARCHAR(255) NOT NULL
   , PRIMARY KEY (IDCLIENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ENTREPRISE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ENTREPRISE
 (
   IDCLIENT INTEGER NOT NULL  ,
   SIREN CHAR(32) NULL  ,
   STATUT CHAR(32) NULL  ,
   NOM VARCHAR(70) NULL  ,
   EMAIL CHAR(70) NULL  ,
   TEL INTEGER NULL  
   , PRIMARY KEY (IDCLIENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : TECHNICIEN
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TECHNICIEN
 (
   IDTEC INTEGER NOT NULL  ,
   NOM VARCHAR(128) NULL  ,
   PRENOM VARCHAR(128) NULL  ,
   MAIL VARCHAR(128) NULL  ,
   TEL REAL(10,2) NULL  
   , PRIMARY KEY (IDTEC) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PRODUIT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PRODUIT
 (
   NUMPRO INTEGER NOT NULL  auto_increment,
   CODETYPE VARCHAR(5) NOT NULL  ,
   NUMU INTEGER NOT NULL  ,
   NOMPRO VARCHAR(128) NULL  ,
   PRIX REAL NULL  
   , PRIMARY KEY (NUMPRO) 
 ) 
 comment = "";
insert into PRODUIT values 
  (null, 'p1',1,'ariane', 3224.00),
  (null, 'p1',2,'clairac', 2699.00),
  (null, 'p1',3,'muse',2299.00),

  (null, 'p1',1,'coulissante 2 vantaux',269.00),
  (null, 'p1',3,'long 1 vantal',220.00),
  (null, 'p1',2,'rond',369.00),

  (null, 'p1',1,'pergola classique',679.00),
  (null, 'p1',1,'toit de terrasse',849.15);
# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PRODUIT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PRODUIT_TYPEPRODUIT
     ON PRODUIT (CODETYPE ASC);

CREATE  INDEX I_FK_PRODUIT_USINE
     ON PRODUIT (NUMU ASC);

# -----------------------------------------------------------------------------
#       TABLE : TYPEPRODUIT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPEPRODUIT
 (
   CODETYPE VARCHAR(10) NOT NULL UNIQUE,
   NOMTYPE VARCHAR(128) NULL  
   , PRIMARY KEY (CODETYPE) 
 ) 
 comment = "";
insert into TYPEPRODUIT values 
  ('p1',"Porte d'entree"),
  ('f1',"Fenetre"),
  ('l1',"Loggia");
# -----------------------------------------------------------------------------
#       TABLE : DATE_INTER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DATE_INTER
 (
   DATEDEBUT DATE NOT NULL  
   , PRIMARY KEY (DATEDEBUT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PARTICULIER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PARTICULIER
 (
   IDCLIENT INTEGER NOT NULL  ,
   PRENOM CHAR(32) NULL  ,
   NOM VARCHAR(70) NULL  ,
   EMAIL CHAR(70) NULL  ,
   TEL INTEGER NULL  
   , PRIMARY KEY (IDCLIENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : LIGNECOM
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS LIGNECOM
 (
   NUMCOM INTEGER NOT NULL  ,
   NUMPRO INTEGER NOT NULL  ,
   QUANTITECOM INTEGER NULL  
   , PRIMARY KEY (NUMCOM,NUMPRO) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE LIGNECOM
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_LIGNECOM_COMMANDE
     ON LIGNECOM (NUMCOM ASC);

CREATE  INDEX I_FK_LIGNECOM_PRODUIT
     ON LIGNECOM (NUMPRO ASC);

# -----------------------------------------------------------------------------
#       TABLE : INTERVENIR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS INTERVENIR
 (
   IDDEVIS VARCHAR(10) NOT NULL  ,
   IDTEC INTEGER NOT NULL  ,
   DATEDEBUT DATE NOT NULL  ,
   DATEFIN DATE NULL  
   , PRIMARY KEY (IDDEVIS,IDTEC,DATEDEBUT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE INTERVENIR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_INTERVENIR_DEVIS
     ON INTERVENIR (IDDEVIS ASC);

CREATE  INDEX I_FK_INTERVENIR_TECHNICIEN
     ON INTERVENIR (IDTEC ASC);

CREATE  INDEX I_FK_INTERVENIR_DATE_INTER
     ON INTERVENIR (DATEDEBUT ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE FACTURE 
  ADD FOREIGN KEY FK_FACTURE_COMMANDE (NUMCOM)
      REFERENCES COMMANDE (NUMCOM) ;


ALTER TABLE DEVIS 
  ADD FOREIGN KEY FK_DEVIS_COMMANDE (NUMCOM)
      REFERENCES COMMANDE (NUMCOM) ;


ALTER TABLE DEVIS 
  ADD FOREIGN KEY FK_DEVIS_CLIENT (IDCLIENT)
      REFERENCES CLIENT (IDCLIENT) ;


ALTER TABLE COMMANDE 
  ADD FOREIGN KEY FK_COMMANDE_CLIENT (IDCLIENT)
      REFERENCES CLIENT (IDCLIENT) ;


ALTER TABLE ENTREPRISE 
  ADD FOREIGN KEY FK_ENTREPRISE_CLIENT (IDCLIENT)
      REFERENCES CLIENT (IDCLIENT) ;


ALTER TABLE PRODUIT 
  ADD FOREIGN KEY FK_PRODUIT_TYPEPRODUIT (CODETYPE)
      REFERENCES TYPEPRODUIT (CODETYPE) ;


ALTER TABLE PRODUIT 
  ADD FOREIGN KEY FK_PRODUIT_USINE (NUMU)
      REFERENCES USINE (NUMU) ;


ALTER TABLE PARTICULIER 
  ADD FOREIGN KEY FK_PARTICULIER_CLIENT (IDCLIENT)
      REFERENCES CLIENT (IDCLIENT) ;


ALTER TABLE LIGNECOM 
  ADD FOREIGN KEY FK_LIGNECOM_COMMANDE (NUMCOM)
      REFERENCES COMMANDE (NUMCOM) ;


ALTER TABLE LIGNECOM 
  ADD FOREIGN KEY FK_LIGNECOM_PRODUIT (NUMPRO)
      REFERENCES PRODUIT (NUMPRO) ;


ALTER TABLE INTERVENIR 
  ADD FOREIGN KEY FK_INTERVENIR_DEVIS (IDDEVIS)
      REFERENCES DEVIS (IDDEVIS) ;


ALTER TABLE INTERVENIR 
  ADD FOREIGN KEY FK_INTERVENIR_TECHNICIEN (IDTEC)
      REFERENCES TECHNICIEN (IDTEC) ;


ALTER TABLE INTERVENIR 
  ADD FOREIGN KEY FK_INTERVENIR_DATE_INTER (DATEDEBUT)
      REFERENCES DATE_INTER (DATEDEBUT) ;

