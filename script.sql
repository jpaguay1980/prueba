USE [prueba]
GO
/****** Object:  Table [dbo].[cargos]    Script Date: 06/10/2023 8:32:35 ******/
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
/****** Object:  Table [dbo].[departamentos]    Script Date: 06/10/2023 8:32:35 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 06/10/2023 8:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
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
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [usuario], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDepartamento], [idCargo]) VALUES (1, N'JPAGUAY2', N'JORGE', N'ROBERTO', N'PAGUAY', N'AMAGUAYA', 1, 1)
INSERT [dbo].[users] ([id], [usuario], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDepartamento], [idCargo]) VALUES (2, N'DPAGUAY', N'DARWW', N'RENE', N'PAGUAY', N'AMAGUAAY', 1, 1)
INSERT [dbo].[users] ([id], [usuario], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDepartamento], [idCargo]) VALUES (3, N'JPEREZ', N'JUAN', N'SEGUNDO', N'PEREZ', N'PEREZ2', 1, 2)
INSERT [dbo].[users] ([id], [usuario], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [idDepartamento], [idCargo]) VALUES (4, N'AAA', N'A1', N'A2', N'P1', N'P2', 2, 2)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[cargos] ADD  CONSTRAINT [DF_cargos_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[departamentos] ADD  CONSTRAINT [DF_departamentos_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [fk_users_cargos] FOREIGN KEY([idCargo])
REFERENCES [dbo].[cargos] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [fk_users_cargos]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [fk_users_departamentos] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[departamentos] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [fk_users_departamentos]
GO
/****** Object:  StoredProcedure [dbo].[sp_crear_usuario]    Script Date: 06/10/2023 8:32:35 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_eliminar_usuario]    Script Date: 06/10/2023 8:32:35 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_get_usuario]    Script Date: 06/10/2023 8:32:35 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_lista_cargos]    Script Date: 06/10/2023 8:32:35 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_lista_departamentos]    Script Date: 06/10/2023 8:32:35 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_listar_usuario]    Script Date: 06/10/2023 8:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_listar_usuario] @id int =null
as
begin
	select a.*,  d.nombre as departamento, c.nombre as cargo
	from dbo.users a with(nolock)
	inner join dbo.departamentos d with(nolock) on a.iddepartamento = d.id
	inner join dbo.cargos c with(nolock) on a.idcargo = c.id
	where a.id = isnull(@id , a.id)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_modificar_usuario]    Script Date: 06/10/2023 8:32:35 ******/
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
