#modify this to be your seiral port
ifeq (${shell uname} , Darwin)
USERPORT := `ls /dev/tty.usbserial*`
else
USERPORT := `ls
endif
# modifty this to include the asm file you want to proram
SRC := 7

AS := tools/bin/rasm
PROG := tools/bin/prog8051

${SRC}.obj: ${SRC}.asm
	${AS} ${SRC}.asm
all: ${SRC}.obj

clean:
	rm ${SRC}.lst
	rm ${SRC}.err
	rm ${SRC}.obj

program: all
	${PROG}  ${SRC}.obj --serial-port ${USERPORT}

