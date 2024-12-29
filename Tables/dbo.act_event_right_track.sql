CREATE TABLE [dbo].[act_event_right_track] (
  [event_right_track_id] [int] NULL,
  [adults] [int] NULL,
  [children] [int] NULL,
  [babies] [int] NULL,
  [additional_charge] [numeric](5, 2) NULL,
  [receipts_number] [int] NULL,
  [updated_by] [numeric] NULL,
  [updated_date] [datetime] NULL
)
ON [PRIMARY]
GO