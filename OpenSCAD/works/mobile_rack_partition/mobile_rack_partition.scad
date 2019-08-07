echo(version=version());

unitNum=10;
unitW=10;
unitH=40;
unitD=1.8;
diffD=(unitD-1)/2;
diffD2=unitD-diffD;

for(i = [0:unitNum - 1]) {
    translate([i * unitW, 0, 0]) {
        difference(){
            cube([unitW, unitH, unitD]);
            translate([unitW -unitD, 0, 0]) cube([unitD, unitH /2, diffD]);
            translate([unitW -unitD, 0, diffD2]) cube([unitD, unitH /2, diffD]);
            translate([unitW -unitD, unitH /2, 0]) cube([unitD, unitH /2, unitD]);
        }
    }
}