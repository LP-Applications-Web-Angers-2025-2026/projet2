
CREATE TABLE Marque (
    id_marque INT PRIMARY KEY,
    nom_marque VARCHAR(100) NOT NULL
);

CREATE TABLE Modele (
    id_modele INT PRIMARY KEY,
    nom_modele VARCHAR(100) NOT NULL
);

CREATE TABLE Sous_Modele (
    id_sous_modele INT PRIMARY KEY,
    nom_sous_modele VARCHAR(100) NOT NULL,
    id_modele INT,
    FOREIGN KEY (id_modele) REFERENCES Modele(id_modele)
);

CREATE TABLE Type_Test (
    id_type_test INT PRIMARY KEY,
    nom_type_test VARCHAR(100) NOT NULL
);

CREATE TABLE Test (
    id_test INT PRIMARY KEY,
    nom_test VARCHAR(100) NOT NULL,
    date_test DATE,
    id_type_test INT,
    description TEXT,
    FOREIGN KEY (id_type_test) REFERENCES Type_Test(id_type_test)
);

CREATE TABLE CPU (
    id_cpu INT PRIMARY KEY,
    nombre_core INT,
    nombre_thread INT,
    frequence_min FLOAT,
    frequence_max FLOAT,
    nom_cpu VARCHAR(100),
    architecture VARCHAR(50),
    lithographie INT,
    taille_cache_l1 INT,
    taille_cache_l2 INT,
    taille_cache_l3 INT,
    taille_cache_l4 INT,
    id_marque INT,
    id_modele INT,
    FOREIGN KEY (id_marque) REFERENCES Marque(id_marque),
    FOREIGN KEY (id_modele) REFERENCES Modele(id_modele)
);

CREATE TABLE Resultat (
    id_test INT,
    id_cpu INT,
    valeur_resultat FLOAT,
    validation BOOLEAN,
    PRIMARY KEY (id_test, id_cpu),
    FOREIGN KEY (id_test) REFERENCES Test(id_test),
    FOREIGN KEY (id_cpu) REFERENCES CPU(id_cpu)
)