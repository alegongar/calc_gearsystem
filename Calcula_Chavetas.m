function [L_final,b_final,w,chavetas] = Calcula_Chavetas(d_E_final,L)
    if d_E_final>=6 & d_E_final<8 & L<6
        L_final=6;
        b_final=2;
        w=2;
        chavetas=1;
    elseif d_E_final>=6 & d_E_final<8 & L>=6 & L<8
        L_final=8;
        b_final=2;
        w=2;
        chavetas=1;
    elseif d_E_final>=6 & d_E_final<8 & L>=8 & L<10
        L_final=10;
        b_final=2;
        w=2;
        chavetas=1;
    elseif d_E_final>=6 & d_E_final<8 & L>=10 & L<12
        L_final=12;
        b_final=2;
        w=2;
        chavetas=1;
    elseif d_E_final>=6 & d_E_final<8 & L>=12 & L<14
        L_final=14;
        b_final=2;
        w=2;
        chavetas=1;
    elseif d_E_final>=6 & d_E_final<8 & L>=14 & L<16
        L_final=16;
        b_final=2;
        w=2;
        chavetas=1;
    elseif d_E_final>=6 & d_E_final<8 & L>=16 & L<18
        L_final=18;
        b_final=2;
        w=2;
        chavetas=1;
    elseif d_E_final>=6 & d_E_final<8 & L>=18 & L<20
        L_final=20;
        b_final=2;
        w=2;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L<6
        L_final=6;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L>=6 & L<8
        L_final=8;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L>=8 & L<10
        L_final=10;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L>=10 & L<12
        L_final=12;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L>=12 & L<14
        L_final=14;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L>=14 & L<16
        L_final=16;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L>=16 & L<18
        L_final=18;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L>=18 & L<20
        L_final=20;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L>=20 & L<22
        L_final=22;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L>=22 & L<25
        L_final=25;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L>=25 & L<28
        L_final=28;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L>=28 & L<30
        L_final=30;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L>=30 & L<32
        L_final=32;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L>=32 & L<35
        L_final=35;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=8 & d_E_final<10 & L>=35 & L<36
        L_final=36;
        b_final=3;
        w=3;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L<6
        L_final=6;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L>=6 & L<8
        L_final=8;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L>=8 & L<10
        L_final=10;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L>=10 & L<12
        L_final=12;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L>=12 & L<14
        L_final=14;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L>=14 & L<16
        L_final=16;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L>=16 & L<18
        L_final=18;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L>=18 & L<20
        L_final=20;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L>=20 & L<22
        L_final=22;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L>=22 & L<25
        L_final=25;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L>=25 & L<28
        L_final=28;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L>=28 & L<32
        L_final=32;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L>=32 & L<36
        L_final=36;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L>=36 & L<40
        L_final=40;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=10 & d_E_final<12 & L>=40 & L<45
        L_final=45;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L<8
        L_final=8;
        b_final=5;
        w=5;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L>=8 & L<10
        L_final=10;
        b_final=5;
        w=5;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L>=10 & L<12
        L_final=12;
        b_final=5;
        w=5;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L>=12 & L<14
        L_final=14;
        b_final=4;
        w=4;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L>=14 & L<16
        L_final=16;
        b_final=5;
        w=5;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L>=16 & L<18
        L_final=18;
        b_final=5;
        w=5;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L>=18 & L<20
        L_final=20;
        b_final=5;
        w=5;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L>=20 & L<22
        L_final=22;
        b_final=5;
        w=5;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L>=22 & L<25
        L_final=25;
        b_final=5;
        w=5;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L>=25 & L<28
        L_final=28;
        b_final=5;
        w=5;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L>=28 & L<32
        L_final=32;
        b_final=5;
        w=5;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L>=32 & L<36
        L_final=36;
        b_final=5;
        w=5;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L>=36 & L<40
        L_final=40;
        b_final=5;
        w=5;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L>=40 & L<45
        L_final=45;
        b_final=5;
        w=5;
        chavetas=1;
    elseif d_E_final>=12 & d_E_final<17 & L>=45 & L<50
        L_final=50;
        b_final=5;
        w=5;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L<12
        L_final=12;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L>=12 & L<14
        L_final=14;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L>=14 & L<16
        L_final=16;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L>=16 & L<18
        L_final=18;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L>=18 & L<20
        L_final=20;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L>=20 & L<22
        L_final=22;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L>=22 & L<25
        L_final=25;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L>=25 & L<28
        L_final=28;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L>=28 & L<32
        L_final=32;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L>=32 & L<36
        L_final=36;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L>=36 & L<40
        L_final=40;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L>=40 & L<45
        L_final=45;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L>=45 & L<50
        L_final=50;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L>=50 & L<56
        L_final=56;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=17 & d_E_final<22 & L>=56 & L<63
        L_final=63;
        b_final=6;
        w=6;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L<12
        L_final=12;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=12 & L<14
        L_final=14;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=14 & L<16
        L_final=16;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=16 & L<18
        L_final=18;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=18 & L<20
        L_final=20;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=20 & L<22
        L_final=22;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=22 & L<25
        L_final=25;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=25 & L<28
        L_final=28;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=28 & L<32
        L_final=32;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=32 & L<36
        L_final=36;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=36 & L<40
        L_final=40;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=40 & L<45
        L_final=45;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=45 & L<50
        L_final=50;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=50 & L<56
        L_final=56;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=56 & L<63
        L_final=63;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=63 & L<70
        L_final=70;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=70 & L<80
        L_final=80;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=22 & d_E_final<30 & L>=80 & L<90
        L_final=90;
        b_final=8;
        w=7;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L<16
        L_final=16;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=16 & L<18
        L_final=18;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=18 & L<20
        L_final=20;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=20 & L<22
        L_final=22;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=22 & L<25
        L_final=25;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=25 & L<28
        L_final=28;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=28 & L<32
        L_final=32;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=32 & L<36
        L_final=36;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=36 & L<40
        L_final=40;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=40 & L<45
        L_final=45;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=45 & L<50
        L_final=50;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=50 & L<56
        L_final=56;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=56 & L<63
        L_final=63;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=63 & L<70
        L_final=70;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=70 & L<80
        L_final=80;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=80 & L<90
        L_final=90;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=90 & L<100
        L_final=100;
        b_final=10;
        w=8;
        chavetas=1;
    elseif d_E_final>=30 & d_E_final<38 & L>=100 & L<110
        L_final=110;
        b_final=10;
        w=8;
        chavetas=1;
    else
        f52=msgbox({'No hay chavetas normalizadas para su sistema.';' ';...
            'Pruebe a modificar alguno de los siguientes datos introducidos:';...
            '1. Seleccionar otro material para las chavetas.';...
            '2. Disminuir la dimensión Y de la caja.';...
            '3. Disminuir la potencia a transmitir.';...
            '4. Aumentar la velocidad de entrada o salida (la más pequeña).'},'Error','error');
        chavetas=0;
    end
end

