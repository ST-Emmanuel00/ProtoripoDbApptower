

/*

> ## **Espacios**

*/


CREATE TABLE Parqueaderos (


    IdParqueadero INT IDENTITY(1,1),
    NombreParqueadero VARCHAR (10) NOT NULL,
    TipoParqueadero VARCHAR (50) NOT NULL,
	IdEspacio INT,
    EstadoParqueadero VARCHAR (20) DEFAULT ('ACTIVO')

    CONSTRAINT PKParqueaderos PRIMARY KEY (IdParqueadero),

    CONSTRAINT FKEspacios FOREIGN KEY (IdEspacio) REFERENCES Espacios(IdEspacio),

    CONSTRAINT UNNombreParqueadro UNIQUE (NombreParqueadero),

    CONSTRAINT CKNombreParqueadero CHECK (NombreParqueadero NOT LIKE '%[^a-zA-Z0-9]%'),

    CONSTRAINT CKTipoParqueadero CHECK (TipoParqueadero IN ('RESIDENTES', 'VISITANTES')),

    -- CONSTRAINT DFEstadoParqueadero DEFAULT (EstadoParqueadero ('ACTIVO')),

    CONSTRAINT CKEstadoParqueadero CHECK (EstadoParqueadero in ('ACTIVO', 'INACTIVO'))



)







CREATE TABLE Espacios



(


    IdEspacio INT IDENTITY(1,1),

	TipoEspacio VARCHAR(255) NOT NULL,

    NombreEspacio VARCHAR(255) UNIQUE,

    Area FLOAT DEFAULT (NULL),

    Capacidad INT DEFAULT (NULL),

    EstadoEspacio VARCHAR(20) DEFAULT ('ACTIVO') NOT NULL



    CONSTRAINT PKIdEspacios PRIMARY KEY (IdEspacio),

    CONSTRAINT CKNombreEspacio CHECK (NombreEspacio NOT LIKE '%[^a-zA-Z0-9]%'),

	CONSTRAINT CKTipoEspacio CHECK (TipoEspacio LIKE '%[a-zA-Z0-9]%\s%[a-zA-Z]%'),

    CONSTRAINT CKArea CHECK (Area > 0),

    CONSTRAINT CKCapacidad CHECK (Capacidad > 0 ),

    CONSTRAINT  CKEstadoEspacio CHECK (EstadoEspacio in ('ACTIVO', 'INACTIVO'))





)


CREATE TABLE Propietarios





(



    IdPropietario INT IDENTITY (1,1),

    TipoDocumentoPropietario VARCHAR (20) NOT NULL,

    NumeroDocumentoPropietario VARCHAR (15) NOT NULL,

    NombrePropietario VARCHAR (255) NOT NULL,

    ApellidoPropietario VARCHAR (255) NOT NULL,

	FechaNacimientoPropietario DATETIME NOT NULL,

    CorreoPropietario VARCHAR (80) NOT NULL,

    TelefonoPropietario VARCHAR (15),

    EstadoPropietario VARCHAR(20) DEFAULT ('ACTIVO') NOT NULL





    CONSTRAINT PKIdPropietario PRIMARY KEY (IdPropietario),

    CONSTRAINT CKCorreoPropietario CHECK (CorreoPropietario LIKE '%[A-Za-z0-9]%@%[A-Za-z0-9]%.com' ),

    CONSTRAINT CKNombrePropietario CHECK (NombrePropietario NOT LIKE  '%[^A-Za-z]%'),

    CONSTRAINT CKApellidoPropietario CHECK (ApellidoPropietario NOT LIKE '%[^A-Za-z]%'),

    CONSTRAINT CKTipoDocumentoPropietario CHECK (TipoDocumentoPropietario NOT LIKE '%[^A-Za-z]%'),

    CONSTRAINT CKTelefonoPropietario CHECK (TelefonoPropietario LIKE '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'),

    CONSTRAINT CKNumeroDocumentoPropietario CHECK (NumeroDocumentoPropietario LIKE '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'),

    CONSTRAINT  CKEstadoPropietario CHECK (EstadoPropietario in ('ACTIVO', 'INACTIVO'))







);	



/*



> **Visitantes**



*/







CREATE TABLE Visitantes

