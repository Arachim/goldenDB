SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[setRooms]
	-- Add the parameters for the stored procedure here
	@order_id int,
	@rooms nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @roomList as RoomList
    -- Insert statements for procedure here
	insert into @roomList select *
					FROM OPENJSON(@rooms)
					  WITH (
						adults INT 'strict $.adults',
						children INT 'strict $.children',
						baby BIT 'strict $.baby',
						roomNumber INT 'strict $.roomNumber',
						new BIT 'strict $.new',
						isUpdate BIT 'strict $.isUpdate'
					);

	select * from @roomList

	DECLARE @roomNumber int,
			@adults int,
			@children int,
			@baby bit,
			@new bit,
			@isUpdate bit

	DECLARE load_cursor CURSOR FOR
	select * from @roomList
	 OPEN load_cursor 
FETCH NEXT FROM load_cursor INTO @adults, @children,@baby,@roomNumber,@new,@isUpdate
 
WHILE @@FETCH_STATUS = 0 
BEGIN 
  if @new = 1
	begin
    insert into act_event_order_rooms(order_id,adults,children,babies,room_number)
	values(@order_id,@adults,@children,@baby,@roomNumber)
	end
	else 
	if @isUpdate = 1
	begin
	update act_event_order_rooms set adults = @adults,children = @children,babies = @baby where order_id = @order_id and room_number = @roomNumber
	end
	FETCH NEXT FROM load_cursor INTO @adults, @children,@baby,@roomNumber,@new,@isUpdate
END
CLOSE load_cursor
DEALLOCATE load_cursor
	

END
GO