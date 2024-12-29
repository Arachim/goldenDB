CREATE TABLE [dbo].[act_hotels] (
  [hotel_name] [nvarchar](50) NULL,
  [address] [nvarchar](50) NULL,
  [city] [nvarchar](50) NULL,
  [hotel_id] [int] IDENTITY,
  PRIMARY KEY CLUSTERED ([hotel_id])
)
ON [PRIMARY]
GO