// Visi veiksmai susije su string duomenimis
codeunit 50100 StringUtils
{
    var
        vowelsCount: Integer;
        consonantsCount: Integer;

    procedure GetVowelsCount(): Integer
    begin
        exit(vowelsCount);
    end;

    procedure GetConsonantsCount(): Integer
    begin
        exit(consonantsCount);
    end;


    procedure ReverseText(originalText: Text): Text
    var
        ReversedString: Text;
        i: Integer;
    begin
        ReversedString := '';
        for i := StrLen(originalText) downto 1 do
            ReversedString := ReversedString + originalText[i];
        exit(ReversedString);
    end;

    procedure CountVowelsAndConsonants(originalSentence: Text)
    var
        vowels: Text;
        consonants: Text;
        i: Integer;
    begin
        vowelsCount := 0;
        consonantsCount := 0;
        vowels := 'aeiouyAEIOUYąęėįųūĄĘĖĮŲŪ';
        consonants := 'bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZčšžČŠŽ';
        for i := 1 to StrLen(originalSentence) do begin
            if vowels.Contains(originalSentence[i]) then
                vowelsCount := vowelsCount + 1; // Galima naudoti: vowelsCount += 1;
            if consonants.Contains(originalSentence[i]) then
                consonantsCount := consonantsCount + 1;
        end;
    end;
}