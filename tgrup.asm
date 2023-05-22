include tgrup\lib.mcr

.model small
.386
.code
org 100h

tdata :
        jmp proses
        layar db 4000 dup (?)
        menu db 9,9,'+==================================+',13,10
             db 9,9,'|      >> >> Menu Sorot << <<      |',13,10
             db 9,9,'|     --- TUGAS KELOMPOK 2 ---     |',13,10
             db 9,9,'+==================================+',13,10
             db 9,9,'|  1. Cetak Karakter               |',13,10
             db 9,9,'|  2. Karakter Berwarna            |',13,10
             db 9,9,'|  3. Program Rontok               |',13,10
             db 9,9,'|  4. Anggota Kelompok             |',13,10
             db 9,9,'|  5. Kalkulator 1 Digit           |',13,10
             db 9,9,'|  6. Cetak Bilangan Prima         |',13,10
             db 9,9,'|  7. Animasi Helikopter           |',13,10
             db 9,9,'|  8. Keluar                       |',13,10
             db 9,9,'+==================================+',13,10
             db 9,9,'|   Adhe | Whisnu | Verdi | Rizky  |',13,10
             db 9,9,'+==================================+$'

        posx db 22
        posy db 12
    panah_atas equ 72
    panah_bawah equ 80
    tenter      equ 0dh

    proses    :
            cls
            gotoxy 0 8
            menul menu
            simpanl

 ulang    :
            balikl

            sorot posx,posy

    masukan :
            readkey
            cmp ah,panah_bawah
            je bawah

            cmp ah,panah_atas
            je ceky

            cmp al,tenter

            jne masukan
            jmp banding
   

    ceky    :
            cmp posy,12
            je maxy
            dec posy
            jmp ulang

   
    maxy    :
            mov posy,19
            jmp ulang

    bawah     :
            cmp posy,19
            je no1y
            inc posy
            jmp ulang

    no1y    :
            mov posy,12
            jmp ulang

banding    :
            cmp posy,12
            je karakter

            cmp posy,13
            je warna

            cmp posy,14
            je rontok

            cmp posy,15
            je kelompok

            cmp posy,16
            je kalkulator
            
            cmp posy,17
            je bilprima

            cmp posy,18
            je helikopter

            cmp posy,19
            je keluar


    keluar    :
            jmp selesai


karakter :
            cls
            gotoxy 22,12

            mov ah,2h
            mov dl,'A'
            mov cx,26
    k1        :
            int 21h
            inc dl
            loop k1
            readkey
            jmp proses

warna  :
            cls
            gotoxy 22,12
           
            mov ah,9h
            mov bx,29h
            mov al,'Z'
            mov cx,26

    k2     :
            int 10h
            dec al
            inc bl
            loop k2
            readkey
            jmp proses

    kelompok : jmp nama
                nm1 db '1. Adhe Setiawan - 22171065710$'
                nm2 db, 0ah, 9, 9, '2. Raden Mas Muhammad Whisnu TN - 22171065711$'
                nm3 db, 0ah, 9, 9, '3. Verdy Januar - 22171065704$'
                nm4 db, 0ah, 9, 9, '4. Rizky Fathony -22271065703$'
                nm5 db, 0ah, 9, 9, 'Tekan Enter Untuk Kembali ke Menu Utama$'


            nama : 
            cls
            gotoxy 16,12

            Cetak_Kal nm1
            Cetak_Kal nm2
            Cetak_Kal nm3
            Cetak_Kal nm4
            Cetak_Kal nm5
            
            readkey
            jmp proses

        

kalkulator:
	jmp mulaiproses

	judul		db ' Calculator ITBU'
	tambah	db ' [1] Tambah$'
	kurang		db ' [2] Kurang$'
	kali		db ' [3] Kali$'
	bagi		db ' [4] Bagi$'
	keluarhitung		db ' Exit Program$'
	sk2009		db ' ITBU$'
	rule		db ' RULE$'
	up			db ' = up$'
	down		db ' = down$'
	akhir		db 'Tekan Enter Untuk Kembali Ke Menu Utama$'

	pertambahan	db 'Pertambahan$'
	pengurangan	db 'Pengurangan$'
	perkalian	db 'Perkalian$'
	pembagian	db 'Pembagian$'
	back	db ' Back$'
	sd		db '  = $'
	tanda1	db '  + $'
	tanda2	db '  - $'
	tanda3	db '  x $'
	tanda4	db '  : $'
	hasil	db ' hasil$'
	
	pindah		db 13,10,'$'
	
	a			db 0
	b			db 0
	c			db 1
	d			db 0
	e			db 0
	f			db 0
	nilaix		db 33
	nilaiy		db 6
	nilaiy1		db 6
	panah_atas	equ 72
	panah_	equ	80
	enter_key	equ	0dh
	
