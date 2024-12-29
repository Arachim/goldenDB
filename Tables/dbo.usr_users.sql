CREATE TABLE [dbo].[usr_users] (
  [user_id] [int] NOT NULL,
  [first_name] [nvarchar](50) NULL,
  [status] [int] NULL,
  [last_name] [nvarchar](50) NULL,
  [email] [nvarchar](50) NULL,
  [user_details] [nvarchar](50) NULL,
  [job_id] [int] NULL,
  PRIMARY KEY CLUSTERED ([user_id])
)
ON [PRIMARY]
GO