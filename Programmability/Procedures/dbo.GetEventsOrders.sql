SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEventsOrders]
	-- Add the parameters for the stored procedure here
	@person_id int=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT o.*, rooms.sum_of_rooms, rooms.adults,rooms.children,rooms.babies 
	from act_event_order as o join act_event as e on o.event_id = e.event_id
	left join (select r.order_id, sum(r.adults) as adults, count(*) as sum_of_rooms, sum(r.children) as children,sum(r.babies) as babies from act_event_order_rooms as r 
	 group by r.order_id)
	as rooms on rooms.order_id = o.order_id
	where @person_id = o.person_id 
END
GO