mulaiproses:
	cls
        gotoxy 10,3
	tampil 201
	ulangtampil 205, 33
	tampil 187
	gotoxy 10,4
	tampil 186
	gotoxy 44,4
	tampil 186
	menul pindah
	gotoxy 10,5
	tampil 204
	ulangtampil 205, 20
	tampil 203
	ulangtampil 205, 3
	tampil 203
	ulangtampil 205, 8
	tampil 185
	menul pindah
	gotoxy 10,6
	tampil 186
	ulangtampil 255, 20
	tampil 186
	ulangtampil 255, 3
	tampil 186
	ulangtampil 255, 8
	tampil 186
	menul pindah
	gotoxy 10,7
	tampil 186
	ulangtampil 255, 20
	tampil 186
	ulangtampil 255, 3
	tampil 204
	ulangtampil 205, 8
	tampil 185
	menul pindah
	gotoxy 10,8
	tampil 186
	ulangtampil 255, 20
	tampil 186
	ulangtampil 255, 3
	tampil 186
	ulangtampil 255, 8
	tampil 186
	menul pindah
	gotoxy 10,9
	tampil 186
	ulangtampil 255, 20
	tampil 186
	ulangtampil 255, 3
	tampil 186
	ulangtampil 255, 8
	tampil 186
	menul pindah
	gotoxy 10,10
	tampil 204
	ulangtampil 205, 20
	tampil 206
	ulangtampil 205, 3
	tampil 206
	ulangtampil 205, 8
	tampil 185
	menul pindah
	gotoxy 10,11
	tampil 186
	ulangtampil 255, 20
	tampil 186
	ulangtampil 255, 3
	tampil 186
	ulangtampil 255, 8
	tampil 186
	menul pindah
	gotoxy 10,12
	tampil 200
	ulangtampil 205, 20
	tampil 202
	ulangtampil 205, 3
	tampil 202
	ulangtampil 205, 8
	tampil 188
	menul pindah
	gotoxy 30, 9
	
tulis:
	gotoxy 12, 4
	menul judul
	gotoxy 12, 6
	menul tambah
	gotoxy 12, 7
	menul kurang
	gotoxy 12, 8
	menul kali
	gotoxy 12, 9
	menul bagi
	gotoxy 12, 11
	menul keluarhitung
	gotoxy 37, 11
	menul sk2009
	gotoxy 38, 6
	menul rule
	gotoxy 36, 8
	tampil 24
	menul up
	gotoxy 36, 9
	tampil 25
	menul down
	cmp c, 0
	je input
	dec c
	jmp mulaiproses
awal:
	jmp mulaiproses
input:
	gotoxy nilaix, nilaiy
	tampil 17
	readkey
	cmp ah, panah_bawah
	je	bawahhitung
	cmp ah, panah_atas
	je atas
	cmp al, enter_key
	je setting
	jmp input
bawahhitung:
	cmp nilaiy, 9
	je lompat1
	cmp nilaiy, 11
	je awal
	inc nilaiy
	jmp awal
	
lompat1:
	mov nilaiy, 11
	jmp awal
	
atas:
	cmp nilaiy, 11
	je lompat2
	cmp nilaiy, 6
	je awal
	dec nilaiy
	jmp awal
	
lompat2:
	mov nilaiy, 9
	jmp awal
	
setting:
	cls
	cmp nilaiy, 5
	ja mulaihitung

