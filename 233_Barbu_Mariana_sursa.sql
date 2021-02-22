
create table adresa (
    id_adresa int NOT NULL primary key, 
    oras varchar2(40) NOT NULL, 
    tara varchar2(40) NOT NULL,
    strada varchar2(60),
    cod_postal varchar2(6)
    );
    
create table cititor (
    id_cititor int NOT NULL primary key,
    nume varchar2(40) NOT NULL,
    prenume varchar2(40) NOT NULL,
    telefon varchar2(10) NOT NULL,
    email varchar2(30),
    data_nastere date default sysdate,
    id_adresa int,
    CONSTRAINT FK_CititorAdresa FOREIGN KEY (id_adresa) REFERENCES adresa(id_adresa) on delete cascade
    );
    
    
create table abonament (
    id_abonament int NOT NULL primary key,
    data_start date default sysdate NOT NULL,
    data_expirare date default sysdate NOT NULL,
    id_cititor int,
    CONSTRAINT FK_AbonamentCititor FOREIGN KEY (id_cititor) REFERENCES cititor(id_cititor) on delete cascade
    );
    
create table sectie (
    id_sectie int NOT NULL primary key,
    nume_sectie varchar2(40),
    nr_carti int
    );
    
create table carte (
    id_carte int NOT NULL primary key,
    autor varchar2(40),
    titlu varchar2(40),
    an_aparitie varchar2(4),
    id_sectie int,
    CONSTRAINT FK_CarteSectie FOREIGN KEY (id_sectie) REFERENCES sectie(id_sectie) on delete cascade
    );
    
create table imprumut (
    id_abonament int NOT NULL,
    id_carte int NOT NULL,
    data_start date default sysdate,
    data_final date default sysdate,
    CONSTRAINT FK_ImprumutAbonament FOREIGN KEY (id_abonament) REFERENCES abonament(id_abonament) on delete cascade,
    CONSTRAINT FK_ImprumutCarte FOREIGN KEY (id_carte) REFERENCES carte(id_carte) on delete cascade,
    primary key (id_abonament, id_carte, data_start)
    );

create table angajat (
    id_angajat int NOT NULL primary key,
    nume varchar2(40) NOT NULL,
    prenume varchar2(40) NOT NULL,
    salariu number(10),
    data_nastere date default sysdate,
    id_adresa int,
    CONSTRAINT FK_AngajatAdresa FOREIGN KEY (id_adresa) REFERENCES adresa(id_adresa) on delete cascade
    );
    
create table bibliotecar(
    id_angajat int primary key,
    id_sectie,
    CONSTRAINT FK_BibliotecarAngajat FOREIGN KEY (id_angajat) REFERENCES angajat(id_angajat) ON DELETE CASCADE,
    CONSTRAINT FK_BibliotecarSectie FOREIGN KEY (id_sectie) REFERENCES sectie(id_sectie) ON DELETE CASCADE
    );
    
create table gardian(
    id_angajat int primary key,
    nr_ore number(10),
    CONSTRAINT FK_GardianAngajat FOREIGN KEY (id_angajat) REFERENCES angajat(id_angajat) ON DELETE CASCADE
    );

--adresa--


insert into adresa
values (1, 'Bucuresti', 'Romania', 'Splaiul Independentei', '123456');

insert into adresa
values (2, 'Pitesti', 'Romania', 'Raiului', '234567');

insert into adresa
values (3, 'Bucuresti', 'Romania', 'Unicornilor', '345678');

insert into adresa
values (4, 'Craiova', 'Romania', 'Primaverii', '456789');

insert into adresa
values (5, 'Buzau', 'Romania', 'Libertatii', '124567');

--citittor--

insert into cititor 
values (1, 'Popescu', 'Ion', '0711111111', 'popescu@gmail.com', '12-dec-1980', 3);

insert into cititor 
values (2, 'Nicolescu', 'Alicia', '0722222222', 'nicolescu@gmail.com', '30-dec-1990', 2);

