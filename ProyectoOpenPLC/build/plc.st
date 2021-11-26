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
    AtLeftExit : BOOL := FALSE;
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
    High : RS;
    TOF2 : TOF;
    TOF3 : TOF;
    RS0 : RS;
    TOF4 : TOF;
    High0 : RS;
    TOF5 : TOF;
    TOF6 : TOF;
    RS1 : RS;
    TON1 : TON;
    RS2 : RS;
    TON2 : TON;
    TOF7 : TOF;
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
    NOT25_OUT : BOOL;
    AND22_OUT : BOOL;
    NOT68_OUT : BOOL;
    AND8_OUT : BOOL;
    NOT9_OUT : BOOL;
    AND82_OUT : BOOL;
    NOT45_OUT : BOOL;
    AND48_OUT : BOOL;
    NOT37_OUT : BOOL;
    AND54_OUT : BOOL;
    AND91_OUT : BOOL;
    NOT86_OUT : BOOL;
    NOT93_OUT : BOOL;
    AND35_OUT : BOOL;
    NOT14_OUT : BOOL;
    AND83_OUT : BOOL;
    NOT79_OUT : BOOL;
    NOT85_OUT : BOOL;
    AND58_OUT : BOOL;
    NOT26_OUT : BOOL;
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
  NOT25_OUT := NOT(TOF1.Q);
  AND22_OUT := AND(NOT25_OUT, ThirdTransferLoaded);
  RS0(S := SecondTransferLoaded, R1 := AND22_OUT);
  SecondConveyor := RS0.Q1;
  NOT68_OUT := NOT(ThirdTransferLoaded);
  LoadThirdTransfer := NOT68_OUT;
  AND8_OUT := AND(HighSensor);
  NOT9_OUT := NOT(AtLeftEntry);
  TOF3(IN := NOT9_OUT, PT := T#1000ms);
  High(S := AND8_OUT, R1 := TOF3.Q);
  AND82_OUT := AND(High.Q1, ThirdTransferLoaded);
  TOF6(IN := AND82_OUT, PT := T#2000ms);
  TransfLeft := TOF6.Q;
  NOT45_OUT := NOT(HighSensor);
  AND48_OUT := AND(NOT45_OUT, LowSensor);
  NOT37_OUT := NOT(AtRightEntry);
  TOF4(IN := NOT37_OUT, PT := T#1000ms);
  High0(S := AND48_OUT, R1 := TOF4.Q);
  AND54_OUT := AND(High0.Q1, ThirdTransferLoaded);
  TOF5(IN := AND54_OUT, PT := T#2000ms);
  TransfRight := TOF5.Q;
  AND91_OUT := AND(ThirdTransferLoaded, TransfLeft);
  NOT86_OUT := NOT(AtLeftExit);
  NOT93_OUT := NOT(ThirdTransferLoaded);
  AND35_OUT := AND(NOT86_OUT, NOT93_OUT);
  TON2(IN := AND35_OUT, PT := T#2000ms);
  RS2(S := AND91_OUT, R1 := TON2.Q);
  ConveyorLeft := RS2.Q1;
  NOT14_OUT := NOT(AtLeftExit);
  TOF2(IN := NOT14_OUT, PT := T#2500ms);
  RemoverLargePackage := TOF2.Q;
  AND83_OUT := AND(ThirdTransferLoaded, TransfRight);
  NOT79_OUT := NOT(AtRightExit);
  NOT85_OUT := NOT(ThirdTransferLoaded);
  AND58_OUT := AND(NOT79_OUT, NOT85_OUT);
  TON1(IN := AND58_OUT, PT := T#2000ms);
  RS1(S := AND83_OUT, R1 := TON1.Q);
  ConveyorRight := RS1.Q1;
  NOT26_OUT := NOT(AtRightExit);
  TOF7(IN := NOT26_OUT, PT := T#2500ms);
  RemoverSmallPackage := TOF7.Q;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
