load --os $HOME/myexpos/spl/spl_progs/os_startup.xsm
load --library $HOME/myexpos/expl/library.lib
load --int=timer $HOME/myexpos/spl/spl_progs/sample_timer.xsm
load --int=console $HOME/myexpos/spl/samples/console_intr.xsm 
load --int=6 $HOME/myexpos/spl/spl_progs/int6.xsm
load --int=7 $HOME/myexpos/spl/spl_progs/sample_int7.xsm
load --int=9 ../spl/spl_progs/int9_st17.xsm
load --int=10 $HOME/myexpos/spl/spl_progs/haltprog.xsm
load --exhandler $HOME/myexpos/spl/spl_progs/haltprog.xsm
load --idle $HOME/myexpos/expl/expl_progs/sample_idle.xsm
load --module 0 $HOME/myexpos/spl/spl_progs/mod0.xsm
load --module 1 ../spl/spl_progs/mod1_st17.xsm
load --module 2 ../spl/spl_progs/mod2_st17.xsm
load --module 4 $HOME/myexpos/spl/samples/dmm.xsm
load --module 5 $HOME/myexpos/spl/samples/context_switch.xsm
load --module 7 $HOME/myexpos/spl/spl_progs/boot_module_st17_assign.xsm
load --init ../expl/expl_progs/st17_assign.xsm
load --exec ../expl/samples/ou100.xsm
