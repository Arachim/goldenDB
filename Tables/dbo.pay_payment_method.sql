CREATE TABLE [dbo].[pay_payment_method] (
  [pay_payment_method_id] [int] NOT NULL,
  [name] [nvarchar](50) NULL,
  [details] [nvarchar](50) NULL,
  CONSTRAINT [PK_pay_payment_method] PRIMARY KEY CLUSTERED ([pay_payment_method_id])
)
ON [PRIMARY]
GO