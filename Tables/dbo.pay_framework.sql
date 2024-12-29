CREATE TABLE [dbo].[pay_framework] (
  [framework_id] [int] NOT NULL,
  [name] [nvarchar](50) NOT NULL,
  [details] [nvarchar](50) NULL,
  [min_sum] [float] NULL,
  CONSTRAINT [PK_pay_framework] PRIMARY KEY CLUSTERED ([framework_id])
)
ON [PRIMARY]
GO