

//right
/*
dod
mi
sold
dod

dod
mi
si
sold

si 
red
fad
si

sold
si
mi
red
*/

//left
/*
dod
mi
red
si

dod
fad 
mi
red
*/


<CsoundSynthesizer><CsOptions>-odac
</CsOptions><CsInstruments>

sr=44100
ksmps=32
nchnls=2


ifn1 ftgen 1, 0, 16384, 10, 1                                          ; Sine
ifn2 ftgen 2, 0, 16384, 10, 1, 0.5, 0.3, 0.25, 0.2, 0.167, 0.14, 0.125, .111   ; Sawtooth
ifn3 ftgen 3, 0, 16384, 10, 1, 0,   0.3, 0 ,   0.2, 0,     0.14, 0,     .111   ; Square
ifn4 ftgen 4, 0, 16384, 10, 1, 1,   1,   1,    0.7, 0.5,   0.3,  0.1 


instr 1


kenv linen 1, .3, p3, .1
kfreq=p4

 outs oscili((0dbfs+ oscili:k(0dbfs/2, 2200))*kenv, kfreq), oscili((0dbfs/2+oscili:k(0dbfs/2, 2200))*kenv, kfreq)


endin


instr 2


kenv linen 1, .3, p3, .1
kfreq=p4

 outs oscili((0dbfs/3+ oscili:k(0dbfs/2, 200))*kenv, kfreq, 2), oscili((0dbfs/2*kenv+oscili:k(0dbfs/2, 2))*kenv, kfreq, 2)


endin


instr 3
kenv linen 1, .3, p3, .1
kfreq=p4 
outs oscili((0dbfs/4)*kenv, kfreq/2, 2),oscili((0dbfs/4)*kenv, kfreq/8, 2)


endin 




</CsInstruments> 

<CsScore>

;section1

m theme   





i 1  0        0.125    277.183 
i 1  0.125    0.125    329.628
i 1  0.25     0.125    415.305
i 1  0.375    0.125    554.365
i 1  0.5      0.125    277.183
i 1  0.625    0.125    329.628
i 1  0.75     0.125    493.883
i 1  0.875    0.125    415.305


 




i 1  1      0.125    246.942
i 1  1.125  0.125    311.127
i 1  1.25   0.125    369.994
i 1  1.375  0.125    493.883


i 1 1.5      0.125    207.652
i 1 1.625    0.125    246.942
i 1 1.75     0.125    329.628
i 1 1.875    0.125    311.127

i 1  2        0.125    277.183 
i 1  2.125    0.125    329.628
i 1  2.25     0.125    415.305
i 1  2.375    0.125    554.365
i 1  2.5      0.125    277.183
i 1  2.625    0.125    329.628
i 1  2.75     0.125    493.883
i 1  2.875    0.125    415.305

i 1  3      0.125    246.942
i 1  3.125  0.125    311.127
i 1  3.25   0.125    369.994
i 1  3.375  0.125    493.883


i 1 3.5      0.125    207.652
i 1 3.625    0.125    246.942
i 1 3.75     0.125    329.628
i 1 3.875    0.125    311.127
 
s
;section2
n theme

s
;section3
m go

;bass

i 2  0     1   69.2957  
i 2  1     1   82.4069   
i 2  2     1   77.7817 
i 2  3     1   61.7354 
i 2  4     1   69.2957 
i 2  5     1   92.4986 
i 2  6     1   82.4069
i 2  7     1   123.471

i 2  8     1   69.2957  
i 2  9     1   82.4069   
i 2  10    1   77.7817 
i 2  11    1   61.7354 
i 2  12    1   69.2957 
i 2  13    1   92.4986 
i 2  14    1   82.4069
i 2  15    1   123.471




;progressionLoop


i 1  0        0.125    277.183 
i 1  0.125    0.125    329.628
i 1  0.25     0.125    415.305
i 1  0.375    0.125    554.365
i 1  0.5      0.125    277.183
i 1  0.625    0.125    329.628
i 1  0.75     0.125    493.883
i 1  0.875    0.125    415.305


 