insert into cititor 
values (3, 'Ionescu', 'Aurel', '0711111111', 'ionescu@gmail.com', '07-jul-2001', 1);

insert into cititor 
values (4, 'Udrea', 'Cristina', '0744444444', 'udrea@gmail.com', '05-jun-1997', 5);

insert into cititor 
values (5, 'Dinu', 'Andreea', '0755555555', 'dinu@gmail.com', '24-mar-1999', 4);

insert into cititor 
values (6, 'Cirstea', 'Gabriel', '0766666666', 'cirstea@gmail.com', '13-jan-2003', 3);

insert into cititor 
values (7, 'Cirstea', 'Ioana', '0777777777', 'cirstea@gmail.com', '15-jan-2003', 4);

insert into cititor 
values (8, 'Oprea', 'Carmen', '0788888888', 'oprea@gmail.com', '09-jun-2001', 1);
--abonament--


insert into abonament
values (1, '05-apr-2018', '05-apr-2020', 1);

insert into abonament
values (2, '12-dec-2019', '12-dec-2021', 2);

insert into abonament
values (3, '13-may-2020', '13-may-2022', 3);

insert into abonament
values (4, '21-nov-2017', '21-nov-2019', 4);

insert into abonament
values (5, '05-oct-2018', '05-oct-2020', 5);

insert into abonament
values (6, '17-apr-2016', '17-apr-2018', 6);

insert into abonament
values (7, '20-apr-2017', '20-apr-2019', 7);

--sectie--

insert into sectie 
values (1, 'Beletristica', 10000);

insert into sectie 
values (2, 'Matematica', 2000);

insert into sectie 
values (3, 'poezii', 7540);

insert into sectie 
values (4, 'Stiintele naturii', 1230);

insert into sectie 
values (5, 'Copii', 3480);

insert into sectie 
values (6, 'Informatica', 21340);

--carte--

insert into carte
values (1, 'Mihai Eminescu', 'Poezii', '1881', 3);

insert into carte
values (2, 'Camil Petrescu', 'Ultima noapte de dragoste', '1918', 1);

insert into carte
values (3, 'Fratii Grimm', 'Alba-ca-Zapada', '1812', 5);

insert into carte
values (4, 'Ion Luca Caragiale', 'O scrisoare pierduta', '1879', 1);

insert into carte
values (5, 'Marius Perianu', 'Culegere Matematica', '2015', 2);

insert into carte
values (6, 'Tudor Sorin', 'Algoritmi', '2004', 6);

--imprumut--

insert into imprumut
values (1, 1, '19-dec-2020', '3-jan-2021');

insert into imprumut
values (2, 2, '20-dec-2020', '4-jan-2021');

insert into imprumut
values (3, 3, '21-dec-2020', '5-jan-2021');

insert into imprumut
values (4, 4, '22-dec-2020', '6-jan-2021');

insert into imprumut
values (5, 5, '23-dec-2020', '7-jan-2021');

insert into imprumut
values (1, 5, '24-dec-2020', '8-jan-2021');

insert into imprumut
values (2, 4, '10-dec-2020', '24-dec-2021');

insert into imprumut
values (1, 2, '11-dec-2020', '26-dec-2021');

insert into imprumut
values (2, 3, '12-dec-2020', '27-dec-2021');

insert into imprumut
values (4, 5, '13-dec-2020', '28-dec-2021');

insert into imprumut
values (1, 3, '13-dec-2019', '28-dec-2020');

insert into imprumut 
values (1, 4, '13-jan-2018', '28-jan-2019');

insert into imprumut 
values (7, 1, '12-jan-2015', '27-jan-2015');

insert into imprumut 
values (7, 2, '12-jan-2015', '27-jan-2015');

--angajat--


insert into angajat
values (1, 'Parnescu', 'Tamarel', 1000, '2-dec-1998', 3);

