load --os $HOME/myexpos/spl/spl_progs/os_startup.xsm
load --library $HOME/myexpos/expl/library.lib
load --int=timer $HOME/myexpos/spl/spl_progs/sample_timer.xsm
load --int=console $HOME/myexpos/spl/samples/console_intr.xsm 
load --int=disk ../spl/samples/disk_intr.xsm
load --int=4 ../spl/spl_progs/int4_st23.xsm
load --int=5 ../spl/spl_progs/int5_st24.xsm
load --int=6 $HOME/myexpos/spl/spl_progs/int6_st24.xsm
load --int=7 $HOME/myexpos/spl/spl_progs/sample_int7.xsm
load --int=8 ../spl/spl_progs/int8_st24.xsm
load --int=9 ../spl/spl_progs/int9_st19.xsm
load --int=10 $HOME/myexpos/spl/spl_progs/haltprog.xsm
load --int=11 ../spl/spl_progs/st24_test/int11_st21_test.xsm
load --int=13 ../spl/spl_progs/int13_st22.xsm
load --int=14 ../spl/spl_progs/int14_st22.xsm
load --int=15 ../spl/spl_progs/int15_st23.xsm
load --exhandler $HOME/myexpos/spl/spl_progs/exhandler.xsm
load --idle $HOME/myexpos/expl/expl_progs/sample_idle.xsm
load --module 0 $HOME/myexpos/spl/spl_progs/mod0_st24.xsm
load --module 1 ../spl/spl_progs/st24_test/mod1_st24_test.xsm
load --module 2 ../spl/spl_progs/mod2_st19.xsm
load --module 3 ../spl/spl_progs/mod3_st24.xsm
load --module 4 $HOME/myexpos/spl/spl_progs/mod4_st23.xsm
load --module 5 $HOME/myexpos/spl/samples/context_switch.xsm
load --module 7 $HOME/myexpos/spl/spl_progs/boot_module_st24.xsm
load --init ../expl/samples/forkprog.xsm
load --exec ../expl/samples/evennums.xsm
load --exec ../expl/samples/oddnums.xsm
load --exec ../expl/samples/rw.xsm
load --exec ../expl/samples/create.xsm
load --exec ../expl/samples/delete.xsm
load --exec ../expl/samples/st24_assign/rf.xsm
load --data ../expl/samples/st24_assign/numbers.dat
load --data ../expl/samples/st24_assign/sample.dat
