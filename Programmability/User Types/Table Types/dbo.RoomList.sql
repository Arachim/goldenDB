CREATE TYPE [dbo].[RoomList] AS TABLE (
  [adults] [int] NULL,
  [children] [int] NULL,
  [baby] [bit] NULL,
  [roomNumber] [int] NULL,
  [new] [bit] NULL,
  [isUpdate] [bit] NULL
)
GO