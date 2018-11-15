# TODO - fix these up
set(KernelPlatform "rpi3" CACHE STRING "")
set(KernelARMPlatform "rpi3" CACHE STRING "")
set(KernelArch "arm" CACHE STRING "")
set(KernelArmSel4Arch "aarch64" CACHE STRING "")
#set(KernelIPCBufferLocation "threadID_register" CACHE STRING "")
set(KernelOptimisation "-O2" CACHE STRING "")
set(KernelBenchmarks "none" CACHE STRING "")
set(KernelDangerousCodeInjection OFF CACHE BOOL "")
set(KernelFastpath ON CACHE BOOL "")
set(KernelPrinting ON CACHE BOOL "" FORCE)
set(ElfloaderImage "elf" CACHE STRING "")

set(KernelVerificationBuild OFF CACHE BOOL "" FORCE)

#set(KernelMaxNumNodes "4" CACHE STRING "")
set(KernelNumDomains 1 CACHE STRING "")
#set(KernelMaxNumBootinfoUntypedCap 200 CACHE STRING "")
#set(KernelRetypeFanOutLimit "256" CACHE STRING "")
