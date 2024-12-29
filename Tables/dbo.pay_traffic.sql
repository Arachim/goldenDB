CREATE TABLE [dbo].[pay_traffic] (
  [pay_traffic_id] [int] NOT NULL,
  [created_date] [datetime] NULL,
  [status] [nvarchar](50) NULL,
  [file_id] [int] NULL,
  [receipt_id] [int] NULL,
  [payment_channel_type] [int] NULL,
  [sum] [nchar](10) NULL,
  [payment_channel_id] [int] NULL,
  PRIMARY KEY CLUSTERED ([pay_traffic_id])
)
ON [PRIMARY]
GO