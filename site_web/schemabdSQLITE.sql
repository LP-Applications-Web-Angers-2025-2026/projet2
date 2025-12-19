PRAGMA foreign_keys = ON;

CREATE TABLE Marque (
    id_marque INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_marque TEXT NOT NULL
);

CREATE TABLE Modele (
    id_modele INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_modele TEXT NOT NULL
);


CREATE TABLE Sous_Modele (
    id_sous_modele INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_sous_modele TEXT NOT NULL,
    id_modele INTEGER NOT NULL,
    FOREIGN KEY (id_modele) REFERENCES Modele(id_modele) ON DELETE RESTRICT
);

CREATE TABLE Type_Test (
    id_type_test INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_type_test TEXT NOT NULL,
    description TEXT
);

CREATE TABLE Test (
    id_test INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_test TEXT NOT NULL,
    date_test TEXT, -- SQLite stocke les dates en TEXT
    id_type_test INTEGER NOT NULL,
    FOREIGN KEY (id_type_test) REFERENCES Type_Test(id_type_test) ON DELETE RESTRICT
);

CREATE TABLE CPU (
    id_cpu INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_core INTEGER,
    nombre_thread INTEGER,
    frequence_min REAL,
    frequence_max REAL,
    nom_cpu TEXT,
    architecture TEXT,
    lithographie INTEGER,
    taille_cache_l1 INTEGER,
    taille_cache_l2 INTEGER,
    taille_cache_l3 INTEGER,
    taille_cache_l4 INTEGER,
    id_marque INTEGER NOT NULL,
    id_modele INTEGER NOT NULL,
    FOREIGN KEY (id_marque) REFERENCES Marque(id_marque) ON DELETE RESTRICT,
    FOREIGN KEY (id_modele) REFERENCES Modele(id_modele) ON DELETE RESTRICT
);

CREATE TABLE Resultat (
    id_test INTEGER NOT NULL,
    id_cpu INTEGER NOT NULL,
    valeur_resultat REAL,
    validation INTEGER, -- 0 = faux, 1 = vrai
    remarque TEXT,
    PRIMARY KEY (id_test, id_cpu),
    FOREIGN KEY (id_test) REFERENCES Test(id_test) ON DELETE RESTRICT,
    FOREIGN KEY (id_cpu) REFERENCES CPU(id_cpu) ON DELETE RESTRICT
);
