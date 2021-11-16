PROGRAM program0
  VAR
    AtEmptyPallet AT %IX100.0 : BOOL := FALSE;
    AtLeftEntry AT %IX100.1 : BOOL := TRUE;
    AtLeftExit AT %IX100.2 : BOOL := TRUE;
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
