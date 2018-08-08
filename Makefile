CXX := g++
CXXFLAGS := -Wall -Wextra -pedantic -std=c++17 -I lib/ -I src/
LDFLAGS := libglfw3.a glad.a -lGL -lm -ldl -lXinerama -lXrandr -lXi -lXcursor -lX11 -lXxf86vm -lpthread 

debug : CXXFLAGS += -g -Werror
all : CXXFLAGS += -Werror

src := $(shell find src/ lib/ -type f -name "*.cc")
obj := $(src:%.cc=%.o)
bin := main

all: $(obj)
	$(CXX) $(fls) $^ $(LDFLAGS) -o $(bin)

warn: $(obj)
	$(CXX) $(fls) $^ $(LDFLAGS) -o $(bin)

debug: $(obj)
	$(CXX) $(fls) $^ $(LDFLAGS) -o $(bin)

clean:
	$(RM) $(obj) $(bin)

.PHONY: all debug clean
