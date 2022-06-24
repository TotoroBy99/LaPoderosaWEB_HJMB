
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/23/2022 17:58:45
-- Generated from EDMX file: C:\Users\JAVIER\source\repos\LaPoderosaWEB_HJMB\LaPoderosaWEB_HJMB\Models\LaPoderosa_Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LaPoderosa_DB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ProveedorProducto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Productos] DROP CONSTRAINT [FK_ProveedorProducto];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoriaProducto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Productos] DROP CONSTRAINT [FK_CategoriaProducto];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Proveedores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Proveedores];
GO
IF OBJECT_ID(N'[dbo].[Categorias]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categorias];
GO
IF OBJECT_ID(N'[dbo].[Productos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Productos];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Proveedores'
CREATE TABLE [dbo].[Proveedores] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Categorias'
CREATE TABLE [dbo].[Categorias] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Productos'
CREATE TABLE [dbo].[Productos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [ProveedorId] int  NOT NULL,
    [CategoriaId] int  NOT NULL,
    [CantidadUnidad] int  NOT NULL,
    [PrecioUnidad] int  NOT NULL,
    [UnidadExistencia] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Proveedores'
ALTER TABLE [dbo].[Proveedores]
ADD CONSTRAINT [PK_Proveedores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categorias'
ALTER TABLE [dbo].[Categorias]
ADD CONSTRAINT [PK_Categorias]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [PK_Productos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ProveedorId] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [FK_ProveedorProducto]
    FOREIGN KEY ([ProveedorId])
    REFERENCES [dbo].[Proveedores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProveedorProducto'
CREATE INDEX [IX_FK_ProveedorProducto]
ON [dbo].[Productos]
    ([ProveedorId]);
GO

-- Creating foreign key on [CategoriaId] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [FK_CategoriaProducto]
    FOREIGN KEY ([CategoriaId])
    REFERENCES [dbo].[Categorias]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriaProducto'
CREATE INDEX [IX_FK_CategoriaProducto]
ON [dbo].[Productos]
    ([CategoriaId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------