(


    IdVisitante INT IDENTITY (1,1),

    TipoDocumentoVisitante VARCHAR (20) NOT NULL,

    NumeroDocumentoVisitante VARCHAR (15),

    NombreVisitante VARCHAR (255) NOT NULL,

    ApellidoVisitante VARCHAR (255) NOT NULL,

    /* CorreoVisitante VARCHAR (80) NOT NULL,

    TelefonoVisitante VARCHAR (15), 

    EdadVisitante INT NOT NULL, */

    GeneroVisitante VARCHAR (1) DEFAULT ('OTRO'),

    PermisoVisitante VARCHAR(20) DEFAULT ('ACTIVO') NOT NULL,



    CONSTRAINT PKIdVisitante PRIMARY KEY (IdVisitante),

    /* CONSTRAINT CK_correo_visitante CHECK (correo_visitante LIKE '%[A-Za-z0-9]%@%[A-Za-z0-9]%.com' ), 

	   CONSTRAINT CK_telefono_visitante CHECK (telefono_visitante LIKE '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'),*/

    CONSTRAINT CKNombreVisitante CHECK (NombreVisitante NOT LIKE  '%[^A-Za-z]%'),

    CONSTRAINT CKApellidoVisitante CHECK (ApellidoVisitante NOT LIKE '%[^A-Za-z]%'),

    CONSTRAINT CKTipoDocumentoVisitante CHECK (TipoDocumentoVisitante NOT LIKE '%[^A-Za-z]%'),

    CONSTRAINT CKNumeroDocumentoVisitante CHECK (NumeroDocumentoVisitante LIKE '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'),

    CONSTRAINT  CKPermisoVisitante CHECK (PermisoVisitante in ('PERMITIDO', 'NO PERMITIDO')),

    CONSTRAINT CKGeneroVisitante CHECK (GeneroVisitante IN ('F', 'M', 'OTRO'))



);	


CREATE TABLE VisitantesPorEspacio
(
	IdVisitantePorEspacio INT IDENTITY (1,1),
	IdEspacio INT,
	IdVisitante INT

	CONSTRAINT PKIdVisitantePorEspacio PRIMARY KEY (IdVisitantePorEspacio),
	CONSTRAINT FKEspacios1 FOREIGN KEY (IdEspacio) REFERENCES Espacios(IdEspacio),
	CONSTRAINT FKVisitante1 FOREIGN KEY (IdVisitante) REFERENCES Visitantes(IdVisitante)

)


CREATE TABLE VehiculosPorEspacio
(
	IdVehiculosPorEspacio INT IDENTITY (1,1),
	IdEspacio INT,
	IdVehiculo INT

	CONSTRAINT PKIdVehiculosPorEspacio PRIMARY KEY (IdVehiculosPorEspacio),
	CONSTRAINT FKEspacios2 FOREIGN KEY (IdEspacio) REFERENCES Espacios(IdEspacio),
	CONSTRAINT FKVehiculo2 FOREIGN KEY (IdVehiculo) REFERENCES Vehiculos(IdVehiculo)

)

CREATE TABLE PropietariosPorEspacio
(
	IdPropietariosPorEspacio INT IDENTITY (1,1),
	IdEspacio INT,
	IdPropietario INT

	CONSTRAINT PKPropietariosPorEspacio PRIMARY KEY (IdPropietariosPorEspacio),
	CONSTRAINT FKEspacios3 FOREIGN KEY (IdEspacio) REFERENCES Espacios(IdEspacio),
	CONSTRAINT FKPropietarios3 FOREIGN KEY (IdPropietario) REFERENCES Propietarios(IdPropietario)

)





CREATE TABLE Residentes


(

    IdResidente INT IDENTITY (1,1),

    TipoDocumentoResidente VARCHAR (20) NOT NULL,

    NumeroDocumentoResidente VARCHAR (15) NOT NULL,

    NombreResidente VARCHAR (255) NOT NULL,

    ApellidoResidente VARCHAR (255) NOT NULL,

	FechaNacimientoResidente DATETIME NOT NULL,

	/* EdadResidente INT NOT NULL, */

    CorreoResidente VARCHAR (80) NOT NULL,

    TelefonoResidente VARCHAR (15),

	TipoResidente VARCHAR (255) DEFAULT ('PROPIETARIO') NOT NULL,

    ResidenciaActual BIT DEFAULT (1) NOT NULL,

    IdEspacio INT NOT NULL,

    FechaInicioResidencia DATETIME NOT NULL,

    FechaFinResidencia DATETIME DEFAULT (NULL),

    EstadoResidente VARCHAR(20) DEFAULT ('ACTIVO') NOT NULL



    CONSTRAINT PKIdResidente PRIMARY KEY (IdResidente),

    CONSTRAINT CKCorreoResidente CHECK (CorreoResidente LIKE '%[A-Za-z0-9]%@%[A-Za-z0-9]%.com' ),

    CONSTRAINT CKNombreResidente CHECK (NombreResidente NOT LIKE  '%[^A-Za-z]%'),

    CONSTRAINT CKApellidoResidente CHECK (ApellidoResidente NOT LIKE '%[^A-Za-z]%'),

    CONSTRAINT CKTipoDocumentoResidente CHECK (NumeroDocumentoResidente NOT LIKE '%[^A-Za-z]%'),

    CONSTRAINT CKTelefonoResidente CHECK (TelefonoResidente LIKE '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'),

    CONSTRAINT CKNumeroDocumentoResidente CHECK (NumeroDocumentoResidente LIKE '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'),

    CONSTRAINT CKEstadoResidente CHECK (EstadoResidente in ('ACTIVO', 'INACTIVO')),

    /* CONSTRAINT CKEdadResidente CHECK (EdadResidente >= 0), */

    CONSTRAINT FKEspacio FOREIGN KEY (IdEspacio) REFERENCES Espacios(IdEspacio),

    CONSTRAINT CKTipoResidente CHECK (TipoResidente IN ('PROPIETARIO', 'ARRENDATARIO'))





);	



