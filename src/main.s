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
 movi r9,1
 movi r11,0
 movi r12,0

CHECK_TRIGGER:
 # ldwio r8,0(r0) #Prev
 # ldwio r8,0(r14)
 # ldwio r14,0(r9) #new
 # ldwio r8,0(r14)
 ldwio r14,0(r7)
#bne r8,r14,CHECK_TRIGGER

ldwio r11,0(r2)  #load register 11 with the switches.
cmpgt r15,r14,r10
mov r10,r14
beq r15,r0,CHECK_TRIGGER
add r12,r12,r11   # add the two registers
stwio r12, 0(r3)


 br CHECK_TRIGGER

#loop: 	#read from r2 and store to r3
 # ldwio r4, 0(r9)
 # stwio r4, 0(r3)
#call CHECK_TRIGGER
 #br    loop
