SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPersons]
	-- Add the parameters for the stored procedure here
	@PersonID int = null, 
	@FirstName nvarchar = null,
	@LastName nvarchar = null
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT psn_person.person_id as id,
		   psn_person.first_name,
		   psn_person.last_name,
		   psn_person.phone,
		   psn_person.email,
		   psn_person.address,
		   psn_person.city,
		   psn_person.identity_number,
		   psn_person.main_payment_method_id,
		   psn_person.gender,
		   pay_payment_method.name as payment_method_name 
		   FROM psn_person JOIN pay_payment_method on main_payment_method_id = pay_payment_method.pay_payment_method_id
END
GO