i 1  1      0.125    246.942
i 1  1.125  0.125    311.127
i 1  1.25   0.125    369.994
i 1  1.375  0.125    493.883


i 1 1.5      0.125    207.652
i 1 1.625    0.125    246.942
i 1 1.75     0.125    329.628
i 1 1.875    0.125    311.127

i 1  2        0.125    277.183 
i 1  2.125    0.125    329.628
i 1  2.25     0.125    415.305
i 1  2.375    0.125    554.365
i 1  2.5      0.125    277.183
i 1  2.625    0.125    329.628
i 1  2.75     0.125    493.883
i 1  2.875    0.125    415.305

i 1  3      0.125    246.942
i 1  3.125  0.125    311.127
i 1  3.25   0.125    369.994
i 1  3.375  0.125    493.883


i 1 3.5      0.125    207.652
i 1 3.625    0.125    246.942
i 1 3.75     0.125    329.628
i 1 3.875    0.125    311.127




i 1  4        0.125    277.183 
i 1  4.125    0.125    329.628
i 1  4.25     0.125    415.305
i 1  4.375    0.125    554.365
i 1  4.5      0.125    277.183
i 1  4.625    0.125    329.628
i 1  4.75     0.125    493.883
i 1  4.875    0.125    415.305


 




i 1  5      0.125    246.942
i 1  5.125  0.125    311.127
i 1  5.25   0.125    369.994
i 1  5.375  0.125    493.883


i 1 5.5      0.125    207.652
i 1 5.625    0.125    246.942
i 1 5.75     0.125    329.628
i 1 5.875    0.125    311.127

i 1  6        0.125    277.183 
i 1  6.125    0.125    329.628
i 1  6.25     0.125    415.305
i 1  6.375    0.125    554.365
i 1  6.5      0.125    277.183
i 1  6.625    0.125    329.628
i 1  6.75     0.125    493.883
i 1  6.875    0.125    415.305

i 1  7      0.125    246.942
i 1  7.125  0.125    311.127
i 1  7.25   0.125    369.994
i 1  7.375  0.125    493.883


i 1 7.5      0.125    207.652
i 1 7.625    0.125    246.942
i 1 7.75     0.125    329.628
i 1 7.875    0.125    311.127

i 1  8        0.125    277.183 
i 1  8.125    0.125    329.628
i 1  8.25     0.125    415.305
i 1  8.375    0.125    554.365
i 1  8.5      0.125    277.183
i 1  8.625    0.125    329.628
i 1  8.75     0.125    493.883
i 1  8.875    0.125    415.305


 




i 1  9      0.125    246.942
i 1  9.125  0.125    311.127
i 1  9.25   0.125    369.994
i 1  9.375  0.125    493.883


i 1 9.5      0.125    207.652
i 1 9.625    0.125    246.942
i 1 9.75     0.125    329.628
i 1 9.875    0.125    311.127

i 1  10        0.125    277.183 
i 1  10.125    0.125    329.628
i 1  10.25     0.125    415.305
i 1  10.375    0.125    554.365
i 1  10.5      0.125    277.183
i 1  10.625    0.125    329.628
i 1  10.75     0.125    493.883
i 1  10.875    0.125    415.305

i 1  11      0.125    246.942
i 1  11.125  0.125    311.127
i 1  11.25   0.125    369.994
i 1  11.375  0.125    493.883


i 1 11.5      0.125    207.652
i 1 11.625    0.125    246.942
i 1 11.75     0.125    329.628
i 1 11.875    0.125    311.127




i 1  12        0.125    277.183 
i 1  12.125    0.125    329.628
i 1  12.25     0.125    415.305
i 1  12.375    0.125    554.365
i 1  12.5      0.125    277.183
i 1  12.625    0.125    329.628
i 1  12.75     0.125    493.883
i 1  12.875    0.125    415.305


 




i 1  13      0.125    246.942
i 1  13.125  0.125    311.127
i 1  13.25   0.125    369.994
i 1  13.375  0.125    493.883


