# See LICENSE.txt for license details.


# The build fails with -std=c++11
# CXX_FLAGS = -std=c++11 -O3 -Wall

# Compile takes too long with
# CXX_FLAGS = -O3 -Wall

# So, give no flags
CXX_FLAGS = -Wall


KERNELS = bc bfs cc cc_sv pr pr_spmv sssp tc
SUITE = $(KERNELS) converter

.PHONY: all
all: $(SUITE)

% : src/%.cc src/*.h
	$(CXX) $(CXX_FLAGS) $< -o $@

# Testing
include test/test.mk

# Benchmark Automation
include benchmark/bench.mk


.PHONY: clean
clean:
	rm -f $(SUITE) test/out/*
