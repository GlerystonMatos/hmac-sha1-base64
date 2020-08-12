// Exemplos de chamada:

//HMAC_SHA1("key", "message")
//THMACUtils<TIdHMACSHA1>.HMAC_HexStr('key', 'message'));

//HMAC_SHA256("key", "message")
//THMACUtils<TIdHMACSHA256>.HMAC_HexStr('key', 'message'));

//HMAC_SHA1_Base64("key", "message")
//THMACUtils<TIdHMACSHA1>.HMAC_Base64('key', 'message'));

//HMAC_SHA256_Base64("key", "message")
//THMACUtils<TIdHMACSHA256>.HMAC_Base64('key', 'message'));

unit HMAC;

interface

uses
  System.SysUtils, EncdDecd, IdHMAC, IdSSLOpenSSL, IdHash, IdGlobal;

type
  THMACUtils<T: TIdHMAC, constructor> = class
  private
    class function IdBytesOf(aValue: RawByteString): TIdBytes;
    class function BytesTypeOf(aValue: TIdBytes): TBytes;
  public
    class function HMAC(aKey, aMessage: RawByteString): TBytes;
    class function HMAC_HexStr(aKey, aMessage: RawByteString): RawByteString;
    class function HMAC_Base64(aKey, aMessage: RawByteString): RawByteString;
  end;

implementation

class function THMACUtils<T>.IdBytesOf(aValue: RawByteString): TIdBytes;
var
  _ArrayIdBytes: TIdBytes;
  _ArrayBytes: TBytes;
  _Counter: Integer;
begin
  aValue := StringReplace(aValue, '\n', '#$A', [rfReplaceAll, rfIgnoreCase]);
  _ArrayBytes := BytesOf(aValue);
  for _Counter := 0 to Pred(Length(_ArrayBytes)) do
  begin
    SetLength(_ArrayIdBytes, (Length(_ArrayIdBytes) + 1));
    _ArrayIdBytes[_Counter] := _ArrayBytes[_Counter];
  end;
  Result := _ArrayIdBytes;
end;

class function THMACUtils<T>.BytesTypeOf(aValue: TIdBytes): TBytes;
var
  _ArrayBytes: TBytes;
  _Counter: Integer;
begin
  for _Counter := 0 to Pred(Length(aValue)) do
  begin
    SetLength(_ArrayBytes, (Length(_ArrayBytes) + 1));
    _ArrayBytes[_Counter] := aValue[_Counter];
  end;
  Result := _ArrayBytes;
end;

class function THMACUtils<T>.HMAC(aKey, aMessage: RawByteString): TBytes;
var
  _HMAC: T;
begin
  if not IdSSLOpenSSL.LoadOpenSSLLibrary then
    Exit;
  _HMAC := T.Create;
  try
    _HMAC.Key := IdBytesOf(aKey);
    Result := BytesTypeOf(_HMAC.HashValue(IdBytesOf(aMessage)));
  finally
    _HMAC.Free;
  end;
end;

class function THMACUtils<T>.HMAC_HexStr(aKey, aMessage: RawByteString): RawByteString;
var
  I: Byte;
begin
  Result := '0x';
  for I in HMAC(aKey, aMessage) do
    Result := Result + IntToHex(I, 2);
end;

class function THMACUtils<T>.HMAC_Base64(aKey, aMessage: RawByteString): RawByteString;
var
  _HMAC: TBytes;
begin
  _HMAC := HMAC(aKey, aMessage);
  Result := EncodeBase64(_HMAC, Length(_HMAC));
end;

end.
