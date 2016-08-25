SELECT I.*
FROM PERSONA P, DISCIPULADOR D, DISCIPULADO I
WHERE I.`idDISCIPULADOR`=D.`idDISCIPULADOR`
AND I.`idPERSONA`=P.`idPERSONA`
AND I.`idDISCIPULADOR`=1;


DROP PROCEDURE GET_LIST_DISCIPULO;
DELIMITER $$
CREATE PROCEDURE GET_LIST_DISCIPULO(IDP INTEGER)
BEGIN
    DECLARE IDD INTEGER;
    SELECT D.IDDISCIPULADOR INTO IDD 
    FROM MIEMBROGP M, DISCIPULADOR D 
    WHERE M.IDMIEMBROGP=D.IDMIEMBROGP
    AND M.IDPERSONA=IDP LIMIT 1;
    SELECT I.*, P.`NOMBRES`, P.`APELLIDOS`, GET_PROGRESO_DISCIPULO(I.`idDISCIPULADO`) AS PROGRESO
    FROM PERSONA P, DISCIPULADOR D, DISCIPULADO I
    WHERE I.`idDISCIPULADOR`=D.`idDISCIPULADOR`
    AND I.`idPERSONA`=P.`idPERSONA`
    AND I.`idDISCIPULADOR`=IDD;
END$$

SELECT D.IDDISCIPULADOR
    FROM MIEMBROGP M, DISCIPULADOR D 
    WHERE M.IDMIEMBROGP=D.IDMIEMBROGP
    AND M.IDPERSONA=9 LIMIT 1;

CALL GET_LIST_DISCIPULO(22);

    SELECT I.*, P.`NOMBRES`, P.`APELLIDOS`
    FROM PERSONA P, DISCIPULADOR D, DISCIPULADO I
    WHERE I.`idDISCIPULADOR`=D.`idDISCIPULADOR`
    AND I.`idPERSONA`=P.`idPERSONA`
    AND I.`idDISCIPULADOR`=1;

DELIMITER $$
CREATE FUNCTION GET_PROGRESO_DISCIPULO(IDDI INTEGER)
RETURNS DECIMAL
BEGIN
    DECLARE TLECCION INTEGER;
    DECLARE TTRAB INTEGER;
    SELECT COUNT(*) INTO TLECCION FROM LECCION
    WHERE IDTIPOLECCION=(SELECT IDTIPOLECCION FROM DETLECCION WHERE IDDISCIPULADO=IDDI);
    SELECT COUNT(*) INTO TTRAB FROM TRABMISIONERO WHERE IDDISCIPULADO=IDDI;
    RETURN IFNULL((TTRAB*100)/TLECCION,0);
END$$

SELECT COUNT(*) FROM LECCION
    WHERE IDTIPOLECCION=(SELECT IDTIPOLECCION FROM DETLECCION WHERE IDDISCIPULADO=1);

DROP PROCEDURE GET_TIPO_LECCION_DISCIPULO;
DELIMITER $$
CREATE PROCEDURE GET_TIPO_LECCION_DISCIPULO(IDDI INTEGER)
BEGIN
    SELECT T.*, DL.`ESTADO` AS ESTADODET
    FROM DETLECCION DL, DISCIPULADO D, TIPOLECCION T
    WHERE DL.`idDISCIPULADO`=IDDI
    AND DL.`idTIPOLECCION`=T.`idTIPOLECCION`;
END$$

DROP PROCEDURE ADD_TIPOLECCION;
DELIMITER $$
CREATE PROCEDURE ADD_TIPOLECCION(NOMBREi VARCHAR(64), ESTADOi CHAR(1))
BEGIN
    START TRANSACTION;
    INSERT INTO TIPOLECCION (idTIPOLECCION, NOMBRE, ESTADO) VALUES(NULL, NOMBREi, ESTADOi);
    COMMIT;
    SELECT MAX(`idTIPOLECCION`) AS IDTIPOLECCION FROM TIPOLECCION;
END$$

DELIMITER$$
CREATE PROCEDURE GET_DISCIPULADOR_GP(IDGRUPOi INTEGER)
BEGIN
    SELECT P.`idPERSONA`, P.`NOMBRES`, P.`APELLIDOS`´,MG.`idMIEMBROGP`,
    IFNULL(D.`idDISCIPULADOR`,0) AS DISCIPULADOR
    FROM PERSONA P, GRUPO G, MIEMBROGP MG LEFT OUTER JOIN DISCIPULADOR D
    ON MG.`idMIEMBROGP`=D.`idMIEMBROGP`
    WHERE P.`idPERSONA`=MG.`idPERSONA`
    AND MG.`idGRUPO`=G.`idGRUPO`
    AND MG.`idGRUPO`=IDGRUPOi;
