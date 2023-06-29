page 50101 StartingTasks
{
    Caption = 'Starting tasks';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            group(Task1)
            {
                Caption = 'First task: reverse a string';
                field(InputCtrl; originalText)
                {
                    Caption = 'Input';
                    ToolTip = 'The original sentence that will be reversed.';

                    trigger OnValidate()
                    begin
                        reversedText := StringUtils.ReverseText(originalText);
                    end;
                }

                field(OutputCtrl; reversedText)
                {
                    Caption = 'Output';
                    ToolTip = 'The reversed sentance of the original one';
                }
            }
            group(Task2)
            {
                Caption = 'Second task: find min and max';
                field(MaxListSizeCtrl; listSize)
                {
                    Caption = 'Size';
                    ToolTip = 'The size of the list';
                    trigger OnValidate()
                    begin
                        if listSize < 1 then
                            Error('List size can not be a negative number');
                    end;
                }
                field(MaxCtrl; IntUtils.GetMax())
                {
                    Caption = 'Max';
                    ToolTip = 'The highest number of the array';

                    Editable = false;
                }
                field(MinCtrl; IntUtils.GetMin())
                {
                    Caption = 'Min';
                    ToolTip = 'The lowest number in the list';

                    Editable = false;
                }
            }

            group(Task3)
            {
                Caption = 'Third task: find duplicates';
                field(DuplicatesCtrl; duplicateText)
                {
                    Caption = 'Duplicates';
                    ToolTip = 'The duplicates found in the list';

                    Editable = false;
                }
            }

            group(Task4)
            {
                Caption = 'Fourth task: Count vowels and consonants';

                field(SentenceCtrl; sentenceText)
                {
                    Caption = 'Sentance';
                    ToolTip = 'The original sentence of which the vowels and consonants is counted of';

                    trigger OnValidate()
                    begin
                        StringUtils.CountVowelsAndConsonants(sentenceText);

                        numOfVowels := StringUtils.GetVowelsCount();
                        numOfConsonants := StringUtils.GetConsonantsCount();
                    end;
                }
                field(numOfVowelsCtrl; numOfVowels)
                {
                    Caption = 'Number of vowels';
                    ToolTip = 'The total number of vowels in the original sentence';

                    Editable = false;
                }
                field(numOfConsonantsCtrl; numOfConsonants)
                {
                    Caption = 'Number of consonants';
                    ToolTip = 'The total number of consonants in the original sentence';

                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action(RandomListGen)
            {
                Caption = 'Generate numbers';
                ToolTip = 'Generates a list of random numbers where the maximum number is 1000';
                Image = NewResource;


                trigger OnAction()
                begin
                    if listSize < 1 then
                        Message('List size can not be a negative number')
                    else
                        IntUtils.RandomListGen(listSize);


                end;
            }
        }
        area(Processing)
        {

            action(FindMinMax)
            {
                Caption = 'Find minimum and maximum';
                ToolTip = 'Finds the minimum and maximum values from the list of random numbers';
                Image = MakeOrder;


                trigger OnAction()
                begin
                    IntUtils.FindMinMax();
                end;
            }

            action(FindDuplicates)
            {
                Caption = 'Find duplicates';
                ToolTip = 'Finds duplicate numbers in the list with random values';

                trigger OnAction()
                begin
                    duplicateText := IntUtils.FindDuplicates();
                end;
            }
        }

        area(Promoted)
        {
            actionref(RandomListGen_Promoted; RandomListGen) { }
            actionref(FindMinMax_Promoted; FindMinMax) { }
            actionref(FindDuplicates_Promoted; FindDuplicates) { }
        }
    }

    var
        StringUtils: Codeunit StringUtils;
        IntUtils: Codeunit IntUtils;
        originalText: Text;
        reversedText: Text;
        listSize: Integer;
        duplicateText: Text;
        sentenceText: Text;
        numOfVowels: Integer;
        numOfConsonants: Integer;

}