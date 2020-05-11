CC = g++
CCFLAGS = -g -Wall
LDFLAGS =
SOURCES = $(wildcard *.cpp)
OBJECTS = $(SOURCES:.cpp=.o)
TARGET = a.out

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) -o $@ $^ $(LDFLAGS) 

%.o: %.cpp %.h
	$(CC) $(CCFLAGS) -c $<

%.o: %.cpp
	$(CC) $(CCFLAGS) -c $<

clean:
	/bin/rm -f *.o $(TARGET)
