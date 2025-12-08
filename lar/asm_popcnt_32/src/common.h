#ifndef COMMON_H
#define COMMON_H

#include <stdint.h>
#include <iostream>
using namespace std;

// ------------------------------------
// definition of types
// ------------------------------------
typedef uint8_t u8;
typedef int32_t i32;
typedef uint32_t u32;
typedef uint64_t u64;
typedef float f32;

// ------------------------------------
// definition of method
// ------------------------------------
typedef u32 (*Method)(u8 *x, u32 size);

// ------------------------------------
// type for method declaration 
// ------------------------------------
typedef struct _MethodDeclaration {
	Method method;
	const char *name;
} MethodDeclaration;

// ------------------------------------
// macro instruction to declare method
// ------------------------------------
#define add_method(x) { x, #x }

// ------------------------------------
// macro instruction for getopt
// ------------------------------------
#define OPTION_ARG(x,y) { x, required_argument, 0, y}
#define OPTION_NO_ARG(x,y) { x, no_argument, 0, y}


#endif
