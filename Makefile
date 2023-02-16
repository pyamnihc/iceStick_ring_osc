ring_osc.bin: ring_osc.txt
	icepack ring_osc.txt ring_osc.bin

ring_osc.txt: ring_osc.blif icestick.pcf
	arachne-pnr -d 1k -o ring_osc.txt -p icestick.pcf ring_osc.blif

ring_osc.blif: ring_osc.v ring_osc_top.v
	yosys -p 'synth_ice40 -blif ring_osc.blif' ring_osc_top.v ring_osc.v

prog: ring_osc.bin
	iceprog ring_osc.bin
	
clean:
	rm -fv ring_osc.bin ring_osc.txt ring_osc.blif

