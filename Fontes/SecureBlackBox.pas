unit SecureBlackBox;

interface

uses
  SBHashFunction, SBConstants, SBTypes, SBUtils, synacode, SysUtils;

function HmacSha1Base64(Key: string; Text: string): string;

implementation

function HmacSha1Base64(Key: string; Text: string): string;
var
  retorno: string;
  hash: TElHashFunction;
  km: TElHMACKeyMaterial;
begin
  km := TElHMACKeyMaterial.Create;
  km.Key := BytesOfString(Key);
  hash := TElHashFunction.Create(SB_ALGORITHM_MAC_HMACSHA1, km);
  try
    hash.Update(BytesOfString(Text));
    retorno := StringOfBytes(hash.Finish);
    Result := EncodeBase64(AnsiString(retorno));
  finally
    FreeAndNil(hash);
  end;
end;

end.