END$$
DELIMITER$$
CREATE PROCEDURE ADD_DISCIPULO(IDPERSONAi INTEGER, IDDI INTEGER, TIPOi CHAR(1))
BEGIN
    DECLARE IDD INTEGER;
    IF(SELECT COUNT(*)FROM DISCIPULADO WHERE IDPERSONA=IDPERSONAi)=0 THEN
        START TRANSACTION;
            INSERT INTO DISCIPULADO (idDISCIPULADO, idPERSONA, TIPO, FE_INICIO, ESTADO) VALUES(
            NULL, IDPERSONAi,TIPOi, NOW(),'1');
        COMMIT;
    END IF;
    SELECT `idDISCIPULADO` INTO IDD FROM DISCIPULADO WHERE IDPERSONA=IDPERSONAi;
    IF(SELECT COUNT(*) FROM DETDISCIPULADOR WHERE idDISCIPULADOR=IDDI AND idDISCIPULADO=IDD) =0 THEN
        START TRANSACTION;
            INSERT INTO DETDISCIPULADOR (idDISCIPULADOR, idDISCIPULADO, ESTADO) VALUES(IDDI,IDD,'1');
        COMMIT;
    END IF;
END$$
DELIMITER$$
CREATE PROCEDURE GET_DISCIPULO(IDDI INTEGER)
BEGIN
    SELECT P.`NOMBRES`, P.`APELLIDOS`,D.`idDISCIPULADO`, D.*
    FROM PERSONA P, DISCIPULADO D, DETDISCIPULADOR DD
    WHERE P.`idPERSONA`=D.`idPERSONA`
    AND D.`idDISCIPULADO`=DD.`idDISCIPULADO`
    AND DD.`idDISCIPULADOR`=IDDI;
END$$

SELECT A.*, B.* FROM
(SELECT P.NOMBRES, P.APELLIDOS, D.*
FROM PERSONA P,DISCIPULADOR D, MIEMBROGP M
WHERE P.IDPERSONA=M.IDPERSONA
AND D.IDMIEMBROGP=M.IDMIEMBROGP)A LEFT OUTER JOIN
(SELECT P.NOMBRES AS NASOCIADO, P.APELLIDOS AS APASOCIADO,
 D.`idDISCIPULADOR` AS IDDISCIPULADOR2, D.`idMIEMBROGP` AS IDMIEMBROGP2,
D.`idASOCIADO` AS IDASOCIADO2, D.`FE_INICIO` AS FE_INICIO2, D.`ESTADO` AS ESTADO2
FROM PERSONA P,DISCIPULADOR D, MIEMBROGP M
WHERE P.IDPERSONA=M.IDPERSONA
AND D.IDMIEMBROGP=M.IDMIEMBROGP)B ON A.IDASOCIADO=B.IDASOCIADO2;

SELECT P.`NOMBRES`, P.`APELLIDOS`,D.`idDISCIPULADO`, D.*, GET_PROGRESO_DISCIPULO(D.`idDISCIPULADO`) AS PROGRESO
    FROM PERSONA P, DISCIPULADO D, DETDISCIPULADOR DD, DISCIPULADOR DI
    WHERE P.`idPERSONA`=D.`idPERSONA`
    AND D.`idDISCIPULADO`=DD.`idDISCIPULADO`
    AND DD.`idDISCIPULADOR`=DI.`idDISCIPULADOR`
    AND (DD.`idDISCIPULADOR`=1 OR DD.`idDISCIPULADOR`=DI.`idASOCIADO`);

DROP PROCEDURE ADD_ASOCIADO;
DELIMITER$$
CREATE PROCEDURE ADD_ASOCIADO(IDDI INTEGER, IDA INTEGER)
BEGIN
    DECLARE IDDA INTEGER;
    DECLARE IDI INTEGER;
    DECLARE TMP INTEGER;
    IF(SELECT COUNT(*) FROM DISCIPULADOR WHERE IDMIEMBROGP=IDA)=0 THEN
        START TRANSACTION;
            INSERT INTO DISCIPULADOR (idDISCIPULADOR, idMIEMBROGP, idASOCIADO, FE_INICIO, ESTADO) VALUES(
            NULL,IDA,IDDI, NOW(),'1');
        COMMIT;
        SELECT IDDISCIPULADOR INTO IDDA FROM DISCIPULADOR WHERE IDASOCIADO=IDDI;
        START TRANSACTION;
            UPDATE DISCIPULADOR SET IDASOCIADO=IDDA WHERE IDDISCIPULADOR=IDDI;
        COMMIT;
    ELSE
        SELECT IDASOCIADO INTO TMP FROM DISCIPULADOR WHERE IDDISCIPULADOR=IDDI;
        IF TMP>0 THEN
            START TRANSACTION;
                UPDATE DISCIPULADOR SET IDASOCIADO=0 WHERE IDDISCIPULADOR=TMP;
            COMMIT;
        END IF;
        SELECT IDDISCIPULADOR INTO IDDA FROM DISCIPULADOR WHERE IDMIEMBROGP=IDA;
        START TRANSACTION;
            UPDATE DISCIPULADOR SET IDASOCIADO=IDDA WHERE IDDISCIPULADOR=IDDI;
        COMMIT;
        SELECT IDDISCIPULADOR INTO IDI FROM DISCIPULADOR WHERE IDMIEMBROGP=IDA;
        START TRANSACTION;
            UPDATE DISCIPULADOR SET IDASOCIADO=IDDI WHERE IDDISCIPULADOR=IDI;
        COMMIT;
    END IF;
