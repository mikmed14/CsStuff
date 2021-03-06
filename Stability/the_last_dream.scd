
s.boot;
s.reboot;
s.options.memSize=2*1024*1024;

~bus1=Bus.audio(s,2);
~bus2=Bus.audio(s,2);



(
SynthDef(
	\abcsaw5, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, 180*SinOsc.kr(0.35, -2.5, 8 ,8.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.02, 2.5, 2, -8),   doneAction: 2); //20-0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 1500);
	sig=HPF.ar(sig, 50);


Out.ar(bus,Pan2.ar(sig*2 ,0));
	Out.ar(0,Pan2.ar(sig/1.2 ,0));//10-1.5

}).add;
)







(
SynthDef(\abcdelay7, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
	var input, output, delrd, sig, deltimes;

	// Choose which sort of input you want by (un)commenting these lines:
	//input = Pan2.ar(PlayBuf.ar(2, b, loop: 0), -0.5); // buffer playback, panned halfway left
	//input = SoundIn.ar([0,1]); // TAKE CARE of feedback - use headphones
	//input = Dust2.ar([0.1, 0.01]); // Occasional clicks
    input=In.ar(bus);
	// Read our 4-channel delayed signals back from the feedback loop
	delrd = LocalIn.ar(4);

	// This will be our eventual output, which will also be recirculated
	output = input + delrd[[0,1]];

	// Cross-fertilise the four delay lines with each other:
	sig = [output[0]+output[1], output[0]-output[1], delrd[2]+delrd[3], delrd[2]-delrd[3]];
	sig = [sig[0]+sig[2], sig[1]+sig[3], sig[0]-sig[2], sig[1]-sig[3]];
	// Attenutate the delayed signals so they decay:
//	sig = sig * [0.6, 0.27, 0.233, 0.83];
	sig = sig * [0.33, 0.37, 0.25, 0.53];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [191, 153, 145, 187] * 0.00004 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 3.6, 3, -4) ,  doneAction: 2);
output=LPF.ar(output, 2500);
	Out.ar(0,Pan2.ar(output/100 ,-0.2));

}).add;
)



