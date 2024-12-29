CREATE TABLE [dbo].[act_event] (
  [event_id] [int] NOT NULL,
  [name] [nvarchar](100) NOT NULL,
  [date] [datetime] NULL,
  [days_number] [nvarchar](50) NULL,
  [status] [int] NULL,
  [parasha] [nvarchar](50) NULL,
  [event_manager] [int] NULL,
  [number_of_rooms] [int] NULL,
  [catched_rooms] [int] NULL,
  [event_type] [int] NULL,
  [hotel_id] [int] NULL,
  [event_id_new] [int] IDENTITY
)
ON [PRIMARY]
GO