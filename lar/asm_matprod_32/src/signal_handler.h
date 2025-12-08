#ifndef SIGNAL_HANDLER_H
#define SIGNAL_HANDLER_H

#include <iostream>
#include <stdexcept>
#include <fenv.h>
#include <signal.h>
#include <errno.h>
#include <err.h>
using namespace std;

class SignalHandler {
public:
	SignalHandler();
};

#endif