CREATE TABLE Reservas


(


    IdReserva INT IDENTITY(1,1),

	IdUsuario INT,

    TipoReserva VARCHAR(40) NOT NULL,

    FechaReserva INT NOT NULL,

    EspacioReserva VARCHAR(40) NOT NULL,

    CantidadPersonas INT NOT NULL,



    CONSTRAINT PKReserva PRIMARY KEY(IdReserva),

	CONSTRAINT FKUsuario FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)

    -- CONSTRAINT FKReserva FOREIGN KEY (FechaReserva) REFERENCES agenda(Id_Agenda)







);


CREATE TABLE ReservasEspacios (


    IdReservaEspacios INT IDENTITY(1,1),
    IdReserva INT,
    IdEspacio INT 

    CONSTRAINT PKReservaEspacios PRIMARY KEY (IdReservaEspacios),
    CONSTRAINT FKReserva1 FOREIGN KEY (IdReserva) REFERENCES Reservas(IdReserva),
    CONSTRAINT FKEspacio1 FOREIGN KEY (IdEspacio) REFERENCES Espacios(IdEspacio),

)

CREATE TABLE ReservasParqueadero (


    IdReservaEspacios INT IDENTITY(1,1),
    IdReserva INT,
    IdParqueadero INT,
	IdVehiculo INT

    CONSTRAINT PKReservaParqueadero PRIMARY KEY (IdReservaEspacios),
    CONSTRAINT FKReserva2 FOREIGN KEY (IdReserva) REFERENCES Reservas(IdReserva),
    CONSTRAINT FKParqueadero2 FOREIGN KEY (IdParqueadero) REFERENCES Parqueaderos(IdParqueadero),
	CONSTRAINT FKVehiculo FOREIGN KEY (IdVehiculo) REFERENCES Vehiculos(IdVehiculo),


)



CREATE TABLE Vehiculos


(


    IdVehiculo INT IDENTITY(1,1),

    Placa VARCHAR(10) NOT NULL,

    TipoUsuarioVehiculo INT NOT NULL,

    NombrePropietarioVehiculo int NOT NULL,



    constraint UCPlaca UNIQUE (Placa),



    constraint PKVehiculos PRIMARY KEY(IdVehiculo)







);



CREATE TABLE Usuarios


(


    IdUsuario INT IDENTITY (1,1),

    Nombre VARCHAR (50),

    Apellido VARCHAR (50),

    IdRol INT,

    TipoDocumento VARCHAR (20),

    Documento VARCHAR (15),

    Correo VARCHAR (80),

    Telefono varchar (15),

    Contrasena varchar (10),

	estado VARCHAR (20) DEFAULT ('ACTIVO')



    CONSTRAINT PkIdUsuario PRIMARY KEY (IdUsuario),



    CONSTRAINT CHKCorreo CHECK (Correo LIKE '%[A-Za-z0-9]%@%[A-Za-z0-9]%.com' ),



    CONSTRAINT CHKNombre CHECK (Nombre NOT LIKE '%[^A-Za-z]%'),



    CONSTRAINT CHKApellido CHECK (Apellido NOT LIKE '%[^A-Za-z]%'),



    CONSTRAINT CHKTipo	CHECK (TipoDocumento NOT LIKE '%[^A-Za-z]%'),



    CONSTRAINT CHKTelefono CHECK (Telefono LIKE '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'),



    CONSTRAINT CHKDocumento CHECK (Documento LIKE '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'),



    CONSTRAINT CHKContrasena CHECK (Contrasena LIKE '%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]'),


	CONSTRAINT CKestado CHECK (estado in ('ACTIVO', 'INACTIVO'))

    -- CONSTRAINT FKIdRol FOREIGN KEY (IdRol) REFERENCES Roles(Id_Rol)







);

