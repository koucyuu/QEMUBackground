#include <dlfcn.h>

#import "dobby_override.h"

%config(generator=MobileSubstrate)

%hookf(OSStatus, SetFrontProcessWithOptions, const ProcessSerialNumber *inProcess, OptionBits inOptions){
    return 0;
} //SetFrontProcessWithOptions

%ctor{
    void *HIServices = dlopen("/System/Library/Frameworks/ApplicationServices.framework/Frameworks/HIServices.framework/HIServices", RTLD_NOLOAD);
    void *SetFrontProcessWithOptions = dlsym(HIServices, "SetFrontProcessWithOptions");
    %init(SetFrontProcessWithOptions = SetFrontProcessWithOptions);
}
