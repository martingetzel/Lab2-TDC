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
    PopulatedPallet : RS;
    TOF0 : TOF;
    TOF1 : TOF;
    NOT27_OUT : BOOL;
    AND75_OUT : BOOL;
    AND74_OUT : BOOL;
    NOT2_OUT : BOOL;
    AND46_OUT : BOOL;
    NOT57_OUT : BOOL;
    AND55_OUT : BOOL;
    OR56_OUT : BOOL;
    AND6_OUT : BOOL;
    AND5_OUT : BOOL;
    NOT3_OUT : BOOL;
    OR4_OUT : BOOL;
    NOT68_OUT : BOOL;
  END_VAR

  NOT27_OUT := NOT(FirstTransferLoaded);
  AND75_OUT := AND(AtEmptyPallet, AtPopulatedPallet);
  AND74_OUT := AND(NOT27_OUT, AND75_OUT);
  FirstConveyor := AND74_OUT;
  LoadFirstTransfer := AND74_OUT;
  NOT2_OUT := NOT(AtEmptyPallet);
  TOF0(IN := NOT2_OUT, PT := T#2500ms);
  RemoverEmptyPallet := TOF0.Q;
  AND46_OUT := AND(EmptyPalletSensor, PopulatedPalletSensor);
  PopulatedPallet(S := AND46_OUT, R1 := SecondTransferLoaded);
  NOT57_OUT := NOT(PopulatedPallet.Q1);
  AND55_OUT := AND(NOT57_OUT, FirstTransferLoaded);
  OR56_OUT := OR(NOT2_OUT, AND55_OUT);
  TransEmptyPallet := OR56_OUT;
  AND6_OUT := AND(PopulatedPallet.Q1, SecondTransferLoaded);
  LoadSecondTransfer := AND6_OUT;
  AND5_OUT := AND(PopulatedPallet.Q1, FirstTransferLoaded);
  NOT3_OUT := NOT(AtPopulatedPallet);
  OR4_OUT := OR(AND5_OUT, NOT3_OUT);
  TransPopulatedPallet := OR4_OUT;
  TOF1(IN := SecondTransferLoaded, PT := T#2500ms);
  TransToSecondConveyor := TOF1.Q;
  NOT68_OUT := NOT(ThirdTransferLoaded);
  SecondConveyor := NOT68_OUT;
  LoadThirdTransfer := NOT68_OUT;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
