	.include "asm/macros.inc"
	.include "global.inc"

	.extern gSystem

	.text

	thumb_func_start sub_0208A338
sub_0208A338: ; 0x0208A338
	push {r4-r6, lr}
	add r6, r0, #0x0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0x0
	mov r0, #0x20
	mov r1, #0x6c
	bl AllocFromHeap
	add r4, r0, #0x0
	mov r0, #0x19
	str r5, [r4, #0x0]
	lsl r0, r0, #0x4
	mov r1, #0x20
	bl String_New
	str r0, [r4, #0x4]
	mov r0, #0x19
	lsl r0, r0, #0x4
	mov r1, #0x20
	bl String_New
	str r0, [r4, #0x8]
	mov r0, #0x20
	bl MessageFormat_New
	str r0, [r4, #0xc]
	ldr r2, _0208A3C0 ; =0x00000171
	mov r0, #0x1
	mov r1, #0x1a
	mov r3, #0x20
	bl NewMsgDataFromNarc
	str r0, [r4, #0x10]
	mov r0, #0x20
	bl ListMenuCursorNew
	str r0, [r4, #0x14]
	ldr r2, [r4, #0x0]
	mov r0, #0x2
	ldr r2, [r2, #0xc]
	mov r1, #0x0
	mov r3, #0x20
	bl sub_02085338
	str r0, [r4, #0x50]
	bl sub_020853DC
	add r0, r4, #0x0
	add r0, #0x18
	bl InitWindow
	add r0, r4, #0x0
	add r0, #0x28
	bl InitWindow
	add r0, r4, #0x0
	add r0, #0x38
	bl InitWindow
	mov r0, #0x0
	str r0, [r4, #0x54]
	ldr r1, _0208A3C4 ; =sub_0208A458
	add r0, r6, #0x0
	add r2, r4, #0x0
	bl TaskManager_Call
	pop {r4-r6, pc}
	.balign 4
_0208A3C0: .word 0x00000171
_0208A3C4: .word sub_0208A458

	thumb_func_start sub_0208A3C8
sub_0208A3C8: ; 0x0208A3C8
	push {r4, lr}
	add r4, r0, #0x0
	ldr r0, [r4, #0x50]
	bl sub_020853A8
	ldr r0, [r4, #0x14]
	bl DestroyListMenuCursorObj
	ldr r0, [r4, #0x4]
	bl String_Delete
	ldr r0, [r4, #0x8]
	bl String_Delete
	ldr r0, [r4, #0xc]
	bl MessageFormat_Delete
	ldr r0, [r4, #0x10]
	bl DestroyMsgData
	add r0, r4, #0x0
	bl sub_0208A400
	add r0, r4, #0x0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4

	thumb_func_start sub_0208A400
sub_0208A400: ; 0x0208A400
	push {r4, lr}
	add r4, r0, #0x0
	add r0, #0x18
	bl WindowIsInUse
	cmp r0, #0x0
	beq _0208A41E
	add r0, r4, #0x0
	add r0, #0x18
	bl RemoveWindow
	add r0, r4, #0x0
	add r0, #0x18
	bl InitWindow
_0208A41E:
	add r0, r4, #0x0
	add r0, #0x28
	bl WindowIsInUse
	cmp r0, #0x0
	beq _0208A43A
	add r0, r4, #0x0
	add r0, #0x28
	bl RemoveWindow
	add r0, r4, #0x0
	add r0, #0x28
	bl InitWindow
_0208A43A:
	add r0, r4, #0x0
	add r0, #0x38
	bl WindowIsInUse
	cmp r0, #0x0
	beq _0208A456
	add r0, r4, #0x0
	add r0, #0x38
	bl RemoveWindow
	add r4, #0x38
	add r0, r4, #0x0
	bl InitWindow
_0208A456:
	pop {r4, pc}

	thumb_func_start sub_0208A458
sub_0208A458: ; 0x0208A458
	push {r3-r5, lr}
	bl TaskManager_GetEnvironment
	add r4, r0, #0x0
	ldr r1, [r4, #0x54]
	cmp r1, #0xd
	bhi _0208A4A4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #0x6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0208A472: ; jump table (using 16-bit offset)
	.short _0208A48E - _0208A472 - 2; case 0
	.short _0208A49C - _0208A472 - 2; case 1
	.short _0208A4B8 - _0208A472 - 2; case 2
	.short _0208A556 - _0208A472 - 2; case 3
	.short _0208A566 - _0208A472 - 2; case 4
	.short _0208A57A - _0208A472 - 2; case 5
	.short _0208A5A6 - _0208A472 - 2; case 6
	.short _0208A5BE - _0208A472 - 2; case 7
	.short _0208A5D4 - _0208A472 - 2; case 8
	.short _0208A614 - _0208A472 - 2; case 9
	.short _0208A628 - _0208A472 - 2; case 10
	.short _0208A694 - _0208A472 - 2; case 11
	.short _0208A6A2 - _0208A472 - 2; case 12
	.short _0208A6C0 - _0208A472 - 2; case 13
_0208A48E:
	mov r1, #0x0
	add r2, r1, #0x0
	bl sub_0208A6D4
	mov r0, #0x1
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A49C:
	bl sub_0208A750
	cmp r0, #0x0
	bne _0208A4A6
_0208A4A4:
	b _0208A6C8
_0208A4A6:
	add r0, r4, #0x0
	bl sub_0208A760
	add r0, r4, #0x0
	bl sub_0208A77C
	mov r0, #0x2
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A4B8:
	bl sub_0208A8DC
	mov r1, #0x0
	mvn r1, r1
	str r0, [r4, #0x64]
	cmp r0, r1
	beq _0208A5B0
	add r0, r4, #0x0
	bl sub_0208A820
	ldr r0, [r4, #0x64]
	cmp r0, #0x4
	bhi _0208A5B0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #0x6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208A4DE: ; jump table (using 16-bit offset)
	.short _0208A4E8 - _0208A4DE - 2; case 0
	.short _0208A502 - _0208A4DE - 2; case 1
	.short _0208A51C - _0208A4DE - 2; case 2
	.short _0208A536 - _0208A4DE - 2; case 3
	.short _0208A550 - _0208A4DE - 2; case 4
_0208A4E8:
	ldr r0, [r4, #0x0]
	mov r1, #0x0
	ldr r0, [r0, #0xc]
	bl SaveStruct23_GetMessage
	add r1, r0, #0x0
	add r0, r4, #0x0
	add r0, #0x48
	bl MailMsg_Copy
	mov r0, #0x3
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A502:
	ldr r0, [r4, #0x0]
	mov r1, #0x1
	ldr r0, [r0, #0xc]
	bl SaveStruct23_GetMessage
	add r1, r0, #0x0
	add r0, r4, #0x0
	add r0, #0x48
	bl MailMsg_Copy
	mov r0, #0x3
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A51C:
	ldr r0, [r4, #0x0]
	mov r1, #0x2
	ldr r0, [r0, #0xc]
	bl SaveStruct23_GetMessage
	add r1, r0, #0x0
	add r0, r4, #0x0
	add r0, #0x48
	bl MailMsg_Copy
	mov r0, #0x3
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A536:
	ldr r0, [r4, #0x0]
	mov r1, #0x3
	ldr r0, [r0, #0xc]
	bl SaveStruct23_GetMessage
	add r1, r0, #0x0
	add r0, r4, #0x0
	add r0, #0x48
	bl MailMsg_Copy
	mov r0, #0x3
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A550:
	mov r0, #0xb
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A556:
	ldr r1, [r4, #0x64]
	mov r2, #0x0
	add r1, r1, #0x1
	bl sub_0208A6D4
	mov r0, #0x4
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A566:
	bl sub_0208A750
	cmp r0, #0x0
	beq _0208A5B0
	mov r0, #0x0
	bl ov05_021D7CA4
	mov r0, #0x5
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A57A:
	bl IsPaletteFadeFinished
	cmp r0, #0x0
	beq _0208A5B0
	add r1, r4, #0x0
	ldr r0, [r4, #0x50]
	add r1, #0x48
	bl sub_020853BC
	ldr r0, [r4, #0x50]
	bl sub_020853D0
	add r0, r4, #0x0
	bl sub_0208A400
	ldr r0, [r4, #0x0]
	ldr r1, [r4, #0x50]
	bl sub_02037E80
	mov r0, #0x6
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A5A6:
	ldr r0, [r4, #0x0]
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0x0
	beq _0208A5B2
_0208A5B0:
	b _0208A6C8
_0208A5B2:
	ldr r0, [r4, #0x0]
	bl FieldSystem_LoadFieldOverlay
	mov r0, #0x7
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A5BE:
	ldr r0, [r4, #0x0]
	bl sub_020464A4
	cmp r0, #0x0
	beq _0208A6C8
	mov r0, #0x1
	bl ov05_021D7CA4
	mov r0, #0x8
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A5D4:
	bl IsPaletteFadeFinished
	cmp r0, #0x0
	beq _0208A6C8
	ldr r0, [r4, #0x50]
	bl sub_020853E4
	cmp r0, #0x0
	beq _0208A5EC
	mov r0, #0xb
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A5EC:
	add r1, r4, #0x0
	ldr r0, [r4, #0x50]
	add r1, #0x48
	bl sub_020853FC
	ldr r0, [r4, #0x0]
	add r2, r4, #0x0
	ldr r0, [r0, #0xc]
	ldr r1, [r4, #0x64]
	add r2, #0x48
	bl SaveStruct23_SetMessage
	add r0, r4, #0x0
	mov r1, #0x6
	mov r2, #0x0
	bl sub_0208A6D4
	mov r0, #0x9
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A614:
	bl sub_0208A750
	cmp r0, #0x0
	beq _0208A6C8
	add r0, r4, #0x0
	bl sub_0208A82C
	mov r0, #0xa
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A628:
	bl sub_0208A8DC
	mov r1, #0x0
	mvn r1, r1
	str r0, [r4, #0x64]
	cmp r0, r1
	beq _0208A6C8
	cmp r0, #0x0
	beq _0208A63E
	cmp r0, #0x1
	b _0208A656
_0208A63E:
	add r0, r4, #0x0
	bl sub_0208A8D0
	add r0, r4, #0x0
	bl sub_0208A760
	add r0, r4, #0x0
	bl sub_0208A77C
	mov r0, #0x2
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A656:
	add r0, r4, #0x0
	add r0, #0x48
	mov r1, #0x0
	bl MailMsg_GetFieldI
	add r5, r0, #0x0
	add r0, r4, #0x0
	bl sub_0208A8D0
	ldr r0, _0208A6CC ; =0x0000FFFF
	cmp r5, r0
	beq _0208A684
	ldr r0, [r4, #0xc]
	mov r1, #0x0
	add r2, r5, #0x0
	bl BufferECWord
	add r0, r4, #0x0
	mov r1, #0x8
	mov r2, #0x1
	bl sub_0208A6D4
	b _0208A68E
_0208A684:
	add r0, r4, #0x0
	mov r1, #0x7
	mov r2, #0x0
	bl sub_0208A6D4
_0208A68E:
	mov r0, #0xc
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A694:
	mov r1, #0x5
	mov r2, #0x0
	bl sub_0208A6D4
	mov r0, #0xc
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A6A2:
	bl sub_0208A750
	cmp r0, #0x0
	beq _0208A6C8
	ldr r0, _0208A6D0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xf3
	tst r0, r1
	beq _0208A6C8
	add r0, r4, #0x0
	bl sub_0208A760
	mov r0, #0xd
	str r0, [r4, #0x54]
	b _0208A6C8
_0208A6C0:
	bl sub_0208A3C8
	mov r0, #0x1
	pop {r3-r5, pc}
_0208A6C8:
	mov r0, #0x0
	pop {r3-r5, pc}
	.balign 4
_0208A6CC: .word 0x0000FFFF
_0208A6D0: .word gSystem

	thumb_func_start sub_0208A6D4
sub_0208A6D4: ; 0x0208A6D4
	push {r3-r5, lr}
	add r5, r0, #0x0
	add r4, r5, #0x0
	add r4, #0x18
	cmp r2, #0x0
	ldr r0, [r5, #0x10]
	beq _0208A6F4
	ldr r2, [r5, #0x4]
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x8]
	ldr r2, [r5, #0x4]
	bl StringExpandPlaceholders
	b _0208A6FA
_0208A6F4:
	ldr r2, [r5, #0x8]
	bl ReadMsgDataIntoString
_0208A6FA:
	add r0, r4, #0x0
	bl WindowIsInUse
	cmp r0, #0x0
	bne _0208A722
	ldr r0, [r5, #0x0]
	add r1, r4, #0x0
	ldr r0, [r0, #0x8]
	mov r2, #0x3
	bl sub_020545B8
	ldr r0, [r5, #0x0]
	ldr r0, [r0, #0xc]
	bl Save_PlayerData_GetOptionsAddr
	add r1, r0, #0x0
	add r0, r4, #0x0
	bl sub_02054608
	b _0208A734
_0208A722:
	add r0, r4, #0x0
	bl sub_0205464C
	ldr r2, _0208A74C ; =0x000003E2
	add r0, r4, #0x0
	mov r1, #0x0
	mov r3, #0xa
	bl DrawFrameAndWindow2
_0208A734:
	ldr r0, [r5, #0x0]
	ldr r0, [r0, #0xc]
	bl Save_PlayerData_GetOptionsAddr
	add r2, r0, #0x0
	ldr r1, [r5, #0x8]
	add r0, r4, #0x0
	mov r3, #0x1
	bl sub_02054658
	str r0, [r5, #0x58]
	pop {r3-r5, pc}
	.balign 4
_0208A74C: .word 0x000003E2

	thumb_func_start sub_0208A750
sub_0208A750: ; 0x0208A750
	ldr r0, [r0, #0x58]
	ldr r3, _0208A75C ; =sub_020546C8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx r3
	nop
_0208A75C: .word sub_020546C8

	thumb_func_start sub_0208A760
sub_0208A760: ; 0x0208A760
	push {r4, lr}
	add r4, r0, #0x0
	add r4, #0x18
	add r0, r4, #0x0
	bl WindowIsInUse
	cmp r0, #0x0
	beq _0208A778
	add r0, r4, #0x0
	mov r1, #0x0
	bl ClearFrameAndWindow2
_0208A778:
	pop {r4, pc}
	.balign 4

	thumb_func_start sub_0208A77C
sub_0208A77C: ; 0x0208A77C
	push {r4-r7, lr}
	sub sp, #0x14
	add r5, r0, #0x0
	add r7, r5, #0x0
	add r7, #0x28
	add r0, r7, #0x0
	bl WindowIsInUse
	cmp r0, #0x0
	bne _0208A808
	mov r0, #0x0
	str r0, [sp, #0x0]
	mov r0, #0x20
	str r0, [sp, #0x4]
	ldr r0, [r5, #0x0]
	mov r1, #0x3
	ldr r0, [r0, #0x8]
	mov r2, #0xa5
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r1, #0xd
	str r1, [sp, #0x0]
	mov r0, #0xe
	str r0, [sp, #0x4]
	mov r0, #0xa
	str r0, [sp, #0x8]
	str r1, [sp, #0xc]
	mov r0, #0x1
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x0]
	add r1, r7, #0x0
	ldr r0, [r0, #0x8]
	mov r2, #0x3
	mov r3, #0x11
	bl AddWindowParameterized
	add r0, r7, #0x0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r6, #0x0
	add r4, r6, #0x0
_0208A7D2:
	add r1, r6, #0x0
	ldr r0, [r5, #0x10]
	ldr r2, [r5, #0x8]
	add r1, #0x9
	bl ReadMsgDataIntoString
	str r4, [sp, #0x0]
	mov r0, #0xff
	str r0, [sp, #0x4]
	mov r0, #0x0
	str r0, [sp, #0x8]
	ldr r2, [r5, #0x8]
	add r0, r7, #0x0
	mov r1, #0x0
	mov r3, #0xc
	bl AddTextPrinterParameterized
	add r6, r6, #0x1
	add r4, #0x10
	cmp r6, #0x5
	blt _0208A7D2
	mov r2, #0x0
	ldr r0, [r5, #0x14]
	add r1, r7, #0x0
	add r3, r2, #0x0
	bl ListMenuUpdateCursorObj
_0208A808:
	str r7, [r5, #0x68]
	mov r1, #0x0
	str r1, [r5, #0x5c]
	mov r0, #0x5
	str r0, [r5, #0x60]
	add r0, r7, #0x0
	mov r2, #0xa5
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add sp, #0x14
	pop {r4-r7, pc}

	thumb_func_start sub_0208A820
sub_0208A820: ; 0x0208A820
	ldr r3, _0208A828 ; =ClearFrameAndWindow1
	add r0, #0x28
	mov r1, #0x1
	bx r3
	.balign 4
_0208A828: .word ClearFrameAndWindow1

	thumb_func_start sub_0208A82C
sub_0208A82C: ; 0x0208A82C
	push {r4-r7, lr}
	sub sp, #0x14
	add r5, r0, #0x0
	add r7, r5, #0x0
	add r7, #0x38
	add r0, r7, #0x0
	bl WindowIsInUse
	cmp r0, #0x0
	bne _0208A8B8
	mov r0, #0x0
	str r0, [sp, #0x0]
	mov r0, #0x20
	str r0, [sp, #0x4]
	ldr r0, [r5, #0x0]
	mov r1, #0x3
	ldr r0, [r0, #0x8]
	mov r2, #0xa5
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r1, #0xd
	str r1, [sp, #0x0]
	mov r0, #0x6
	str r0, [sp, #0x4]
	mov r0, #0x4
	str r0, [sp, #0x8]
	str r1, [sp, #0xc]
	mov r0, #0x8d
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x0]
	add r1, r7, #0x0
	ldr r0, [r0, #0x8]
	mov r2, #0x3
	mov r3, #0x19
	bl AddWindowParameterized
	add r0, r7, #0x0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r6, #0x0
	add r4, r6, #0x0
_0208A882:
	add r1, r6, #0x0
	ldr r0, [r5, #0x10]
	ldr r2, [r5, #0x8]
	add r1, #0xe
	bl ReadMsgDataIntoString
	str r4, [sp, #0x0]
	mov r0, #0xff
	str r0, [sp, #0x4]
	mov r0, #0x0
	str r0, [sp, #0x8]
	ldr r2, [r5, #0x8]
	add r0, r7, #0x0
	mov r1, #0x0
	mov r3, #0xc
	bl AddTextPrinterParameterized
	add r6, r6, #0x1
	add r4, #0x10
	cmp r6, #0x2
	blt _0208A882
	mov r2, #0x0
	ldr r0, [r5, #0x14]
	add r1, r7, #0x0
	add r3, r2, #0x0
	bl ListMenuUpdateCursorObj
_0208A8B8:
	str r7, [r5, #0x68]
	mov r1, #0x0
	str r1, [r5, #0x5c]
	mov r0, #0x2
	str r0, [r5, #0x60]
	add r0, r7, #0x0
	mov r2, #0xa5
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add sp, #0x14
	pop {r4-r7, pc}

	thumb_func_start sub_0208A8D0
sub_0208A8D0: ; 0x0208A8D0
	ldr r3, _0208A8D8 ; =ClearFrameAndWindow1
	add r0, #0x38
	mov r1, #0x1
	bx r3
	.balign 4
_0208A8D8: .word ClearFrameAndWindow1

	thumb_func_start sub_0208A8DC
sub_0208A8DC: ; 0x0208A8DC
	push {r4, lr}
	sub sp, #0x8
	add r4, r0, #0x0
	ldr r0, _0208A990 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _0208A906
	ldr r0, [r4, #0x5c]
	sub r0, r0, #0x1
	str r0, [r4, #0x5c]
	bpl _0208A954
	ldr r0, [r4, #0x60]
	cmp r0, #0x2
	ble _0208A900
	sub r0, r0, #0x1
	str r0, [r4, #0x5c]
	b _0208A954
_0208A900:
	mov r0, #0x0
	str r0, [r4, #0x5c]
	b _0208A954
_0208A906:
	mov r1, #0x80
	tst r1, r0
	beq _0208A928
	ldr r0, [r4, #0x5c]
	add r1, r0, #0x1
	str r1, [r4, #0x5c]
	ldr r0, [r4, #0x60]
	cmp r1, r0
	blt _0208A954
	cmp r0, #0x2
	ble _0208A922
	mov r0, #0x0
	str r0, [r4, #0x5c]
	b _0208A954
_0208A922:
	sub r0, r0, #0x1
	str r0, [r4, #0x5c]
	b _0208A954
_0208A928:
	mov r1, #0x1
	tst r1, r0
	beq _0208A93A
	ldr r0, _0208A994 ; =0x000005DC
	bl PlaySE
	add sp, #0x8
	ldr r0, [r4, #0x5c]
	pop {r4, pc}
_0208A93A:
	mov r1, #0x2
	tst r0, r1
	beq _0208A94E
	ldr r0, _0208A994 ; =0x000005DC
	bl PlaySE
	ldr r0, [r4, #0x60]
	add sp, #0x8
	sub r0, r0, #0x1
	pop {r4, pc}
_0208A94E:
	add sp, #0x8
	sub r0, r1, #0x3
	pop {r4, pc}
_0208A954:
	ldr r0, [r4, #0x68]
	mov r1, #0xc
	str r1, [sp, #0x0]
	ldrb r1, [r0, #0x8]
	mov r2, #0x0
	add r3, r2, #0x0
	lsl r1, r1, #0x13
	lsr r1, r1, #0x10
	str r1, [sp, #0x4]
	mov r1, #0xf
	bl FillWindowPixelRect
	ldr r3, [r4, #0x5c]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x68]
	mov r2, #0x0
	lsl r3, r3, #0x4
	bl ListMenuUpdateCursorObj
	ldr r0, [r4, #0x68]
	bl CopyWindowPixelsToVram_TextMode
	ldr r0, _0208A994 ; =0x000005DC
	bl PlaySE
	mov r0, #0x0
	mvn r0, r0
	add sp, #0x8
	pop {r4, pc}
	nop
_0208A990: .word gSystem
_0208A994: .word 0x000005DC
