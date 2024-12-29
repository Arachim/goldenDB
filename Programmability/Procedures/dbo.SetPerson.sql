SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetPerson]
	-- Add the parameters for the stored procedure here
	
	@id int = null,
	@identity_number int,
	@first_name nvarchar(100),
	@last_name nvarchar(100),
	@main_payment_method_id int= 1,
	@phone int,
	@address nvarchar(100),
	@city nvarchar(100),
	@email nvarchar(100),
	@gender int = 1

	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @id is null
	begin
	insert into psn_person(person_id,first_name,identity_number,main_payment_method_id,last_name,phone,address,city,email,gender) values(	
				(select max(person_id) +1 from psn_person),
				@first_name ,
				@identity_number,
				@main_payment_method_id,
				@last_name,
				@phone,
				@address,
				@city,
				@email,
				@gender)

	end

	else
	
	UPDATE psn_person
	SET first_name = @first_name, last_name =@last_name, phone = @phone, address = @address, city =@city, gender =@gender, email = @email, main_payment_method_id =@main_payment_method_id,identity_number=@identity_number
    WHERE person_id = @id
	
end
	
GO