DIR=~/tmp/canis/nt98336/configs/Linux/cfg_98336_RC_8GX2_8GX2_EP_8GX2_8GX2_STANDARD_PCI_NAND_DVR_SYS_XNPM32

for var in `find . -maxdepth 1 -type f`; do
	FILE=`basename ${var}`
	diff -q ${FILE} ${DIR}/${FILE}
done
