CREATE TABLE [dbo].[pay_entity_type] (
  [pay_entity_type_id] [int] NOT NULL,
  [name] [nvarchar](50) NOT NULL,
  CONSTRAINT [PK_pay_entity_type] PRIMARY KEY CLUSTERED ([pay_entity_type_id])
)
ON [PRIMARY]
GO