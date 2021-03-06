﻿/*
Deployment script for pizza

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "pizza"
:setvar DefaultFilePrefix "pizza"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

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

IF (SELECT OBJECT_ID('tempdb..#tmpErrors')) IS NOT NULL DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO
BEGIN TRANSACTION
GO
PRINT N'Creating [dbo].[Appetizers]...';


GO
CREATE TABLE [dbo].[Appetizers] (
    [AppID]       INT             NOT NULL,
    [Name]        NVARCHAR (100)  NOT NULL,
    [SmallPrice]  DECIMAL (16, 2) NOT NULL,
    [LargePrice]  DECIMAL (16, 2) NOT NULL,
    [Description] NVARCHAR (500)  NOT NULL,
    PRIMARY KEY CLUSTERED ([AppID] ASC)
);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Creating [dbo].[Beverages]...';


GO
CREATE TABLE [dbo].[Beverages] (
    [BevID]       INT             NOT NULL,
    [Name]        NVARCHAR (100)  NULL,
    [Price]       DECIMAL (16, 2) NULL,
    [Description] NVARCHAR (500)  NULL,
    PRIMARY KEY CLUSTERED ([BevID] ASC)
);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Creating [dbo].[Crusts]...';


GO
CREATE TABLE [dbo].[Crusts] (
    [CrustID]     INT             NOT NULL,
    [Name]        NVARCHAR (100)  NULL,
    [SmallPrice]  DECIMAL (16, 2) NULL,
    [MedPrice]    DECIMAL (16, 2) NULL,
    [LargePrice]  DECIMAL (16, 2) NULL,
    [Description] NVARCHAR (500)  NULL,
    [Size]        VARCHAR (1)     NULL,
    PRIMARY KEY CLUSTERED ([CrustID] ASC)
);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Creating [dbo].[SpecialtyPizza]...';


GO
CREATE TABLE [dbo].[SpecialtyPizza] (
    [PizzaID]     INT             NOT NULL,
    [Name]        NVARCHAR (100)  NULL,
    [Description] NVARCHAR (500)  NULL,
    [SmallPrice]  DECIMAL (16, 2) NULL,
    [MedPrice]    DECIMAL (16, 2) NULL,
    [LargePrice]  DECIMAL (16, 2) NULL,
    [Size]        VARCHAR (1)     NULL,
    PRIMARY KEY CLUSTERED ([PizzaID] ASC)
);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Creating [dbo].[Toppings]...';


GO
CREATE TABLE [dbo].[Toppings] (
    [ToppingID]   INT             NOT NULL,
    [Name]        NVARCHAR (100)  NOT NULL,
    [Description] NVARCHAR (500)  NOT NULL,
    [Price]       DECIMAL (16, 2) NOT NULL,
    [ToppingType] NVARCHAR (100)  NULL,
    PRIMARY KEY CLUSTERED ([ToppingID] ASC)
);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO

IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT N'The transacted portion of the database update succeeded.'
COMMIT TRANSACTION
END
ELSE PRINT N'The transacted portion of the database update failed.'
GO
DROP TABLE #tmpErrors
GO
PRINT N'Update complete.';


GO
