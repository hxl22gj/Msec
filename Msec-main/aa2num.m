function aa_num=aa2num(aa)
aa=upper(aa);
switch aa
    case 'A'
        aa_num=0;
    case 'C'
        aa_num=1;
    case 'D'
        aa_num=2;
    case 'E'
        aa_num=3;
    case 'F'
        aa_num=4;
    case 'G'
        aa_num=5;
    case 'H'
        aa_num=6;
    case 'I'
        aa_num=7;
    case 'K'
        aa_num=8;
    case 'L'
        aa_num=9;
    case 'M'
        aa_num=10;
    case 'N'
        aa_num=11;
    case 'P'
        aa_num=12;
    case 'Q'
        aa_num=13;
    case 'R'
        aa_num=14;
    case 'S'
        aa_num=15;
    case 'T'
        aa_num=16;
    case 'V'
        aa_num=17;
    case 'W'
        aa_num=18;
    case 'Y'
        aa_num=19;
    otherwise
        aa_num=-inf;
end