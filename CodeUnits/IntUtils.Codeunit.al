// Visi veiksmai susije su skaiciais

// Būtų geras dizaino principas public procedūras kurti tik tam ką nori exposinti išorėje, 
// o vidinę logiką laikyti local procedūrose.

// Suprantu, kad dabartiniame sprendime viskas yra naudojama išoriškai, bet manau, kad galėtų ir nebūti.

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
        for i := 1 to listSize do
            // begin .. end naudotinas tik kompleksinėms išraiškoms, t.y. kai jie enkapsuliuoja daugiau nei vieną statement
            // begin
            randomList.Add(Random(1000));
        //Message('%1', randomList.Get(i));
        // end;
        Message('List generated!');
    end;

    procedure FindMinMax()
    var
        i: Integer;
    begin
        // TODO min/max inicializavimas reikšmėmis ne iš masyvo: 
        // - Logikos klaida
        // - inicializavimui naudok pirmo elemento reikšmes
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
        foreach i in randomList do
            if SeenNumbers.Contains(i) then
                Duplicates.Add(i)
            else
                SeenNumbers.Add(i);

        if Duplicates.Count() > 0 then
            foreach i in Duplicates do begin
                IF returnText <> '' THEN // operatoriai didžiosiomis raidėmis primena PASCAL kodą. Čia pats taip parašei? :)
                    returnText := returnText + ', ';

                returnText := returnText + FORMAT(i);
            end
        else
            exit('None');

        exit(returnText);

    end;
}