insert into angajat
values (2, 'Preda', 'Larisa', 1200, '12-dec-1990', 1);

insert into angajat
values (3, 'Celmare', 'Diana', 2000, '9-feb-2001', 2);

insert into angajat
values (4, 'Istrare', 'Maria', 1500, '15-dec-1983', 4);

insert into angajat
values (5, 'Calin', 'George', 1340, '10-mar-1980', 5);

--bibliotecar--

insert into bibliotecar
values (1, 3);

insert into bibliotecar
values (2,1);

insert into bibliotecar
values (3, 2);

--gardian--

insert into gardian
values (4, 30);

insert into gardian
values (5, 48);


--6. Definiti un subprogram stocat care primeste id-ul unui cititor si retine intr-o colectie toate cartile imprumutate de acesta in ultimul an, iar apoi le afiseaza. Apelati subprogramul.

CREATE OR REPLACE PROCEDURE f1_biblioteca
 (v_id_cititor cititor.id_cititor%TYPE )
 IS nume cititor.nume%type;
BEGIN
    SELECT nume INTO nume
    FROM cititor
    WHERE id_cititor = v_id_cititor;
    DECLARE
        TYPE carti IS TABLE OF INT INDEX BY PLS_INTEGER;
        x carti;
        titlu_carte carte.titlu%type;
    BEGIN
        select c.id_carte
        BULK COLLECT INTO x
        from carte c, imprumut i, abonament a
        where c.id_carte = i.id_carte and i.id_abonament = a.id_abonament and a.id_cititor = v_id_cititor
        and i.data_start > sysdate - 365;
        
        IF x.first IS NULL THEN  DBMS_OUTPUT.PUT_LINE('Nu exista imprumuturi! ');
        ELSE 
        DBMS_OUTPUT.PUT_LINE('Cartile imprumutate de cititorul ' || v_id_cititor || ': ');
        FOR i IN x.first..x.last LOOP
            SELECT titlu
            INTO titlu_carte
            from carte
            where carte.id_carte = x(i);
            DBMS_OUTPUT.PUT_LINE(titlu_carte);
        END LOOP;
        END IF;
    END;
EXCEPTION
 WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20000, 'Nu exista cititori cu id-ul dat');
 WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');

END f1_biblioteca;
/

BEGIN
f1_biblioteca(1);
--f1_biblioteca(6);
--f1_biblioteca(8);
END;
/



--7. Pentru o sectie transmisa prin id(nume - care va fi afisat o singura data) obtineti lista cartilor care se gasesc in sectia respectiva.

CREATE OR REPLACE PROCEDURE f2_biblioteca
 (v_id_sectie sectie.id_sectie%TYPE )
 IS nume sectie.nume_sectie%type;
BEGIN
    SELECT nume_sectie INTO nume
    FROM sectie
    WHERE id_sectie = v_id_sectie;
    DBMS_OUTPUT.PUT_LINE('Sectia ' || nume ||': ');
    DECLARE
        v_nr number(4) :=0;
        CURSOR cu IS
        SELECT titlu, autor
        FROM carte c, sectie s
        WHERE c.id_sectie = s.id_sectie
        AND s.id_sectie = v_id_sectie;
    BEGIN 
        FOR j in cu LOOP
        v_nr := v_nr + 1;
        DBMS_OUTPUT.PUT_LINE('Cartea ' || j.titlu || ' scrisa de ' || j.autor);
        END LOOP;
        IF v_nr = 0 THEN DBMS_OUTPUT.PUT_LINE('Nu exista carti!');
        END IF;
    END;
EXCEPTION
 WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20000, 'Nu exista sectii cu id-ul dat');
 WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');    
END f2_biblioteca;
/

BEGIN
f2_biblioteca(1);
--f2_biblioteca(4);
--f2_biblioteca(9);
END;
/

--8. Definiti un subprogram prin care sa obtineti orasul in care locuieste un cititor daca se cunoaste id-ul abonamentului sau.

