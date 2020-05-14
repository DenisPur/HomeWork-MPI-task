FLAGS = -Wall -O2 
TM = task
CM = const

main: main.f90 $(TM).o $(CM).o
	gfortran $^ $(FLAGS) -o $@

$(TM).o: $(TM).f90 $(CM).o
	gfortran $^ $(FLAGS) -c
$(CM).o: $(CM).f90
	gfortran $^ $(FLAGS) -c

clear:
	rm -f *.o *.mod
