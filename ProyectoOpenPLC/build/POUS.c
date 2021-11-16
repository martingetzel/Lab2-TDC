void LOGGER_init__(LOGGER *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MSG,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->LEVEL,LOGLEVEL__INFO,retain)
  __INIT_VAR(data__->TRIG0,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void LOGGER_body__(LOGGER *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  if ((__GET_VAR(data__->TRIG,) && !(__GET_VAR(data__->TRIG0,)))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  
    #undef GetFbVar
    #undef SetFbVar
;
  };
  __SET_VAR(data__->,TRIG0,,__GET_VAR(data__->TRIG,));

  goto __end;

__end:
  return;
} // LOGGER_body__() 





void PYTHON_EVAL_init__(PYTHON_EVAL *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->STATE,0,retain)
  __INIT_VAR(data__->BUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->PREBUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->TRIGM1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRIGGED,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_EVAL_body__(PYTHON_EVAL *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __IL_DEFVAR_T __IL_DEFVAR;
  __IL_DEFVAR_T __IL_DEFVAR_BACK;
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(0, data__);
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // PYTHON_EVAL_body__() 





void PYTHON_POLL_init__(PYTHON_POLL *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->STATE,0,retain)
  __INIT_VAR(data__->BUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->PREBUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->TRIGM1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRIGGED,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_POLL_body__(PYTHON_POLL *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __IL_DEFVAR_T __IL_DEFVAR;
  __IL_DEFVAR_T __IL_DEFVAR_BACK;
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(1,(PYTHON_EVAL*)(void*)data__);
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // PYTHON_POLL_body__() 





void PYTHON_GEAR_init__(PYTHON_GEAR *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->N,0,retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  PYTHON_EVAL_init__(&data__->PY_EVAL,retain);
  __INIT_VAR(data__->COUNTER,0,retain)
  __INIT_VAR(data__->ADD10_OUT,0,retain)
  __INIT_VAR(data__->EQ13_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SEL15_OUT,0,retain)
  __INIT_VAR(data__->AND7_OUT,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_GEAR_body__(PYTHON_GEAR *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __SET_VAR(data__->,ADD10_OUT,,ADD__UINT__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->COUNTER,),
    (UINT)1));
  __SET_VAR(data__->,EQ13_OUT,,EQ__BOOL__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->N,),
    (UINT)__GET_VAR(data__->ADD10_OUT,)));
  __SET_VAR(data__->,SEL15_OUT,,SEL__UINT__BOOL__UINT__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (BOOL)__GET_VAR(data__->EQ13_OUT,),
    (UINT)__GET_VAR(data__->ADD10_OUT,),
    (UINT)0));
  __SET_VAR(data__->,COUNTER,,__GET_VAR(data__->SEL15_OUT,));
  __SET_VAR(data__->,AND7_OUT,,AND__BOOL__BOOL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (BOOL)__GET_VAR(data__->EQ13_OUT,),
    (BOOL)__GET_VAR(data__->TRIG,)));
  __SET_VAR(data__->PY_EVAL.,TRIG,,__GET_VAR(data__->AND7_OUT,));
  __SET_VAR(data__->PY_EVAL.,CODE,,__GET_VAR(data__->CODE,));
  PYTHON_EVAL_body__(&data__->PY_EVAL);
  __SET_VAR(data__->,ACK,,__GET_VAR(data__->PY_EVAL.ACK,));
  __SET_VAR(data__->,RESULT,,__GET_VAR(data__->PY_EVAL.RESULT,));

  goto __end;

__end:
  return;
} // PYTHON_GEAR_body__() 





void PROGRAM0_init__(PROGRAM0 *data__, BOOL retain) {
  __INIT_VAR(data__->ATEMPTYPALLET,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ATLEFTENTRY,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ATLEFTEXIT,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ATPOPULATEDPALLET,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ATRIGHTENTRY,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ATRIGHTEXIT,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ATSECONDCONVEYORENTRY,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->EMPTYPALLETSENSOR,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->FIRSTTRANSFERLOADED,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->HIGHSENSOR,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->LOWSENSOR,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->PALLETSENSOR,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->POPULATEDPALLETSENSOR,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->SECONDTRANSFERLOADED,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->THIRDTRANSFERLOADED,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->CONVEYORLEFT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CONVEYORRIGHT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->FIRSTCONVEYOR,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->LOADFIRSTTRANSFER,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LOADSECONDTRANSFER,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LOADTHIRDTRANSFER,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->REMOVEREMPTYPALLET,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->REMOVERLARGEPACKAGE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->REMOVERSMALLPACKAGE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SECONDCONVEYOR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRANSEMPTYPALLET,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRANSPOPULATEDPALLET,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRANSTOSECONDCONVEYOR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRANSFLEFT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRANSFRIGHT,__BOOL_LITERAL(FALSE),retain)
  TOF_init__(&data__->TOF0,retain);
  TOF_init__(&data__->TOF1,retain);
  TON_init__(&data__->TON0,retain);
  __INIT_VAR(data__->NOT27_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->NOT29_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->NOT38_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->AND37_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->AND40_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->AND4_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->NOT42_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->AND5_OUT,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PROGRAM0_body__(PROGRAM0 *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->,NOT27_OUT,,!(__GET_VAR(data__->FIRSTTRANSFERLOADED,)));
  __SET_VAR(data__->,LOADFIRSTTRANSFER,,__GET_VAR(data__->NOT27_OUT,));
  __SET_VAR(data__->,NOT29_OUT,,!(__GET_VAR(data__->FIRSTTRANSFERLOADED,)));
  __SET_VAR(data__->,FIRSTCONVEYOR,,__GET_VAR(data__->NOT29_OUT,));
  __SET_VAR(data__->TON0.,IN,,__GET_VAR(data__->EMPTYPALLETSENSOR,));
  __SET_VAR(data__->TON0.,PT,,__time_to_timespec(1, 500, 0, 0, 0, 0));
  TON_body__(&data__->TON0);
  __SET_VAR(data__->,NOT38_OUT,,!(__GET_VAR(data__->POPULATEDPALLETSENSOR,)));
  __SET_VAR(data__->,AND37_OUT,,AND__BOOL__BOOL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (BOOL)__GET_VAR(data__->TON0.Q,),
    (BOOL)__GET_VAR(data__->NOT38_OUT,)));
  __SET_VAR(data__->TOF0.,IN,,__GET_VAR(data__->AND37_OUT,));
  __SET_VAR(data__->TOF0.,PT,,__time_to_timespec(1, 2500, 0, 0, 0, 0));
  TOF_body__(&data__->TOF0);
  __SET_VAR(data__->,AND40_OUT,,AND__BOOL__BOOL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (BOOL)__GET_VAR(data__->TOF0.Q,),
    (BOOL)__GET_VAR(data__->FIRSTTRANSFERLOADED,)));
  __SET_VAR(data__->TOF1.,IN,,__GET_VAR(data__->POPULATEDPALLETSENSOR,));
  __SET_VAR(data__->TOF1.,PT,,__time_to_timespec(1, 2500, 0, 0, 0, 0));
  TOF_body__(&data__->TOF1);
  __SET_VAR(data__->,AND4_OUT,,AND__BOOL__BOOL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (BOOL)__GET_VAR(data__->FIRSTTRANSFERLOADED,),
    (BOOL)__GET_VAR(data__->TOF1.Q,)));
  __SET_VAR(data__->,NOT42_OUT,,!(__GET_VAR(data__->AND4_OUT,)));
  __SET_VAR(data__->,AND5_OUT,,AND__BOOL__BOOL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (BOOL)__GET_VAR(data__->AND40_OUT,),
    (BOOL)__GET_VAR(data__->NOT42_OUT,)));
  __SET_VAR(data__->,TRANSEMPTYPALLET,,__GET_VAR(data__->AND5_OUT,));
  __SET_VAR(data__->,TRANSPOPULATEDPALLET,,__GET_VAR(data__->AND4_OUT,));

  goto __end;

__end:
  return;
} // PROGRAM0_body__() 





