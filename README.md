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

## 🚀 Getting Started

### Prerequisites

- **XSM Simulator**: Download from [XSM Official Site](http://exposnitc.github.io/)
- **SPL Compiler**: For compiling OS modules (System Programmer's Language)
- **ExpL Compiler**: For compiling user programs (Experimental Language)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/expos-project.git
cd expos-project
```

2. Compile OS modules:
```bash
# Compile OS startup
spl os_startup_final.spl

# Compile boot module
spl boot_module.spl

# Compile timer interrupt handler
spl sample_timer.spl

# Compile context switch module
spl context_switch.spl

# Compile exit system call handler
spl haltprog.spl
```

3. Compile user programs:
```bash
# Compile idle program
expl sample_idle.expl

# User programs (already in XSM format)
# even100.xsm and odd_under_100.xsm
```

4. Load into XSM disk:
```bash
# Load OS modules
load --os os_startup_final.xsm
load --module 7 boot_module.xsm
load --int=timer sample_timer.xsm
load --int=10 haltprog.xsm
load --module 5 context_switch.xsm

# Load user programs
load --exec idle.xsm
load --exec even100.xsm
load --exec odd_under_100.xsm
```

5. Run the OS:
```bash
xsm --timer 20
```

## 📁 Project Structure

```
expos-project/
│
├── README.md
├── LICENSE
│
├── kernel/                      # OS Kernel Code (SPL)
│   ├── os_startup_final.spl    # OS initialization
│   ├── boot_module.spl         # Process initialization
│   ├── sample_timer.spl        # Timer interrupt handler
│   ├── context_switch.spl      # Scheduler implementation
│   └── haltprog.spl            # Exit system call
│
├── user/                        # User Programs (ExpL/XSM)
│   ├── sample_idle.expl        # Idle process
│   ├── even100.xsm             # Prints even numbers
│   └── odd_under_100.xsm       # Prints odd numbers
│
├── compiled/                    # Compiled XSM binaries
│   ├── os_startup_final.xsm
│   ├── boot_module.xsm
│   ├── sample_timer.xsm
│   ├── context_switch.xsm
│   ├── haltprog.xsm
│   └── sample_idle.xsm
│
└── docs/                        # Documentation
    ├── ARCHITECTURE.md
    ├── MEMORY_LAYOUT.md
    └── DEVELOPMENT_LOG.md
```

## 🔧 Key Components Explained

### 1. OS Startup (`os_startup_final.spl`)
- Loads interrupt handlers and modules into memory
- Initializes the idle process (PID 0)
- Sets up page tables for the idle process
- Calls the boot module to create user processes
- Transfers control to user mode

### 2. Boot Module (`boot_module.spl`)
- Loads user programs from disk into memory
- Creates process table entries for each process
- Initializes page tables for user processes
- Sets up initial stack pointers and instruction pointers
- Marks processes as CREATED state

### 3. Timer Interrupt Handler (`sample_timer.spl`)
- Triggered periodically by hardware timer
- Saves current process state
- Updates process tick counters
- Invokes the scheduler for context switching
- Restores new process state

### 4. Context Switch Module (`context_switch.spl`)
- Implements round-robin scheduling algorithm
- Saves current process context (SP, PTBR, PTLR, BP)
- Selects next READY or CREATED process
- Loads new process context
- Handles first-time process execution (CREATED → RUNNING)

### 5. Exit System Call (`haltprog.spl`)
- Handles INT 10 (process termination)
- Marks process as TERMINATED
- Checks if all processes are terminated
- Halts system if all done, otherwise schedules next process

## 🎓 Learning Outcomes

This project demonstrates understanding of:

- **Process Lifecycle**: Creation, scheduling, execution, and termination
- **Context Switching**: Complete state preservation and restoration
- **Interrupt Handling**: Both hardware (timer) and software (system calls)
- **Memory Management**: Paging, virtual memory, and address translation
- **Privilege Separation**: Kernel mode vs. user mode execution
- **Concurrency**: Multiple processes sharing CPU time

## 🐛 Known Limitations

- No file system implementation (uses predefined disk blocks)
- Limited to 16 processes (PIDs 0-15)
- Single-core execution (no multiprocessing)
- No dynamic process creation (fork/exec not implemented)
- Basic round-robin scheduling (no priority levels)

## 🔮 Future Enhancements

- [ ] Implement Fork and Exec system calls
- [ ] Add file system support (Create, Open, Read, Write, Close)
- [ ] Implement inter-process communication (pipes, semaphores)
- [ ] Add memory protection and page fault handling
- [ ] Implement priority-based scheduling
- [ ] Add support for more system calls (Read, Write, etc.)
- [ ] Implement copy-on-write for fork optimization

## 📚 Resources

- [expOS Official Documentation](http://exposnitc.github.io/)
- [XSM Architecture Specification](http://exposnitc.github.io/arch_spec.html)
- [SPL Language Specification](http://exposnitc.github.io/spl.html)
- [ExpL Language Specification](http://exposnitc.github.io/expl.html)

## 🤝 Contributing

This is an educational project. Contributions, suggestions, and improvements are welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Create a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com

## 🙏 Acknowledgments

- NIT Calicut for the expOS project and XSM architecture
- Dr. K. Muralikrishnan and the expOS development team
- Operating Systems course instructors and teaching assistants

## 📊 Project Status

**Current Stage**: Stage 6-7 - Preemptive Multitasking with Round-Robin Scheduling

**Completed**:
- ✅ Basic bootstrapping and OS startup
- ✅ Timer interrupt handling
- ✅ Round-robin process scheduling
- ✅ Context switching mechanism
- ✅ Exit system call
- ✅ Multiple concurrent processes

**In Progress**:
- 🔄 Additional system calls
- 🔄 Enhanced memory management

---

*Built with ❤️ for learning operating systems from the ground up*
