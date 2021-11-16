TYPE
  LOGLEVEL : (CRITICAL, WARNING, INFO, DEBUG) := INFO;
END_TYPE

FUNCTION_BLOCK LOGGER
  VAR_INPUT
    TRIG : BOOL;
    MSG : STRING;
    LEVEL : LOGLEVEL := INFO;
  END_VAR
  VAR
    TRIG0 : BOOL;
  END_VAR

  IF TRIG AND NOT TRIG0 THEN
  {{
   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  }}
  END_IF;
  TRIG0:=TRIG;
END_FUNCTION_BLOCK



FUNCTION_BLOCK python_eval
  VAR_INPUT
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    STATE : DWORD;
    BUFFER : STRING;
    PREBUFFER : STRING;
    TRIGM1 : BOOL;
    TRIGGED : BOOL;
  END_VAR

  {extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(0, data__);}
END_FUNCTION_BLOCK

FUNCTION_BLOCK python_poll
  VAR_INPUT
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    STATE : DWORD;
    BUFFER : STRING;
    PREBUFFER : STRING;
    TRIGM1 : BOOL;
    TRIGGED : BOOL;
  END_VAR

  {extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(1,(PYTHON_EVAL*)(void*)data__);}
END_FUNCTION_BLOCK

FUNCTION_BLOCK python_gear
  VAR_INPUT
    N : UINT;
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    py_eval : python_eval;
    COUNTER : UINT;
    ADD10_OUT : UINT;
    EQ13_OUT : BOOL;
    SEL15_OUT : UINT;
    AND7_OUT : BOOL;
  END_VAR

  ADD10_OUT := ADD(COUNTER, 1);
  EQ13_OUT := EQ(N, ADD10_OUT);
  SEL15_OUT := SEL(EQ13_OUT, ADD10_OUT, 0);
  COUNTER := SEL15_OUT;
  AND7_OUT := AND(EQ13_OUT, TRIG);
  py_eval(TRIG := AND7_OUT, CODE := CODE);
  ACK := py_eval.ACK;
  RESULT := py_eval.RESULT;
END_FUNCTION_BLOCK


PROGRAM program0
  VAR
    AtEmptyPallet : BOOL := FALSE;
    AtLeftEntry : BOOL := TRUE;
    AtLeftExit : BOOL := TRUE;
    AtPopulatedPallet : BOOL := FALSE;
    AtRightEntry : BOOL := TRUE;
    AtRightExit : BOOL := TRUE;
    AtSecondConveyorEntry : BOOL := TRUE;
    EmptyPalletSensor : BOOL := TRUE;
    FirstTransferLoaded : BOOL := TRUE;
    HighSensor : BOOL := TRUE;
    LowSensor : BOOL := TRUE;
    PalletSensor : BOOL := TRUE;
    PopulatedPalletSensor : BOOL := TRUE;
    SecondTransferLoaded : BOOL := TRUE;
    ThirdTransferLoaded : BOOL := TRUE;
    ConveyorLeft : BOOL := FALSE;
    ConveyorRight : BOOL := FALSE;
    FirstConveyor : BOOL := TRUE;
    LoadFirstTransfer : BOOL := FALSE;
    LoadSecondTransfer : BOOL := FALSE;
    LoadThirdTransfer : BOOL := FALSE;
    RemoverEmptyPallet : BOOL := FALSE;
    RemoverLargePackage : BOOL := FALSE;
    RemoverSmallPackage : BOOL := FALSE;
    SecondConveyor : BOOL := FALSE;
    TransEmptyPallet : BOOL := FALSE;
    TransPopulatedPallet : BOOL := FALSE;
    TransToSecondConveyor : BOOL := FALSE;
    TransfLeft : BOOL := FALSE;
    TransfRight : BOOL := FALSE;
  END_VAR
  VAR
    TOF0 : TOF;
    TOF1 : TOF;
    TON0 : TON;
    NOT27_OUT : BOOL;
    NOT29_OUT : BOOL;
    NOT38_OUT : BOOL;
    AND37_OUT : BOOL;
    AND40_OUT : BOOL;
    AND4_OUT : BOOL;
    NOT42_OUT : BOOL;
    AND5_OUT : BOOL;
  END_VAR

  NOT27_OUT := NOT(FirstTransferLoaded);
  LoadFirstTransfer := NOT27_OUT;
  NOT29_OUT := NOT(FirstTransferLoaded);
  FirstConveyor := NOT29_OUT;
  TON0(IN := EmptyPalletSensor, PT := T#500ms);
  NOT38_OUT := NOT(PopulatedPalletSensor);
  AND37_OUT := AND(TON0.Q, NOT38_OUT);
  TOF0(IN := AND37_OUT, PT := T#2500ms);
  AND40_OUT := AND(TOF0.Q, FirstTransferLoaded);
  TOF1(IN := PopulatedPalletSensor, PT := T#2500ms);
  AND4_OUT := AND(FirstTransferLoaded, TOF1.Q);
  NOT42_OUT := NOT(AND4_OUT);
  AND5_OUT := AND(AND40_OUT, NOT42_OUT);
  TransEmptyPallet := AND5_OUT;
  TransPopulatedPallet := AND4_OUT;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
