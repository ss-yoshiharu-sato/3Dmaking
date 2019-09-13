//http://www.hatumeifile.com/jyoho/chosa/petbottle.htm
//http://www.nc-net.or.jp/knowledge/morilog/detail/40606/
//include <lib/screw.scad>
include <screw.scad>
$fn=100;
inDia = 27.5;
capT = 1.5;
OutDia= inDia+2*capT;
topSapce=1.7;
threadH = 1.6;
threadW=1.5;
threadPitch=3.5;
capOutH = 14;
capInH = 12;
loopN=2;
InScrewH = loopN*threadPitch+threadW;
screwOffset=capInH-topSapce-InScrewH+threadW/2;

rotate([180,0,0])
PETCap();
module PETCap(){
	union(){
		difference(){
			cylinder(h=capOutH,d=OutDia);
			translate([0,0,-0.1])
			cylinder(h=capInH+0.2,d=inDia);
		}
		translate([0,0,screwOffset])
		thread(inDia+0.1,loopN,threadPitch ,threadH,threadW,1,0);
	}
}