i 1 13.5      0.125    207.652
i 1 13.625    0.125    246.942
i 1 13.75     0.125    329.628
i 1 13.875    0.125    311.127

i 1  14        0.125    277.183 
i 1  14.125    0.125    329.628
i 1  14.25     0.125    415.305
i 1  14.375    0.125    554.365
i 1  14.5      0.125    277.183
i 1  14.625    0.125    329.628
i 1  14.75     0.125    493.883
i 1  14.875    0.125    415.305

i 1  15      0.125    246.942
i 1  15.125  0.125    311.127
i 1  15.25   0.125    369.994
i 1  15.375  0.125    493.883


i 1 15.5      0.125    207.652
i 1 15.625    0.125    246.942
i 1 15.75     0.125    329.628
i 1 15.875    0.125    311.127




s

;section4
m addThemAll




i 3 0  4.25  1661.22   ;highAsFuck
i 3 4  4.25  2217.46
i 3 8  6.25  1318.51
i 3 14 2  1108.73




i 2  0     1   69.2957  ;bass
i 2  1     1   82.4069   
i 2  2     1   77.7817 
i 2  3     1   61.7354 
i 2  4     1   69.2957 
i 2  5     1   92.4986 
i 2  6     1   82.4069
i 2  7     1   123.471

i 2  8      1   69.2957  
i 2  9      1   82.4069   
i 2  10     1   77.7817 
i 2  11     1   61.7354 
i 2  12     1   69.2957 
i 2  13     1   92.4986 
i 2  14     1   82.4069
i 2  15     1   123.471




;progressionLoop


i 1  0        0.125    277.183 
i 1  0.125    0.125    329.628
i 1  0.25     0.125    415.305
i 1  0.375    0.125    554.365
i 1  0.5      0.125    277.183
i 1  0.625    0.125    329.628
i 1  0.75     0.125    493.883
i 1  0.875    0.125    415.305


 




i 1  1      0.125    246.942
i 1  1.125  0.125    311.127
i 1  1.25   0.125    369.994
i 1  1.375  0.125    493.883


i 1 1.5      0.125    207.652
i 1 1.625    0.125    246.942
i 1 1.75     0.125    329.628
i 1 1.875    0.125    311.127

i 1  2        0.125    277.183 
i 1  2.125    0.125    329.628
i 1  2.25     0.125    415.305
i 1  2.375    0.125    554.365
i 1  2.5      0.125    277.183
i 1  2.625    0.125    329.628
i 1  2.75     0.125    493.883
i 1  2.875    0.125    415.305

i 1  3      0.125    246.942
i 1  3.125  0.125    311.127
i 1  3.25   0.125    369.994
i 1  3.375  0.125    493.883


i 1 3.5      0.125    207.652
i 1 3.625    0.125    246.942
i 1 3.75     0.125    329.628
i 1 3.875    0.125    311.127




i 1  4        0.125    277.183 
i 1  4.125    0.125    329.628
i 1  4.25     0.125    415.305
i 1  4.375    0.125    554.365
i 1  4.5      0.125    277.183
i 1  4.625    0.125    329.628
i 1  4.75     0.125    493.883
i 1  4.875    0.125    415.305


 




i 1  5      0.125    246.942
i 1  5.125  0.125    311.127
i 1  5.25   0.125    369.994
i 1  5.375  0.125    493.883


i 1 5.5      0.125    207.652
i 1 5.625    0.125    246.942
i 1 5.75     0.125    329.628
i 1 5.875    0.125    311.127

i 1  6        0.125    277.183 
i 1  6.125    0.125    329.628
i 1  6.25     0.125    415.305
i 1  6.375    0.125    554.365
i 1  6.5      0.125    277.183
i 1  6.625    0.125    329.628
i 1  6.75     0.125    493.883
i 1  6.875    0.125    415.305

i 1  7      0.125    246.942
i 1  7.125  0.125    311.127
i 1  7.25   0.125    369.994
i 1  7.375  0.125    493.883


