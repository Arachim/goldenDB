CREATE TABLE [dbo].[pay_route] (
  [pay_route_id] [int] NOT NULL,
  [name] [nvarchar](50) NOT NULL,
  [details] [nvarchar](100) NULL,
  CONSTRAINT [PK_pay_route] PRIMARY KEY CLUSTERED ([pay_route_id])
)
ON [PRIMARY]
GO