CREATE OR REPLACE FUNCTION f3_biblioteca
 (v_id_abonament abonament.id_abonament%TYPE DEFAULT 'Bell')
RETURN VARCHAR2 IS
 oras adresa.oras%type;
 BEGIN
 SELECT oras INTO oras
 FROM adresa ad, cititor c, abonament ab
 WHERE ab.id_abonament = v_id_abonament AND ad.id_adresa = c.id_adresa AND c.id_cititor = ab.id_cititor;
 RETURN oras;
 EXCEPTION
 WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20000, 'Nu exista abonamente cu id-ul dat');
 WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
END f3_biblioteca;
/

BEGIN
 DBMS_OUTPUT.PUT_LINE('Orasul este '|| f3_biblioteca(2));
 --DBMS_OUTPUT.PUT_LINE('Orasul este '|| f3_biblioteca(9));
END;
/


--9. Sa se defineasca un subprogram prin care se afiseaza numele sectiei de la care a imprumutat cele mai multe carti un cititor al carui nume se da ca parametru. 


CREATE OR REPLACE PROCEDURE f4_biblioteca
 (v_nume cititor.nume%TYPE)
 IS
 v_id cititor.id_cititor%TYPE;
 BEGIN
 
     SELECT id_cititor into v_id
     FROM cititor
     WHERE v_nume = nume;
     DECLARE
        nume_s sectie.nume_sectie%TYPE;
    BEGIN
         SELECT nume_sectie INTO nume_s
         FROM sectie
         WHERE id_sectie in ( SELECT id_sectie
                             FROM ( SELECT aux.id_sectie
                                    FROM (  SELECT COUNT(data_start) nr, c.id_sectie id_sectie
                                            FROM imprumut i, carte c
                                            WHERE i.id_abonament = ( SELECT id_abonament
                                                                        FROM abonament a, cititor ci
                                                                        WHERE a.id_cititor = ci.id_cititor
                                                                        AND ci.nume = v_nume)
                                            AND i.id_carte = c.id_carte
                                            GROUP BY c.id_sectie
                                            ) aux
                                     WHERE aux.nr IN (   SELECT MAX (nr)
                                                        FROM (  SELECT COUNT(data_start) nr, c.id_sectie id_sectie
                                                                FROM imprumut i, carte c
                                                                WHERE i.id_abonament = (    SELECT id_abonament
                                                                                            FROM abonament a, cititor ci
                                                                                            WHERE a.id_cititor = ci.id_cititor
                                                                                            AND ci.nume = v_nume)
                                                                AND i.id_carte = c.id_carte
                                                                GROUP  BY c.id_sectie
                                                             )
                                                    )        
                                        
                                )
                                    
                            );
                             
        DBMS_OUTPUT.PUT_LINE('Sectia este '|| nume_s);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20000, 'Nu exista imprumuturi facute de acest cititor!');
        WHEN TOO_MANY_ROWS THEN RAISE_APPLICATION_ERROR(-20001, 'Exista mai multe sectii cu acelasi numar de carti!');
        WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
    END;
 EXCEPTION
 WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20000, 'Nu exista cititori cu numele dat!');
 WHEN TOO_MANY_ROWS THEN RAISE_APPLICATION_ERROR(-20001, 'Exista mai multi cititori cu numele dat!');
 END f4_biblioteca;
 /


BEGIN
f4_biblioteca('Dinu');
--f4_biblioteca('Radu');
--f4_biblioteca('Cirstea');
--f4_biblioteca('Udrea');
--f4_biblioteca('Oprea');
END;
/


--10. Definiti un trigger care sa permita inserarea si stergerea in tabelul angajat doar in zilele lucratoare( sambata si duminica nu se fac angajari sau concedieri), intre orele 08-18. Declansati trigger ul.

CREATE OR REPLACE TRIGGER trig1_biblioteca
 BEFORE INSERT OR DELETE ON angajat
