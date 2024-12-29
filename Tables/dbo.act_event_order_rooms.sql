CREATE TABLE [dbo].[act_event_order_rooms] (
  [order_id] [int] NULL,
  [room_number] [int] NULL,
  [adults] [int] NULL,
  [children] [int] NULL,
  [babies] [int] NULL
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[act_event_order_rooms]
  ADD FOREIGN KEY ([order_id]) REFERENCES [dbo].[act_event_order] ([order_id])
GO