CREATE TABLE [dbo].[psn_family] (
  [psn_family_id] [numeric] NOT NULL,
  [nvFamilyName] [nvarchar](50) NOT NULL,
  [nAdressId] [numeric] NULL,
  [nAdressIdForMailing] [numeric] NULL,
  [iFamilyStatusId] [int] NULL,
  [nvPhone] [nvarchar](15) NULL,
  [nvFax] [nvarchar](15) COLLATE SQL_Latin1_General_CP1255_CI_AS NULL,
  [iIsMailingToSend] [int] NOT NULL,
  [nvContactComment] [nvarchar](150) NULL,
  [nPratIdRecomender] [numeric] NULL,
  [iRegistrationWayId] [int] NULL,
  [iCreateUserId] [numeric] NULL,
  [iLastUpdateUserId] [numeric] NULL,
  [dtLastUpdateDate] [datetime] NOT NULL,
  [iStationId] [int] NOT NULL,
  [iSysRowStatus] [int] NOT NULL,
  [uiHistoryRowId] [uniqueidentifier] NULL,
  [family_id] [int] NULL,
  [family_name] [nvarchar](50) NULL,
  [family_status] [int] NULL,
  [phone] [nvarchar](50) NULL,
  [fax] [nvarchar](50) NULL,
  CONSTRAINT [PK_psn_family] PRIMARY KEY CLUSTERED ([psn_family_id])
)
ON [PRIMARY]
GO