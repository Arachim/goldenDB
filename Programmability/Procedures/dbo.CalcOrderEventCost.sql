SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:vaisfish dvora	
-- Create date:28.12.21
-- Description:חישוב כמה המשתמש יצטרך להוסיף לתשלום עבור ההזמנה
-- =============================================
CREATE PROCEDURE [dbo].[CalcOrderEventCost]
	--@nvToken nvarchar(50) , 
	--@nofeshId int,
	@numAdult int ,
	@numChild int,
	@numBaby int,
	@numTransportation int,
	@numRooms int
AS --comment
BEGIN
declare @numReceiptNeed int , @nAditionalCharge numeric,@PersonCode int,
@numReceiptHave int, @levelHotel int
set @levelHotel = 400
if(@numRooms=1)
begin
	select @numReceiptNeed = receipts_number,@nAditionalCharge = additional_charge
	from act_event_right_track
	where adults=@numAdult and children = @numChild and babies = @numBaby
end
else
begin
	if(@numRooms = 2)
	begin
		declare @numAdult1 int,@numChild1 int,@numBaby1 int ,
		 @numAdult2 int,@numChild2 int,@numBaby2 int
		 set @numAdult1 = @numAdult/2 + @numAdult%2
		 set @numAdult2 = @numAdult/2
		 set @numChild1= @numChild/2
		 set @numChild2 = @numChild/2+@numChild%2
		 set @numBaby1= @numBaby/2
		 set @numBaby2 = @numBaby/2+@numBaby%2
		 declare @numReceiptNeed1 int, @nAditionalCharge1 numeric,
		  @numReceiptNeed2 int, @nAditionalCharge2 numeric

		select @numReceiptNeed1 = receipts_number,@nAditionalCharge1 = additional_charge
		from act_event_right_track
		where adults=@numAdult1 and children = @numChild1 and babies = @numBaby1
		select @numReceiptNeed2 = receipts_number,@nAditionalCharge2 = additional_charge
		from act_event_right_track
		where adults=@numAdult2 and children = @numChild2 and babies = @numBaby2

		set @numReceiptNeed = isnull(@numReceiptNeed1,0)+isnull(@numReceiptNeed2,0)
		set @nAditionalCharge = isnull(@nAditionalCharge1,0)+isnull(@nAditionalCharge2,0)
	end
end
--מספר זכאויות שצריך וסכום לתשלום כתוספת
print @numReceiptNeed 
print @nAditionalCharge

--שליפת הלקוח לפי הטוקן
--select @PersonCode = iPersonCode from tbl_zhb_DonorToken where nvToken=@nvToken

set @PersonCode = 2051105
--שליפת התקבולים מהשנתיים האחרונות
declare @tableReceipt table (actualAmount numeric)
insert into @tableReceipt
SELECT actualAmount
	FROM dms_be...receipt t1
	where
		t1.[For]=1 and (t1.nofeshid is null or t1.nofeshid<=0)and
		t1.donationDate > DATEADD(year,-2,GETDATE()) and
	(t1.cancelCode<>26 or t1.cancelCode is null) and
	t1.nfshNReason is null and t1.DonationDate< getdate()
	and personcode=@PersonCode	
	
--מניית מספר תקבולים לפי רמת המלון
select @numReceiptHave = count(*) from @tableReceipt where actualAmount= @levelHotel
--אם יש מספר תקבולים שווה גדול ממה שצריך
print cast(@numReceiptHave as nvarchar) + ': @numReceiptHave'
print cast(@numReceiptNeed as nvarchar) + ': @@numReceiptNeed'
if(@numReceiptHave >= @numReceiptNeed)
begin
	print 'if'
	select @nAditionalCharge;
end
else
begin
	print 'else'
	--מניית התקבולים שגדולים מרמת המלון בהפרש של עד 100 שקל
	declare @tmp int
	select tmp = count(*) from @tableReceipt where actualAmount>  @levelHotel and actualAmount<= (@levelHotel+100)
	print 'tmp'
	set @numReceiptHave = @numReceiptHave + isnull(@tmp,0)
	print  '***: @numReceiptHave'
	print @numReceiptHave
	if(@numReceiptHave >= @numReceiptNeed)
	begin
	print '////////////////'
		select @nAditionalCharge;
	end
	else
	begin
	print '----------------------------'
	--אם אין מספיק תקבולים מחשבים את סכום התקבולים שגדולים ממאה מרמת המלון
		declare @sumBigAmount numeric
		select @sumBigAmount = sum(actualAmount) from @tableReceipt where actualAmount>  (@levelHotel +100)
		print '@sumBigAmount'
		set @sumBigAmount= isnull(@sumBigAmount,0)
		print @sumBigAmount
		set @tmp = (@sumBigAmount/@levelHotel)
		print '@tmp'
		print @tmp
		set @numReceiptHave= @numReceiptHave +@tmp
		print ': @numReceiptHave'
		print @numReceiptHave
		select * from @tableReceipt
		if(@numReceiptHave >= @numReceiptNeed)
		begin
			select @nAditionalCharge;
		end
		else
		begin
		declare @actualAmount numeric
		DECLARE cursor1 CURSOR FOR 
			select  actualAmount
			from @tableReceipt
			where actualAmount>= 150 and actualAmount < @levelHotel
			order by actualAmount desc		
		OPEN cursor1

		FETCH NEXT FROM cursor1
		INTO @actualAmount

		WHILE @@FETCH_STATUS = 0 and @numReceiptHave < @numReceiptNeed
		BEGIN 
		print ': @numReceiptHave'
		print isnull(@numReceiptHave,1)
		print ': @actualAmount'
		print isnull(@actualAmount,2)
		print ': @nAditionalCharge'
		print isnull(@nAditionalCharge,3)
			set @nAditionalCharge= @nAditionalCharge+ (@levelHotel-@actualAmount)
			set @numReceiptHave= @numReceiptHave+1
		FETCH NEXT FROM cursor1
		INTO @actualAmount
		END ;
		CLOSE cursor1;
		DEALLOCATE cursor1;

		print 'end cursor'

		if(@numReceiptHave = @numReceiptNeed)
		begin
			print 'end'
			select @nAditionalCharge;
		end
		else
		begin
		print '@nAditionalCharge'
		print @nAditionalCharge
		print '@numReceiptNeed'
		print @numReceiptNeed
		print '@numReceiptHave'
		print @numReceiptHave
		print '@levelHotel'
		print @levelHotel
			select isnull(@nAditionalCharge,0) + ((@numReceiptNeed - @numReceiptHave) * @levelHotel)
		end
		end
	end 
end 


END
GO