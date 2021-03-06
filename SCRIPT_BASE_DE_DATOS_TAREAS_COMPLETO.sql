USE [TAREAS]
GO
/****** Object:  StoredProcedure [dbo].[spInsertarTareas]    Script Date: 4/17/2019 12:00:53 PM ******/
DROP PROCEDURE [dbo].[spInsertarTareas]
GO
/****** Object:  StoredProcedure [dbo].[spEliminarTareas]    Script Date: 4/17/2019 12:00:53 PM ******/
DROP PROCEDURE [dbo].[spEliminarTareas]
GO
/****** Object:  StoredProcedure [dbo].[spConsultaTareasUsuarios]    Script Date: 4/17/2019 12:00:53 PM ******/
DROP PROCEDURE [dbo].[spConsultaTareasUsuarios]
GO
/****** Object:  StoredProcedure [dbo].[spConsultaTareasPorEstado]    Script Date: 4/17/2019 12:00:53 PM ******/
DROP PROCEDURE [dbo].[spConsultaTareasPorEstado]
GO
/****** Object:  StoredProcedure [dbo].[spConsultaTareas]    Script Date: 4/17/2019 12:00:53 PM ******/
DROP PROCEDURE [dbo].[spConsultaTareas]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarTareas]    Script Date: 4/17/2019 12:00:53 PM ******/
DROP PROCEDURE [dbo].[spActualizarTareas]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 4/17/2019 12:00:53 PM ******/
DROP TABLE [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[TareasXUsuario]    Script Date: 4/17/2019 12:00:53 PM ******/
DROP TABLE [dbo].[TareasXUsuario]
GO
/****** Object:  Table [dbo].[Tareas]    Script Date: 4/17/2019 12:00:53 PM ******/
DROP TABLE [dbo].[Tareas]
GO
/****** Object:  Table [dbo].[LOGERRORES]    Script Date: 4/17/2019 12:00:53 PM ******/
DROP TABLE [dbo].[LOGERRORES]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 4/17/2019 12:00:53 PM ******/
DROP TABLE [dbo].[Estados]
GO
USE [master]
GO
/****** Object:  Database [TAREAS]    Script Date: 4/17/2019 12:00:53 PM ******/
DROP DATABASE [TAREAS]
GO
/****** Object:  Database [TAREAS]    Script Date: 4/17/2019 12:00:53 PM ******/
CREATE DATABASE [TAREAS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TAREAS', FILENAME = N'C:\Users\extisjlmarrugom\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\TAREAS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TAREAS_log', FILENAME = N'C:\Users\extisjlmarrugom\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\TAREAS.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TAREAS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TAREAS] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [TAREAS] SET ANSI_NULLS ON 
GO
ALTER DATABASE [TAREAS] SET ANSI_PADDING ON 
GO
ALTER DATABASE [TAREAS] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [TAREAS] SET ARITHABORT ON 
GO
ALTER DATABASE [TAREAS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TAREAS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TAREAS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TAREAS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TAREAS] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [TAREAS] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [TAREAS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TAREAS] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [TAREAS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TAREAS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TAREAS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TAREAS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TAREAS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TAREAS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TAREAS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TAREAS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TAREAS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TAREAS] SET RECOVERY FULL 
GO
ALTER DATABASE [TAREAS] SET  MULTI_USER 
GO
ALTER DATABASE [TAREAS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TAREAS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TAREAS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TAREAS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TAREAS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TAREAS]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 4/17/2019 12:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOGERRORES]    Script Date: 4/17/2019 12:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOGERRORES](
	[DESCERROR] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Tareas]    Script Date: 4/17/2019 12:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tareas](
	[Id] [int] NOT NULL,
	[Titulo] [nvarchar](150) NOT NULL,
	[Detalle] [nvarchar](max) NULL,
	[FechaCrea] [datetime] NOT NULL,
	[IdUsuarios] [int] NOT NULL,
	[FechaVen] [datetime] NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TareasXUsuario]    Script Date: 4/17/2019 12:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TareasXUsuario](
	[Id] [int] NOT NULL,
	[IdUsuarios] [int] NOT NULL,
	[IdTarea] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 4/17/2019 12:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] NOT NULL,
	[Login] [nvarchar](50) NULL,
	[Clave] [nvarchar](100) NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Estados] ([Id], [Nombre]) VALUES (0, N'Inactivo')
