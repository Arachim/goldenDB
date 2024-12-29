CREATE TABLE [dbo].[act_event_order] (
  [event_id] [int] NOT NULL,
  [person_id] [int] NOT NULL,
  [registration_date] [datetime] NULL,
  [status_order] [int] NULL,
  [sum_for_payment] [float] NULL,
  [rooms_number] [int] NULL,
  [adults_in_first_room] [int] NULL,
  [children_in_first_room] [int] NULL,
  [is_travel] [bit] NULL,
  [baby_in_first_room] [bit] NULL,
  [comment] [nvarchar](100) NULL,
  [baby_in_second_room] [bit] NULL,
  [adults_in_second_room] [int] NULL,
  [children_in_second_room] [int] NULL,
  [order_id] [int] IDENTITY,
  CONSTRAINT [PK_act_event_order] PRIMARY KEY CLUSTERED ([order_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[act_event_order]
  ADD CONSTRAINT [FK_EventPerson] FOREIGN KEY ([person_id]) REFERENCES [dbo].[psn_person] ([person_id])
GO