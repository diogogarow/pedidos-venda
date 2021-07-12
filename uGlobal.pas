unit uGlobal;

interface

uses vcl.StdCtrls, vcl.Forms, System.SysUtils, vcl.Mask, vcl.Buttons, vcl.DBGrids;

type
   TChars = set of Char;
   procedure LimpaCampos( Formulario: TForm );
   procedure RestauraBotao( Formulario: TForm );
   procedure RestExclusao( Formulario: TForm );

var
   operacao: String[01];
   cancelabusca: Boolean;

implementation

procedure LimpaCampos( Formulario: TForm );
var i: Integer;
begin
   for i := 0 To Formulario.ComponentCount -1 Do
      begin
         if ( Formulario.Components[i] is TLabel ) and ( Formulario.Components[I].Tag = 1 ) Then
            TLabel( Formulario.Components[i] ).Caption := ''
         else if ( Formulario.Components[i] is TEdit )  Then
            TEdit( Formulario.Components[i] ).Text := ''
         else if ( Formulario.Components[I] is TMemo ) and ( Formulario.Components[I].Tag = 1 ) Then
            TMemo( Formulario.Components[I] ).Clear
         else if ( Formulario.Components[I] is TMaskEdit ) Then
            TMaskEdit( Formulario.Components[i] ).Text := ''
         else If ( Formulario.Components[I] is TComboBox ) Then
            TComboBox( Formulario.Components[i] ).ItemIndex:= -1;
      end;
end;

procedure RestauraBotao( Formulario: TForm );
var i: Integer;
begin
   for i := 0 to Formulario.ComponentCount -1 do
      begin
         if ( Formulario.Components[i] is TBitBtn ) and ( Formulario.Components[I].Tag = 1 )Then
            TBitBtn( Formulario.Components[i] ).Enabled := not TBitBtn( Formulario.Components[i] ).Enabled
         else if ( Formulario.Components[I] is TMemo ) and ( Formulario.Components[I].Tag = 1 ) Then
            TMemo( Formulario.Components[I] ).Enabled := not TMemo( Formulario.Components[I] ).Enabled
         else if ( Formulario.Components[I] is TSpeedButton ) and ( Formulario.Components[I].Tag = 1 ) Then
            TSpeedButton( Formulario.Components[i] ).Enabled := not TSpeedButton( Formulario.Components[i] ).Enabled
         else if ( Formulario.Components[i] is TEdit ) and ( Formulario.Components[I].Tag = 1 ) Then
            TEdit( Formulario.Components[I] ).Enabled := not TEdit( Formulario.Components[I] ).Enabled
         else if ( Formulario.Components[I] is TMaskEdit ) and ( Formulario.Components[I].Tag = 1 ) Then
            TMaskEdit( Formulario.Components[I] ).Enabled := not TMaskEdit( Formulario.Components[I] ).Enabled
         else if ( Formulario.Components[I] is TDBGrid ) and ( Formulario.Components[I].Tag = 1 ) Then
            TDBGrid( Formulario.Components[I] ).Enabled := not TDBGrid( Formulario.Components[I] ).Enabled
         else if ( Formulario.Components[I] is TComboBox ) and ( Formulario.Components[I].Tag = 1 ) Then
            TComboBox( Formulario.Components[I]).Enabled := not TComboBox( Formulario.Components[I]).Enabled;
      end;
end;

procedure RestExclusao( Formulario: TForm );
var
  I: Integer;
begin
   for I := 0 To Formulario.ComponentCount -1 Do
      begin
         if ( Formulario.Components[I] is TEdit ) and ( Formulario.Components[I].Tag = 1 ) Then
            TEdit(Formulario.Components[I]).Enabled:= not TEdit(Formulario.Components[I]).Enabled
         else If ( Formulario.Components[I] is TMaskEdit ) and ( Formulario.Components[I].Tag = 1 ) Then
            TMaskEdit( Formulario.Components[I] ).Enabled := Not TMaskEdit( Formulario.Components[I] ).Enabled
         else if ( Formulario.Components[I] is TDBGrid ) and ( Formulario.Components[I].Tag = 1 ) Then
            TDBGrid( Formulario.Components[I] ).Enabled := not TDBGrid( Formulario.Components[I] ).Enabled
         else if ( Formulario.Components[I] is TComboBox ) and ( Formulario.Components[I].Tag = 1 ) Then
            TComboBox(Formulario.Components[I]).Enabled:= not TComboBox(Formulario.Components[I]).Enabled
         else if ( Formulario.Components[I] is TBitBtn ) and ( Formulario.Components[I].Tag = 1 ) then
         	TBitBtn(Formulario.Components[I]).Enabled := not TBitBtn(Formulario.Components[I]).Enabled;
      end;
end;

end.
