SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		55555כככככ
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetFamilyPersons]
	-- Add the parameters for the stored procedure here
	@familyId int=null,
	@personId int=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from psn_person
	inner join psn_family on psn_person.family_id = psn_family.psn_family_id
	where psn_family_id = @familyId
END
GO