BEGIN
    IF ((TO_CHAR(SYSDATE,'D') = 1) OR (TO_CHAR(SYSDATE,'D') = 7)) OR (TO_CHAR(SYSDATE,'HH24') NOT BETWEEN 8 AND 18)
    THEN RAISE_APPLICATION_ERROR(-20001,'Nu se fac angajari sau concedieri!');
END IF;
END;
/
ALTER TRIGGER trig1_biblioteca ENABLE;

insert into angajat
values (6, 'Dragnea', 'Alex', 2000, '15-mar-1970', 4);

--11. Definiti un trigger care va actualiza automat campul nr_carti dintr-o sectie atunci cand se adauga sau se sterge o carte in sectia respectiva. Declansati trigger-ul.

CREATE OR REPLACE PROCEDURE modific_nr_carti_biblioteca
 (v_id_sectie sectie.id_sectie%TYPE,
 aux int ) AS
BEGIN
 UPDATE sectie
 SET nr_carti = NVL (nr_carti, 0) + aux
 WHERE id_sectie = v_id_sectie;
END;
/

CREATE OR REPLACE TRIGGER trig2_biblioteca
 AFTER DELETE OR INSERT ON carte
 FOR EACH ROW
BEGIN
 IF DELETING THEN
 modific_nr_carti_biblioteca (:OLD.id_sectie, -1);
 ELSE
 modific_nr_carti_biblioteca (:NEW.id_sectie, 1);
 END IF;
END;
/


ALTER TRIGGER trig2_biblioteca ENABLE;

select * from sectie;

insert into carte
values (8, 'Alexandru Sorin', 'Culegere ecuatii', '2000', 2);

select * from sectie;

--12. Creati tabelul info_biblioteca cu urmatoarele campuri : eveniment(evenimentul sistem), nume_obiect(numele obiectului) si data (data producerii evenimentului), iar apoi definiti un trigger care sa introduca date in acest tabel dupa ce utilizatorul a folosit o comanda LDD.

CREATE TABLE info_biblioteca
 (eveniment VARCHAR2(20),
 nume_obiect VARCHAR2(30),
 data DATE);
 
CREATE OR REPLACE TRIGGER trig3_biblioteca
 AFTER CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
 INSERT INTO info_biblioteca
 VALUES (SYS.SYSEVENT,
 SYS.DICTIONARY_OBJ_NAME, SYSDATE);
END;
/
CREATE INDEX ind_biblioteca ON cititor(nume);
DROP INDEX ind_biblioteca;
SELECT * FROM info_biblioteca;
DROP TRIGGER trig3_biblioteca;

13. 


CREATE OR REPLACE PACKAGE pachet1_biblioteca AS 
    PROCEDURE f1_biblioteca (v_id_cititor cititor.id_cititor%TYPE );
    PROCEDURE f2_biblioteca (v_id_sectie sectie.id_sectie%TYPE );
    FUNCTION f3_biblioteca (v_id_abonament abonament.id_abonament%TYPE DEFAULT 'Bell') RETURN VARCHAR2;
    PROCEDURE f4_biblioteca (v_nume cititor.nume%TYPE);
    PROCEDURE modific_nr_carti_biblioteca (v_id_sectie sectie.id_sectie%TYPE, aux int );
END pachet1_biblioteca;
/ 

CREATE OR REPLACE PACKAGE BODY pachet1_biblioteca AS 
    PROCEDURE f1_biblioteca
     (v_id_cititor cititor.id_cititor%TYPE )
     IS nume cititor.nume%type;
    BEGIN
    SELECT nume INTO nume
    FROM cititor
    WHERE id_cititor = v_id_cititor;
    DECLARE
        TYPE carti IS TABLE OF INT INDEX BY PLS_INTEGER;
        x carti;
        titlu_carte carte.titlu%type;
    BEGIN
        select c.id_carte
        BULK COLLECT INTO x
        from carte c, imprumut i, abonament a
        where c.id_carte = i.id_carte and i.id_abonament = a.id_abonament and a.id_cititor = v_id_cititor
        and i.data_start > sysdate - 365;
        
        IF x.first IS NULL THEN  DBMS_OUTPUT.PUT_LINE('Nu exista imprumuturi! ');
        ELSE 
        DBMS_OUTPUT.PUT_LINE('Cartile imprumutate de cititorul ' || v_id_cititor || ': ');
        FOR i IN x.first..x.last LOOP
            SELECT titlu
            INTO titlu_carte
            from carte
            where carte.id_carte = x(i);
            DBMS_OUTPUT.PUT_LINE(titlu_carte);
        END LOOP;
        END IF;
    END;