mulaihitung:
	cls
	gotoxy 10,3
	tampil 201
	ulangtampil 205, 15
	tampil 203
	ulangtampil 205, 8
	tampil 187
	gotoxy 10,4
	tampil 186
	ulangtampil 255, 15
	tampil 186
	ulangtampil 255, 8
	tampil 186
	menul pindah
	gotoxy 10,5
	tampil 204
	ulangtampil 205, 6
	tampil 203
	ulangtampil 205, 3
	tampil 203
	ulangtampil 205, 4
	tampil 206
	ulangtampil 205, 8
	tampil 185
	menul pindah
	gotoxy 10,6
	tampil 186
	ulangtampil 255, 6
	tampil 186
	ulangtampil 255, 3
	tampil 186
	ulangtampil 255, 4
	tampil 186
	ulangtampil 255, 8
	tampil 186
	menul pindah
	gotoxy 10,7
	tampil 186
	ulangtampil 255, 6
	tampil 186
	ulangtampil 255, 3
	tampil 186
	ulangtampil 255, 4
	tampil 186
	ulangtampil 255, 8
	tampil 186
	menul pindah
	gotoxy 10,8
	tampil 204
	ulangtampil 205, 6
	tampil 202
	ulangtampil 205, 3
	tampil 206
	ulangtampil 205, 4
	tampil 206
	ulangtampil 205, 8
	tampil 185
	menul pindah
	gotoxy 10,9
	tampil 186
	ulangtampil 255, 10
	tampil 186
	ulangtampil 255, 4
	tampil 186
	ulangtampil 255, 8
	tampil 186
	menul pindah
	gotoxy 10,10
	tampil 200
	ulangtampil 205, 10
	tampil 202
	ulangtampil 205, 4
	tampil 202
	ulangtampil 205, 8
	tampil 188
	menul pindah
	gotoxy 30, 9
	
	cmp nilaiy, 6
	je tambah1
	cmp nilaiy, 7
	je kurang1
	cmp nilaiy, 8
	je kali1
	cmp nilaiy, 9
	je bagi1
	jmp selesaihitung
tambah1:
	gotoxy 13, 4
	menul pertambahan
	gotoxy 11, 6
	menul tanda1
	jmp tulis1
kurang1:
	gotoxy 13, 4
	menul pengurangan
	gotoxy 11, 6
	menul tanda2
	jmp tulis1
kali1:
	gotoxy 13, 4
	menul perkalian
	gotoxy 11, 6
	menul tanda3
	jmp tulis1
bagi1:
	gotoxy 13, 4
	menul pembagian
	gotoxy 11, 6
	menul tanda4
	jmp tulis1
tulis1:
	mov nilaiy1, 6
	gotoxy 11, 7
	menul back
	gotoxy 12, 9
	menul hasil
	gotoxy 28, 9
	menul sk2009
	gotoxy 28, 4
	menul rule
	gotoxy 27, 6
	tampil 24
	menul up
	gotoxy 27, 7
	tampil 25
	menul down

input1:
	gotoxy 19, nilaiy1
	tampil 17
baca1:
	gotoxy 23, 6
	readkey
	cmp ah, panah_bawah
	je	bawah1
	cmp ah, panah_atas
	je atas1
	cmp al, enter_key
	je setting1
	mov ah,02h
	mov dl, al
	int 21h
	mov a,dl
	loop baca1
	jmp input1
atas1: jmp atas2
input2: jmp input1
bawah1:
	gotoxy 19, nilaiy1
	tampil 255
	cmp nilaiy1, 7
	je input1
	inc nilaiy1
	jmp input1
atas2:
	gotoxy 19, nilaiy1
	tampil 255
	cmp nilaiy1, 6
	je input2
	dec nilaiy1
	jmp input2

setting1:
	cmp nilaiy1, 7
	je kembali1
baca2:
	gotoxy 23,7
	readkey
	cmp al, enter_key
	je samadengan
	mov ah,02h
	mov dl, al
	int 21h
	mov b,dl
	loop baca2
samadengan:
	gotoxy 24, 9
	tampil 255
	gotoxy 23, 9
	mov ah, a
	mov al, b
	cmp nilaiy, 6
	je sdt
	cmp nilaiy, 7
	je sdk
	cmp nilaiy, 8
	je sdka
	cmp nilaiy, 9
	je sdb
sdt:	
	add ah, al
	mov dl,ah
	sub dl, 48
	jmp sadg
sdk:
	sub ah, al
	mov dl,ah
	sub dl, 208
	jmp sadg
kembali1: jmp kembali
sdka:
	sub al, 48
	sub ah, 48
	mov cl, al
	mov al, ah
	mov ah, 0
sdka1:
	add ah, al
	loop sdka1
	mov dl,ah
	sub dl, 208
	jmp sadg
sdb:
	sub al, 48
	sub ah, 48
	mov e, 49
	mov f, ah
	mov ah, al
sdb1:
	add ah, al
	mov dl, e
	cmp ah, f
	ja sadg
	inc e
	jmp sdb1
sadg:
	cmp dl,	'9'
	ja puluhan
	cmp dl,'0'
	jb min
	mov ah,2
	int 21h
	jmp input2
min:
	mov e, 49
ulang4:
	inc dl
	cmp dl, '0'
	mov d, '-'
	je tampil2
	inc e
	jmp ulang4
puluhan:
	mov d, 49
ulang3:	sub dl, 10
	cmp dl, ':'
	mov e, dl
	jb tampil2
	inc d
	jmp ulang3