i 1 7.5      0.125    207.652
i 1 7.625    0.125    246.942
i 1 7.75     0.125    329.628
i 1 7.875    0.125    311.127

i 1  8        0.125    277.183 
i 1  8.125    0.125    329.628
i 1  8.25     0.125    415.305
i 1  8.375    0.125    554.365
i 1  8.5      0.125    277.183
i 1  8.625    0.125    329.628
i 1  8.75     0.125    493.883
i 1  8.875    0.125    415.305


 




i 1  9      0.125    246.942
i 1  9.125  0.125    311.127
i 1  9.25   0.125    369.994
i 1  9.375  0.125    493.883


i 1 9.5      0.125    207.652
i 1 9.625    0.125    246.942
i 1 9.75     0.125    329.628
i 1 9.875    0.125    311.127

i 1  10        0.125    277.183 
i 1  10.125    0.125    329.628
i 1  10.25     0.125    415.305
i 1  10.375    0.125    554.365
i 1  10.5      0.125    277.183
i 1  10.625    0.125    329.628
i 1  10.75     0.125    493.883
i 1  10.875    0.125    415.305

i 1  11      0.125    246.942
i 1  11.125  0.125    311.127
i 1  11.25   0.125    369.994
i 1  11.375  0.125    493.883


i 1 11.5      0.125    207.652
i 1 11.625    0.125    246.942
i 1 11.75     0.125    329.628
i 1 11.875    0.125    311.127




i 1  12        0.125    277.183 
i 1  12.125    0.125    329.628
i 1  12.25     0.125    415.305
i 1  12.375    0.125    554.365
i 1  12.5      0.125    277.183
i 1  12.625    0.125    329.628
i 1  12.75     0.125    493.883
i 1  12.875    0.125    415.305


 




i 1  13      0.125    246.942
i 1  13.125  0.125    311.127
i 1  13.25   0.125    369.994
i 1  13.375  0.125    493.883


i 1 13.5      0.125    207.652
i 1 13.625    0.125    246.942
i 1 13.75     0.125    329.628
i 1 13.875    0.125    311.127

i 1  14        0.125    277.183 
i 1  14.125    0.125    329.628
i 1  14.25     0.125    415.305
i 1  14.375    0.125    554.365
i 1  14.5      0.125    277.183
i 1  14.625    0.125    329.628
i 1  14.75     0.125    493.883
i 1  14.875    0.125    415.305

i 1  15      0.125    246.942
i 1  15.125  0.125    311.127
i 1  15.25   0.125    369.994
i 1  15.375  0.125    493.883


i 1 15.5      0.125    207.652
i 1 15.625    0.125    246.942
i 1 15.75     0.125    329.628
i 1 15.875    0.125    311.127

s
;section5
n addThemAll

s

m BassOff

i 3 0  4  1661.22   ;highAsFuck
i 3 4  4  2217.46
i 3 8  6  1318.51
i 3 14 2  1108.73

;progressionLoopChanged

i 1  0        0.125    277.183 
i 1  0.125    0.125    554.365
i 1  0.25     0.125    415.305
i 1  0.375    0.125    329.628
i 1  0.5      0.125    415.305
i 1  0.625    0.125    493.883
i 1  0.75     0.125    329.628
i 1  0.875    0.125    277.183


 




i 1  1      0.125    246.942
i 1  1.125  0.125    311.127
i 1  1.25   0.125    369.994
i 1  1.375  0.125    493.883


i 1 1.5      0.125    207.652
i 1 1.625    0.125    246.942
i 1 1.75     0.125    329.628
i 1 1.875    0.125    311.127


i 1  2        0.125    277.183 
i 1  2.125    0.125    554.365
i 1  2.25     0.125    415.305
i 1  2.375    0.125    329.628
i 1  2.5      0.125    415.305
i 1  2.625    0.125    493.883
i 1  2.75     0.125    329.628
i 1  2.875    0.125    277.183

i 1  3      0.125    246.942
i 1  3.125  0.125    311.127
i 1  3.25   0.125    369.994
i 1  3.375  0.125    493.883