EXCEPTION
 WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20000, 'Nu exista cititori cu id-ul dat');
 WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');

END f1_biblioteca;
    
    
    
    PROCEDURE f2_biblioteca
     (v_id_sectie sectie.id_sectie%TYPE )
     IS nume sectie.nume_sectie%type;
    BEGIN
    SELECT nume_sectie INTO nume
    FROM sectie
    WHERE id_sectie = v_id_sectie;
    DBMS_OUTPUT.PUT_LINE('Sectia ' || nume ||': ');
    DECLARE
        v_nr number(4) :=0;
        CURSOR cu IS
        SELECT titlu, autor
        FROM carte c, sectie s
        WHERE c.id_sectie = s.id_sectie
        AND s.id_sectie = v_id_sectie;
    BEGIN 
        FOR j in cu LOOP
        v_nr := v_nr + 1;
        DBMS_OUTPUT.PUT_LINE('Cartea ' || j.titlu || ' scrisa de ' || j.autor);
        END LOOP;
        IF v_nr = 0 THEN DBMS_OUTPUT.PUT_LINE('Nu exista carti!');
        END IF;
    END;
EXCEPTION
 WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20000, 'Nu exista sectii cu id-ul dat');
 WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');    
END f2_biblioteca;


    FUNCTION f3_biblioteca
     (v_id_abonament abonament.id_abonament%TYPE DEFAULT 'Bell')
    RETURN VARCHAR2 IS
     oras adresa.oras%type;
     BEGIN
     SELECT oras INTO oras
     FROM adresa ad, cititor c, abonament ab
     WHERE ab.id_abonament = v_id_abonament AND ad.id_adresa = c.id_adresa AND c.id_cititor = ab.id_cititor;
     RETURN oras;
     EXCEPTION
     WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20000, 'Nu exista abonamente cu id-ul dat');
     WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
    END f3_biblioteca;
    
    PROCEDURE f4_biblioteca
     (v_nume cititor.nume%TYPE)
     IS
      v_id cititor.id_cititor%TYPE;
 BEGIN
 
     SELECT id_cititor into v_id
     FROM cititor
     WHERE v_nume = nume;
     DECLARE
        nume_s sectie.nume_sectie%TYPE;
    BEGIN
         SELECT nume_sectie INTO nume_s
         FROM sectie
         WHERE id_sectie in ( SELECT id_sectie
                             FROM ( SELECT aux.id_sectie
                                    FROM (  SELECT COUNT(data_start) nr, c.id_sectie id_sectie
                                            FROM imprumut i, carte c
                                            WHERE i.id_abonament = ( SELECT id_abonament
                                                                        FROM abonament a, cititor ci
                                                                        WHERE a.id_cititor = ci.id_cititor
                                                                        AND ci.nume = v_nume)
                                            AND i.id_carte = c.id_carte
                                            GROUP BY c.id_sectie
                                            ) aux
                                     WHERE aux.nr IN (   SELECT MAX (nr)
                                                        FROM (  SELECT COUNT(data_start) nr, c.id_sectie id_sectie
                                                                FROM imprumut i, carte c
                                                                WHERE i.id_abonament = (    SELECT id_abonament
                                                                                            FROM abonament a, cititor ci
                                                                                            WHERE a.id_cititor = ci.id_cititor
                                                                                            AND ci.nume = v_nume)
                                                                AND i.id_carte = c.id_carte
                                                                GROUP  BY c.id_sectie
                                                             )
                                                    )        
                                        
                                )
                                    
                            );
                             
        DBMS_OUTPUT.PUT_LINE('Sectia este '|| nume_s);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20000, 'Nu exista imprumuturi facute de acest cititor!');
        WHEN TOO_MANY_ROWS THEN RAISE_APPLICATION_ERROR(-20001, 'Exista mai multe sectii cu acelasi numar de carti!');
        WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
    END;
 EXCEPTION
 WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20000, 'Nu exista cititori cu numele dat!');
 WHEN TOO_MANY_ROWS THEN RAISE_APPLICATION_ERROR(-20001, 'Exista mai multi cititori cu numele dat!');
 END f4_biblioteca;

    PROCEDURE modific_nr_carti_biblioteca
     (v_id_sectie sectie.id_sectie%TYPE,
     aux int ) AS
    BEGIN
     UPDATE sectie
     SET nr_carti = NVL (nr_carti, 0) + aux
     WHERE id_sectie = v_id_sectie;
    END;

    
  
