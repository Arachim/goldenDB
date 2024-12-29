SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================



CREATE PROCEDURE [dbo].[SetEventOrder]
	-- Add the parameters for the stored procedure here
	@order_id int,
	@event_id int,
	@person_id int,
	@registration_date date,
	@status_order int,
	@sum_for_payment int,
	@rooms_number int,
	@is_travel bit,
	@comment nvarchar(100) = null,
	@rooms nvarchar(max) 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @roomList as RoomList
    -- Insert statements for procedure here
if @order_id is null
	begin
	insert into act_event_order(order_id,event_id,person_id,registration_date,status_order,sum_for_payment,rooms_number,is_travel,comment)
	values
				((select max(order_id) +1 from act_event_order),
				@event_id,
				@person_id,
				@registration_date,
				@status_order,
				@sum_for_payment,
				@rooms_number,
				@is_travel,
				@comment)

				

	end

	else
	
	UPDATE act_event_order
	SET status_order = @status_order,  rooms_number = @rooms_number, is_travel =@is_travel, comment =@comment
    WHERE order_id = @order_id
	

	end
	if @rooms is not null
				begin
				  exec setRooms @order_id,@rooms
				end
GO