# ---------------------------------------------------------------
# Assembly language program that reads data from the switches,
# that are memory mapped to location 0x00011000, and displays
# it on the LEDs, which are memory mapped to location 0x00011010
# ---------------------------------------------------------------

.text

# define a macro to move a 32 bit address to a register

.macro MOVIA reg, addr
  movhi \reg, %hi(\addr)
  ori \reg, \reg, %lo(\addr)
.endm

# define constants
.equ I_SWITCHES,    0x00011020
.equ I_TRIGGERS,    0x00011000
.equ O_ACCUMULATOR, 0x00011010

#Define the main program
.global main
main: 	#load r2 and r3 with the addresses
movia r2, I_SWITCHES
movia r3, O_ACCUMULATOR
 movia r7, I_TRIGGERS
 movi r8,1
 movi r9,0
loop:
ldwio r5,0(r2)
ldwio r6,0(r3)
cmpgt r7,r6,r10
mov r10,r6
beq r7,r0,loop

add r9,r9, r5

stwio r9,0(r3)
br loop




