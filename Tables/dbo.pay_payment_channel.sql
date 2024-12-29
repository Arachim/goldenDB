CREATE TABLE [dbo].[pay_payment_channel] (
  [payment_channel_id] [int] NOT NULL,
  [bill_id] [int] NOT NULL,
  [created_date] [datetime] NULL,
  [sum] [float] NULL,
  [currency] [nvarchar](50) NULL,
  [route_id] [int] NULL,
  [payments_number] [int] NULL,
  [payment_method_id] [int] NULL,
  [status] [nvarchar](50) NULL,
  [billing_day] [int] NULL,
  [bank_id] [int] NULL,
  [bank_account] [int] NULL,
  [bank_branch] [int] NULL,
  [credit_card_number] [int] NULL,
  [credit_card_cvv] [int] NULL,
  [credit_card_validity] [int] NULL,
  CONSTRAINT [PK_pay_payment_channel] PRIMARY KEY CLUSTERED ([payment_channel_id])
)
ON [PRIMARY]
GO