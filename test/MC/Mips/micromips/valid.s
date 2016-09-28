# RUN: llvm-mc %s -triple=mips-unknown-linux -show-encoding -mattr=micromips | FileCheck %s

.set noat
addiusp -16                 # CHECK: addiusp -16        # encoding: [0x4f,0xf9]
addiusp -1028               # CHECK: addiusp -1028      # encoding: [0x4f,0xff]
addiusp -1032               # CHECK: addiusp -1032      # encoding: [0x4f,0xfd]
addiusp 1024                # CHECK: addiusp 1024       # encoding: [0x4c,0x01]
addiusp 1028                # CHECK: addiusp 1028       # encoding: [0x4c,0x03]
andi16 $16, $2, 31          # CHECK: andi16 $16, $2, 31 # encoding: [0x2c,0x29]
jraddiusp 20                # CHECK: jraddiusp 20       # encoding: [0x47,0x05]
addu16 $6, $17, $4          # CHECK: addu16 $6, $17, $4 # encoding: [0x07,0x42]
subu16 $5, $16, $3          # CHECK: subu16 $5, $16, $3 # encoding: [0x06,0xb1]
and16 $16, $2               # CHECK: and16 $16, $2      # encoding: [0x44,0x82]
not16 $17, $3               # CHECK: not16 $17, $3      # encoding: [0x44,0x0b]
or16 $16, $4                # CHECK: or16 $16, $4       # encoding: [0x44,0xc4]
xor16 $17, $5               # CHECK: xor16 $17, $5      # encoding: [0x44,0x4d]
sll16 $3, $16, 5            # CHECK: sll16 $3, $16, 5   # encoding: [0x25,0x8a]
srl16 $4, $17, 6            # CHECK: srl16 $4, $17, 6   # encoding: [0x26,0x1d]
lbu16 $3, 4($17)            # CHECK: lbu16 $3, 4($17)   # encoding: [0x09,0x94]
lbu16 $3, -1($16)           # CHECK: lbu16 $3, -1($16)  # encoding: [0x09,0x8f]
lhu16 $3, 4($16)            # CHECK: lhu16 $3, 4($16)   # encoding: [0x29,0x82]
lw16 $4, 8($17)             # CHECK: lw16 $4, 8($17)    # encoding: [0x6a,0x12]
sb16 $3, 4($16)             # CHECK: sb16 $3, 4($16)    # encoding: [0x89,0x84]
sh16 $4, 8($17)             # CHECK: sh16 $4, 8($17)    # encoding: [0xaa,0x14]
sw16 $4, 4($17)             # CHECK: sw16 $4, 4($17)    # encoding: [0xea,0x11]
sw16 $zero, 4($17)          # CHECK: sw16 $zero, 4($17) # encoding: [0xe8,0x11]
mfhi $9                     # CHECK: mfhi $9            # encoding: [0x46,0x09]
mflo $9                     # CHECK: mflo $9            # encoding: [0x46,0x49]
move $25, $1                # CHECK: move $25, $1       # encoding: [0x0f,0x21]
jrc $9                      # CHECK: jrc $9             # encoding: [0x45,0xa9]
jalr $9                     # CHECK: jalr $9            # encoding: [0x45,0xc9]
jalrs16 $9                  # CHECK: jalrs16 $9         # encoding: [0x45,0xe9]
jr16 $9                     # CHECK: jr16 $9            # encoding: [0x45,0x89]
li16 $3, -1                 # CHECK: li16 $3, -1        # encoding: [0xed,0xff]
li16 $3, 126                # CHECK: li16 $3, 126       # encoding: [0xed,0xfe]
addiur1sp $7, 4             # CHECK: addiur1sp $7, 4    # encoding: [0x6f,0x83]
addiur2 $6, $7, -1          # CHECK: addiur2 $6, $7, -1 # encoding: [0x6f,0x7e]
addiur2 $6, $7, 12          # CHECK: addiur2 $6, $7, 12 # encoding: [0x6f,0x76]
addius5 $7, -2              # CHECK: addius5 $7, -2     # encoding: [0x4c,0xfc]
nop                         # CHECK: nop                # encoding: [0x00,0x00,0x00,0x00]
beqz16 $6, 20               # CHECK: beqz16 $6, 20      # encoding: [0x8f,0x0a]
bnez16 $6, 20               # CHECK: bnez16 $6, 20      # encoding: [0xaf,0x0a]
b16 132                     # CHECK: b16 132            # encoding: [0xcc,0x42]
lwm16 $16, $17, $ra, 8($sp) # CHECK: lwm16 $16, $17, $ra, 8($sp) # encoding: [0x45,0x12]
swm16 $16, $17, $ra, 8($sp) # CHECK: swm16 $16, $17, $ra, 8($sp) # encoding: [0x45,0x52]
movep $5, $6, $2, $3        # CHECK: movep $5, $6, $2, $3        # encoding: [0x84,0x34]
break16 8                   # CHECK: break16 8          # encoding: [0x46,0x88]
sdbbp16 14                  # CHECK: sdbbp16 14         # encoding: [0x46,0xce]
lw $3, 32($sp)              # CHECK: lw $3, 32($sp)     # encoding: [0x48,0x68]
sw $4, 124($sp)             # CHECK: sw $4, 124($sp)    # encoding: [0xc8,0x9f]
lw $3, 32($gp)              # CHECK: lw $3, 32($gp)     # encoding: [0x65,0x88]
add $9, $6, $7              # CHECK: add $9, $6, $7         # encoding: [0x00,0xe6,0x49,0x10]
addi $9, $6, 17767          # CHECK: addi $9, $6, 17767     # encoding: [0x11,0x26,0x45,0x67]
addiu $9, $6, -15001        # CHECK: addiu $9, $6, -15001   # encoding: [0x31,0x26,0xc5,0x67]
addi $9, $6, 17767          # CHECK: addi $9, $6, 17767     # encoding: [0x11,0x26,0x45,0x67]
addiu $9, $6, -15001        # CHECK: addiu $9, $6, -15001   # encoding: [0x31,0x26,0xc5,0x67]
addu $9, $6, $7             # CHECK: addu $9, $6, $7        # encoding: [0x00,0xe6,0x49,0x50]
sub $9, $6, $7              # CHECK: sub $9, $6, $7         # encoding: [0x00,0xe6,0x49,0x90]
subu $4, $3, $5             # CHECK: subu $4, $3, $5        # encoding: [0x00,0xa3,0x21,0xd0]
sub $6, $zero, $7           # CHECK: neg $6, $7             # encoding: [0x00,0xe0,0x31,0x90]
subu $6, $zero, $7          # CHECK: subu $6, $zero, $7     # encoding: [0x00,0xe0,0x31,0xd0]
addu $7, $8, $zero          # CHECK: addu $7, $8, $zero     # encoding: [0x00,0x08,0x39,0x50]
slt $3, $3, $5              # CHECK: slt $3, $3, $5         # encoding: [0x00,0xa3,0x1b,0x50]
slti $3, $3, 103            # CHECK: slti $3, $3, 103       # encoding: [0x90,0x63,0x00,0x67]
slti $3, $3, 103            # CHECK: slti $3, $3, 103       # encoding: [0x90,0x63,0x00,0x67]
sltiu $3, $3, 103           # CHECK: sltiu $3, $3, 103      # encoding: [0xb0,0x63,0x00,0x67]
sltu $3, $3, $5             # CHECK: sltu $3, $3, $5        # encoding: [0x00,0xa3,0x1b,0x90]
lui $9, 17767               # CHECK: lui $9, 17767          # encoding: [0x41,0xa9,0x45,0x67]
and $9, $6, $7              # CHECK: and $9, $6, $7         # encoding: [0x00,0xe6,0x4a,0x50]
andi $9, $6, 17767          # CHECK: andi $9, $6, 17767     # encoding: [0xd1,0x26,0x45,0x67]
or $3, $4, $5               # CHECK: or $3, $4, $5          # encoding: [0x00,0xa4,0x1a,0x90]
ori $9, $6, 17767           # CHECK: ori $9, $6, 17767      # encoding: [0x51,0x26,0x45,0x67]
xor $3, $3, $5              # CHECK: xor $3, $3, $5         # encoding: [0x00,0xa3,0x1b,0x10]
xori $9, $6, 17767          # CHECK: xori $9, $6, 17767     # encoding: [0x71,0x26,0x45,0x67]
nor $9, $6, $7              # CHECK: nor $9, $6, $7         # encoding: [0x00,0xe6,0x4a,0xd0]
not $7, $8                  # CHECK: not $7, $8             # encoding: [0x00,0x08,0x3a,0xd0]
mul $9, $6, $7              # CHECK: mul $9, $6, $7         # encoding: [0x00,0xe6,0x4a,0x10]
mult $9, $7                 # CHECK: mult $9, $7            # encoding: [0x00,0xe9,0x8b,0x3c]
multu $9, $7                # CHECK: multu $9, $7           # encoding: [0x00,0xe9,0x9b,0x3c]
div $zero, $9, $7           # CHECK: div $zero, $9, $7      # encoding: [0x00,0xe9,0xab,0x3c]
divu $zero, $9, $7          # CHECK: divu $zero, $9, $7     # encoding: [0x00,0xe9,0xbb,0x3c]
sll $4, $3, 7               # CHECK: sll $4, $3, 7          # encoding: [0x00,0x83,0x38,0x00]
sllv $2, $3, $5             # CHECK: sllv $2, $3, $5        # encoding: [0x00,0x65,0x10,0x10]
sra $4, $3, 7               # CHECK: sra $4, $3, 7          # encoding: [0x00,0x83,0x38,0x80]
srav $2, $3, $5             # CHECK: srav $2, $3, $5        # encoding: [0x00,0x65,0x10,0x90]
srl $4, $3, 7               # CHECK: srl $4, $3, 7          # encoding: [0x00,0x83,0x38,0x40]
srlv $2, $3, $5             # CHECK: srlv $2, $3, $5        # encoding: [0x00,0x65,0x10,0x50]
rotr $9, $6, 7              # CHECK: rotr $9, $6, 7         # encoding: [0x01,0x26,0x38,0xc0]
rotrv $9, $6, $7            # CHECK: rotrv $9, $6, $7       # encoding: [0x00,0xc7,0x48,0xd0]
lb $5, 8($4)                # CHECK: lb $5, 8($4)           # encoding: [0x1c,0xa4,0x00,0x08]
lbu $6, 8($4)               # CHECK: lbu $6, 8($4)          # encoding: [0x14,0xc4,0x00,0x08]
lh $2, 8($4)                # CHECK: lh $2, 8($4)           # encoding: [0x3c,0x44,0x00,0x08]
lhu $4, 8($2)               # CHECK: lhu $4, 8($2)          # encoding: [0x34,0x82,0x00,0x08]
lw  $6, 4($5)               # CHECK: lw  $6, 4($5)          # encoding: [0xfc,0xc5,0x00,0x04]
lw $6, 123($sp)             # CHECK: lw $6, 123($sp)        # encoding: [0xfc,0xdd,0x00,0x7b]
sb $5, 8($4)                # CHECK: sb $5, 8($4)           # encoding: [0x18,0xa4,0x00,0x08]
sh  $2, 8($4)               # CHECK: sh  $2, 8($4)          # encoding: [0x38,0x44,0x00,0x08]
sw  $5, 4($6)               # CHECK: sw  $5, 4($6)          # encoding: [0xf8,0xa6,0x00,0x04]
sw $5, 123($sp)             # CHECK: sw $5, 123($sp)        # encoding: [0xf8,0xbd,0x00,0x7b]
lwu $2, 8($4)               # CHECK: lwu $2, 8($4)          # encoding: [0x60,0x44,0xe0,0x08]
lwl $4, 16($5)              # CHECK: lwl $4, 16($5)         # encoding: [0x60,0x85,0x00,0x10]
lwr $4, 16($5)              # CHECK: lwr $4, 16($5)         # encoding: [0x60,0x85,0x10,0x10]
swl $4, 16($5)              # CHECK: swl $4, 16($5)         # encoding: [0x60,0x85,0x80,0x10]
swr $4, 16($5)              # CHECK: swr $4, 16($5)         # encoding: [0x60,0x85,0x90,0x10]
movz $9, $6, $7             # CHECK: movz $9, $6, $7        # encoding: [0x00,0xe6,0x48,0x58]
movn $9, $6, $7             # CHECK: movn $9, $6, $7        # encoding: [0x00,0xe6,0x48,0x18]
movt $9, $6, $fcc0          # CHECK: movt $9, $6, $fcc0     # encoding: [0x55,0x26,0x09,0x7b]
movf $9, $6, $fcc0          # CHECK: movf $9, $6, $fcc0     # encoding: [0x55,0x26,0x01,0x7b]
# FIXME: MTHI should also have its 16 bit implementation selected in micromips
mthi   $6                   # CHECK: mthi   $6              # encoding: [0x00,0x06,0x2d,0x7c]
mfhi   $6                   # CHECK: mfhi   $6              # encoding: [0x46,0x06]
# FIXME: MTLO should also have its 16 bit implementation selected in micromips
mtlo   $6                   # CHECK: mtlo   $6              # encoding: [0x00,0x06,0x3d,0x7c]
mflo   $6                   # CHECK: mflo   $6              # encoding: [0x46,0x46]
madd   $4, $5               # CHECK: madd   $4, $5          # encoding: [0x00,0xa4,0xcb,0x3c]
maddu  $4, $5               # CHECK: maddu  $4, $5          # encoding: [0x00,0xa4,0xdb,0x3c]
msub   $4, $5               # CHECK: msub   $4, $5          # encoding: [0x00,0xa4,0xeb,0x3c]
msubu  $4, $5               # CHECK: msubu  $4, $5          # encoding: [0x00,0xa4,0xfb,0x3c]
clz $9, $6                  # CHECK: clz $9, $6             # encoding: [0x01,0x26,0x5b,0x3c]
clo $9, $6                  # CHECK: clo $9, $6             # encoding: [0x01,0x26,0x4b,0x3c]
seb $9, $6                  # CHECK: seb $9, $6             # encoding: [0x01,0x26,0x2b,0x3c]
seh $9, $6                  # CHECK: seh $9, $6             # encoding: [0x01,0x26,0x3b,0x3c]
wsbh $9, $6                 # CHECK: wsbh $9, $6            # encoding: [0x01,0x26,0x7b,0x3c]
ext $9, $6, 3, 7            # CHECK: ext $9, $6, 3, 7       # encoding: [0x01,0x26,0x30,0xec]
ins $9, $6, 3, 7            # CHECK: ins $9, $6, 3, 7       # encoding: [0x01,0x26,0x48,0xcc]
j 1328                      # CHECK: j 1328                 # encoding: [0xd4,0x00,0x02,0x98]
jal 1328                    # CHECK: jal 1328               # encoding: [0xf4,0x00,0x02,0x98]
jalr $ra, $6                # CHECK: jalr $ra, $6           # encoding: [0x03,0xe6,0x0f,0x3c]
jr $7                       # CHECK: jr $7                  # encoding: [0x00,0x07,0x0f,0x3c]
beq $9, $6, 1332            # CHECK: beq $9, $6, 1332       # encoding: [0x94,0xc9,0x02,0x9a]
bgez $6, 1332               # CHECK: bgez $6, 1332          # encoding: [0x40,0x46,0x02,0x9a]
bgezal $6, 1332             # CHECK: bgezal $6, 1332        # encoding: [0x40,0x66,0x02,0x9a]
bltzal $6, 1332             # CHECK: bltzal $6, 1332        # encoding: [0x40,0x26,0x02,0x9a]
bgtz $6, 1332               # CHECK: bgtz $6, 1332          # encoding: [0x40,0xc6,0x02,0x9a]
blez $6, 1332               # CHECK: blez $6, 1332          # encoding: [0x40,0x86,0x02,0x9a]
bne $9, $6, 1332            # CHECK: bne $9, $6, 1332       # encoding: [0xb4,0xc9,0x02,0x9a]
bltz $6, 1332               # CHECK: bltz $6, 1332          # encoding: [0x40,0x06,0x02,0x9a]
teq $8, $9                  # CHECK: teq $8, $9             # encoding: [0x01,0x28,0x00,0x3c]
tge $8, $9                  # CHECK: tge $8, $9             # encoding: [0x01,0x28,0x02,0x3c]
tgeu $8, $9                 # CHECK: tgeu $8, $9            # encoding: [0x01,0x28,0x04,0x3c]
tlt $8, $9                  # CHECK: tlt $8, $9             # encoding: [0x01,0x28,0x08,0x3c]
tltu $8, $9                 # CHECK: tltu $8, $9            # encoding: [0x01,0x28,0x0a,0x3c]
tne $8, $9                  # CHECK: tne $8, $9             # encoding: [0x01,0x28,0x0c,0x3c]
teqi $9, 17767              # CHECK: teqi $9, 17767         # encoding: [0x41,0xc9,0x45,0x67]
tgei $9, 17767              # CHECK: tgei $9, 17767         # encoding: [0x41,0x29,0x45,0x67]
tgeiu $9, 17767             # CHECK: tgeiu $9, 17767        # encoding: [0x41,0x69,0x45,0x67]
tlti $9, 17767              # CHECK: tlti $9, 17767         # encoding: [0x41,0x09,0x45,0x67]
tltiu $9, 17767             # CHECK: tltiu $9, 17767        # encoding: [0x41,0x49,0x45,0x67]
tnei $9, 17767              # CHECK: tnei $9, 17767         # encoding: [0x41,0x89,0x45,0x67]
cache 1, 8($5)              # CHECK: cache 1, 8($5)         # encoding: [0x20,0x25,0x60,0x08]
pref 1, 8($5)               # CHECK: pref 1, 8($5)          # encoding: [0x60,0x25,0x20,0x08]
ssnop                       # CHECK: ssnop                  # encoding: [0x00,0x00,0x08,0x00]
ehb                         # CHECK: ehb                    # encoding: [0x00,0x00,0x18,0x00]
pause                       # CHECK: pause                  # encoding: [0x00,0x00,0x28,0x00]
ll $2, 8($4)                # CHECK: ll $2, 8($4)           # encoding: [0x60,0x44,0x30,0x08]
sc $2, 8($4)                # CHECK: sc $2, 8($4)           # encoding: [0x60,0x44,0xb0,0x08]
lwxs $2, $3($4)             # CHECK: lwxs $2, $3($4)        # encoding: [0x00,0x64,0x11,0x18]
bgezals $6, 1332            # CHECK: bgezals $6, 1332       # encoding: [0x42,0x66,0x02,0x9a]
bltzals $6, 1332            # CHECK: bltzals $6, 1332       # encoding: [0x42,0x26,0x02,0x9a]
beqzc $9, 1332              # CHECK: beqzc $9, 1332         # encoding: [0x40,0xe9,0x02,0x9a]
bnezc $9, 1332              # CHECK: bnezc $9, 1332         # encoding: [0x40,0xa9,0x02,0x9a]
jals 1328                   # CHECK: jals 1328              # encoding: [0x74,0x00,0x02,0x98]
jalrs $ra, $6               # CHECK: jalrs $ra, $6          # encoding: [0x03,0xe6,0x4f,0x3c]
lwm32 $16, $17, 8($4)       # CHECK: lwm32 $16, $17, 8($4)  # encoding: [0x20,0x44,0x50,0x08]
lwm32 $16, $17, $18, $19, $20, $21, $22, $23, $fp, -1660($27)   # CHECK: lwm32 $16, $17, $18, $19, $20, $21, $22, $23, $fp, -1660($27)  # encoding: [0x21,0x3b,0x59,0x84]
swm32 $16, $17, 8($4)       # CHECK: swm32 $16, $17, 8($4)  # encoding: [0x20,0x44,0xd0,0x08]
swp $16, 8($4)              # CHECK: swp $16, 8($4)         # encoding: [0x22,0x04,0x90,0x08]
lwp $16, 8($4)              # CHECK: lwp $16, 8($4)         # encoding: [0x22,0x04,0x10,0x08]
nop                         # CHECK: nop                    # encoding: [0x00,0x00,0x00,0x00]
addiupc $2, 20              # CHECK: addiupc $2, 20         # encoding: [0x79,0x00,0x00,0x05]
addiupc $7, 16777212        # CHECK: addiupc $7, 16777212   # encoding: [0x7b,0xbf,0xff,0xff]
addiupc $7, -16777216       # CHECK: addiupc $7, -16777216  # encoding: [0x7b,0xc0,0x00,0x00]
ei                          # CHECK: ei                     # encoding: [0x00,0x00,0x57,0x7c]
ei $10                      # CHECK: ei $10                 # encoding: [0x00,0x0a,0x57,0x7c]
cachee 1, 8($5)             # CHECK: cachee 1, 8($5)        # encoding: [0x60,0x25,0xa6,0x08]
prefe 1, 8($5)              # CHECK: prefe 1, 8($5)         # encoding: [0x60,0x25,0xa4,0x08]
prefx 1, $3($5)             # CHECK: prefx 1, $3($5)        # encoding: [0x54,0x65,0x09,0xa0]
lhue $4, 8($2)              # CHECK: lhue $4, 8($2)         # encoding: [0x60,0x82,0x62,0x08]
lbe $4, 8($2)               # CHECK: lbe $4, 8($2)          # encoding: [0x60,0x82,0x68,0x08]
lbue $4, 8($2)              # CHECK: lbue $4, 8($2)         # encoding: [0x60,0x82,0x60,0x08]
lhe $4, 8($2)               # CHECK: lhe $4, 8($2)          # encoding: [0x60,0x82,0x6a,0x08]
lwe $4, 8($2)               # CHECK: lwe $4, 8($2)          # encoding: [0x60,0x82,0x6e,0x08]
sbe $5, 8($4)               # CHECK: sbe $5, 8($4)          # encoding: [0x60,0xa4,0xa8,0x08]
she $5, 8($4)               # CHECK: she $5, 8($4)          # encoding: [0x60,0xa4,0xaa,0x08]
swe $5, 8($4)               # CHECK: swe $5, 8($4)          # encoding: [0x60,0xa4,0xae,0x08]
swre $24, 5($3)             # CHECK: swre $24, 5($3)        # encoding: [0x63,0x03,0xa2,0x05]
swle $24, 5($3)             # CHECK: swle $24, 5($3)        # encoding: [0x63,0x03,0xa0,0x05]
lwre $24, 5($3)             # CHECK: lwre $24, 5($3)        # encoding: [0x63,0x03,0x66,0x05]
lwle $24, 2($4)             # CHECK: lwle $24, 2($4)        # encoding: [0x63,0x04,0x64,0x02]
lle $2, 8($4)               # CHECK: lle $2, 8($4)          # encoding: [0x60,0x44,0x6c,0x08]
sce $2, 8($4)               # CHECK: sce $2, 8($4)          # encoding: [0x60,0x44,0xac,0x08]
syscall                     # CHECK: syscall                # encoding: [0x00,0x00,0x8b,0x7c]
syscall 396                 # CHECK: syscall 396            # encoding: [0x01,0x8c,0x8b,0x7c]
# FIXME: ldc1 should accept uneven registers
# ldc1 $f7, 300($10)        # -CHECK: ldc1 $f7, 300($10)    # encoding: [0xbc,0xea,0x01,0x2c]
ldc1 $f8, 300($10)          # CHECK: ldc1 $f8, 300($10)     # encoding: [0xbd,0x0a,0x01,0x2c]
lwc1 $f2, 4($6)             # CHECK: lwc1 $f2, 4($6)        # encoding: [0x9c,0x46,0x00,0x04]
sdc1 $f2, 4($6)             # CHECK: sdc1 $f2, 4($6)        # encoding: [0xb8,0x46,0x00,0x04]
# FIXME: sdc1 should accept uneven registers
# sdc1 $f7, 64($10)         # -CHECK: sdc1 $f7, 64($10)     # encoding: [0xb8,0xea,0x00,0x40]
swc1 $f2, 4($6)             # CHECK: swc1 $f2, 4($6)        # encoding: [0x98,0x46,0x00,0x04]
cfc1 $1, $2                 # CHECK: cfc1 $1, $2            # encoding: [0x54,0x22,0x10,0x3b]
cfc2 $3, $4                 # CHECK: cfc2 $3, $4            # encoding: [0x00,0x64,0xcd,0x3c]
ctc1 $5, $6                 # CHECK: ctc1 $5, $6            # encoding: [0x54,0xa6,0x18,0x3b]
ctc2 $7, $8                 # CHECK: ctc2 $7, $8            # encoding: [0x00,0xe8,0xdd,0x3c]
recip.s $f2, $f4            # CHECK: recip.s $f2, $f4       # encoding: [0x54,0x44,0x12,0x3b]
recip.d $f2, $f4            # CHECK: recip.d $f2, $f4       # encoding: [0x54,0x44,0x52,0x3b]
rsqrt.s $f3, $f5            # CHECK: rsqrt.s $f3, $f5       # encoding: [0x54,0x65,0x02,0x3b]
rsqrt.d $f2, $f4            # CHECK: rsqrt.d $f2, $f4       # encoding: [0x54,0x44,0x42,0x3b]
