CREATE TABLE [dbo].[act_benefit] (
  [name] [nvarchar](50) NOT NULL,
  [details] [nvarchar](50) NULL,
  [status] [int] NULL,
  [benefit_date] [datetime] NULL,
  [units_in_stock] [int] NULL,
  [cost] [float] NULL,
  [benefit_id] [int] IDENTITY,
  CONSTRAINT [PK_act_benefit_1] PRIMARY KEY CLUSTERED ([benefit_id])
)
ON [PRIMARY]
GO