#include <stdio.h>
#include "include/wren.h"
#include <string.h>

static void writeFn(WrenVM* vm, const char* text)
{
  printf("%s", text);
}

void errorFn(WrenVM* vm, WrenErrorType errorType,
             const char* module, const int line,
             const char* msg)
{
  switch (errorType)
  {
    case WREN_ERROR_COMPILE:
    {
      printf("\",{text:\"\033[91m[%s line %d] [Error] %s\033[0m\n\",color:red},\"", module, line, msg);
    } break;
    case WREN_ERROR_STACK_TRACE:
    {
      printf("\",{text:\"\033[91m[%s line %d] in %s\033[0m\n\",color:red},\"", module, line, msg);
    } break;
    case WREN_ERROR_RUNTIME:
    {
      printf("\",{text:\"\033[91m[Runtime Error] %s\033[0m\n\",color:red},\"", msg);
    } break;
  }
}

int main()
{
  char script[4096] = "";
  char line[256];
  char buffer[1024];

  FILE *fp = fopen("script.wren", "r");

  if (fp == NULL) {
    printf("Unable to open file.");
    return 1;
  }

  while (fgets(buffer, sizeof(buffer), fp)) {
    strcpy(line,buffer);
    strcat(script,line);
  }
  //line = buffer;

  //printf("Script:\033[96m\n\n");
  //printf(script);
  //printf("\n\n\033[0mOutput:\n\n");
  printf("[\"");
  fclose(fp);
  const char* module = "main";

  WrenConfiguration config;
  wrenInitConfiguration(&config);
    config.writeFn = &writeFn;
    config.errorFn = &errorFn;
  WrenVM* vm = wrenNewVM(&config);

  WrenInterpretResult result = wrenInterpret(vm, module, script);

  wrenFreeVM(vm);

  printf("\"]");
}