(


	w=Routine({
	var delta;
	var freqvect=[
		43, 43, 46, 43, 48, 43, 46, 48, 43, 48, 46, 43, 48, 43, 46, 48,
		39, 39, 46, 39, 48, 39, 46, 48, 39, 48, 46, 39, 48, 39, 46, 48,
		34, 34, 46, 34, 48, 34, 46, 48, 34, 48, 46, 34, 48, 34, 46, 48,
		41, 41, 46, 41, 48, 41, 46, 48, 41, 48, 46, 41, 48, 41, 46, 48,



];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/12;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("abcsaw5", [freq: freqvect[i], amp: 1 , bus: ~bus1.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

	k6 = Synth.new( "abcdelay7", [bus: ~bus1.index]);


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
w.play;
s.record;
w.stop;


(
SynthDef(
	\abcsine6, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);



sig3 = Mix.ar(SinOsc.ar((freq+12).midicps * [1, 2.015,  0.99,0.99, 2.01, 2.02, 4.014, 4.019, 4.005, 4.007, 4.01]  ));
	//	sig3=SinOsc.ar((freq).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 600*SinOsc.kr(0.1, -2, 0.95 ,1.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.4, 0.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 1400);
	sig=HPF.ar(sig, 100);


		//Out.ar(bus,Pan2.ar(sig3/150 ,0));
Out.ar(0,Pan2.ar(sig/3 ,0));

}).add;
)


(
SynthDef(\sinedelay, {arg bus, d=0.00007;
	var input, output, delrd, sig, deltimes;

	// Choose which sort of input you want by (un)commenting these lines:
	//input = Pan2.ar(PlayBuf.ar(2, b, loop: 0), -0.5); // buffer playback, panned halfway left
	//input = SoundIn.ar([0,1]); // TAKE CARE of feedback - use headphones
	//input = Dust2.ar([0.1, 0.01]); // Occasional clicks
    input=In.ar(bus);
	// Read our 4-channel delayed signals back from the feedback loop
	delrd = LocalIn.ar(4);

	// This will be our eventual output, which will also be recirculated
	output = input + delrd[[0,1]];

	// Cross-fertilise the four delay lines with each other:
	sig = [output[0]+output[1], output[0]-output[1], delrd[2]+delrd[3], delrd[2]-delrd[3]];
	sig = [sig[0]+sig[2], sig[1]+sig[3], sig[0]-sig[2], sig[1]-sig[3]];
	// Attenutate the delayed signals so they decay:
//	sig = sig * [0.6, 0.27, 0.233, 0.83];
	sig = sig * [0.42, 0.43, 0.47, 0.47];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [111, 153, 130, 177] * d*SinOsc.kr(0.002, 2.5, 0.4*SinOsc.kr(0.01, 2.5, 1, 2), 2)- ControlDur.ir;
	//deltimes = [101, 153, 145, 187] * 0.001 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(1, 2.4, 3, -4) ,  doneAction: 2);
//	output=BPF.ar(output, 2000*SinOsc.kr(8.25, -2.5, 0.95 ,1.05));
output=LPF.ar(output, 1000);
output=HPF.ar(output, 200);
	//output=HPF.ar(output, 200);
	Out.ar(0,Pan2.ar(output ,-0.2));

}).add;
)


(


	r=Routine({
	var delta;


	var freqvect4=[

     43, 46, 50, 43, 50, 43, 46, 50,
		 43, 46, 50, 43, 50, 43, 46, 50,
		 43, 46, 50, 43, 50, 43, 46, 50,
		 43, 46, 50, 43, 50, 43, 46, 50,


39, 43, 46, 39, 46, 39, 43, 46,
		39, 43, 46, 39, 46, 39, 43, 46,
		39, 43, 46, 39, 46, 39, 43, 46,
		39, 43, 46, 39, 46, 39, 43, 46,


   34, 38, 41, 34, 41, 34, 38, 41,
		 34, 38, 41, 34, 41, 34, 38, 41,
		 34, 38, 41, 34, 41, 34, 38, 41,
		 34, 38, 41, 34, 41, 34, 38, 41,


41, 45, 48, 41, 48, 41, 45, 48,
		41, 45, 48, 41, 48, 41, 45, 48,
		41, 45, 48, 41, 48, 41, 45, 48,
		41, 45, 48, 41, 48, 41, 45, 48,


	];

	var bussine=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/12*16/32;

		//freq=freqvect[i];
	//	if(freqvect1[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect1[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
		//if(freqvect2[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect2[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
	    if(freqvect4[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect4[i], amp: 1 , bus: ~bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

        Synth.new( "sinedelay", [bus: ~bus2.index]);


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
r.play;
w.play;

r.stop;



(
SynthDef(
	\peassaw6, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




       sig3 = Mix.ar(LFSaw.ar(((freq+12).midicps) * [1, 1.0013, 1.0034, 1.0065, 2.001, 2.004, 2.0065]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 1570*SinOsc.kr(0.1, -2.5, 1.95 ,2.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.1, 4.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 700);
	sig=HPF.ar(sig, 50);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig*2.5 ,0));

}).add;
)





(


	b=Routine({
	var delta;
	var freqvect=[
        58, 1, 1, 55, 1, 1, 58, 1,
		58, 1, 1, 53, 1, 1, 51, 1,

		58, 1, 1, 53, 1, 1, 58, 1,
		57, 1, 1, 58, 1, 1, 57, 1,

		55, 1, 1, 58, 1, 1, 55, 1,
		58, 1, 1, 60, 1, 1, 58, 1,

		62, 1, 1, 58, 1, 1, 62, 1,
		60, 1, 1, 58, 1, 1, 57, 1,

	];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/6;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw6", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
b.play;
g.play;
b.stop;




(
SynthDef(
	\bass2, {|freq, amp, bus|
		var sig, sig2, sig3;



		//sig=Saw.ar(freq, amp);
		//sig=sig*EnvGen.kr(Env.perc(5, 5, 5, 1), doneAction: 2);
        //sig = sig+SinOsc.ar(freq/4*EnvGen.kr(Env.perc(0.1, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		//sig = sig+SinOsc.ar(freq/3*EnvGen.kr(Env.perc(0.01, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		//sig = sig+SinOsc.ar(freq/2*EnvGen.kr(Env.perc(0.01, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		 // sig = sig+SinOsc.ar(freq*EnvGen.kr(Env.perc(0.01, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		//sig = sig+SinOsc.ar(freq*EnvGen.kr(Env.perc(0.01, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		sig = SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1,- 8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		sig = SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1,- 8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );

		sig2=BPF.ar(WhiteNoise.ar(1.8,0), 100)*EnvGen.kr(Env.perc(0.1, 0.75, 1.5, -8),   doneAction: 2);
		//sig=sig+sig2;
		sig=sig*EnvGen.kr(Env.perc(0.01, 0.25, 1.5, -8),   doneAction: 2);

	  sig=LPF.ar(sig, 500);
		sig=HPF.ar(sig, 30);
//	sig3=sig2+BPF.ar(sig, SinOsc.kr(0.001, 2, 1, 1));
		//sig=sig+AllpassC.ar(sig, 0.5, SinOsc.kr(1, 0, 1, 0) , 1, 1, 0);

		Out.ar(0,Pan2.ar(sig*1.988,0.2));


}).add;
)



(


	c=Routine({
	var delta;
	var freqvect=[


		 35,35, 35, 35,








	];
	var freq;
	var k1;
	var k2=0;
	var k3, k4;
	var a=1;
	var i=0;

	loop{
      // k1.free;
		//k2.free;
		//k3.free;
		//k4.free;
		delta=1.8/12*16/4;
		freq=freqvect[i];

		//Synth.new("bass2", [freq: freqvect[i].midicps, amp: 0.75 ]);

		if (freqvect[i]==1,{ 0},{ Synth(\bass2 , [freq:35 , amp: a*2]   ); }) ;

		i= if( i>=(15), {0}, {i+1});

		 delta.yield;
	}


});
)
c.play;
c.stop;




(
SynthDef(
	\peassaw9, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq+24).midicps) * [1, 1.001, 1.005, 1.0075, 1.0088, 2.01, 2.007, 2.00085, 2.004, 2.009]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 1570*SinOsc.kr(1, -2.5, 1.95 ,2.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.001, 1.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 4400);
	sig=HPF.ar(sig, 1750);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig/2 ,0.2));

}).add;
)

(


	f=Routine({
	var delta;
	var freqvect=[
		67, 69, 70, 74,
		67, 69, 70, 74,
		67, 69, 70, 74,
		67, 69, 70, 74,


		63, 69, 70, 74,
		63, 69, 70, 74,
		63, 69, 70, 74,
		63, 69, 70, 74,




		65, 69, 70, 74,
		65, 69, 70, 74,
		65, 69, 70, 74,
		65, 69, 70, 74,


			65, 69, 70, 72,
		65, 69, 70, 72,
		65, 69, 70, 72,
		65, 69, 70, 72,

	];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/12;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw9", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
f.play;
f.stop;











(
SynthDef(\noise6, {arg out=0,  freq=400, amp=0.2, pan, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+1500);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 1.525, 2, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*10, -0));
Out.ar(bus,Pan2.ar(sig*0.86 ,0.2));



}).add;
)


(
SynthDef(\noise5, {arg out=0,  freq=400, amp=0.2, pan, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+1500);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 1.025, 2, -8) ,  doneAction: 2);
	//Out.ar(0, Pan2.ar(sig*10, -0));
Out.ar(bus,Pan2.ar(sig*0.86 ,0.2));



}).add;
)

(
SynthDef(\noise55, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10,  bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq-500)*SinOsc.kr(3, 2.5, 1.4, 1.9));

	sig=sig*EnvGen.kr(Env.perc(0.04, 0.22, 2, -4), doneAction:2);
	//Out.ar(out, Pan2.ar(sig*11.964, 0));

		//Out.ar(bus, Pan2.ar(sig*0.00244, 0));




}).add;
)


