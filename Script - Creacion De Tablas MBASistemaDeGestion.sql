USE [master]
GO
-- CREACION DE LA BASE DE DATOS MBASistemaDeGestionDb
-- IMPORTANTE: EN LA PARTE QUE DICE FILENAME, SE DEBERA DE AGREGAR
-- LA RUTA DONDE SE DESEA AGREGAR LA BASE DE DATOS, PARA CREAR LOS
-- ARCHIVOS MBASistemaDeGestionDb.mdf Y MBASistemaDeGestionDb_log.ldf 
CREATE DATABASE [MBASistemaDeGestionDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MBASistemaDeGestionDb', FILENAME = N'C:\Proyecto\Contabilidad\MBA Sistema De Gestion\Base De Datos\MBASistemaDeGestionDb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MBASistemaDeGestionDb_log', FILENAME = N'C:\Proyecto\Contabilidad\MBA Sistema De Gestion\Base De Datos\MBASistemaDeGestionDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MBASistemaDeGestionDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET  MULTI_USER 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MBASistemaDeGestionDb]
GO
-- CREACION DE LA TABLA TablaControlDeCuentas
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaControlDeCuentas](
	[ControlDeCuentaID] [int] IDENTITY(1,1) NOT NULL,
	[Usuario_ID] [int] NOT NULL,
	[CuentaPrincipal_ID] [int] NOT NULL,
	[NombreDelControlDeCuenta] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TablaControlDeCuentas] PRIMARY KEY CLUSTERED 