END$$

CALL GET_DISCIPULADOR_GP(2);

    SELECT A.* FROM
    (SELECT P.`NOMBRES`, P.`APELLIDOS`,DI.IDDISCIPULADOR, DI.IDASOCIADO,
    D.*, GET_PROGRESO_DISCIPULO(D.`idDISCIPULADO`) AS PROGRESO
    FROM PERSONA P, DISCIPULADO D, DETDISCIPULADOR DD, DISCIPULADOR DI
    WHERE P.`idPERSONA`=D.`idPERSONA`
    AND D.`idDISCIPULADO`=DD.`idDISCIPULADO`
    AND DD.`idDISCIPULADOR`=DI.`idDISCIPULADOR`)A
    WHERE A.IDDISCIPULADOR=12 OR A.IDDISCIPULADOR=(SELECT IDASOCIADO FROM DISCIPULADOR WHERE IDDISCIPULADOR=12);


DELIMITER$$
CREATE PROCEDURE DEL_DISCIPULADOR(IDDI INTEGER)
BEGIN
    DECLARE IDA INTEGER;
    SELECT IDASOCIADO INTO IDA FROM DISCIPULADOR WHERE IDDISCIPULADOR=IDDI;
    IF IDA>0 THEN
        START TRANSACTION;
        UPDATE DETDISCIPULADOR SET IDDISCIPULADOR=IDA WHERE IDDISCIPULADOR=IDDI;
        COMMIT;
        DELETE FROM DETROL WHERE IDUSUARIO=
        (SELECT IDUSUARIO FROM USUARIO WHERE IDPERSONA=
        (SELECT IDPERSONA FROM MIEMBROGP WHERE IDMIEMBROGP=
        (SELECT IDMIEMBROGP FROM DISCIPULADOR WHERE IDDISCIPULADOR=IDDI))) AND IDROL=4;
        DELETE FROM DISCIPULADOR WHERE IDDISCIPULADOR=IDDI;
        SELECT 1 AS RESULT;
    ELSE
        IF(SELECT COUNT(*) FROM DETDISCIPULADOR WHERE IDDISCIPULADOR=IDDI)>0 THEN
            SELECT -1 AS RESULT;
        ELSE
            DELETE FROM DETROL WHERE IDUSUARIO=
            (SELECT IDUSUARIO FROM USUARIO WHERE IDPERSONA=
            (SELECT IDPERSONA FROM MIEMBROGP WHERE IDMIEMBROGP=
            (SELECT IDMIEMBROGP FROM DISCIPULADOR WHERE IDDISCIPULADOR=IDDI))) AND IDROL=4;
            DELETE FROM DISCIPULADOR WHERE IDDISCIPULADOR=IDDI;
            SELECT 1 AS RESULT;
        END IF;
    END IF;
END$$

SELECT COUNT(*) FROM DISCIPULADOR WHERE IDMIEMBROGP=IDA

CALL GET_TIPO_LECCION_DISCIPULO(1);
DROP PROCEDURE GET_LECCION_DISCIPULO;
DELIMITER $$
CREATE PROCEDURE GET_LECCION_DISCIPULO(IDT INTEGER,IDDI INTEGER)
BEGIN
    SELECT L.*, 
    IFNULL((SELECT IDLECCION FROM TRABMISIONERO WHERE `idLECCION`=L.IDLECCION AND `idDISCIPULADO`=IDDI),0) AS TRABAJO
    FROM LECCION L, DISCIPULADO D, DETLECCION DD, TIPOLECCION TL
    WHERE L.`idTIPOLECCION`=TL.`idTIPOLECCION`
    AND DD.`idTIPOLECCION`=TL.`idTIPOLECCION`
    AND D.`idDISCIPULADO`=DD.`idDISCIPULADO`
    AND D.`idDISCIPULADO`=IDDI
    AND L.`idTIPOLECCION`=IDT;
END$$
SELECT L.*, 
    IFNULL((SELECT IDLECCION FROM TRABMISIONERO WHERE `idLECCION`=L.IDLECCION AND `idDISCIPULADO`=1),0) AS TRABAJO
    FROM LECCION L, DISCIPULADO D, DETLECCION DD, TIPOLECCION TL
    WHERE L.`idTIPOLECCION`=TL.`idTIPOLECCION`
    AND DD.`idTIPOLECCION`=TL.`idTIPOLECCION`
    AND D.`idDISCIPULADO`=DD.`idDISCIPULADO`
    AND D.`idDISCIPULADO`=1
    AND L.`idTIPOLECCION`=1;

CALL LIST_ASISTENCIA(2);

CALL GET_DISCIPULO(12);
CALL GET_ROL(11);