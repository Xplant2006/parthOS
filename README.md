# expOS - Experimental Operating System

A minimal, educational operating system built from scratch for the XSM (eXperimental String Machine) architecture. This project implements core OS concepts including process scheduling, memory management, interrupt handling, and system calls.

## 🎯 Project Overview

expOS is a teaching operating system designed to help understand fundamental OS concepts through hands-on implementation. This implementation covers the essential stages of OS development, from basic bootstrapping to preemptive multitasking with round-robin scheduling.

## ✨ Features

### Core Functionality
- **Preemptive Multitasking**: Round-robin scheduler with timer-based context switching
- **Process Management**: Support for multiple concurrent user processes
- **Memory Management**: Paged memory with separate page tables per process
- **Interrupt Handling**: Hardware timer interrupts and software interrupts (system calls)
- **System Calls**: Exit system call (INT 10) for process termination
- **Privilege Levels**: Separation between kernel mode and user mode execution

### Technical Implementation
- **Boot Module**: Dynamic process initialization and loading
- **Context Switching**: Complete register state preservation and restoration
- **Kernel Stack Management**: Per-process kernel stacks for interrupt handling
- **Page Table Management**: Virtual memory support with configurable page tables
- **Process States**: READY, RUNNING, CREATED, and TERMINATED state management

## 🏗️ Architecture

### System Components

```
┌─────────────────────────────────────────────────────────────┐
│                      User Programs                           │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │ even100.xsm  │  │odd_under_100 │  │  idle.xsm    │      │
│  └──────────────┘  └──────────────┘  └──────────────┘      │
└─────────────────────────────────────────────────────────────┘
                          ↕ System Calls (INT)
┌─────────────────────────────────────────────────────────────┐
│                    Operating System Kernel                   │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │    Timer     │  │   Scheduler  │  │  Exit (INT10)│      │
│  │   Interrupt  │  │   (Context   │  │  System Call │      │
│  │              │  │    Switch)   │  │              │      │
│  └──────────────┘  └──────────────┘  └──────────────┘      │
│  ┌──────────────┐  ┌──────────────┐                        │
│  │ Boot Module  │  │  OS Startup  │                        │
│  └──────────────┘  └──────────────┘                        │
└─────────────────────────────────────────────────────────────┘
                          ↕
┌─────────────────────────────────────────────────────────────┐
│              XSM Machine (Simulated Hardware)                │
│         Timer Chip | Memory | Registers | Disk              │
└─────────────────────────────────────────────────────────────┘
```

### Memory Layout

```
Memory Pages:
├── Pages 0-1    : ROM (Exception Handler)
├── Pages 2-3    : Page for swap-in and swap-out
├── Pages 4-5    : Timer Interrupt Handler
├── Pages 13-14  : Library Code
├── Pages 15-16  : INT 10 Handler (Exit System Call)
├── Pages 22-23  : Exception Handler
├── Pages 25-26  : Context Switch Module
├── Pages 54-55  : Boot Module
├── Pages 63-64  : Shared Library
├── Pages 65-66  : Odd Program Code
├── Pages 67-68  : Idle Program Code
├── Pages 69-70  : Even Program Code
├── Pages 76-87  : Process Stack and Heap Pages
└── Pages 88+    : User Area Pages (Kernel Stacks)
```

## 📚 Resources

- [expOS Official Documentation](http://exposnitc.github.io/)
- [XSM Architecture Specification](http://exposnitc.github.io/arch_spec.html)
- [SPL Language Specification](http://exposnitc.github.io/spl.html)
- [ExpL Language Specification](http://exposnitc.github.io/expl.html)

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

*Built with ❤️ for learning operating systems from the ground up*
