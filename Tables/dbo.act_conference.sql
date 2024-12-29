CREATE TABLE [dbo].[act_conference] (
  [name] [nvarchar](50) NOT NULL,
  [details] [nvarchar](200) NULL,
  [date_created] [datetime] NULL,
  [place] [nvarchar](50) NULL,
  [manager] [int] NULL,
  [participants_number] [int] NULL,
  [conference_id] [int] IDENTITY,
  PRIMARY KEY CLUSTERED ([conference_id])
)
ON [PRIMARY]
GO