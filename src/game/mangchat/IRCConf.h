#ifndef MC_CONFIG_H
#define MC_CONFIG_H

#include "Platform/CompilerDefs.h"

#if PLATFORM == PLATFORM_WINDOWS
  #define _MANGCHAT_CONFIG  "mangchat.conf"
#else
  #define _MANGCHAT_CONFIG  SYSCONFDIR"mangchat.conf"
#endif

#endif