(


	l=Routine({
	var delta;
	var freqvect=[

			1, 1,  1500,1,






	];
	var freq;
	var k1;
	var k2=0;
	var k3, k4;
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);
	loop{
      // k1.free;
		//k2.free;
		//k3.free;
		//k4.free;
		delta=1.8/12*16/8;
		freq=freqvect[i];

		k1=if(freqvect[i]==1,  {0}, {Synth.new("noise6", [freq: freqvect[i], amp: 0.2, bus: bus.index  ]);

		} );
	   //  if(i==7,  {Synth.new("verbok", [bus: bus.index, d1:0.6, d2:0.2, d3:0.2, d4:0.5 ]);} , {0});
		//k1=Synth.new("noise6", [freq: freqvect[i], amp: 0.2 ]);

    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});
)

l.play;

l.stop;






(


	m=Routine({
	var delta;
	var freqvect=[

			1, 3000,  1,3000,






	];
	var freq;
	var k1;
	var k2=0;
	var k3, k4;
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);
	loop{
      // k1.free;
		//k2.free;
		//k3.free;
		//k4.free;
		delta=1.8/12*16/8;
		freq=freqvect[i];

		k1=if(freqvect[i]==1,  {0}, {Synth.new("noise5", [freq: freqvect[i], amp: 0.2, bus: bus.index  ]);

		} );
	   //  if(i==7,  {Synth.new("verbok", [bus: bus.index, d1:0.6, d2:0.2, d3:0.2, d4:0.5 ]);} , {0});
		//k1=Synth.new("noise6", [freq: freqvect[i], amp: 0.2 ]);

    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});
)

