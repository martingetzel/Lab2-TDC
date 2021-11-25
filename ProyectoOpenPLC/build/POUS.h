#include "beremiz.h"
#ifndef __POUS_H
#define __POUS_H

#include "accessor.h"
#include "iec_std_lib.h"

__DECLARE_ENUMERATED_TYPE(LOGLEVEL,
  LOGLEVEL__CRITICAL,
  LOGLEVEL__WARNING,
  LOGLEVEL__INFO,
  LOGLEVEL__DEBUG
)
// FUNCTION_BLOCK LOGGER
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,MSG)
  __DECLARE_VAR(LOGLEVEL,LEVEL)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(BOOL,TRIG0)

} LOGGER;

void LOGGER_init__(LOGGER *data__, BOOL retain);
// Code part
void LOGGER_body__(LOGGER *data__);
// FUNCTION_BLOCK PYTHON_EVAL
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,CODE)
  __DECLARE_VAR(BOOL,ACK)
  __DECLARE_VAR(STRING,RESULT)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(DWORD,STATE)
  __DECLARE_VAR(STRING,BUFFER)
  __DECLARE_VAR(STRING,PREBUFFER)
  __DECLARE_VAR(BOOL,TRIGM1)
  __DECLARE_VAR(BOOL,TRIGGED)

} PYTHON_EVAL;

void PYTHON_EVAL_init__(PYTHON_EVAL *data__, BOOL retain);
// Code part
void PYTHON_EVAL_body__(PYTHON_EVAL *data__);
// FUNCTION_BLOCK PYTHON_POLL
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,CODE)
  __DECLARE_VAR(BOOL,ACK)
  __DECLARE_VAR(STRING,RESULT)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(DWORD,STATE)
  __DECLARE_VAR(STRING,BUFFER)
  __DECLARE_VAR(STRING,PREBUFFER)
  __DECLARE_VAR(BOOL,TRIGM1)
  __DECLARE_VAR(BOOL,TRIGGED)

} PYTHON_POLL;

void PYTHON_POLL_init__(PYTHON_POLL *data__, BOOL retain);
// Code part
void PYTHON_POLL_body__(PYTHON_POLL *data__);
// FUNCTION_BLOCK PYTHON_GEAR
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(UINT,N)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,CODE)
  __DECLARE_VAR(BOOL,ACK)
  __DECLARE_VAR(STRING,RESULT)

  // FB private variables - TEMP, private and located variables
  PYTHON_EVAL PY_EVAL;
  __DECLARE_VAR(UINT,COUNTER)
  __DECLARE_VAR(UINT,ADD10_OUT)
  __DECLARE_VAR(BOOL,EQ13_OUT)
  __DECLARE_VAR(UINT,SEL15_OUT)
  __DECLARE_VAR(BOOL,AND7_OUT)

} PYTHON_GEAR;

void PYTHON_GEAR_init__(PYTHON_GEAR *data__, BOOL retain);
// Code part
void PYTHON_GEAR_body__(PYTHON_GEAR *data__);
// PROGRAM PROGRAM0
// Data part
typedef struct {
  // PROGRAM Interface - IN, OUT, IN_OUT variables

  // PROGRAM private variables - TEMP, private and located variables
  __DECLARE_VAR(BOOL,ATEMPTYPALLET)
  __DECLARE_VAR(BOOL,ATLEFTENTRY)
  __DECLARE_VAR(BOOL,ATLEFTEXIT)
  __DECLARE_VAR(BOOL,ATPOPULATEDPALLET)
  __DECLARE_VAR(BOOL,ATRIGHTENTRY)
  __DECLARE_VAR(BOOL,ATRIGHTEXIT)
  __DECLARE_VAR(BOOL,ATSECONDCONVEYORENTRY)
  __DECLARE_VAR(BOOL,EMPTYPALLETSENSOR)
  __DECLARE_VAR(BOOL,FIRSTTRANSFERLOADED)
  __DECLARE_VAR(BOOL,HIGHSENSOR)
  __DECLARE_VAR(BOOL,LOWSENSOR)
  __DECLARE_VAR(BOOL,PALLETSENSOR)
  __DECLARE_VAR(BOOL,POPULATEDPALLETSENSOR)
  __DECLARE_VAR(BOOL,SECONDTRANSFERLOADED)
  __DECLARE_VAR(BOOL,THIRDTRANSFERLOADED)
  __DECLARE_VAR(BOOL,CONVEYORLEFT)
  __DECLARE_VAR(BOOL,CONVEYORRIGHT)
  __DECLARE_VAR(BOOL,FIRSTCONVEYOR)
  __DECLARE_VAR(BOOL,LOADFIRSTTRANSFER)
  __DECLARE_VAR(BOOL,LOADSECONDTRANSFER)
  __DECLARE_VAR(BOOL,LOADTHIRDTRANSFER)
  __DECLARE_VAR(BOOL,REMOVEREMPTYPALLET)
  __DECLARE_VAR(BOOL,REMOVERLARGEPACKAGE)
  __DECLARE_VAR(BOOL,REMOVERSMALLPACKAGE)
  __DECLARE_VAR(BOOL,SECONDCONVEYOR)
  __DECLARE_VAR(BOOL,TRANSEMPTYPALLET)
  __DECLARE_VAR(BOOL,TRANSPOPULATEDPALLET)
  __DECLARE_VAR(BOOL,TRANSTOSECONDCONVEYOR)
  __DECLARE_VAR(BOOL,TRANSFLEFT)
  __DECLARE_VAR(BOOL,TRANSFRIGHT)
  RS POPULATEDPALLET;
  TOF TOF0;
  TOF TOF1;
  RS HIGH;
  TOF TOF2;
  TOF TOF3;
  RS RS0;
  TOF TOF4;
  __DECLARE_VAR(BOOL,NOT27_OUT)
  __DECLARE_VAR(BOOL,AND75_OUT)
  __DECLARE_VAR(BOOL,AND74_OUT)
  __DECLARE_VAR(BOOL,NOT2_OUT)
  __DECLARE_VAR(BOOL,AND46_OUT)
  __DECLARE_VAR(BOOL,NOT57_OUT)
  __DECLARE_VAR(BOOL,AND55_OUT)
  __DECLARE_VAR(BOOL,OR56_OUT)
  __DECLARE_VAR(BOOL,AND6_OUT)
  __DECLARE_VAR(BOOL,AND5_OUT)
  __DECLARE_VAR(BOOL,NOT3_OUT)
  __DECLARE_VAR(BOOL,OR4_OUT)
  __DECLARE_VAR(BOOL,NOT68_OUT)
  __DECLARE_VAR(BOOL,NOT13_OUT)
  __DECLARE_VAR(BOOL,AND8_OUT)
  __DECLARE_VAR(BOOL,NOT9_OUT)
  __DECLARE_VAR(BOOL,AND82_OUT)
  __DECLARE_VAR(BOOL,OR83_OUT)
  __DECLARE_VAR(BOOL,NOT14_OUT)

} PROGRAM0;

void PROGRAM0_init__(PROGRAM0 *data__, BOOL retain);
// Code part
void PROGRAM0_body__(PROGRAM0 *data__);
#endif //__POUS_H
