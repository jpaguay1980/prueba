USE [master]
GO
/****** Object:  Database [prueba]    Script Date: 17/10/2023 13:52:27 ******/
CREATE DATABASE [prueba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prueba', FILENAME = N'D:\Microsoft SQL Server2\MSSQL15.MSSQLSERVER19\MSSQL\DATA\prueba.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prueba_log', FILENAME = N'D:\Microsoft SQL Server2\MSSQL15.MSSQLSERVER19\MSSQL\DATA\prueba_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [prueba] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prueba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prueba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prueba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prueba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prueba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prueba] SET ARITHABORT OFF 
GO
ALTER DATABASE [prueba] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [prueba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prueba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prueba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prueba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prueba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prueba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prueba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prueba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prueba] SET  DISABLE_BROKER 
GO
ALTER DATABASE [prueba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prueba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prueba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prueba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prueba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prueba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prueba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prueba] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [prueba] SET  MULTI_USER 
GO
ALTER DATABASE [prueba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prueba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prueba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prueba] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [prueba] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [prueba] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [prueba] SET QUERY_STORE = OFF
GO
USE [prueba]
GO
/****** Object:  Table [dbo].[cargos]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
	[idUsuarioCreacion] [int] NOT NULL,
 CONSTRAINT [PK_cargos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departamentos]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamentos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
	[idUsuarioCreacion] [int] NOT NULL,
 CONSTRAINT [PK_departamentos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[failed_jobs]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[failed_jobs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uuid] [nvarchar](255) NOT NULL,
	[connection] [nvarchar](max) NOT NULL,
	[queue] [nvarchar](max) NOT NULL,
	[payload] [nvarchar](max) NOT NULL,
	[exception] [nvarchar](max) NOT NULL,
	[failed_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[migrations]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[migration] [nvarchar](255) NOT NULL,
	[batch] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[password_reset_token]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[password_reset_token](
	[email] [nvarchar](255) NOT NULL,
	[token] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [password_reset_token_email_primary] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personal_access_tokens]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personal_access_tokens](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tokenable_type] [nvarchar](255) NOT NULL,
	[tokenable_id] [bigint] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[token] [nvarchar](64) NOT NULL,
	[abilities] [nvarchar](max) NULL,
	[last_used_at] [datetime] NULL,
	[expires_at] [datetime] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[todos]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[todos](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[email_verified_at] [datetime] NULL,
	[password] [nvarchar](255) NOT NULL,
	[remember_token] [nvarchar](100) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[primerNombre] [varchar](50) NOT NULL,
	[segundoNombre] [varchar](50) NOT NULL,
	[primerApellido] [varchar](50) NOT NULL,
	[segundoApellido] [varchar](50) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[idCargo] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cargos] ON 

INSERT [dbo].[cargos] ([id], [codigo], [nombre], [activo], [idUsuarioCreacion]) VALUES (1, N'LCO', N'LIDER CONTABLE', 1, 1)
INSERT [dbo].[cargos] ([id], [codigo], [nombre], [activo], [idUsuarioCreacion]) VALUES (2, N'SIS1', N'LIDER DE PROYECTOS', 1, 1)
INSERT [dbo].[cargos] ([id], [codigo], [nombre], [activo], [idUsuarioCreacion]) VALUES (3, N'SIS2', N'PROGRAMADOR SENIOR', 1, 1)
INSERT [dbo].[cargos] ([id], [codigo], [nombre], [activo], [idUsuarioCreacion]) VALUES (4, N'SIS2', N'PROGRAMADOR JUNIOR', 1, 1)
SET IDENTITY_INSERT [dbo].[cargos] OFF
GO
SET IDENTITY_INSERT [dbo].[departamentos] ON 

INSERT [dbo].[departamentos] ([id], [codigo], [nombre], [activo], [idUsuarioCreacion]) VALUES (1, N'SIS', N'SISTEMAS', 1, 1)
INSERT [dbo].[departamentos] ([id], [codigo], [nombre], [activo], [idUsuarioCreacion]) VALUES (2, N'CNT', N'CONTABILIDAD', 1, 1)
SET IDENTITY_INSERT [dbo].[departamentos] OFF
GO
SET IDENTITY_INSERT [dbo].[migrations] ON 

INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (1, N'2014_10_12_000000_create_users_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (2, N'2014_10_12_100000_create_password_reset_tokens_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (3, N'2019_08_19_000000_create_failed_jobs_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (4, N'2019_12_14_000001_create_personal_access_tokens_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (5, N'2023_10_13_144259_create_todos_table', 1)
SET IDENTITY_INSERT [dbo].[migrations] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id], [usuario], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDepartamento], [idCargo]) VALUES (1, N'JPAGUAY2', N'JORGE', N'ROBERTO', N'PAGUAY', N'AMAGUAYA', 2, 1)
INSERT [dbo].[usuarios] ([id], [usuario], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDepartamento], [idCargo]) VALUES (2, N'DPAGUAY', N'DARWW', N'RENE', N'PAGUAY', N'AMAGUAAY', 1, 3)
INSERT [dbo].[usuarios] ([id], [usuario], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDepartamento], [idCargo]) VALUES (3, N'JPEREZ', N'JUAN', N'SEGUNDO', N'PEREZ', N'PEREZ2', 1, 4)
INSERT [dbo].[usuarios] ([id], [usuario], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDepartamento], [idCargo]) VALUES (4, N'AAA', N'A1', N'A2', N'P1', N'P2', 2, 2)
INSERT [dbo].[usuarios] ([id], [usuario], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDepartamento], [idCargo]) VALUES (6, N'JPAGUAY2', N'JORGE2', N'ROBERTO2', N'PAGUAY2', N'AMAGUAYA2', 1, 1)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [failed_jobs_uuid_unique]    Script Date: 17/10/2023 13:52:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [failed_jobs_uuid_unique] ON [dbo].[failed_jobs]
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [personal_access_tokens_token_unique]    Script Date: 17/10/2023 13:52:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [personal_access_tokens_token_unique] ON [dbo].[personal_access_tokens]
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [personal_access_tokens_tokenable_type_tokenable_id_index]    Script Date: 17/10/2023 13:52:27 ******/
CREATE NONCLUSTERED INDEX [personal_access_tokens_tokenable_type_tokenable_id_index] ON [dbo].[personal_access_tokens]
(
	[tokenable_type] ASC,
	[tokenable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [usuarios_email_unique]    Script Date: 17/10/2023 13:52:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [usuarios_email_unique] ON [dbo].[usuario]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cargos] ADD  CONSTRAINT [DF_cargos_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[departamentos] ADD  CONSTRAINT [DF_departamentos_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[failed_jobs] ADD  DEFAULT (getdate()) FOR [failed_at]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [fk_users_cargos] FOREIGN KEY([idCargo])
REFERENCES [dbo].[cargos] ([id])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [fk_users_cargos]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [fk_users_departamentos] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[departamentos] ([id])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [fk_users_departamentos]
GO
/****** Object:  StoredProcedure [dbo].[sp_crear_usuario]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_crear_usuario] @usuario varchar(50),@primerNombre varchar(50), @segundoNombre varchar(50),
							 @primerApellido varchar(50), @segundoApellido varchar(50), @idDepartamento int,
							 @idCargo int
as
begin
	declare @id int = 0
	insert into dbo.users (usuario, primerNombre, segundoNombre, primerApellido, segundoApellido,
						   idDepartamento, idCargo)
		values(@usuario ,@primerNombre , @segundoNombre , @primerApellido , @segundoApellido , 
			   @idDepartamento , @idCargo)
	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_usuario]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_eliminar_usuario] @id int
as
begin
	delete from dbo.users
	where id = @id 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_usuario]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_usuario] @id int
as
begin
	select a.*,  d.nombre as departamento, c.nombre as cargo
	from dbo.users a with(nolock)
	inner join dbo.departamentos d with(nolock) on a.iddepartamento = d.id
	inner join dbo.cargos c with(nolock) on a.idcargo = c.id
	where a.id =@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_lista_cargos]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jorge Paguay
-- Create date: 03/10/2023
-- Description:	listar cargos
-- =============================================
CREATE PROCEDURE [dbo].[sp_lista_cargos]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    SELECT id, codigo,nombre,activo,idUsuarioCreacion from dbo.cargos
END
GO
/****** Object:  StoredProcedure [dbo].[sp_lista_departamentos]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jorge Paguay
-- Create date: 03/10/2023
-- Description:	listar departamentos
-- =============================================
CREATE PROCEDURE [dbo].[sp_lista_departamentos]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    SELECT id, codigo,nombre,activo,idUsuarioCreacion from dbo.departamentos
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_usuario]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_listar_usuario] @id int =null
as
begin
	select a.*,  d.nombre as departamento, c.nombre as cargo
	from dbo.usuarios a with(nolock)
	inner join dbo.departamentos d with(nolock) on a.iddepartamento = d.id
	inner join dbo.cargos c with(nolock) on a.idcargo = c.id
	where a.id = isnull(@id , a.id)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_modificar_usuario]    Script Date: 17/10/2023 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_modificar_usuario] @id int, @usuario varchar(50),@primerNombre varchar(50), 
								 @segundoNombre varchar(50), @primerApellido varchar(50), 
								 @segundoApellido varchar(50), @idDepartamento int, @idCargo int
as
begin
	update dbo.users
	set usuario = @usuario,
		primerNombre = @primerNombre, 
		segundoNombre = @segundoNombre, 
		primerApellido = @primerApellido,
		segundoApellido = @segundoApellido,
	    idDepartamento = @idDepartamento, 
		idCargo = @idCargo
	where id = @id 
	select 'OK' AS estado, 'SE ACTUALIZO CON EXITO' mensaje
end
GO
USE [master]
GO
ALTER DATABASE [prueba] SET  READ_WRITE 
GO