GO
INSERT [dbo].[Estados] ([Id], [Nombre]) VALUES (1, N'Activo')
GO
INSERT [dbo].[Tareas] ([Id], [Titulo], [Detalle], [FechaCrea], [IdUsuarios], [FechaVen], [Estado]) VALUES (1, N'Tarea 1', N'ddddddddddddd', CAST(N'2019-04-13 00:00:00.000' AS DateTime), 1, CAST(N'2019-04-15 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Tareas] ([Id], [Titulo], [Detalle], [FechaCrea], [IdUsuarios], [FechaVen], [Estado]) VALUES (2, N'Tarea 2', N'dddddddddddwwdd', CAST(N'2019-04-13 00:00:00.000' AS DateTime), 1, CAST(N'2019-04-13 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Tareas] ([Id], [Titulo], [Detalle], [FechaCrea], [IdUsuarios], [FechaVen], [Estado]) VALUES (3, N'Tarea 3', N'dddddddddddwwdd', CAST(N'2019-04-13 00:00:00.000' AS DateTime), 1, CAST(N'2019-04-12 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Tareas] ([Id], [Titulo], [Detalle], [FechaCrea], [IdUsuarios], [FechaVen], [Estado]) VALUES (4, N'Tarea 1', N'aaaaaa', CAST(N'2019-04-13 00:00:00.000' AS DateTime), 2, CAST(N'2019-04-13 00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Tareas] ([Id], [Titulo], [Detalle], [FechaCrea], [IdUsuarios], [FechaVen], [Estado]) VALUES (5, N'Tarea 2', N'aaaaaa', CAST(N'2019-04-13 00:00:00.000' AS DateTime), 2, CAST(N'2019-04-13 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Tareas] ([Id], [Titulo], [Detalle], [FechaCrea], [IdUsuarios], [FechaVen], [Estado]) VALUES (6, N'tarea5', N'pruebas ', CAST(N'2019-04-14 08:33:16.360' AS DateTime), 1, CAST(N'2019-04-14 08:33:16.360' AS DateTime), 1)
GO
INSERT [dbo].[Usuarios] ([Id], [Login], [Clave], [Estado]) VALUES (1, N'jmarrufom', N'12345', 1)
GO
INSERT [dbo].[Usuarios] ([Id], [Login], [Clave], [Estado]) VALUES (2, N'mbaez', N'12345', 1)
GO
/****** Object:  StoredProcedure [dbo].[spActualizarTareas]    Script Date: 4/17/2019 12:00:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Marrufo 
-- Create date: 14/04/2019
-- Description:	actualizar las tareas 
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarTareas]
 @idTarea int ,
 @Titulo nvarchar(150),
 @Detalle nvarchar(max),
 @FechaVen nvarchar(10),
 @Estado  int 
 	
AS
BEGIN
	
BEGIN TRY

UPDATE [dbo].[Tareas]
   SET 
       [Titulo] = @Titulo
      ,[Detalle] = @Detalle
      ,[FechaVen] = convert(datetime,@FechaVen)
      ,[Estado] = @Estado
 WHERE  Id = @idTarea


 Select T.[Titulo],T.[Detalle],T.[FechaVen], E.Nombre as Estado
 from   [Tareas] T , [Estados] E
 where  T.Estado = E.Id and T.Id = @idTarea

 END TRY

BEGIN CATCH
DECLARE @DESCERROR VARCHAR (200)
SELECT @DESCERROR= ISNULL(ERROR_MESSAGE() ,'')
SELECT @DESCERROR=@DESCERROR + ISNULL(ERROR_PROCEDURE(),'')
INSERT INTO [dbo].[LOGERRORES] (DESCERROR) VALUES(@DESCERROR)
Select 'Error Actualizacion'
END CATCH


END


GO
/****** Object:  StoredProcedure [dbo].[spConsultaTareas]    Script Date: 4/17/2019 12:00:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----
CREATE PROCEDURE [dbo].[spConsultaTareas]
	
AS
	
--- Consulta  para mostrar todos las tareas  (Activas e inictiva) ordenas por usuarios 
BEGIN TRY


	
Select  T.Titulo , 
        T.Detalle,
		T.FechaCrea [Fecha Creacion],
		T.FechaVen  [Fecha Vencimiento],
		U.Login    [Creador],
		E.Nombre   [Estado]
from  Tareas T,  Usuarios U,   Estados E
Where  T.IdUsuarios = U.Id  and E.Id = T.Estado
order by T.FechaVen ASC

END TRY

BEGIN CATCH
DECLARE @DESCERROR VARCHAR (200)
SELECT @DESCERROR= ISNULL(ERROR_MESSAGE() ,'')
SELECT @DESCERROR=@DESCERROR + ISNULL(ERROR_PROCEDURE(),'')
INSERT INTO [dbo].[LOGERRORES] (DESCERROR) VALUES(@DESCERROR)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spConsultaTareasPorEstado]    Script Date: 4/17/2019 12:00:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Luis Marrufo 
-- Create date: 16/04/2019
-- Description:	Consulta de tareas por estado 
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaTareasPorEstado]
	-- Add the parameters for the stored procedure here
	@Usuario varchar (50), 
	@IdEstado int 
AS
BEGIN


  Select  
      Id   ,
	  Titulo , 
	  Detalle,
	  FechaCrea as [Fecha_Creacion]   ,
	  FechaVen as [Fecha_Vencimiento]
from [dbo].[Tareas]
where Estado =@IdEstado and   IdUsuarios in (select Id from Usuarios where Login =  @Usuario)
order by FechaVen ASC  



END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaTareasUsuarios]    Script Date: 4/17/2019 12:00:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----
CREATE PROCEDURE [dbo].[spConsultaTareasUsuarios]

@Usuario VARCHAR (20)	
AS

BEGIN	
--- Consulta  para mostrar todos las tareas  (Activas e inictiva) ordenas por usuarios 
BEGIN TRY


	
Select  T.Titulo , 
        T.Detalle,
		T.FechaCrea [Fecha Creacion],
		T.FechaVen  [Fecha Vencimiento],
		U.Login    [Creador],
		E.Nombre   [Estado]
from  Tareas T,  Usuarios U,   Estados E
Where  T.IdUsuarios = U.Id  and E.Id = T.Estado
and  U.Login in (@Usuario)
order by T.FechaVen ASC  


END TRY

BEGIN CATCH
DECLARE @DESCERROR VARCHAR (200)
SELECT @DESCERROR= ISNULL(ERROR_MESSAGE() ,'')
SELECT @DESCERROR=@DESCERROR + ISNULL(ERROR_PROCEDURE(),'')
INSERT INTO [dbo].[LOGERRORES] (DESCERROR) VALUES(@DESCERROR)
END CATCH


END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarTareas]    Script Date: 4/17/2019 12:00:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEliminarTareas]
	@Id  int
	
	AS
	BEGIN TRY

	
	
    DELETE FROM [dbo].[Tareas]  WHERE Id =@Id  
	

	
END TRY

BEGIN CATCH
DECLARE @DESCERROR VARCHAR (200)
SELECT @DESCERROR= ISNULL(ERROR_MESSAGE() ,'')
SELECT @DESCERROR=@DESCERROR + ISNULL(ERROR_PROCEDURE(),'')
INSERT INTO [dbo].[LOGERRORES] (DESCERROR) VALUES(@DESCERROR)
END CATCH







		
GO
/****** Object:  StoredProcedure [dbo].[spInsertarTareas]    Script Date: 4/17/2019 12:00:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertarTareas]
	@Titulo  NVarchar(150),
	@Detalle NVarchar(max),
	@Usuario NVarchar(50),
	@FechaVen NVarchar(10),
	@Estado   int
AS
	BEGIN
	BEGIN TRY

	
	Declare @idUsuario int
	Declare @Idfila    int 

	Select  @Idfila =   max(id) from Tareas 
	set     @Idfila =   @Idfila + 1

	Select @idUsuario = Id  from  [dbo].[Usuarios] where Login in (@Usuario)

	Insert Into Tareas
	       (Id,Titulo,Detalle,[FechaCrea], [FechaVen] , [IdUsuarios],[Estado])
    Values( @Idfila,@Titulo,@Detalle,convert(datetime,GETDATE()),convert(datetime,@FechaVen), @idUsuario,@Estado)

	
END TRY

BEGIN CATCH
DECLARE @DESCERROR VARCHAR (200)
SELECT @DESCERROR= ISNULL(ERROR_MESSAGE() ,'')
SELECT @DESCERROR=@DESCERROR + ISNULL(ERROR_PROCEDURE(),'')
INSERT INTO [dbo].[LOGERRORES] (DESCERROR) VALUES(@DESCERROR)
END CATCH

END


		
GO
USE [master]
GO
ALTER DATABASE [TAREAS] SET  READ_WRITE 
GO
