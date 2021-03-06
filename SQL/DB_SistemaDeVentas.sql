USE [master]
GO
/****** Object:  Database [DB_SistemaDeVentas]    Script Date: 2/10/2020 23:18:32 ******/
CREATE DATABASE [DB_SistemaDeVentas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_SistemaDeVentas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_SistemaDeVentas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_SistemaDeVentas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_SistemaDeVentas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_SistemaDeVentas] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_SistemaDeVentas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_SistemaDeVentas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET  MULTI_USER 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_SistemaDeVentas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_SistemaDeVentas] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_SistemaDeVentas', N'ON'
GO
ALTER DATABASE [DB_SistemaDeVentas] SET QUERY_STORE = OFF
GO
USE [DB_SistemaDeVentas]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 2/10/2020 23:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [pk_rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 2/10/2020 23:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[n_usuario] [varchar](50) NOT NULL,
	[pass] [varchar](max) NULL,
	[email] [varchar](200) NULL,
	[idRol] [int] NULL,
	[estado] [bit] NULL,
	[legajo] [varchar](15) NULL,
 CONSTRAINT [pk_usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([idRol], [nombre]) VALUES (1, N'Administrativo')
INSERT [dbo].[roles] ([idRol], [nombre]) VALUES (2, N'Control Alto')
INSERT [dbo].[roles] ([idRol], [nombre]) VALUES (3, N'Control Bajo')
INSERT [dbo].[roles] ([idRol], [nombre]) VALUES (4, N'Operativo')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([idUsuario], [nombre], [apellido], [n_usuario], [pass], [email], [idRol], [estado], [legajo]) VALUES (1, N'Franco', N'Torres', N'cabezonbhh', N'QNv1GCMtKoZ3jKC2kCoGFA==', N'francotorres90@gmail.com', 1, 1, N'63624')
INSERT [dbo].[usuarios] ([idUsuario], [nombre], [apellido], [n_usuario], [pass], [email], [idRol], [estado], [legajo]) VALUES (2, N'prueba', N'prueba', N'prueba', N'Xh3mRNuifao=', N'prueba@gmail.com', 3, 1, N'prueba')
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [fk_usuario_rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[roles] ([idRol])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [fk_usuario_rol]
GO
/****** Object:  StoredProcedure [dbo].[SP_Existe_Usuario]    Script Date: 2/10/2020 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Existe_Usuario]
@usuario varchar(50)
as
select idUsuario
from usuarios
where n_usuario = @usuario and estado = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Iniciar_sesion]    Script Date: 2/10/2020 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Iniciar_sesion]
@n_usuario varchar(50),
@password varchar(max)
as
select idUsuario
from usuarios
where n_usuario = @n_usuario and pass = @password and estado = 1
GO
/****** Object:  StoredProcedure [dbo].[SP_Modificar_usuario]    Script Date: 2/10/2020 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Modificar_usuario]
@nombre varchar(50),
@apellido varchar(50),
@n_usuario varchar(50),
@pass varchar(max),
@email varchar(200),
@idRol int,
@legajo varchar(15),
@id int
as
BEGIN TRANSACTION 
BEGIN TRY

update usuarios
set nombre = @nombre, apellido = @apellido, n_usuario = @n_usuario, pass = @pass, email = @email, idRol = @idRol, legajo = @legajo
where idUsuario = @id

COMMIT TRANSACTION 

END TRY

BEGIN CATCH

/* si hay un error, deshacemos los cambios*/ 
ROLLBACK TRANSACTION
SELECT @@ROWCOUNT

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Nuevo_usuario]    Script Date: 2/10/2020 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Nuevo_usuario]
@nombre varchar(50),
@apellido varchar(50),
@n_usuario varchar(50),
@pass varchar(max),
@email varchar(200),
@idRol int,
@legajo varchar(15)
as
BEGIN TRANSACTION 
BEGIN TRY

IF NOT EXISTS(SELECT n_usuario FROM usuarios WHERE n_usuario = @n_usuario and estado = 1)
	BEGIN 
		insert into usuarios(nombre,apellido,n_usuario,pass,email,idRol,estado,legajo)
		values(@nombre,@apellido,@n_usuario,@pass,@email,@idRol,1,@legajo)
    END
COMMIT TRANSACTION 

END TRY

BEGIN CATCH

/* si hay un error, deshacemos los cambios*/ 
ROLLBACK TRANSACTION
SELECT @@ROWCOUNT

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_todos_roles]    Script Date: 2/10/2020 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Obtener_todos_roles]
as
select *
from roles
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_todos_usuarios]    Script Date: 2/10/2020 23:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Obtener_todos_usuarios]
as
select *
from usuarios u join roles r on u.idRol = r.idRol
where u.estado = 1
GO
USE [master]
GO
ALTER DATABASE [DB_SistemaDeVentas] SET  READ_WRITE 
GO
