AS = TASM\TASMX /m2
LN = TASM\TLINK
INCS = DATA.INC GLOBALS.INC SEGMENTS.INC VARS.INC

all: BUILD\SUPAPLEX.EXE

clean:
	@ DEL BUILD\SUPAPLEX.OBJ
	@ DEL BUILD\UTILS.OBJ
	@ DEL BUILD\SUPAPLEX.LST
	@ DEL BUILD\SUPAPLEX.MAP
	@ DEL BUILD\SUPAPLEX.EXE

check:
	@ TEST.BAT

# can't get to work:
# .ASM.OBJ:
# 	DEL $@
# 	DEL $*.LST
# 	echo $** $@ $*.LST

BUILD\SUPAPLEX.EXE: BUILD\SUPAPLEX.OBJ BUILD\UTILS.OBJ
	@ DEL $@
	$(LN) /v/m/s $**

BUILD\SUPAPLEX.OBJ: SUPAPLEX.ASM $(INCS)
	@ DEL $@
	@ DEL $*.LST
	$(AS) /m2 $&.ASM $@ $*.LST
BUILD\UTILS.OBJ: UTILS.ASM $(INCS)
	@ DEL $@
	@ DEL $*.LST
	$(AS) /m2 $&.ASM $@ $*.LST