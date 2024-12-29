CREATE TABLE [dbo].[act_hotels_pricing] (
  [hotel_id] [int] NULL,
  [part_name] [nvarchar](50) NULL,
  [part_details] [nvarchar](50) NULL,
  [part_cost] [float] NULL,
  [part_id] [int] IDENTITY,
  PRIMARY KEY CLUSTERED ([part_id])
)
ON [PRIMARY]
GO