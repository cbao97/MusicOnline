--check password
create trigger check_pw on User
for insert, update
as
if(( select len(password_user) from inserted ) < 8)
begin
print 'password phai chua it nhat 7 ky tu'
rollback tran
go

--check lich_su_nghe tối đa (lịch sử nghe lưu đối đa 50 bài hát)
create trigger check_ls_nghe on LichSuNghe
for insert
as
if ((select count(ma_lich_su_nghe) from LichSuNghe) >= 50)
begin
	delete from LichSuNghe where ngay_nghe = (select min(ngay_nghe) from LichSuNghe)
end
go

--cap nhat yeu thich tu lich su nghe
create trigger bai_hat_yeu_thich on LichSuNghe
for insert
as
if ((select count(t1.ma_bai_hat) from LichSuNghe t1, inserted t2 where t1.ma_bai_hat = t2.ma_bai_hat) >= 10)
begin
declare @mbh char
select @mbh=ma_bai_hat from inserted
insert into Bai_Hat_Yeu_Thich(User_id,Ma_Bai_Hat) values ('',@mbh)
end
go
--cap nhat the loai yeu thich tu bai hat yeu thich
create trigger the_loai_yeu_thich on Bai_Hat_Yeu_Thich
for insert
as
if((select count(t1.Ma_Bai_Hat) from Bai_Hat_Yeu_Thich t1, Bai_Hat t2 
where t1.ma_bai_hat = t2.ma_bai_hat 
and t2.Ma_The_Loai = (select Ma_The_Loai from Bai_Hat, inserted t2 where Bai_Hat.Ma_Bai_Hat = t2.Ma_Bai_Hat))>=10)
begin
declare @mtl char
select @mtl=Ma_The_Loai from Bai_Hat, inserted t2 where Bai_Hat.Ma_Bai_Hat = t2.Ma_Bai_Hat
insert into The_Loai_Yeu_Thich(User_id,Ma_The_Loai_YT) values ('',@mtl)
end
go
--xoa bai hat
create trigger xoa_nhac on Bai_Hat
for delete
as
if (@@ROWCOUNT = 0)
begin
	print 'Khong co du lieu'
	return
end
	declare @mbh char
	select @mbh=ma_bai_hat from deleted
	delete from Playlists_Baihat where Ma_bai_hat = @mbh
	delete from Lich_su_nghe where Ma_bai_hat = @mbh
	delete from Bai_hat_yeu_thich where Ma_bai_hat = @mbh
	print 'da xoa'
go