(
	[ControlDeCuentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-- CREACION DE LA TABLA TablaCuentaPrincipal
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaCuentaPrincipal](
	[CuentaPrincipalID] [int] IDENTITY(1,1) NOT NULL,
	[Usuario_ID] [int] NOT NULL,
	[NombreDeLaCuentaPrincipal] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TablaCuentaPrincipal] PRIMARY KEY CLUSTERED 
(
	[CuentaPrincipalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-- CREACION DE LA TABLA TablaDeSubControlDeCuentas
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaDeSubControlDeCuentas](
	[SubControlDeCuentaID] [int] IDENTITY(1,1) NOT NULL,
	[CuentaPrincipal_ID] [int] NOT NULL,
	[ControlDeCuenta_ID] [int] NOT NULL,
	[Usuario_ID] [int] NOT NULL,
	[NombreDeSubControlDeCuenta] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TablaDeSubControlDeCuentas] PRIMARY KEY CLUSTERED 
(
	[SubControlDeCuentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-- CREACION DE LA TABLA TablaDeCategorias
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaDeCategorias](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[NombreDeLaCategoria] [varchar](100) NOT NULL,
	[EstaBorrado] [bit] NOT NULL CONSTRAINT [DF_TablaDeCategorias_EstaBorrado]  DEFAULT ((0)),
 CONSTRAINT [PK_TablaDeCategorias] PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-- CREACION DE LA TABLA TablaDetallesDeLaFacturaDelCliente
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablaDetallesDeLaFacturaDelCliente](
	[DetalleDeLaFacturaDelClienteID] [int] IDENTITY(1,1) NOT NULL,
	[FacturaDelCliente_ID] [int] NOT NULL,
	[Producto_ID] [int] NOT NULL,
	[CantidadDeVenta] [int] NOT NULL,
	[PrecioDeVentaPorUnidad] [int] NOT NULL,
 CONSTRAINT [PK_TablaDetallesDeLaFacturaDelCliente] PRIMARY KEY CLUSTERED 
(
	[DetalleDeLaFacturaDelClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
-- CREACION DE LA TABLA TablaFacturaDelCliente
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaFacturaDelCliente](
	[FacturaDelClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_ID] [int] NOT NULL,
	[Usuario_ID] [int] NOT NULL,
	[NoDeFactura] [varchar](100) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[MontoTotal] [float] NOT NULL,
	[FechaDeLaFactura] [date] NOT NULL,
	[Descripcion] [varchar](500) NULL,
 CONSTRAINT [PK_TablaFacturaDelCliente] PRIMARY KEY CLUSTERED 
(
	[FacturaDelClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-- CREACION DE LA TABLA TablaPagosDelCliente
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablaPagosDelCliente](
	[PagoDelClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_ID] [int] NOT NULL,
	[FacturaDelCliente_ID] [int] NOT NULL,
	[Usuario_ID] [int] NOT NULL,
	[NoDeFactura] [int] NOT NULL,
	[MontoTotal] [float] NOT NULL,
	[MontoDelPago] [float] NOT NULL,
	[BalanceRestante] [float] NOT NULL,
 CONSTRAINT [PK_TablaPagosDelCliente] PRIMARY KEY CLUSTERED 
(
	[PagoDelClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
-- CREACION DE LA TABLA TablaClientes
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaClientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[NombreDelCliente] [varchar](100) NOT NULL,
	[NoDeTelefono] [varchar](20) NULL,
	[Sector] [varchar](100) NULL,
	[Direccion] [varchar](200) NOT NULL,
	[Descripcion] [varchar](500) NULL,
 CONSTRAINT [PK_TablaClientes] PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-- CREACION DE LA TABLA TablaAñoFiscal
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaAñoFiscal](
	[AñoFiscalID] [int] IDENTITY(1,1) NOT NULL,
	[AñoFiscal] [varchar](50) NOT NULL,
	[FechaDeInicio] [date] NOT NULL,
	[FechaFinal] [date] NOT NULL,
	[EstaActivo] [bit] NOT NULL CONSTRAINT [DF_TablaAñoFiscal_EstaActivo]  DEFAULT ((0)),
 CONSTRAINT [PK_TablaAñoFiscal] PRIMARY KEY CLUSTERED 
(
	[AñoFiscalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-- CREACION DE LA TABLA TablaDeExistencias
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaDeExistencias](
	[ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[Categoria_ID] [int] NOT NULL,
	[Usuario_ID] [int] NOT NULL,
	[NombreDelProducto] [varchar](100) NOT NULL,
	[Cantidad] [int] NOT NULL CONSTRAINT [DF_TablaDeExistencias_Cantidad]  DEFAULT ((0)),
	[PrecioDeVentaPorUnidad] [float] NOT NULL CONSTRAINT [DF_TablaDeExistencias_PrecioDeVentaPorUnidad]  DEFAULT ((0)),
	[PrecioDeCompraPorUnidad] [float] NOT NULL CONSTRAINT [DF_TablaDeExistencias_PrecioDeCompraPorUnidad]  DEFAULT ((0)),
	[FechaDeExpiracion] [date] NULL,
	[FechaDeFabricacion] [date] NULL,
	[UmbralDeCantidadDeExistencias] [int] NOT NULL CONSTRAINT [DF_TablaDeExistencias_UmbralDeCantidadDeExistencias]  DEFAULT ((10)),
	[Descripcion] [varchar](500) NOT NULL,
	[EstaBorrado] [bit] NOT NULL CONSTRAINT [DF_TablaDeExistencias_EstaBorrado]  DEFAULT ((0)),
 CONSTRAINT [PK_TablaDeExistencias] PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-- CREACION DE LA TABLA TablaDetallesDeLaFacturaDelProveedor
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablaDetallesDeLaFacturaDelProveedor](
	[DetalleDeLaFacturaDelProveedorID] [int] IDENTITY(1,1) NOT NULL,
	[FacturaDelProveedor_ID] [int] NOT NULL,
	[Producto_ID] [int] NOT NULL,
	[CantidadDeCompra] [int] NOT NULL,
	[PrecioDeCompraPorUnidad] [float] NOT NULL,
 CONSTRAINT [PK_TablaDetallesDeLaFacturaDelProveedor] PRIMARY KEY CLUSTERED 
(
	[DetalleDeLaFacturaDelProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
-- CREACION DE LA TABLA TablaFacturaDelProveedor
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaFacturaDelProveedor](
	[FacturaDelProveedorID] [int] IDENTITY(1,1) NOT NULL,
	[Proveedor_ID] [int] NOT NULL,
	[Usuario_ID] [int] NOT NULL,
	[NoDeFactura] [bigint] NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[MontoTotal] [float] NOT NULL,
	[FechaDeLaFactura] [date] NOT NULL,
	[Descripcion] [varchar](500) NULL,
 CONSTRAINT [PK_TablaFacturaDelProveedor] PRIMARY KEY CLUSTERED 
(
	[FacturaDelProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-- CREACION DE LA TABLA TablaPagosDelProveedor
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaPagosDelProveedor](
	[PagoDelProveedorID] [int] IDENTITY(1,1) NOT NULL,
	[Proveedor_ID] [int] NOT NULL,
	[FacturaDelProveedor_ID] [int] NOT NULL,
	[Usuario_ID] [int] NOT NULL,
	[NoDeFactura] [varchar](100) NOT NULL,
	[MontoTotal] [float] NOT NULL,
	[MontoDelPago] [float] NOT NULL,
	[BalanceRestante] [float] NOT NULL,
 CONSTRAINT [PK_TablaPagosDelProveedor] PRIMARY KEY CLUSTERED 
(
	[PagoDelProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-- CREACION DE LA TABLA TablaDeProveedores
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaDeProveedores](
	[ProveedorID] [int] IDENTITY(1,1) NOT NULL,
	[NombreDelProveedor] [varchar](100) NOT NULL,
	[NoDeTelefono] [varchar](20) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Email] [varchar](100) NULL,
	[Descripcion] [varchar](300) NULL,
 CONSTRAINT [PK_TablaDeProveedores] PRIMARY KEY CLUSTERED 
(
	[ProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-- CREACION DE LA TABLA TablaDeTransacciones
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaDeTransacciones](
	[TransaccionID] [int] IDENTITY(1,1) NOT NULL,
	[AñoFiscal_ID] [int] NOT NULL,
	[CuentaPrincipal_ID] [int] NOT NULL,
	[ControlDeCuenta_ID] [int] NOT NULL,
	[SubControlDeCuenta_ID] [int] NOT NULL,
	[NoDeFactura] [varchar](100) NOT NULL,
	[Usuario_ID] [int] NOT NULL,
	[Credito] [float] NOT NULL,
	[Debito] [float] NOT NULL,
	[FechaDeLaTransaccion] [date] NOT NULL,
	[TituloDeLaTransaccion] [varchar](100) NULL,
 CONSTRAINT [PK_TablaDeTransacciones] PRIMARY KEY CLUSTERED 
(
	[TransaccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-- CREACION DE LA TABLA TablaUsuarios
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaUsuarios](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[TipoDeUsuario_ID] [int] NOT NULL,
	[NombreCompleto] [varchar](150) NOT NULL,
	[Email] [varchar](100) NULL,
	[NoDeTelefono] [varchar](20) NOT NULL,
	[NombreDeUsuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TablaUsuarios] PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-- CREACION DE LA TABLA TablaTiposDeUsuarios
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaTiposDeUsuarios](
	[TipoDeUsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[TipoDeUsuario] [varchar](50) NULL,
 CONSTRAINT [PK_TablaTiposDeUsuarios] PRIMARY KEY CLUSTERED 
(
	[TipoDeUsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
-- CREACION DE LA VISTA v_ListaControlDeCuentas
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ListaControlDeCuentas]
AS
SELECT        dbo.TablaControlDeCuentas.ControlDeCuentaID, dbo.TablaControlDeCuentas.CuentaPrincipal_ID, dbo.TablaCuentaPrincipal.NombreDeLaCuentaPrincipal, dbo.TablaControlDeCuentas.NombreDelControlDeCuenta, dbo.TablaUsuarios.NombreDeUsuario
FROM            dbo.TablaCuentaPrincipal INNER JOIN
                         dbo.TablaControlDeCuentas ON dbo.TablaCuentaPrincipal.CuentaPrincipalID = dbo.TablaControlDeCuentas.CuentaPrincipal_ID INNER JOIN
                         dbo.TablaUsuarios ON dbo.TablaCuentaPrincipal.Usuario_ID = dbo.TablaUsuarios.UsuarioID AND dbo.TablaControlDeCuentas.Usuario_ID = dbo.TablaUsuarios.UsuarioID

GO
-- CREACION DE LA VISTA v_ListaSubControlDeCuentas
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ListaSubControlDeCuentas]
AS
SELECT        dbo.TablaDeSubControlDeCuentas.SubControlDeCuentaID, dbo.TablaDeSubControlDeCuentas.CuentaPrincipal_ID, dbo.v_ListaControlDeCuentas.NombreDeLaCuentaPrincipal, dbo.TablaDeSubControlDeCuentas.ControlDeCuenta_ID, 
                         dbo.v_ListaControlDeCuentas.NombreDelControlDeCuenta, dbo.TablaDeSubControlDeCuentas.NombreDeSubControlDeCuenta, dbo.TablaUsuarios.NombreDeUsuario
FROM            dbo.TablaDeSubControlDeCuentas INNER JOIN
                         dbo.v_ListaControlDeCuentas ON dbo.TablaDeSubControlDeCuentas.ControlDeCuenta_ID = dbo.v_ListaControlDeCuentas.ControlDeCuentaID INNER JOIN
                         dbo.TablaUsuarios ON dbo.TablaDeSubControlDeCuentas.Usuario_ID = dbo.TablaUsuarios.UsuarioID

GO
-- CREACION DE LA VISTA v_ListaCuentaPrincipal
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ListaCuentaPrincipal]
AS
SELECT        dbo.TablaCuentaPrincipal.CuentaPrincipalID AS ID, dbo.TablaCuentaPrincipal.Usuario_ID, dbo.TablaCuentaPrincipal.NombreDeLaCuentaPrincipal AS [Account Head], dbo.TablaUsuarios.NombreDeUsuario AS [User]
FROM            dbo.TablaCuentaPrincipal INNER JOIN
                         dbo.TablaUsuarios ON dbo.TablaCuentaPrincipal.Usuario_ID = dbo.TablaUsuarios.UsuarioID

GO
-- CREACION DE LA VISTA v_ListaDeProductos
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ListaDeProductos]
AS
SELECT        dbo.TablaDeExistencias.ProductoID AS ID, dbo.TablaDeExistencias.Categoria_ID, dbo.TablaDeCategorias.NombreDeLaCategoria AS Category, dbo.TablaDeExistencias.Usuario_ID, dbo.TablaDeExistencias.NombreDelProducto AS Product, dbo.TablaDeExistencias.Cantidad AS Qty, 
                         dbo.TablaDeExistencias.PrecioDeVentaPorUnidad AS [Sale Unit Price], dbo.TablaDeExistencias.PrecioDeCompraPorUnidad AS [Purchase Unit Price], dbo.TablaDeExistencias.FechaDeFabricacion AS [Mftre Date], dbo.TablaDeExistencias.FechaDeExpiracion AS [Expiry Date], 
                         dbo.TablaDeExistencias.UmbralDeCantidadDeExistencias AS [Threshold Qty], dbo.TablaDeExistencias.EstaBorrado, dbo.TablaUsuarios.NombreDeUsuario AS [User], dbo.TablaDeExistencias.Descripcion
FROM            dbo.TablaDeCategorias INNER JOIN
                         dbo.TablaDeExistencias ON dbo.TablaDeCategorias.CategoriaID = dbo.TablaDeExistencias.Categoria_ID INNER JOIN
                         dbo.TablaUsuarios ON dbo.TablaDeExistencias.Usuario_ID = dbo.TablaUsuarios.UsuarioID

GO
SET IDENTITY_INSERT [dbo].[TablaControlDeCuentas] ON 

INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (1, 1, 1, N'Cash on Hand')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (2, 1, 1, N'Account Recevible')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (3, 1, 2, N'Accounts Payable')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (4, 1, 3, N'Salary')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (5, 1, 4, N'Land')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (6, 1, 5, N'Sale Income')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (7, 1, 1, N'Bank Transfer')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (8, 1, 1, N'Cheque Account')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (9, 1, 1, N'Motor Vehicles')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (10, 1, 2, N'Bank Loans')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (11, 1, 2, N'Credito Cards')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (12, 1, 2, N'Tax Liabilities')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (13, 1, 3, N'Direct Costs')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (14, 1, 3, N'Overheads')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (15, 1, 4, N'Balancing Account')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (16, 1, 4, N'Current Earnings')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (17, 1, 4, N'Owner Equity')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (18, 1, 4, N'Retained Earnings')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (19, 1, 5, N'Bank Interest')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (20, 1, 5, N'Sales Income')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (21, 1, 5, N'Shipping Fees Collected')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (22, 1, 5, N'Uncategorised Income')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (23, 1, 5, N'Products from Capital')
INSERT [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID], [Usuario_ID], [CuentaPrincipal_ID], [NombreDelControlDeCuenta]) VALUES (24, 1, 5, N'Return Purchase')
SET IDENTITY_INSERT [dbo].[TablaControlDeCuentas] OFF
SET IDENTITY_INSERT [dbo].[TablaCuentaPrincipal] ON 

INSERT [dbo].[TablaCuentaPrincipal] ([CuentaPrincipalID], [Usuario_ID], [NombreDeLaCuentaPrincipal]) VALUES (1, 1, N'Assests')
INSERT [dbo].[TablaCuentaPrincipal] ([CuentaPrincipalID], [Usuario_ID], [NombreDeLaCuentaPrincipal]) VALUES (2, 1, N'Liabilities')
INSERT [dbo].[TablaCuentaPrincipal] ([CuentaPrincipalID], [Usuario_ID], [NombreDeLaCuentaPrincipal]) VALUES (3, 1, N'Expenses')
INSERT [dbo].[TablaCuentaPrincipal] ([CuentaPrincipalID], [Usuario_ID], [NombreDeLaCuentaPrincipal]) VALUES (4, 1, N'Capital')
INSERT [dbo].[TablaCuentaPrincipal] ([CuentaPrincipalID], [Usuario_ID], [NombreDeLaCuentaPrincipal]) VALUES (5, 1, N'Revenue')
SET IDENTITY_INSERT [dbo].[TablaCuentaPrincipal] OFF
SET IDENTITY_INSERT [dbo].[TablaDeSubControlDeCuentas] ON 

INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (1, 1, 2, 1, N'By Bank')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (2, 1, 2, 1, N'Cash on hands')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (3, 1, 1, 1, N'Money to be banked')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (4, 1, 1, 1, N'Petty Cash')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (5, 2, 11, 1, N'Master Card')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (6, 2, 11, 1, N'Visa')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (7, 2, 12, 1, N'Icome Tax and NI Liability')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (8, 2, 12, 1, N'VAT Liability')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (9, 4, 17, 1, N'Owner Capital')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (10, 4, 17, 1, N'Owner Drawings and Personal Use')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (11, 3, 13, 1, N'Cost of Goods Sold')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (12, 3, 13, 1, N'Subcontractor Costs')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (13, 3, 14, 1, N'Advertising and Entertainment')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (14, 3, 14, 1, N'Bad Debts Expense')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (15, 3, 14, 1, N'Employee Cost')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (16, 3, 14, 1, N'Finance Costs')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (17, 3, 14, 1, N'General Administrative Expenses')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (18, 3, 14, 1, N'Motor Expenses')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (19, 3, 14, 1, N'Premises Costs')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (20, 3, 14, 1, N'Repairs')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (21, 3, 14, 1, N'Travel')
INSERT [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID], [CuentaPrincipal_ID], [ControlDeCuenta_ID], [Usuario_ID], [NombreDeSubControlDeCuenta]) VALUES (22, 3, 14, 1, N'Uncategorised Expenses')
SET IDENTITY_INSERT [dbo].[TablaDeSubControlDeCuentas] OFF
SET IDENTITY_INSERT [dbo].[TablaDeCategorias] ON 

INSERT [dbo].[TablaDeCategorias] ([CategoriaID], [NombreDeLaCategoria], [EstaBorrado]) VALUES (1, N'Tab', 0)
INSERT [dbo].[TablaDeCategorias] ([CategoriaID], [NombreDeLaCategoria], [EstaBorrado]) VALUES (2, N'Syrup', 0)
INSERT [dbo].[TablaDeCategorias] ([CategoriaID], [NombreDeLaCategoria], [EstaBorrado]) VALUES (3, N'All Capsul', 1)
INSERT [dbo].[TablaDeCategorias] ([CategoriaID], [NombreDeLaCategoria], [EstaBorrado]) VALUES (4, N'Other', 0)
SET IDENTITY_INSERT [dbo].[TablaDeCategorias] OFF
SET IDENTITY_INSERT [dbo].[TablaClientes] ON 

INSERT [dbo].[TablaClientes] ([ClienteID], [NombreDelCliente], [NoDeTelefono], [Sector], [Direccion], [Descripcion]) VALUES (1, N'Ali', N'0314577664', N'CHD', N'Old Bazar Charsadda', N'')
SET IDENTITY_INSERT [dbo].[TablaClientes] OFF
SET IDENTITY_INSERT [dbo].[TablaAñoFiscal] ON 

INSERT [dbo].[TablaAñoFiscal] ([AñoFiscalID], [AñoFiscal], [FechaDeInicio], [FechaFinal], [EstaActivo]) VALUES (1, N'2016-2017', CAST(N'2016-01-01' AS Date), CAST(N'2016-12-31' AS Date), 0)
INSERT [dbo].[TablaAñoFiscal] ([AñoFiscalID], [AñoFiscal], [FechaDeInicio], [FechaFinal], [EstaActivo]) VALUES (2, N'2017-2018', CAST(N'2017-01-01' AS Date), CAST(N'2017-12-31' AS Date), 0)
INSERT [dbo].[TablaAñoFiscal] ([AñoFiscalID], [AñoFiscal], [FechaDeInicio], [FechaFinal], [EstaActivo]) VALUES (3, N'2018-2019', CAST(N'2018-01-01' AS Date), CAST(N'2018-12-31' AS Date), 1)
SET IDENTITY_INSERT [dbo].[TablaAñoFiscal] OFF
SET IDENTITY_INSERT [dbo].[TablaDeExistencias] ON 

INSERT [dbo].[TablaDeExistencias] ([ProductoID], [Categoria_ID], [Usuario_ID], [NombreDelProducto], [Cantidad], [PrecioDeVentaPorUnidad], [PrecioDeCompraPorUnidad], [FechaDeExpiracion], [FechaDeFabricacion], [UmbralDeCantidadDeExistencias], [Descripcion], [EstaBorrado]) VALUES (1, 1, 1, N'Brufen', 0, 0, 0, CAST(N'2018-11-13' AS Date), CAST(N'2018-11-13' AS Date), 10, N'', 0)
INSERT [dbo].[TablaDeExistencias] ([ProductoID], [Categoria_ID], [Usuario_ID], [NombreDelProducto], [Cantidad], [PrecioDeVentaPorUnidad], [PrecioDeCompraPorUnidad], [FechaDeExpiracion], [FechaDeFabricacion], [UmbralDeCantidadDeExistencias], [Descripcion], [EstaBorrado]) VALUES (2, 1, 1, N'Panadol', 0, 0, 0, CAST(N'2018-11-14' AS Date), CAST(N'2018-11-14' AS Date), 10, N'', 0)
INSERT [dbo].[TablaDeExistencias] ([ProductoID], [Categoria_ID], [Usuario_ID], [NombreDelProducto], [Cantidad], [PrecioDeVentaPorUnidad], [PrecioDeCompraPorUnidad], [FechaDeExpiracion], [FechaDeFabricacion], [UmbralDeCantidadDeExistencias], [Descripcion], [EstaBorrado]) VALUES (3, 2, 2, N'Brufen', 0, 0, 0, CAST(N'2018-11-14' AS Date), CAST(N'2018-11-14' AS Date), 10, N'', 0)
SET IDENTITY_INSERT [dbo].[TablaDeExistencias] OFF
SET IDENTITY_INSERT [dbo].[TablaDeProveedores] ON 

INSERT [dbo].[TablaDeProveedores] ([ProveedorID], [NombreDelProveedor], [NoDeTelefono], [Direccion], [Email], [Descripcion]) VALUES (1, N'Junaid', N'03143076781', N'FF762 Deans Trade Center Peshawar', N'info@ilyasoft.net', N'')
INSERT [dbo].[TablaDeProveedores] ([ProveedorID], [NombreDelProveedor], [NoDeTelefono], [Direccion], [Email], [Descripcion]) VALUES (2, N'Hamza & Co', N'03456767678', N'Peshawar Main Bazar', N'hamza@gmail.com', N'')
SET IDENTITY_INSERT [dbo].[TablaDeProveedores] OFF
SET IDENTITY_INSERT [dbo].[TablaUsuarios] ON 

INSERT [dbo].[TablaUsuarios] ([UsuarioID], [TipoDeUsuario_ID], [NombreCompleto], [Email], [NoDeTelefono], [NombreDeUsuario], [Contraseña]) VALUES (1, 1, N'Nauman Ali', N'naumanali@gmail.com', N'03145455665', N'Admin', N'12345')
INSERT [dbo].[TablaUsuarios] ([UsuarioID], [TipoDeUsuario_ID], [NombreCompleto], [Email], [NoDeTelefono], [NombreDeUsuario], [Contraseña]) VALUES (2, 2, N'Ali', N'ali@gmail.com', N'03143076781', N'ali', N'12345')
SET IDENTITY_INSERT [dbo].[TablaUsuarios] OFF
SET IDENTITY_INSERT [dbo].[TablaTiposDeUsuarios] ON 

INSERT [dbo].[TablaTiposDeUsuarios] ([TipoDeUsuarioID], [TipoDeUsuario]) VALUES (1, N'Admin')
INSERT [dbo].[TablaTiposDeUsuarios] ([TipoDeUsuarioID], [TipoDeUsuario]) VALUES (2, N'Normal Users')
INSERT [dbo].[TablaTiposDeUsuarios] ([TipoDeUsuarioID], [TipoDeUsuario]) VALUES (3, N'User')
INSERT [dbo].[TablaTiposDeUsuarios] ([TipoDeUsuarioID], [TipoDeUsuario]) VALUES (4, N'Operator')
SET IDENTITY_INSERT [dbo].[TablaTiposDeUsuarios] OFF
ALTER TABLE [dbo].[TablaControlDeCuentas]  WITH CHECK ADD  CONSTRAINT [FK_TablaControlDeCuentas_TablaCuentaPrincipal] FOREIGN KEY([CuentaPrincipal_ID])
REFERENCES [dbo].[TablaCuentaPrincipal] ([CuentaPrincipalID])
GO
ALTER TABLE [dbo].[TablaControlDeCuentas] CHECK CONSTRAINT [FK_TablaControlDeCuentas_TablaCuentaPrincipal]
GO
ALTER TABLE [dbo].[TablaControlDeCuentas]  WITH CHECK ADD  CONSTRAINT [FK_TablaControlDeCuentas_TablaUsuarios] FOREIGN KEY([Usuario_ID])
REFERENCES [dbo].[TablaUsuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[TablaControlDeCuentas] CHECK CONSTRAINT [FK_TablaControlDeCuentas_TablaUsuarios]
GO
ALTER TABLE [dbo].[TablaCuentaPrincipal]  WITH CHECK ADD  CONSTRAINT [FK_TablaCuentaPrincipal_TablaUsuarios] FOREIGN KEY([Usuario_ID])
REFERENCES [dbo].[TablaUsuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[TablaCuentaPrincipal] CHECK CONSTRAINT [FK_TablaCuentaPrincipal_TablaUsuarios]
GO
ALTER TABLE [dbo].[TablaDeSubControlDeCuentas]  WITH CHECK ADD  CONSTRAINT [FK_TablaDeSubControlDeCuentas_TablaControlDeCuentas] FOREIGN KEY([ControlDeCuenta_ID])
REFERENCES [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID])
GO
ALTER TABLE [dbo].[TablaDeSubControlDeCuentas] CHECK CONSTRAINT [FK_TablaDeSubControlDeCuentas_TablaControlDeCuentas]
GO
ALTER TABLE [dbo].[TablaDeSubControlDeCuentas]  WITH CHECK ADD  CONSTRAINT [FK_TablaDeSubControlDeCuentas_TablaCuentaPrincipal] FOREIGN KEY([CuentaPrincipal_ID])
REFERENCES [dbo].[TablaCuentaPrincipal] ([CuentaPrincipalID])
GO
ALTER TABLE [dbo].[TablaDeSubControlDeCuentas] CHECK CONSTRAINT [FK_TablaDeSubControlDeCuentas_TablaCuentaPrincipal]
GO
ALTER TABLE [dbo].[TablaDeSubControlDeCuentas]  WITH CHECK ADD  CONSTRAINT [FK_TablaDeSubControlDeCuentas_TablaUsuarios] FOREIGN KEY([Usuario_ID])
REFERENCES [dbo].[TablaUsuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[TablaDeSubControlDeCuentas] CHECK CONSTRAINT [FK_TablaDeSubControlDeCuentas_TablaUsuarios]
GO
ALTER TABLE [dbo].[TablaDetallesDeLaFacturaDelCliente]  WITH CHECK ADD  CONSTRAINT [FK_TablaDetallesDeLaFacturaDelCliente_TablaFacturaDelCliente] FOREIGN KEY([FacturaDelCliente_ID])
REFERENCES [dbo].[TablaFacturaDelCliente] ([FacturaDelClienteID])
GO
ALTER TABLE [dbo].[TablaDetallesDeLaFacturaDelCliente] CHECK CONSTRAINT [FK_TablaDetallesDeLaFacturaDelCliente_TablaFacturaDelCliente]
GO
ALTER TABLE [dbo].[TablaDetallesDeLaFacturaDelCliente]  WITH CHECK ADD  CONSTRAINT [FK_TablaDetallesDeLaFacturaDelCliente_TablaDeExistencias] FOREIGN KEY([Producto_ID])
REFERENCES [dbo].[TablaDeExistencias] ([ProductoID])
GO
ALTER TABLE [dbo].[TablaDetallesDeLaFacturaDelCliente] CHECK CONSTRAINT [FK_TablaDetallesDeLaFacturaDelCliente_TablaDeExistencias]
GO
ALTER TABLE [dbo].[TablaFacturaDelCliente]  WITH CHECK ADD  CONSTRAINT [FK_TablaFacturaDelCliente_TablaClientes] FOREIGN KEY([Cliente_ID])
REFERENCES [dbo].[TablaClientes] ([ClienteID])
GO
ALTER TABLE [dbo].[TablaFacturaDelCliente] CHECK CONSTRAINT [FK_TablaFacturaDelCliente_TablaClientes]
GO
ALTER TABLE [dbo].[TablaFacturaDelCliente]  WITH CHECK ADD  CONSTRAINT [FK_TablaFacturaDelCliente_TablaUsuarios] FOREIGN KEY([Usuario_ID])
REFERENCES [dbo].[TablaUsuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[TablaFacturaDelCliente] CHECK CONSTRAINT [FK_TablaFacturaDelCliente_TablaUsuarios]
GO
ALTER TABLE [dbo].[TablaPagosDelCliente]  WITH CHECK ADD  CONSTRAINT [FK_TablaPagosDelCliente_TablaFacturaDelCliente] FOREIGN KEY([FacturaDelCliente_ID])
REFERENCES [dbo].[TablaFacturaDelCliente] ([FacturaDelClienteID])
GO
ALTER TABLE [dbo].[TablaPagosDelCliente] CHECK CONSTRAINT [FK_TablaPagosDelCliente_TablaFacturaDelCliente]
GO
ALTER TABLE [dbo].[TablaPagosDelCliente]  WITH CHECK ADD  CONSTRAINT [FK_TablaPagosDelCliente_TablaClientes] FOREIGN KEY([Cliente_ID])
REFERENCES [dbo].[TablaClientes] ([ClienteID])
GO
ALTER TABLE [dbo].[TablaPagosDelCliente] CHECK CONSTRAINT [FK_TablaPagosDelCliente_TablaClientes]
GO
ALTER TABLE [dbo].[TablaPagosDelCliente]  WITH CHECK ADD  CONSTRAINT [FK_TablaPagosDelCliente_TablaUsuarios] FOREIGN KEY([Usuario_ID])
REFERENCES [dbo].[TablaUsuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[TablaPagosDelCliente] CHECK CONSTRAINT [FK_TablaPagosDelCliente_TablaUsuarios]
GO
ALTER TABLE [dbo].[TablaDeExistencias]  WITH CHECK ADD  CONSTRAINT [FK_TablaDeExistencias_TablaDeCategorias] FOREIGN KEY([Categoria_ID])
REFERENCES [dbo].[TablaDeCategorias] ([CategoriaID])
GO
ALTER TABLE [dbo].[TablaDeExistencias] CHECK CONSTRAINT [FK_TablaDeExistencias_TablaDeCategorias]
GO
ALTER TABLE [dbo].[TablaDeExistencias]  WITH CHECK ADD  CONSTRAINT [FK_TablaDeExistencias_TablaUsuarios] FOREIGN KEY([Usuario_ID])
REFERENCES [dbo].[TablaUsuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[TablaDeExistencias] CHECK CONSTRAINT [FK_TablaDeExistencias_TablaUsuarios]
GO
ALTER TABLE [dbo].[TablaDetallesDeLaFacturaDelProveedor]  WITH CHECK ADD  CONSTRAINT [FK_TablaDetallesDeLaFacturaDelProveedor_TablaDeExistencias] FOREIGN KEY([Producto_ID])
REFERENCES [dbo].[TablaDeExistencias] ([ProductoID])
GO
ALTER TABLE [dbo].[TablaDetallesDeLaFacturaDelProveedor] CHECK CONSTRAINT [FK_TablaDetallesDeLaFacturaDelProveedor_TablaDeExistencias]
GO
ALTER TABLE [dbo].[TablaDetallesDeLaFacturaDelProveedor]  WITH CHECK ADD  CONSTRAINT [FK_TablaDetallesDeLaFacturaDelProveedor_TablaFacturaDelProveedor] FOREIGN KEY([FacturaDelProveedor_ID])
REFERENCES [dbo].[TablaFacturaDelProveedor] ([FacturaDelProveedorID])
GO
ALTER TABLE [dbo].[TablaDetallesDeLaFacturaDelProveedor] CHECK CONSTRAINT [FK_TablaDetallesDeLaFacturaDelProveedor_TablaFacturaDelProveedor]
GO
ALTER TABLE [dbo].[TablaFacturaDelProveedor]  WITH CHECK ADD  CONSTRAINT [FK_TablaFacturaDelProveedor_TablaDeProveedores] FOREIGN KEY([Proveedor_ID])
REFERENCES [dbo].[TablaDeProveedores] ([ProveedorID])
GO
ALTER TABLE [dbo].[TablaFacturaDelProveedor] CHECK CONSTRAINT [FK_TablaFacturaDelProveedor_TablaDeProveedores]
GO
ALTER TABLE [dbo].[TablaFacturaDelProveedor]  WITH CHECK ADD  CONSTRAINT [FK_TablaFacturaDelProveedor_TablaUsuarios] FOREIGN KEY([Usuario_ID])
REFERENCES [dbo].[TablaUsuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[TablaFacturaDelProveedor] CHECK CONSTRAINT [FK_TablaFacturaDelProveedor_TablaUsuarios]
GO
ALTER TABLE [dbo].[TablaPagosDelProveedor]  WITH CHECK ADD  CONSTRAINT [FK_TablaPagosDelProveedor_TablaFacturaDelProveedor] FOREIGN KEY([FacturaDelProveedor_ID])
REFERENCES [dbo].[TablaFacturaDelProveedor] ([FacturaDelProveedorID])
GO
ALTER TABLE [dbo].[TablaPagosDelProveedor] CHECK CONSTRAINT [FK_TablaPagosDelProveedor_TablaFacturaDelProveedor]
GO
ALTER TABLE [dbo].[TablaPagosDelProveedor]  WITH CHECK ADD  CONSTRAINT [FK_TablaPagosDelProveedor_TablaDeProveedores] FOREIGN KEY([Proveedor_ID])
REFERENCES [dbo].[TablaDeProveedores] ([ProveedorID])
GO
ALTER TABLE [dbo].[TablaPagosDelProveedor] CHECK CONSTRAINT [FK_TablaPagosDelProveedor_TablaDeProveedores]
GO
ALTER TABLE [dbo].[TablaPagosDelProveedor]  WITH CHECK ADD  CONSTRAINT [FK_TablaPagosDelProveedor_TablaUsuarios] FOREIGN KEY([Usuario_ID])
REFERENCES [dbo].[TablaUsuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[TablaPagosDelProveedor] CHECK CONSTRAINT [FK_TablaPagosDelProveedor_TablaUsuarios]
GO
ALTER TABLE [dbo].[TablaDeTransacciones]  WITH CHECK ADD  CONSTRAINT [FK_TablaDeTransacciones_TablaControlDeCuentas] FOREIGN KEY([ControlDeCuenta_ID])
REFERENCES [dbo].[TablaControlDeCuentas] ([ControlDeCuentaID])
GO
ALTER TABLE [dbo].[TablaDeTransacciones] CHECK CONSTRAINT [FK_TablaDeTransacciones_TablaControlDeCuentas]
GO
ALTER TABLE [dbo].[TablaDeTransacciones]  WITH CHECK ADD  CONSTRAINT [FK_TablaDeTransacciones_TablaCuentaPrincipal] FOREIGN KEY([CuentaPrincipal_ID])
REFERENCES [dbo].[TablaCuentaPrincipal] ([CuentaPrincipalID])
GO
ALTER TABLE [dbo].[TablaDeTransacciones] CHECK CONSTRAINT [FK_TablaDeTransacciones_TablaCuentaPrincipal]
GO
ALTER TABLE [dbo].[TablaDeTransacciones]  WITH CHECK ADD  CONSTRAINT [FK_TablaDeTransacciones_TablaDeSubControlDeCuentas] FOREIGN KEY([SubControlDeCuenta_ID])
REFERENCES [dbo].[TablaDeSubControlDeCuentas] ([SubControlDeCuentaID])
GO
ALTER TABLE [dbo].[TablaDeTransacciones] CHECK CONSTRAINT [FK_TablaDeTransacciones_TablaDeSubControlDeCuentas]
GO
ALTER TABLE [dbo].[TablaDeTransacciones]  WITH CHECK ADD  CONSTRAINT [FK_TablaDeTransacciones_TablaAñoFiscal] FOREIGN KEY([AñoFiscal_ID])
REFERENCES [dbo].[TablaAñoFiscal] ([AñoFiscalID])
GO
ALTER TABLE [dbo].[TablaDeTransacciones] CHECK CONSTRAINT [FK_TablaDeTransacciones_TablaAñoFiscal]
GO
ALTER TABLE [dbo].[TablaDeTransacciones]  WITH CHECK ADD  CONSTRAINT [FK_TablaDeTransacciones_TablaUsuarios] FOREIGN KEY([Usuario_ID])
REFERENCES [dbo].[TablaUsuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[TablaDeTransacciones] CHECK CONSTRAINT [FK_TablaDeTransacciones_TablaUsuarios]
GO
ALTER TABLE [dbo].[TablaUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_TablaUsuarios_TablaTiposDeUsuarios] FOREIGN KEY([TipoDeUsuario_ID])
REFERENCES [dbo].[TablaTiposDeUsuarios] ([TipoDeUsuarioID])
GO
ALTER TABLE [dbo].[TablaUsuarios] CHECK CONSTRAINT [FK_TablaUsuarios_TablaTiposDeUsuarios]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TablaCuentaPrincipal"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TablaUsuarios"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 136
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2085
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ListaCuentaPrincipal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ListaCuentaPrincipal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TablaCuentaPrincipal"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TablaControlDeCuentas"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 202
               Right = 476
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TablaUsuarios"
            Begin Extent = 
               Top = 6
               Left = 514
               Bottom = 194
               Right = 684
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 2025
         Width = 2370
         Width = 2070
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ListaControlDeCuentas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ListaControlDeCuentas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TablaDeSubControlDeCuentas"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 197
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_ListaControlDeCuentas"
            Begin Extent = 
               Top = 6
               Left = 302
               Bottom = 205
               Right = 508
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TablaUsuarios"
            Begin Extent = 
               Top = 24
               Left = 566
               Bottom = 154
               Right = 736
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ListaSubControlDeCuentas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ListaSubControlDeCuentas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[5] 2[27] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TablaDeCategorias"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 153
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TablaDeExistencias"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 210
               Right = 431
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "TablaUsuarios"
            Begin Extent = 
               Top = 6
               Left = 469
               Bottom = 136
               Right = 639
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ListaDeProductos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ListaDeProductos'
GO
USE [master]
GO
ALTER DATABASE [MBASistemaDeGestionDb] SET  READ_WRITE 
GO
