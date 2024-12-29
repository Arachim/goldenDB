CREATE TABLE [dbo].[act_tasks] (
  [id] [int] NOT NULL,
  [person_id] [int] NOT NULL,
  [task_type] [int] NULL,
  [status] [int] NULL,
  [created_date] [datetime] NULL,
  [user_id] [int] NULL,
  [task_id] [int] IDENTITY,
  PRIMARY KEY CLUSTERED ([task_id])
)
ON [PRIMARY]
GO