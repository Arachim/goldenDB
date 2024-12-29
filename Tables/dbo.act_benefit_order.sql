CREATE TABLE [dbo].[act_benefit_order] (
  [benefit_id] [int] NULL,
  [person_id] [int] NULL,
  [registration_date] [datetime] NULL,
  [exercise_date] [datetime] NULL,
  [comment] [nvarchar](300) NULL,
  [status] [int] NULL,
  [responsible_user] [int] NULL,
  [order_id] [int] IDENTITY,
  PRIMARY KEY CLUSTERED ([order_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[act_benefit_order]
  ADD CONSTRAINT [FK_OrderPerson] FOREIGN KEY ([person_id]) REFERENCES [dbo].[psn_person] ([person_id])
GO