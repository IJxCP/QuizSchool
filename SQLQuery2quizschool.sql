-- Crear la base de datos
Create DATABASE QuizSchoolManagement;
GO


USE QuizSchoolManagement;
GO


CREATE TABLE SCHOOL (
    SchoolId INT PRIMARY KEY,
    SchoolName VARCHAR(50) NOT NULL,
    Descriptio VARCHAR(1000),
    Addres VARCHAR(50),
    Phone VARCHAR(50),
    PostCode VARCHAR(50),
    PostAddress VARCHAR(50)
);


CREATE TABLE CLASS (
    ClassId INT PRIMARY KEY,
    SchoolId INT NOT NULL,
    ClassName VARCHAR(50) NOT NULL,
    Descriptio VARCHAR(1000),
    FOREIGN KEY (SchoolId) REFERENCES SCHOOL(SchoolId)
);





CREATE PROCEDURE Consulta
    @id INT
AS
BEGIN
    SELECT *
    FROM SCHOOL
    WHERE SchoolId = @id;
END;


CREATE PROCEDURE Insertar
    @SchoolId INT,
    @SchoolName VARCHAR(50),
    @Description VARCHAR(1000),
    @Address VARCHAR(50),
    @Phone VARCHAR(50),
    @PostCode VARCHAR(50),
    @PostAddress VARCHAR(50)
AS
BEGIN
    INSERT INTO SCHOOL (SchoolId, SchoolName, Descriptio, Addres, Phone, PostCode, PostAddress)
    VALUES (@SchoolId, @SchoolName, @Description, @Address, @Phone, @PostCode, @PostAddress);
END;

CREATE PROCEDURE Borrar
    @id INT
AS
BEGIN
    DELETE FROM SCHOOL WHERE SchoolId = @id;
END;

CREATE PROCEDURE Modificar
    @id INT,
    @SchoolName VARCHAR(50),
    @Descriptio VARCHAR(1000),
    @Phone VARCHAR(50),
    @PostCode VARCHAR(50),
    @PostAddress VARCHAR(50)
AS
BEGIN
    UPDATE SCHOOL
    SET SchoolName = @SchoolName,
        Descriptio = @Descriptio,
        Phone = @Phone,
        PostCode = @PostCode,
        PostAddress = @PostAddress
    WHERE SchoolId = @id;
END;

CREATE PROCEDURE ConsultaClass
    @id INT
AS
BEGIN
    SELECT *
    FROM CLASS
    WHERE ClassId = @id;
END;


CREATE PROCEDURE InsertarCLass
    @ClassId int,
    @SchoolId int,
    @ClassName VARCHAR(50),
    @Descriptio VARCHAR(1000)

AS
BEGIN
    INSERT INTO CLASS(ClassId,SchoolId,ClassName)
    VALUES (@ClassId, @SchoolId, @ClassName);
END;

CREATE PROCEDURE BorrarClass
    @id INT
AS
BEGIN
    DELETE FROM CLASS WHERE CLASSId = @id;
END;

CREATE PROCEDURE modificarClass
    @id INT,
    @ClassId INT,
    @SchoolId INT,
    @ClassName VARCHAR(50),
    @Descriptio VARCHAR(1000)
AS
BEGIN
    UPDATE CLASS
    SET ClassId = @ClassId,
        SchoolId = @SchoolId,
        ClassName = @ClassName,
        Descriptio = @Descriptio
    WHERE ClassId = @id;
END;
