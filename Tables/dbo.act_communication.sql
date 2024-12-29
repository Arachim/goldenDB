CREATE TABLE [dbo].[act_communication] (
  [communication_type] [int] NULL,
  [communication_status] [int] NULL,
  [data_communication] [nvarchar](500) NULL,
  [status] [int] NULL,
  [task_id] [int] NULL,
  [summary] [nvarchar](300) NULL,
  [communication_id] [int] IDENTITY,
  PRIMARY KEY CLUSTERED ([communication_id])
)
ON [PRIMARY]
GO