tampil2:
	mov dl, d
	mov ah,2
	int 21h
	mov dl, e
	mov ah,2
	int 21h
	jmp input2
kembali:
	mov c, 1
	jmp mulaiproses
selesaihitung:
	cls
	gotoxy 22, 12

        mov ah,09
	lea dx,akhir
        int 21h

	readkey
        jmp proses

bilprima :JMP AwalDes
        BatasDes DW 1000
        Prima DW 0
        I DW 2
        J DW 2
        Spasi DB ' $'
        Header DB 9,9,'Bilangan Prima 1 sampai 1000 : ',13,10
        DB 9,9,9,'------------------------',13,10,10,'$'
AwalDes :
        cls
        gotoxy 12,12
        Cetak_Kal Header

ProsesDes :
        MOV AX,BatasDes ; Jika bilangan yang dicek
        CMP AX,I ; sudah sama dengan BatasDes
        JE Exit ; maka selesai
ForI :
        MOV J,2 ; J untuk dibagi oleh I
        MOV Prima,0 ; Prima = Tidak
ForPrima:
        MOV AX,Prima ;
        CMP AX,0 ; Apakah prima = Tidak ?
        JNE TambahI ; jika Prima = Ya, lompat ke TambahI
        MOV AX,I ;
        CMP AX,J ; I = J ?
        JNE Tidak ; Jika tidak sama, lompat ke Tidak

        CDesimal I ; Cetak angka prima
        Cetak_Kal Spasi ; Cetak spasi
        MOV Prima,1 ; Prima = Ya
        JMP TambahJ ; Lompat ke TambahJ
Tidak :
        MOV DX,0 ;
        MOV AX,I ;
        MOV BX,J ;
        DIV BX ; Bagi I dengan J
        CMP DX,0 ; Apakah sisa bagi=0?
        JNE TambahJ ; Jika tidak sama lompat ke TambahJ
        MOV Prima,1 ; Prima = Ya
TambahJ :
        INC J ; Tambah J dengan 1
        JMP ForPrima ; Ulangi, bagi I dengan J
TambahI :
        INC I ; Tambah I dengan 1
        JMP ProsesDes ; Ulangi Cek I = prima atau bukan
Exit :
  readkey
  jmp proses

helikopter : JMP ProsesHeli
 Heli1 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000001110000000b
 DW 0000000000000000b,0000000100000000b
 DW 0000000011111111b,1111111111111110b
 DW 0000000000000000b,0000000100000000b
 DW 0000000000000000b,0111111111000000b
 DW 1110000000000000b,1111111111100000b
 DW 0100000000111111b,1111000100110000b
 DW 0111111111111111b,1111000100011000b
 DW 0000000000000011b,1111000111111000b
 DW 0000000000000000b,0111111111100000b
 DW 0000000000000000b,0010000100001000b
 DW 0000000000111111b,1111111111110000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 DW 0000000000000000b,0000000000000000b
 PosXHeli DW 00 ; Posisi awal X
 PosYHeli DW 50 ; Posisi awal Y
ProsesHeli:
 SetCRT 13h ; Aktifkan mode video grafik
 MOV CX,0
 UlangHeli:
 Heli Heli1,50 ; Gambar heli dengan warna 50
 DelayHeli ;
 Heli Heli1,00 ; Hapus heli dengan warna hitam
 INC PosXHeli ; Tambah posisi X
 INC CX ;
 CMP CX,290 ; Ulangi sebanyak 290 kali
 JE ExitHeli ;
 JMP UlangHeli ;
ExitHeli:
 SetCRT 03h ; Kemabli ke mode video default dos
 cls
 gotoxy 22, 12
 Int 21h
 readkey
 jmp proses

 
    rontok : jmp prontok

    prontok : jmp kalimat
                kal db 'INSTITUT TEKNOLOGI BUDI UTOMO $'
                kal2 db 'Tekan Enter Untuk Kembali ke Menu $'

            kalimat :
            cls
            gotoxy 22,12

            mov ah,09
            lea dx,kal
            int 21h

            mov ax,0B800h
            mov es,ax

            mov bx,3998
            mov cx,25

        ulangY    :
        mov PosY,12
        push cx
        mov cx,80

ulangX     :
        cmp byte ptr es:[bx],33

        jb Tdk
        Geser PosY
Tdk        :
        sub bx,2
        loop ulangX
        pop cx
        loop ulangY

        gotoxy 22,12
        mov ah,09h
        lea dx,kal2
        int 21h

        readkey
        jmp proses

    selesai :
            int 20h

end     tdata
