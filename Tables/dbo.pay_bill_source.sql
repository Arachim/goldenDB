CREATE TABLE [dbo].[pay_bill_source] (
  [pay_bill_source_id] [int] NOT NULL,
  [bill_id] [int] NULL,
  [entity_type] [int] NULL,
  [entity_details] [nvarchar](100) NULL,
  [sum] [float] NULL,
  [payments_number] [int] NULL,
  [created_date] [datetime] NULL,
  [entity_id] [int] NULL,
  CONSTRAINT [PK_pay_bill_source] PRIMARY KEY CLUSTERED ([pay_bill_source_id])
)
ON [PRIMARY]
GO