CREATE TABLE t_joueur(
   joueur_id INT,
   pseudonyme VARCHAR(50),
   points DECIMAL(25,5),
   quantitearmes VARCHAR(50),
   PRIMARY KEY(joueur_id)
);

CREATE TABLE t_arme(
   arme_id INT,
   nom VARCHAR(50),
   description VARCHAR(250),
   prix DECIMAL(15,2),
   arme_force SMALLINT,
   coupsutilisables INT,
   type VARCHAR(50),
   PRIMARY KEY(arme_id)
);

CREATE TABLE t_commande(
   commande_id INT,
   datedecommande DATE,
   joueur_id INT NOT NULL,
   PRIMARY KEY(commande_id),
   FOREIGN KEY(joueur_id) REFERENCES t_joueur(joueur_id)
);

CREATE TABLE posséder(
   joueur_id INT,
   arme_id INT,
   coupsrestant VARCHAR(50),
   PRIMARY KEY(joueur_id, arme_id),
   FOREIGN KEY(joueur_id) REFERENCES t_joueur(joueur_id),
   FOREIGN KEY(arme_id) REFERENCES t_arme(arme_id)
);

CREATE TABLE concerne(
   arme_id INT,
   commande_id INT,
   quantité VARCHAR(50),
   PRIMARY KEY(arme_id, commande_id),
   FOREIGN KEY(arme_id) REFERENCES t_arme(arme_id),
   FOREIGN KEY(commande_id) REFERENCES t_commande(commande_id)
);
