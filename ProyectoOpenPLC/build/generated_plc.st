PROGRAM program0
  VAR
    AtEmptyPallet AT %IX100.0 : BOOL := FALSE;
    AtLeftEntry AT %IX100.1 : BOOL := FALSE;
    AtLeftExit AT %IX100.2 : BOOL := FALSE;
    AtPopulatedPallet AT %IX100.3 : BOOL := FALSE;
    AtRightEntry AT %IX100.4 : BOOL := TRUE;
    AtRightExit AT %IX100.5 : BOOL := TRUE;
    AtSecondConveyorEntry AT %IX100.6 : BOOL := TRUE;
    EmptyPalletSensor AT %IX100.7 : BOOL := TRUE;
    FirstTransferLoaded AT %IX101.0 : BOOL := TRUE;
    HighSensor AT %IX101.1 : BOOL := TRUE;
    LowSensor AT %IX101.2 : BOOL := TRUE;
    PalletSensor AT %IX101.3 : BOOL := TRUE;
    PopulatedPalletSensor AT %IX101.4 : BOOL := TRUE;
    SecondTransferLoaded AT %IX101.5 : BOOL := TRUE;
    ThirdTransferLoaded AT %IX101.6 : BOOL := TRUE;
    ConveyorLeft AT %QX100.0 : BOOL := FALSE;
    ConveyorRight AT %QX100.1 : BOOL := FALSE;
    FirstConveyor AT %QX100.2 : BOOL := TRUE;
    LoadFirstTransfer AT %QX100.3 : BOOL := FALSE;
    LoadSecondTransfer AT %QX100.4 : BOOL := FALSE;
    LoadThirdTransfer AT %QX100.5 : BOOL := FALSE;
    RemoverEmptyPallet AT %QX100.6 : BOOL := FALSE;
    RemoverLargePackage AT %QX100.7 : BOOL := FALSE;
    RemoverSmallPackage AT %QX101.0 : BOOL := FALSE;
    SecondConveyor AT %QX101.1 : BOOL := FALSE;
    TransEmptyPallet AT %QX101.2 : BOOL := FALSE;
    TransPopulatedPallet AT %QX101.3 : BOOL := FALSE;
    TransToSecondConveyor AT %QX101.4 : BOOL := FALSE;
    TransfLeft AT %QX101.5 : BOOL := FALSE;
    TransfRight AT %QX101.6 : BOOL := FALSE;
  END_VAR
  VAR
    PopulatedPallet : RS;
    TOF0 : TOF;
    TOF1 : TOF;
    High : RS;
    TOF2 : TOF;
    TOF3 : TOF;
    RS0 : RS;
    LEFTC : RS;
    TON0 : TON;
    LEFTC0 : RS;
    TON1 : TON;
    TOF4 : TOF;
    High0 : RS;
    TOF5 : TOF;
    TOF6 : TOF;
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
    NOT31_OUT : BOOL;
    NOT32_OUT : BOOL;
    NOT34_OUT : BOOL;
    NOT35_OUT : BOOL;
    NOT14_OUT : BOOL;
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
  NOT31_OUT := NOT(AtLeftEntry);
  NOT32_OUT := NOT(AtLeftExit);
  TON0(IN := NOT32_OUT, PT := T#2500ms);
  LEFTC(S := NOT31_OUT, R1 := TON0.Q);
  ConveyorLeft := LEFTC.Q1;
  NOT34_OUT := NOT(AtRightEntry);
  NOT35_OUT := NOT(AtRightExit);
  TON1(IN := NOT35_OUT, PT := T#2500ms);
  LEFTC0(S := NOT34_OUT, R1 := TON1.Q);
  ConveyorRight := LEFTC0.Q1;
  NOT14_OUT := NOT(AtLeftExit);
  TOF2(IN := NOT14_OUT, PT := T#2500ms);
  RemoverLargePackage := TOF2.Q;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
