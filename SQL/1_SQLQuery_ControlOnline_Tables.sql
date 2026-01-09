USE [Prueba_Bodega]
GO

/****** Object:  Table [dbo].[ControlOnline_Tarea]    Script Date: 9/01/2026 9:18:19 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Crea tabala tarea

CREATE TABLE [dbo].[ControlOnline_Tarea](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](500) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Prioridad] [int] NULL,
	[Estado] [int] NULL,
 CONSTRAINT [PK_ControlOnline_Tarea] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-- Crea tabla Estado
CREATE TABLE [dbo].[ControlOnline_Estado](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](500) NULL,
 CONSTRAINT [PK_ControlOnline_Estado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO

-- Insertar datos en Estado

INSERT INTO [dbo].[ControlOnline_Estado] ([Nombre]) VALUES ('To Do')
INSERT INTO [dbo].[ControlOnline_Estado] ([Nombre]) VALUES ('In Progress')
INSERT INTO [dbo].[ControlOnline_Estado] ([Nombre]) VALUES ('Done')
GO

--Crea tabla Prioridad
CREATE TABLE [dbo].[ControlOnline_Prioridad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](500) NULL,
 CONSTRAINT [PK_ControlOnline_Prioridad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO

-- Insertar datos en Prioridad

INSERT INTO [dbo].[ControlOnline_Prioridad] ([Nombre]) VALUES ('Alta')
INSERT INTO [dbo].[ControlOnline_Prioridad] ([Nombre]) VALUES ('Media')
INSERT INTO [dbo].[ControlOnline_Prioridad] ([Nombre]) VALUES ('Baja')
GO

-- Crear procedimientos Almanenados 
GO
CREATE PROCEDURE [dbo].[ControlOnline_Insertar_Tarea]
    @Nombre NVARCHAR(500),
    @Descripcion  NVARCHAR(max),
    @Prioridad INT,
    @Estado INT    
AS
BEGIN
    INSERT INTO ControlOnline_Tarea (Nombre, Descripcion, Prioridad, Estado)
    VALUES (@Nombre, @Descripcion, @Prioridad, @Estado);
END;

-- SP Consulta

CREATE PROCEDURE [dbo].[ControlOnline_Consultar_Tareas]
    @Id INT
AS
BEGIN
if (@Id = 0)
    Begin
            SELECT * FROM ControlOnline_Tarea
    End
Else
    Begin
            SELECT * FROM ControlOnline_Tarea where ID = @Id
    End   
END;

-- SP Actualizar
CREATE PROCEDURE [dbo].[ControlOnline_Actualizar_Tarea]
    @ID INT,
    @Nombre NVARCHAR(500),
    @Descripcion NVARCHAR(max),
    @Prioridad INT,
    @Estado INT 
AS
BEGIN
    UPDATE ControlOnline_Tarea
    SET Nombre = @Nombre,
        Descripcion = @Descripcion,
        Prioridad = @Prioridad,
        Estado = @Estado
    WHERE ID = @ID;
END;

-- SP Eliminar
CREATE PROCEDURE [dbo].[ControlOnline_Eliminar_Tarea]
    @ID INT
AS
BEGIN
    DELETE FROM ControlOnline_Tarea
    WHERE ID = @ID;
END;
GO

