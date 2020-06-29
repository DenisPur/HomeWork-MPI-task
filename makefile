FLAGS = -O2
COMPILER = mpiifort

TM = task
CM = const

main: main.f90 $(TM).o $(CM).o
	$(COMPILER) $^ $(FLAGS) -o $@

$(TM).o: $(TM).f90 $(CM).o
	$(COMPILER) $^ $(FLAGS) -c
$(CM).o: $(CM).f90
	$(COMPILER) $^ $(FLAGS) -c

clear:
	rm -f *.o *.mod
