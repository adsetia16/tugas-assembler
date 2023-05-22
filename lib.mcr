cls macro
    mov ax,0600h
    xor cx,cx
    mov dx,184fh
    mov bh,10
    int 10h
endm

gotoxy macro x,y
       mov ah,02
       xor bx,bx
       mov dh,y
       mov dl,x
       int 10h
endm

Cetak_Kal macro Kal
        mov ah,09h
        lea dx,Kal
        int 21h
endm

CDesimal MACRO Angka; macro cetak angka
        local ulang, cetak
        mov ax,angka ; ax = angka yang akan dicetak
        mov bx,10 ; bx = penyebut
        xor cx,cx ; cx = 0


Ulang_Des :
        xor dx,dx ; cegah sisa bagi menjadi pembilang !
        div bx ; bagi angka yang akan dicetak dengan 10
        push dx ; simpan sisa bagi dalam stack
        inc cx ; cx ditambah 1
        cmp ax,0 ; apakah hasil bagi sudah habis ?
        jne Ulang_Des ; jika belum, ulangi lagi !


Cetak_Des :
        pop dx ; ambil 1 angka yang disimpan
        add dl,'0' ; ubah 1 angka dalam kode ascii
        mov ah,02 ;
        int 21h ; cetak angka tersebut
        loop Cetak_Des ; ulangi
endm

simpanl macro
        local ulang
        mov ax,0b800h
        mov es,ax
        mov cx,4000
        xor bx,bx

ulang    :
        mov al,es:[bx]
        mov layar[bx],al
        inc bx
        loop ulang
endm

balikl macro
        local ulang
        mov cx,4000
        xor bx,bx

ulang    :
        mov al,layar[bx]
        mov es:[bx],al
        inc bx
        loop ulang
endm

sorot     macro x,y
        local ulang

        mov bl,y
        mov al,160
        mul bl
        mov bx,ax

        mov al,x
        mov ah,2
        mul ah
        add bx,ax
        inc bx

        mov cx,20
ulang    :
        mov byte ptr es:[bx],6fh

        add bx,2
        loop ulang
endm

readkey    macro
        mov ah,00
        int 16h
endm

menul    macro string
        mov ah,09
        lea dx,string
        int 21h
endm


tampil macro nilai
	mov ah, 02h
	mov dx, nilai
	int 21h
endm

ulangtampil macro nilai, batas
local ulanghitung
	mov cx, batas
ulanghitung:
	mov ah, 02h
	mov dx, nilai
	int 21h
	loop ulanghitung
endm

delayhitung macro
local ulanghitung
local ulanghitung2
	push cx
	mov cx,0ffffh
ulanghitung:
	push cx
	mov cx, 0fffh
ulanghitung2: loop ulanghitung2
	pop cx
	loop ulanghitung
	pop cx
endm


delay macro
    push cx
    xor cx,cx
loop1    :
        loop loop1
        pop cx
endm

Geser    macro PosY
        push ax
        push bx
        push cx

        xor cx,cx
        mov al,26
        sub al,PosY
        mov cl,al

loop2    :
        mov al,byte ptr es:[bx]
        mov byte ptr es:[bx-160],al

hilang    :
        mov byte ptr es:[bx],' '

        delay
        sub bx,160
       
        loop loop2


        pop cx
        pop bx
        pop ax
endm

DelayHeli MACRO
 LOCAL UlangLg
 PUSH CX
 SUB CX,CX
 UlangLg:
 LOOP UlangLg
 POP CX
 ENDM
SetCRT MACRO Mode
 MOV AH,00
 MOV AL,Mode
 INT 10h
 ENDM 

 Pixel MACRO X,Y,Warna
 PUSH AX
 PUSH BX
 PUSH CX
 PUSH DX
 MOV AH,12 ; Servis menggambar pixel
 MOV CX,X ; Posisi kolom atau X
 MOV DX,Y ; Posisi baris atau Y
 MOV AL,Warna ; Atribut Pixel
 INT 10h ; Gambar pixel tersebut !
 POP DX
 POP CX
 POP BX
 POP AX
 ENDM

Heli MACRO Gambar,Warna
 LOCAL Ulang1,Ulang2,Ulang3,Nol
 PUSH AX ;
 PUSH BX ; Simpan semua register yang
 PUSH CX ; digunakan
 PUSH DX ;
 SUB BX,BX ;
 MOV CX,32 ; CX = banyaknya baris

Ulang1:
 PUSH CX
 MOV CX,2 ; CX = banyaknya Word satu baris
Ulang2:
 PUSH CX
 MOV CX,16 ; CX = Banyaknya bit pada 1 word
 MOV AX,1000000000000000b
Ulang3:
 PUSH AX
 AND AX,Gambar[BX] ; Apakah bit gambar ke AX=1 ?
 JZ Nol ; Tidak, lompat
 Pixel PosXHeli,PosYHeli,Warna ; Ya, gambar pixel
 Nol:
 POP AX ;
 SHR AX,1 ; Untuk men-test bit Gambar
 INC PosXHeli ;
 LOOP Ulang3 ; Ulangi test bit berikutnya
 ADD BX,2 ; Untuk mengakses word berikutnya
 POP CX ;
 LOOP Ulang2 ; Ulangi test word berikutnya
 INC PosYHeli ; Tambah posisi Y
 SUB PosXHeli,32 ; Kembalikan posisi X mula-mula
 POP CX ;
 LOOP Ulang1 ; Test word pada baris berikutnya
 SUB PosYHeli,32 ; Kembalikan posisi Y mula-mula
 POP DX ;
 POP CX ; Ambil kembali semua nilai
 POP BX ; register yang disimpan
 POP AX ;
 ENDM 
