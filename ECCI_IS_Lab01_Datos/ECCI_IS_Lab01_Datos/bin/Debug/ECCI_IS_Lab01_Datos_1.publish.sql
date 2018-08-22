﻿/*
Deployment script for DB_B61144

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DB_B61144"
:setvar DefaultFilePrefix "DB_B61144"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating unnamed constraint on [dbo].[Matricula]...';


GO
ALTER TABLE [dbo].[Matricula]
    ADD PRIMARY KEY CLUSTERED ([MatriculaID] ASC);


GO
PRINT N'Creating [dbo].[FK_dbo.Matricula_dbo.Curso_CursoID]...';


GO
ALTER TABLE [dbo].[Matricula] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Matricula_dbo.Curso_CursoID] FOREIGN KEY ([CursoID]) REFERENCES [dbo].[Curso] ([CursoID]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Matricula_dbo.Estudiante_EstudianteID]...';


GO
ALTER TABLE [dbo].[Matricula] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Matricula_dbo.Estudiante_EstudianteID] FOREIGN KEY ([EstudianteID]) REFERENCES [dbo].[Estudiante] ([EstudianteID]) ON DELETE CASCADE;


GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Matricula] WITH CHECK CHECK CONSTRAINT [FK_dbo.Matricula_dbo.Curso_CursoID];

ALTER TABLE [dbo].[Matricula] WITH CHECK CHECK CONSTRAINT [FK_dbo.Matricula_dbo.Estudiante_EstudianteID];


GO
PRINT N'Update complete.';


GO