l.play;
m.play;

m.stop;







(


	n=Routine({
	var delta;
	var freqvect=[

			1, 1, 1,500,   1,500, 1,1,
		1, 500, 1,500,   1,1, 1,500,






	];
	var freq;
	var k1;
	var k2=0;
	var k3, k4;
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);
	loop{
      // k1.free;
		//k2.free;
		//k3.free;
		//k4.free;
		delta=1.8/12;
		freq=freqvect[i];

		k1=if(freqvect[i]==1,  {0}, {Synth.new("noise55", [freq: 1375, amp: 0.2, bus: bus.index  ]);

		} );
	   //  if(i==7,  {Synth.new("verbok", [bus: bus.index, d1:0.6, d2:0.2, d3:0.2, d4:0.5 ]);} , {0});
		//k1=Synth.new("noise6", [freq: freqvect[i], amp: 0.2 ]);

    i= if( i>=15, {0}, {i+1});

		 delta.yield;v
	}


});
)

l.play;
m.play;
n.play;


(
SynthDef(\noise5, {arg out=0,  freq=400, amp=0.2, pan, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+1500);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.825, 2, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*10, -0));
Out.ar(bus,Pan2.ar(sig*0.86 ,0.2));



}).add;
)







(
SynthDef(
	\saw6, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




       sig3 = Mix.ar(LFSaw.ar(((freq+24).midicps) * [1, 1.001, 1.007, 1.01, 2.01, 2.02, 2.005]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 2570*SinOsc.kr(0.11, -2.5, 1.95 ,2.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.01, 2.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 2800);
	sig=HPF.ar(sig, 1450);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig*1 ,0));

}).add;
)





(


	d=Routine({
	var delta;
	var freqvect=[
58, 60, 62, 65,  67, 65, 70, 69,
		65, 67, 65, 62,  60, 62, 65, 60,
		62, 58, 57, 58, 53, 57, 58, 60,
		57, 58, 57, 53, 57, 53, 57, 58

	];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/6;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw6", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
d.play;
g.play;
d.stop;


(
SynthDef(\noise55, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10,  bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq-500)*SinOsc.kr(3, 2.5, 1.4, 1.9));

	sig=sig*EnvGen.kr(Env.perc(0.04, 0.22, 2, -4), doneAction:2);
	Out.ar(out, Pan2.ar(sig*16.964, 0));

		//Out.ar(bus, Pan2.ar(sig*0.00244, 0));




}).add;
)




b.stop;

d.stop;

n.stop;
l.stop;
m.stop;
c.stop;

f.stop;

r.stop;
w.stop;

s.stopRecording;