i 1 3.5      0.125    207.652
i 1 3.625    0.125    246.942
i 1 3.75     0.125    329.628
i 1 3.875    0.125    311.127




i 1  4        0.125    277.183 
i 1  4.125    0.125    554.365
i 1  4.25     0.125    415.305
i 1  4.375    0.125    329.628
i 1  4.5      0.125    415.305
i 1  4.625    0.125    493.883
i 1  4.75     0.125    329.628
i 1  4.875    0.125    277.183


 




i 1  5      0.125    246.942
i 1  5.125  0.125    311.127
i 1  5.25   0.125    369.994
i 1  5.375  0.125    493.883


i 1 5.5      0.125    207.652
i 1 5.625    0.125    246.942
i 1 5.75     0.125    329.628
i 1 5.875    0.125    311.127

i 1  6        0.125    277.183 
i 1  6.125    0.125    554.365
i 1  6.25     0.125    415.305
i 1  6.375    0.125    329.628
i 1  6.5      0.125    415.305
i 1  6.625    0.125    493.883
i 1  6.75     0.125    329.628
i 1  6.875    0.125    277.183

i 1  7      0.125    246.942
i 1  7.125  0.125    311.127
i 1  7.25   0.125    369.994
i 1  7.375  0.125    493.883


i 1 7.5      0.125    207.652
i 1 7.625    0.125    246.942
i 1 7.75     0.125    329.628
i 1 7.875    0.125    311.127

i 1  8        0.125    277.183 
i 1  8.125    0.125    554.365
i 1  8.25     0.125    415.305
i 1  8.375    0.125    329.628
i 1  8.5      0.125    415.305
i 1  8.625    0.125    493.883
i 1  8.75     0.125    329.628
i 1  8.875    0.125    277.183


 




i 1  9      0.125    246.942
i 1  9.125  0.125    311.127
i 1  9.25   0.125    369.994
i 1  9.375  0.125    493.883


i 1 9.5      0.125    207.652
i 1 9.625    0.125    246.942
i 1 9.75     0.125    329.628
i 1 9.875    0.125    311.127

i 1  10        0.125    277.183 
i 1  10.125    0.125    554.365
i 1  10.25     0.125    415.305
i 1  10.375    0.125    329.628
i 1  10.5      0.125    415.305
i 1  10.625    0.125    493.883
i 1  10.75     0.125    329.628
i 1  10.875    0.125    277.183

i 1  11      0.125    246.942
i 1  11.125  0.125    311.127
i 1  11.25   0.125    369.994
i 1  11.375  0.125    493.883


i 1 11.5      0.125    207.652
i 1 11.625    0.125    246.942
i 1 11.75     0.125    329.628
i 1 11.875    0.125    311.127




i 1  12        0.125    277.183 
i 1  12.125    0.125    554.365
i 1  12.25     0.125    415.305
i 1  12.375    0.125    329.628
i 1  12.5      0.125    415.305
i 1  12.625    0.125    493.883
i 1  12.75     0.125    329.628
i 1  12.875    0.125    277.183


 




i 1  13      0.125    246.942
i 1  13.125  0.125    311.127
i 1  13.25   0.125    369.994
i 1  13.375  0.125    493.883


i 1 13.5      0.125    207.652
i 1 13.625    0.125    246.942
i 1 13.75     0.125    329.628
i 1 13.875    0.125    311.127

i 1  14        0.125    277.183 
i 1  14.125    0.125    554.365
i 1  14.25     0.125    415.305
i 1  14.375    0.125    329.628
i 1  14.5      0.125    415.305
i 1  14.625    0.125    493.883
i 1  14.75     0.125    329.628
i 1  14.875    0.125    277.183

i 1  15      0.125    246.942
i 1  15.125  0.125    311.127
i 1  15.25   0.125    369.994
i 1  15.375  0.125    493.883


i 1 15.5      0.125    207.652
i 1 15.625    0.125    246.942
i 1 15.75     0.125    329.628
i 1 15.875    0.125    311.127


e

</CsScore>

</CsoundSynthesizer>


;micmed