CREATE TABLE [dbo].[psn_person] (
  [person_id] [int] NOT NULL,
  [first_name] [nvarchar](50) NULL,
  [last_name] [nvarchar](50) NULL,
  [phone] [nvarchar](50) NULL,
  [address] [nvarchar](50) NULL,
  [city] [nvarchar](50) NULL,
  [email] [nvarchar](50) NULL,
  [family_id] [int] NULL,
  [gender] [int] NULL,
  [main_payment_method_id] [int] NOT NULL,
  [identity_number] [int] NULL,
  CONSTRAINT [PK_psn_person] PRIMARY KEY CLUSTERED ([person_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[psn_person]
  ADD CONSTRAINT [FK_PersonMainPaymentMethod] FOREIGN KEY ([main_payment_method_id]) REFERENCES [dbo].[pay_payment_method] ([pay_payment_method_id])
GO