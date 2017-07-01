
all: clean
	$(MAKE) -C . build_v
	$(MAKE) -C . build_c
	$(MAKE) -C . run
	$(MAKE) -C . view


build_v:
	verilator -Wall --cc --trace counter.v --exe counter_tb.cpp


build_c:
	make -j -C obj_dir/ -f Vcounter.mk Vcounter

run:
	obj_dir/Vcounter

view:
	gtkwave counter.vcd counter.sav

clean:
	rm -rf obj_dir
	rm -f  counter.vcd

