CREATE TABLE [dbo].[usr_jobs] (
  [usr_job_id] [int] NOT NULL,
  [name] [nvarchar](50) NOT NULL,
  [details] [nvarchar](50) NULL,
  CONSTRAINT [PK_usr_jobs] PRIMARY KEY CLUSTERED ([usr_job_id])
)
ON [PRIMARY]
GO