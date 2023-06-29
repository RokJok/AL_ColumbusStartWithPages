// Visi veiksmai susije su skaiciais
codeunit 50101 IntUtils
{
    var
        randomList: List of [Integer];
        max: Integer;
        min: Integer;

    procedure GetMax(): Integer
    begin
        exit(max);
    end;

    procedure GetMin(): Integer
    begin
        exit(min);
    end;

    procedure RandomListGen(listSize: Integer)
    var
        i: Integer;
    begin
        for i := 1 to listSize do begin
            randomList.Add(Random(1000));
            //Message('%1', randomList.Get(i));
        end;
        Message('List generated!');
    end;

    procedure FindMinMax()
    var
        i: Integer;
    begin
        max := -1;
        min := 1001;
        foreach i in randomList do begin
            if max < i then
                max := i;
            if min > i then
                min := i;
        end;
    end;

    procedure FindDuplicates(): Text
    var
        i: Integer;
        SeenNumbers: List of [Integer];
        Duplicates: List of [Integer];
        returnText: Text;
    begin
        foreach i in randomList do begin
            if SeenNumbers.Contains(i) then
                Duplicates.Add(i)
            else
                SeenNumbers.Add(i);
        end;
        if Duplicates.Count() > 0 then
            foreach i in Duplicates do begin
                IF returnText <> '' THEN
                    returnText := returnText + ', ';

                returnText := returnText + FORMAT(i);
            end
        else
            exit('None');

        exit(returnText);

    end;
}