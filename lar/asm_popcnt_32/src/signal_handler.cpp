#include "signal_handler.h"

// ==================================================================
// SIGNAL HANDLER
// intercepts errors and report them to stderr/cerr
// ==================================================================

void posix_signal_handler(int sig, siginfo_t *siginfo, void *context) {
	switch(sig) {
		case SIGSEGV: 
        	cerr << "error SIGSEGV: Segmentation Fault\n";	break;
		case SIGINT:
			cerr << "error SIGINT: Interactive attention signal, (usually ctrl+c)\n"; break;
		case SIGFPE:
			switch(siginfo->si_code) {
				case FPE_INTDIV:
					cerr << "error SIGFPE: integer divide by zero\n"; break;
				case FPE_INTOVF: 
					cerr << "error SIGFPE: integer overflow\n"; break;
				case FPE_FLTDIV:
					cerr << "error SIGFPE: floating-point divide by zero\n"; break;
				case FPE_FLTOVF:
					cerr << "error SIGFPE: floating-point overflow\n"; break;
				case FPE_FLTUND:
					cerr << "error SIGFPE: floating-point underflow\n"; break;
				case FPE_FLTRES:
					cerr << "error SIGFPE: floating-point inexact result\n"; break;
				case FPE_FLTINV:
					cerr << "error SIGFPE: floating-point invalid operation\n"; break;
				case FPE_FLTSUB:
					cerr << "error SIGFPE: subscript out of range\n"; break;
				default:
					cerr << "error SIGFPE: Arithmetic Exception\n"; break;
			}
			break;
		case SIGILL:
			switch(siginfo->si_code) {
				case ILL_ILLOPC:
					cerr << "error SIGILL: illegal opcode\n"; break;
				case ILL_ILLOPN:
					cerr << "error SIGILL: illegal operand\n"; break;
				case ILL_ILLADR:
					cerr << "error SIGILL: illegal addressing mode\n"; break;
				case ILL_ILLTRP:
					cerr << "error SIGILL: illegal trap\n"; break;
				case ILL_PRVOPC:
					cerr << "error SIGILL: privileged opcode\n"; break;
				case ILL_PRVREG:
					cerr << "error SIGILL: privileged register\n"; break;
				case ILL_COPROC:
					cerr << "error SIGILL: coprocessor error\n"; break;
				case ILL_BADSTK:
					cerr << "error SIGILL: internal stack error\n"; break;
				default:
					cerr << "error SIGILL: Illegal Instruction\n"; break;
			}
			break;
		case SIGTERM:
			cerr << "error SIGTERM: a termination request was sent to the program\n"; break;
		case SIGABRT:
			cerr << "error SIGABRT: usually caused by an abort() or assert()\n"; break;
      	default:
        	break;
	}
	
    exit(EXIT_FAILURE);
}
 
void set_signal_handler() {
	struct sigaction sig_action = {};
	sig_action.sa_sigaction = posix_signal_handler;
	sigemptyset(&sig_action.sa_mask);
	sig_action.sa_flags = SA_SIGINFO | SA_ONSTACK;

	if (sigaction(SIGSEGV, &sig_action, NULL) != 0) { err(1, "sigaction"); }
	if (sigaction(SIGFPE,  &sig_action, NULL) != 0) { err(1, "sigaction"); }
	if (sigaction(SIGINT,  &sig_action, NULL) != 0) { err(1, "sigaction"); }
	if (sigaction(SIGILL,  &sig_action, NULL) != 0) { err(1, "sigaction"); }
	if (sigaction(SIGTERM, &sig_action, NULL) != 0) { err(1, "sigaction"); }
	if (sigaction(SIGABRT, &sig_action, NULL) != 0) { err(1, "sigaction"); }
}



SignalHandler::SignalHandler() {
	set_signal_handler();
	// for floating point operations use this
	feenableexcept(FE_DIVBYZERO | FE_INVALID);
}