END pachet1_biblioteca;
/

BEGIN
 pachet1_biblioteca.f1_biblioteca(1);
 pachet1_biblioteca.f2_biblioteca(2);
 --DBMS_OUTPUT.PUT_LINE('Orasul este '|| pachet1_biblioteca.f3_biblioteca(9));
 DBMS_OUTPUT.PUT_LINE('Orasul este '|| pachet1_biblioteca.f3_biblioteca(2));
 pachet1_biblioteca.f4_biblioteca('Dinu');
 --pachet1_biblioteca.f4_biblioteca('Radu');
 --pachet1_biblioteca.f4_biblioteca('Cirstea');
END;
/  



--14. Creati un pachet care sa contina o procedura ce returneaza numele, prenumele si email-ul cititorilor care si-au facut abonament inainte de o data specificata ca si parametru.

CREATE OR REPLACE PACKAGE pachet2_biblioteca AS
 PROCEDURE abonamente
 (v_data abonament.data_start%TYPE);
END pachet2_biblioteca;
/ 
CREATE OR REPLACE PACKAGE BODY pachet2_biblioteca AS 
    PROCEDURE abonamente
        (v_data abonament.data_start%TYPE)
        AS
     BEGIN
        DECLARE
         TYPE cititor_record IS RECORD
         (nume cititor.nume%TYPE,
         prenume cititor.prenume%TYPE,
         email cititor.email%TYPE);
         v_cititor cititor_record;
        
        BEGIN
            DECLARE
             TYPE tablou_cititori IS TABLE OF NUMBER
             INDEX BY BINARY_INTEGER;
             t tablou_cititori;
            BEGIN
                 SELECT c.id_cititor
                 BULK COLLECT INTO t
                 FROM cititor c, abonament a
                 WHERE c.id_cititor = a.id_cititor
                 AND a.data_start < v_data;
                 
                 IF t.COUNT > 0 THEN
                     FOR i in t.first..t.last LOOP
                         SELECT nume, prenume, email 
                         INTO v_cititor
                         FROM cititor
                         WHERE t(i) = id_cititor;
                         
                         DBMS_OUTPUT.PUT_LINE('Cititorul ' || v_cititor.nume || v_cititor.prenume || ' cu email-ul '|| v_cititor.email);
                     END LOOP;
                ELSE
                    DBMS_OUTPUT.PUT_LINE('Nu exista cititori care sa aiba abonament facut inainte de data aleasa!');
                END IF;
            END;
        END;
    EXCEPTION
         WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20000, 'Nu exista cititori care sa aiba abonament facut inainte de data aleasa');
    END abonamente;
    

END pachet2_biblioteca;
/


BEGIN
    pachet2_biblioteca.abonamente('01-Oct-2015');
END;
/