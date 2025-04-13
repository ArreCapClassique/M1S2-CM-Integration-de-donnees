BEGIN
    FOR t IN (SELECT table_name FROM user_tables) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS';
    END LOOP;
END;
/

CREATE TABLE Commande (
    idCommande     NUMBER(3),
    dateCommande   DATE,
    idClient       VARCHAR2(10)
);


CREATE TABLE Produit (
    idProduit      VARCHAR2(10),
    nomProduit     VARCHAR2(30),
    idCategory     VARCHAR2(10),
    prixUnitaire   NUMBER(10,2)
);

CREATE TABLE Contenir (
    idCommande     NUMBER(3),
    idProduit      VARCHAR2(10),
    quantite       NUMBER(5)
);


INSERT ALL
    INTO Commande (idCommande, dateCommande, idClient) VALUES (1, TO_DATE('2025-03-01', 'YYYY-MM-DD'), 'C001')
    INTO Commande (idCommande, dateCommande, idClient) VALUES (2, TO_DATE('2025-03-02', 'YYYY-MM-DD'), 'C002')
    INTO Commande (idCommande, dateCommande, idClient) VALUES (3, TO_DATE('2025-03-03', 'YYYY-MM-DD'), 'C003')
SELECT * FROM DUAL;


INSERT ALL
    INTO Produit (idProduit, nomProduit, prixUnitaire, idCategory) VALUES ('P001', 'Ordinateur portable', 1000.00, 'CAT01')
    INTO Produit (idProduit, nomProduit, prixUnitaire, idCategory) VALUES ('P002', 'Lampe LED', 45.00, 'CAT02')
    INTO Produit (idProduit, nomProduit, prixUnitaire, idCategory) VALUES ('P003', 'Écouteurs Bluetooth', 79.99, 'CAT03')
SELECT * FROM DUAL;


INSERT ALL
    INTO Contenir (idCommande, idProduit, quantite) VALUES (1, 'P001', 1)
    INTO Contenir (idCommande, idProduit, quantite) VALUES (1, 'P002', 2)
    INTO Contenir (idCommande, idProduit, quantite) VALUES (2, 'P003', 1)
    INTO Contenir (idCommande, idProduit, quantite) VALUES (3, 'P001', 1)
    INTO Contenir (idCommande, idProduit, quantite) VALUES (3, 'P002', 1)
    INTO Contenir (idCommande, idProduit, quantite) VALUES (3, 'P003', 1)
SELECT * FROM DUAL;


ALTER TABLE Commande
ADD CONSTRAINT pk_commande PRIMARY KEY (idCommande);

ALTER TABLE Produit
ADD CONSTRAINT pk_produit PRIMARY KEY (idProduit);

ALTER TABLE Contenir
ADD CONSTRAINT pk_contenir PRIMARY KEY (idCommande, idProduit)
ADD CONSTRAINT fk_contenir_commande FOREIGN KEY (idCommande) REFERENCES Commande(idCommande)
ADD CONSTRAINT fk_contenir_produit FOREIGN KEY (idProduit) REFERENCES Produit(idProduit);


SELECT * FROM commande;
SELECT * FROM produit;
SELECT * FROM contenir;