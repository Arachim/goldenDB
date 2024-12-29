CREATE TABLE [dbo].[act_order_status] (
  [order_status_name] [nvarchar](50) NULL,
  [order_status_details] [nvarchar](50) NULL,
  [order_status_id] [int] IDENTITY,
  PRIMARY KEY CLUSTERED ([order_status_id])
)
ON [PRIMARY]
GO