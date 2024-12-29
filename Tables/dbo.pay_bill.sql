CREATE TABLE [dbo].[pay_bill] (
  [pay_bill_id] [int] NOT NULL,
  [person_id] [int] NULL,
  [created_date] [datetime] NULL,
  [comment] [nvarchar](50) NULL,
  [framework_id] [int] NULL,
  [sum] [float] NULL
)
ON [PRIMARY]
GO